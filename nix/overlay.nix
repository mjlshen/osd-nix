final: prev: {
  hiveutil = prev.callPackage ./hiveutil.nix { };
  oc = prev.callPackage ./oc.nix { };
  ocm = prev.callPackage ./ocm.nix { };
  operator-sdk = prev.callPackage ./operator-sdk.nix { };
  osdctl = prev.callPackage ./osdctl.nix { };
  pd = prev.callPackage ./go-pagerduty.nix { };

  devShell = final.callPackage ./openshift-sre.nix { };
}
