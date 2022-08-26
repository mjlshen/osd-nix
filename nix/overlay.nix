final: prev: {
  hypershift = prev.callPackage ./hypershift.nix { };
  oc = prev.callPackage ./oc.nix { };
  ocm = prev.callPackage ./ocm.nix { };
  osdctl = prev.callPackage ./osdctl.nix { };
  pd = prev.callPackage ./go-pagerduty.nix { };
  rosa = prev.callPackage ./rosa.nix { };

  devShell = final.callPackage ./openshift-sre.nix { };
}
