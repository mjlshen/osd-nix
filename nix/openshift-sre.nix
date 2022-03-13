{ mkShell
, awscli2
, google-cloud-sdk
, hiveutil
, oc
, ocm
, osdctl
}:

mkShell rec {
  packages = [
    awscli2
    google-cloud-sdk
    hiveutil
    oc
    ocm
    osdctl
  ];
}
