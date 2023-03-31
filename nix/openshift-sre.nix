{ mkShell
, google-cloud-sdk
, hypershift
, mirrosa
, oc
, ocm
, ocm-backplane
, osdctl
, rosa
}:

mkShell rec {
  packages = [
    google-cloud-sdk
    hypershift
    oc
    ocm
    ocm-backplane
    osdctl
    mirrosa
    rosa
  ];
}
