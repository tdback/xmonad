{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  outputs =
    { nixpkgs, ... }:
    let
      supportedSystems = [ "x86_64-linux" ];
      eachSystem = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      devShells = eachSystem (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              (haskellPackages.ghcWithPackages (
                ps: with ps; [ haskell-language-server ]
              ))
            ];
          };
        }
      );
    };
}
