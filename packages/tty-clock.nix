{
  stdenv,
  fetchFromGitHub,
  fetchpatch,
  ncurses,
  pkg-config,
}:
stdenv.mkDerivation {
  pname = "tty-clock";
  version = "2.3+unstable=2021-04-07";

  buildInputs = [
    ncurses
    pkg-config
  ];

  src = fetchFromGitHub {
    owner = "xorg62";
    repo = "tty-clock";
    rev = "9e00c32098524c30dac4dab701f7e33f8bc7c880";
    sha256 = "14jrzz06jr29887bxgad1x6kd26c2fnqrc26864wqm3838fpcqw0";
  };

  patches = [
    # Pull upstream patch pending inclusion fir more ncurses-6.3 fixes:
    #  https://github.com/xorg62/tty-clock/pull/100
    (fetchpatch {
      name = "ncurses-6.2.patch";
      url = "https://github.com/xorg62/tty-clock/commit/4cfd73080da1964557484da620c401745d73881c.patch";
      sha256 = "13pj1v6yrfc4vynsa746974kixfxxsy2jzzpl73c8bp7msr9d3md";
    })
  ];

  makeFlags = [ "PREFIX=$(out)" ];
}
