{ mkShell
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
