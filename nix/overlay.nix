final: prev: {
  hypershift = prev.callPackage ./hypershift.nix { };
  mirrosa = prev.callPackage ./mirrosa.nix { };
  oc = prev.callPackage ./oc.nix { };
  ocm = prev.callPackage ./ocm.nix { };
  ocm-backplane = prev.callPackage ./ocm-backplane.nix { };
  osdctl = prev.callPackage ./osdctl.nix { };
  rosa = prev.callPackage ./rosa.nix { };
  static-kas = prev.callPackage ./static-kas.nix { };

  devShell = final.callPackage ./openshift-sre.nix { };
}
