use IO;

config const noisy = false;
config type t = string;

proc testio(fmts: [] string, values: [])
{
  for fmt in fmts {
    for v in values {
      if noisy then writeln("Testing ",fmt," ",v.type:string," ",v);
      for tryN in 1..4 {
        // We do it 4x:
        // try 1 is the simple way
        // try 2 puts after the data (in the file, not the format string)
        // try 3 adds a space at the start of the format string
        // try 4 adds a space at the end of the format string
        
        var writextra = false;
        var usefmt = fmt;
        if tryN == 2 then writextra = true;
        if tryN == 3 then usefmt = " " + fmt;
        if tryN == 4 then usefmt = fmt + " ";
        if noisy then writeln("Testing try ", tryN, " with fmt '", usefmt, "'");

        var x = v;
        var f = openTempFile();
        {
          var ch = f.writer();
          if noisy then writeln("Writing ", x:string);
          ch.writef(usefmt:t, x);
          if writextra then ch.write("  \t\n");
          ch.close();
        }

        {
          var ch = f.reader();
          var y:x.type;
          var z:x.type;
          if noisy then writeln("Reading element");
          var got = ch.readf(usefmt:t, y);
          if noisy then writeln("Read ", y:string);
          assert( got );
          assert( y == x );

          if tryN == 1 {
            // Try reading another item -- should get EOF
            if noisy then writeln("Reading another - should get EOF");
            got = ch.readf(usefmt:t, z);
            if noisy then writeln("Read ", z:string);
            assert( !got );
          }

          ch.close();
        }
        f.close();
      }
    }
  }
}

proc main() {

  var smallintformats = 
         ["%?", "%n",
          "%r", "%10r", "%010r", "%<10r", "%+r", "% r",
          "%n", "%10n", "%010n", "%<10n", "%+n", "%+10n", "%<+10n", "% n", "% 10n", "%< 10n",
          "%i", "%10i", "%010i", "%<10i", "%+i", "%+10i", "%<+10i", "% i", "% 10i", "%< 10i",
          "%xi","%10xi", "%010xi", "%<10xi", "%+xi", "%+10xi", "% xi", "% 10xi", "%<+10xi", "%< 10xi",
          "%@xi","%@10xi", "%0@10xi", "%<@10xi", "%@+xi", "%@+10xi", "%@ xi", "%@ 10xi", "%@<+10xi", "%@< 10xi",
          "%Xi","%10Xi", "%010Xi", "%<10Xi", "%+Xi", "% Xi",
          "%@Xi","%@10Xi", "%@010Xi", "%@<10Xi", "%@+Xi", "%@ Xi",
          "%bi","%10bi", "%010bi", "%<10bi", "%+bi", "% bi",
          "%@bi","%@10bi", "%@010bi", "%@<10bi", "%@+bi", "%@ bi",
          "%oi","%10oi", "%010oi", "%<10oi", "%+oi", "% oi",
          "%@oi","%@10oi", "%@010oi", "%@<10oi", "%@+oi", "%@ oi",
          "%{###############}",
          "%{###############.#}" ];
 
  var bigintformats = 
         ["%?", "%n",
          "%i", "%10i", "%010i", "%<10i", "%+i", "%+10i", "%<+10i", "% i", "% 10i", "%< 10i",
          "%xi","%10xi", "%010xi", "%<10xi", "%+xi", "%+10xi", "% xi", "% 10xi", "%<+10xi", "%< 10xi",
          "%@xi","%@10xi", "%0@10xi", "%<@10xi", "%@+xi", "%@+10xi", "%@ xi", "%@ 10xi", "%@<+10xi", "%@< 10xi",
          "%Xi","%10Xi", "%010Xi", "%<10Xi", "%+Xi", "% Xi",
          "%@Xi","%@10Xi", "%@010Xi", "%@<10Xi", "%@+Xi", "%@ Xi",
          "%bi","%10bi", "%010bi", "%<10bi", "%+bi", "% bi",
          "%@bi","%@10bi", "%@010bi", "%@<10bi", "%@+bi", "%@ bi",
          "%oi","%10oi", "%010oi", "%<10oi", "%+oi", "% oi",
          "%@oi","%@10oi", "%@010oi", "%@<10oi", "%@+oi", "%@ oi",
          "%{###############.#}"];
  
  testio(smallintformats, [true, false]);
  testio(smallintformats, [100:uint(8), ]);
  testio(smallintformats, [100:int(8), ]);
  testio(smallintformats, [-100:int(8), ]);
  testio(smallintformats, [1000:uint(16), ]);
  testio(smallintformats, [1000:int(16), ]);
  testio(smallintformats, [-1000:int(16), ]);
  testio(smallintformats, [100000:uint(32), ]);
  testio(smallintformats, [100000:int(32), ]);
  testio(smallintformats, [-100000:int(32), ]);
  testio(bigintformats, [12884901888:uint(64), ]);
  testio(bigintformats, [12884901888:int(64), ]);
  testio(bigintformats, [-12884901888:int(64), ]);

  var fformats =
         ["%?", "%n",
          "%r", "%10r", "%010r", "%<10r", "%+r", "% r",
          "%xr",
          "%Xr",
          "%er",
          "%en",
          "%xer",
          "%Xer",
          "%Er",
          "%xEr",
          "%XEr",
          "%dr", "%10dr", "%010dr", "%<10dr", "%+dr", "% dr",
          "%{######.######}"];

  testio(fformats, [0.002:real(32), -0.002:real(32)]);
  testio(fformats, [0.002:real(64), -0.002:real(64)]);

  var mformats =
         ["%?", "%n",
          "%m", "%10m", "%010m", "%<10m", "%+m", "% m",
          "%xm",
          "%Xm",
          "%xem",
          "%Xem",
          "%Em",
          "%xEm",
          "%XEm",
          "%dm", "%10dm", "%010dm", "%<10dm", "%+dm", "% dm",
          "%{######.######}"];
  testio(mformats, [0.002:imag(32), -0.002:imag(32)]);
  testio(mformats, [0.002:imag(64), -0.002:imag(64)]);

  var eformats =
         ["%?",
          "%xer",
          "%Xer",
          "%Er",
          "%xEr",
          "%XEr",
          "%r", "%10r", "%010r", "%<10r", "%+r", "% r"];
  testio(eformats, [57.24e23:real(32), -57.24e23:real(32)]);
  testio(eformats, [57.24e23:real(64), -57.24e23:real(64)]);

  var zformats = 
         ["%?", "%n",
          "%z", "%10z", "%010z", "%<10z", "%+z", "% z"];
 
  testio(zformats, [997.89+200.124i, -997.89-200.124i,
                    0.0+1.0i, 1.0+0.0i, 0.0-1.0i, -1.0+0.0i]);
  testio(zformats, [1.0:imag(32), ]);
  testio(zformats, [1.0:imag(64), ]);


  testio(["%c", ], [33, 42]);
  testio(["%c", ], ["x", "a"]);

  testio(["%s", "%10s", "%<10s"], ["a", "test"]);

  testio(["%'S", "%'S", "%10'S", "%<10'S",
          "%\"S", "%10\"S", "%<10\"S", "%>10'S", "%^10'S"],
         ["", "a", "test"]);

  // test that these ones handle space in strings correctly
  testio(["%'S", "%10'S", "%<10'S",
          "%\"S", "%10\"S", "%<10\"S"],
         ["", "a", "test", " ' ", " \" "]);

}
