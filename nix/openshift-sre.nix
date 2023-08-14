{ mkShell
, google-cloud-sdk
, hypershift
, mirrosa
, oc
, ocm
, ocm-backplane
, osdctl
, rosa
, static-kas
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
    static-kas
  ];
}
