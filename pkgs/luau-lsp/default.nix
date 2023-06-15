with import <nixpkgs> {};
stdenv.mkDerivation rec {
  pname = "luau-lsp";
  version = "1.20.2";

  src = fetchFromGitHub {
    owner = "JohnnyMorganz";
    repo = "luau-lsp";
    rev = version;
    hash = "sha256-XuALF8qZ3j3gT0g72lulwrKFanBSyLAx+4Jgn9R37ds=";
  };

  nativeBuildInputs = [ cmake ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  meta = with lib; {
    homepage = "https://github.com/JohnnyMorganz/luau-lsp";
    description = "Luau Language Server";
    longDescription = "An implementation of a language server for the Luau programming language.";
    license = licenses.mit;
    platforms = [ "x86_64-linux" "aarch64-linux" ];
    maintainers = with maintainers; [ eyryse ];
  };
}

