/*
 * Copyright 2020-2023 Hewlett Packard Enterprise Development LP
 * Copyright 2004-2019 Cray Inc.
 * Other additional copyright holders may be indicated within.
 *
 * The entirety of this work is licensed under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 *
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//
// Launch assistance for the uGNI communication interface.
//

#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>

#include "chplrt.h"
#include "chplcgfns.h"
#include "chpl-comm-launch.h"
#include "chpl-env.h"


void chpl_comm_preLaunch(int32_t numLocales) {
#ifdef COMM_OFI_OOB_PMI2
  //
  // Set the maximum number of PMI key-value store entries to an amount
  // adequate for our launch needs.  We'll actually only need this if we
  // end up using the PMI2_KVS_*() interface for out-of-band support
  // during comm layer initialization.  At this point we cannot tell
  // whether we'll do so, but it won't hurt anything to set it anyway.
  //
  // Based on limited experimentation, numLocales * 10 works with
  // small-scale runs. The cray-pmi{,-lib} modules are likely to be
  // loaded for large-scale runs in which case KVS isn't even used.

  {
    int32_t newVal = numLocales * 10;

    const char* evName = "PMI_MAX_KVS_ENTRIES";
    char* evStr;
    int32_t oldVal;
    if ((evStr = getenv(evName)) == NULL
        || sscanf(evStr, "%" SCNi32, &oldVal) < 1
        || oldVal < newVal) {
      char buf[10];
      (void) snprintf(buf, sizeof(buf), "%" PRId32, newVal);
      chpl_env_set(evName, buf, 1);
    }
  }
#endif

  if (chpl_env_rt_get_bool("OVERSUBSCRIBED", false)) {
    //
    // This only applies to the sockets provider.  Here in the launcher
    // we can't tell if that will be used, but setting it superfluously
    // won't hurt anything.
    //
    chpl_env_set("FI_SOCKETS_PE_WAITTIME", "0", 0);
  }

  if (strcmp(CHPL_TARGET_PLATFORM, "hpe-cray-ex") == 0) {
    //
    // On HPE Cray EX systems, temporarily work around a PMI bug by
    // setting PMI_NO_PREINITIALIZE=y which prevents PMI initializing
    // itself more than once and thus getting into the bug situation.
    //
    // The fix for the bug is in the PMI module version that follows
    // 6.1.0, so this workaround can be removed as soon as no system
    // has that or earlier.  (PMI_NO_PREINITIALIZE actually defaults
    // to "y" in PMI 6.0.17 and later, but even with that we have to
    // override the user if they set it otherwise.)
    //
    chpl_env_set("PMI_NO_PREINITIALIZE", "y", 1);
  }
  if (chpl_env_rt_get_bool("COMM_OFI_USE_HUGEPAGES", false)) {
    //
    // Don't map virtual hugepages to physical pages when allocating a
    // fixed heap. We want to do it ourselves so we can stripe the heap
    // across NUMA domains.
    //
    chpl_env_set("HUGETLB_NO_RESERVE", "yes", 0);
  } else {
    //
    // Don't allow morecore to use hugepages, otherwise we'll end up using
    // hugepages when we allocate the fixed heap using memalign.
    //
    chpl_env_set("HUGETLB_MORECORE", "no", 1);
  }

}
