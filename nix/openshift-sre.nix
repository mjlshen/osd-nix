{ mkShell
, awscli2
, go_1_17
, google-cloud-sdk
, hiveutil
, oc
, ocm
, osdctl
, pd
, rosa
}:

mkShell rec {
  packages = [
    awscli2
    google-cloud-sdk
    go_1_17
    hiveutil
    oc
    ocm
    osdctl
    pd
    rosa
  ];
}
