module test {
  class Parent { var p:int; }

  class Child : Parent { var c:int; }

  proc main() {
    var ownCb = new owned Child(1, 2);
    var cb:borrowed Parent = ownCb.borrow();
    var cbq = cb:borrowed Parent?;
    var cu:unmanaged Parent = new unmanaged Child(1, 2);
    var cuq = cu:unmanaged Parent?;

    var ownPb = new owned Parent(3);
    var pb:borrowed Parent  = ownPb.borrow();
    var pbq = pb:borrowed Parent?;
    var pu:unmanaged Parent = new unmanaged Parent(3);
    var puq = pu:unmanaged Parent?;

    var nbq:borrowed Parent? = nil;
    var nuq:unmanaged Parent? = nil;

    // casting to borrowed Child
    {
      writeln();
      writeln("casts to borrowed Child");

      // from cb
      try {
        writeln("cb:borrowed Child");
        var x = cb:borrowed Child;
        writeln(x.type:string, " ", x);
      } catch e {
        writeln(e);
        halt("fail");
      }
      // from cbq
      try {
        writeln("cbq:borrowed Child");
        var x = cbq:borrowed Child;
        writeln(x.type:string, " ", x);
      } catch e {
        writeln(e);
        halt("fail");
      }
      // from cu
      try {
        writeln("cu:borrowed Child");
        var x = cu:borrowed Child;
        writeln(x.type:string, " ", x);
      } catch e {
        writeln(e);
        halt("fail");
      }
      // from cuq
      try {
        writeln("cuq:borrowed Child");
        var x = cuq:borrowed Child;
        writeln(x.type:string, " ", x);
      } catch e {
        writeln(e);
        halt("fail");
      }
      // from pb
      try {
        writeln("pb:borrowed Child");
        var x = pb:borrowed Child;
        writeln(x.type:string, " ", x);
        halt("fail");
      } catch e {
        writeln(e);
      }
      // from pbq
      try {
        writeln("pbq:borrowed Child");
        var x = pbq:borrowed Child;
        writeln(x.type:string, " ", x);
        halt("fail");
      } catch e {
        writeln(e);
      }
      // from pu
      try {
        writeln("pu:borrowed Child");
        var x = pu:borrowed Child;
        writeln(x.type:string, " ", x);
        halt("fail");
      } catch e {
        writeln(e);
      }
      // from puq
      try {
        writeln("puq:borrowed Child");
        var x = puq:borrowed Child;
        writeln(x.type:string, " ", x);
        halt("fail");
      } catch e {
        writeln(e);
      }
      // from nbq
      try {
        writeln("nbq:borrowed Child");
        var x = nbq:borrowed Child;
        writeln(x.type:string, " ", x);
        halt("fail");
      } catch e {
        writeln(e);
      }
      // from nuq
      try {
        writeln("nuq:borrowed Child");
        var x = nuq:borrowed Child;
        writeln(x.type:string, " ", x);
        halt("fail");
      } catch e {
        writeln(e);
      }
    }

    // casting to borrowed Child?
    {
      writeln();
      writeln("casts to borrowed Child?");

      // from cb
      {
        writeln("cb:borrowed Child?");
        var x = cb:borrowed Child?;
        writeln(x.type:string, " ", x);
        assert(x != nil);
      }
      // from cbq
      {
        writeln("cbq:borrowed Child?");
        var x = cbq:borrowed Child?;
        writeln(x.type:string, " ", x);
        assert(x != nil);
      }
      // from cu
      {
        writeln("cu:borrowed Child?");
        var x = cu:borrowed Child?;
        writeln(x.type:string, " ", x);
        assert(x != nil);
      }
      // from cuq
      {
        writeln("cuq:borrowed Child?");
        var x = cuq:borrowed Child?;
        writeln(x.type:string, " ", x);
        assert(x != nil);
      }
      // from pb
      {
        writeln("pb:borrowed Child?");
        var x = pb:borrowed Child?;
        writeln(x.type:string, " ", x);
        assert(x == nil);
      }
      // from pbq
      {
        writeln("pbq:borrowed Child?");
        var x = pbq:borrowed Child?;
        writeln(x.type:string, " ", x);
        assert(x == nil);
      }
      // from pu
      {
        writeln("pu:borrowed Child?");
        var x = pu:borrowed Child?;
        writeln(x.type:string, " ", x);
        assert(x == nil);
      }
      // from puq
      {
        writeln("puq:borrowed Child?");
        var x = puq:borrowed Child?;
        writeln(x.type:string, " ", x);
        assert(x == nil);
      }
      // from nbq
      {
        writeln("nbq:borrowed Child?");
        var x = nbq:borrowed Child?;
        writeln(x.type:string, " ", x);
        assert(x == nil);
      }
      // from nuq
      {
        writeln("nuq:borrowed Child?");
        var x = nuq:borrowed Child?;
        writeln(x.type:string, " ", x);
        assert(x == nil);
      }
    }

    // casting to unmanaged Child
    {
      writeln();
      writeln("casts to unmanaged Child");

      // from cu
      try {
        writeln("cu:unmanaged Child");
        var x = cu:unmanaged Child;
        writeln(x.type:string, " ", x);
      } catch e {
        writeln(e);
        halt("fail");
      }
      // from cuq
      try {
        writeln("cuq:unmanaged Child");
        var x = cuq:unmanaged Child;
        writeln(x.type:string, " ", x);
      } catch e {
        writeln(e);
        halt("fail");
      }
      // from pu
      try {
        writeln("pu:unmanaged Child");
        var x = pu:unmanaged Child;
        writeln(x.type:string, " ", x);
        halt("fail");
      } catch e {
        writeln(e);
      }
      // from puq
      try {
        writeln("puq:unmanaged Child");
        var x = puq:unmanaged Child;
        writeln(x.type:string, " ", x);
        halt("fail");
      } catch e {
        writeln(e);
      }
      // from nuq
      try {
        writeln("nuq:unmanaged Child");
        var x = nuq:unmanaged Child;
        writeln(x.type:string, " ", x);
        halt("fail");
      } catch e {
        writeln(e);
      }
    }


    // casting to unmanaged Child?
    {
      writeln();
      writeln("casts to unmanaged Child?");

      // from cu
      {
        writeln("cu:unmanaged Child?");
        var x = cu:unmanaged Child?;
        writeln(x.type:string, " ", x);
        assert(x != nil);
      }
      // from cuq
      {
        writeln("cuq:unmanaged Child?");
        var x = cuq:unmanaged Child?;
        writeln(x.type:string, " ", x);
        assert(x != nil);
      }
      // from pu
      {
        writeln("pu:unmanaged Child?");
        var x = pu:unmanaged Child?;
        writeln(x.type:string, " ", x);
        assert(x == nil);
      }
      // from puq
      {
        writeln("puq:unmanaged Child?");
        var x = puq:unmanaged Child?;
        writeln(x.type:string, " ", x);
        assert(x == nil);
      }
      // from nuq
      {
        writeln("nuq:unmanaged Child?");
        var x = nuq:unmanaged Child?;
        writeln(x.type:string, " ", x);
        assert(x == nil);
      }
    }
    delete cu;
    delete pu;
  }
}
