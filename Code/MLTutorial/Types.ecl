/*##############################################################################
## HPCC SYSTEMS software Copyright (C) 2022 HPCC Systems.  All rights reserved.
############################################################################## */
EXPORT Types := MODULE
  // init data structure for each session
  EXPORT initParams := RECORD
    UNSIGNED4 nodeId;  // node id of the current session
    UNSIGNED4 nNodes;  // total nodes for a session
  END;

END;