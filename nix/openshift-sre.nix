{ mkShell
, hypershift
, oc
, ocm
, osdctl
, rosa
}:

mkShell rec {
  packages = [
    hypershift
    oc
    ocm
    osdctl
    rosa
  ];
}
