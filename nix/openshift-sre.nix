{ mkShell
, awscli2
, google-cloud-sdk
, hiveutil
, oc
, ocm
, operator-sdk
, osdctl
, pd
}:

mkShell rec {
  packages = [
    awscli2
    google-cloud-sdk
    hiveutil
    oc
    ocm
    operator-sdk
    osdctl
    pd
  ];
}
