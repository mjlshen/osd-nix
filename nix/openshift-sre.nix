{ mkShell
, google-cloud-sdk
, hypershift
, oc
, ocm
, osdctl
, rosa
}:

mkShell rec {
  packages = [
    google-cloud-sdk
    hypershift
    oc
    ocm
    osdctl
    rosa
  ];
}
