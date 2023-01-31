{ mkShell
, google-cloud-sdk
, hypershift
, mirrosa
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
    mirrosa
    rosa
  ];
}
