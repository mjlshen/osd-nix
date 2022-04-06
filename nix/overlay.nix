final: prev: {
  hiveutil = prev.callPackage ./hiveutil.nix { };
  oc = prev.callPackage ./oc.nix { };
  ocm = prev.callPackage ./ocm.nix { };
  osdctl = prev.callPackage ./osdctl.nix { };
  pd = prev.callPackage ./go-pagerduty.nix { };

  devShell = final.callPackage ./openshift-sre.nix { };
}
