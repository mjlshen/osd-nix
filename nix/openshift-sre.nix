{ mkShell
, hypershift
, oc
, ocm
, osdctl
, pd
, rosa
}:

mkShell rec {
  packages = [
    hypershift
    oc
    ocm
    osdctl
    pd
    rosa
  ];
}
