{
  config,
  lib,
  pkgs,
  ...
}: 
let
  cfg = config.modules.awesome;
in {
  imports = [
    ./packages.nix
    ./programs
  ];

  # Fonts
  fonts.fontconfig.enable = true;

  # xdg
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = ["firefox.desktop"];
      "text/cache-manifest" = ["nvim.desktop"];
      "text/calendar" = ["nvim.desktop"];
      "text/crystal" = ["nvim.desktop"];
      "text/css" = ["nvim.desktop"];
      "text/csv" = ["nvim.desktop"];
      "text/csv-schema" = ["nvim.desktop"];
      "text/directory" = ["nvim.desktop"];
      "text/ecmascript" = ["nvim.desktop"];
      "text/enriched" = ["nvim.desktop"];
      "text/gedcom" = ["nvim.desktop"];
      "text/google-video-pointer" = ["nvim.desktop"];
      "text/html" = ["nvim.desktop"];
      "text/htmlh" = ["nvim.desktop"];
      "text/ico" = ["nvim.desktop"];
      "text/javascript" = ["nvim.desktop"];
      "text/jscript" = ["nvim.desktop"];
      "text/julia" = ["nvim.desktop"];
      "text/markdown" = ["nvim.desktop"];
      "text/mathml" = ["nvim.desktop"];
      "text/org" = ["nvim.desktop"];
      "text/plain" = ["nvim.desktop"];
      "text/rdf" = ["nvim.desktop"];
      "text/rfc822-headers" = ["nvim.desktop"];
      "text/richtext" = ["nvim.desktop"];
      "text/rss" = ["nvim.desktop"];
      "text/rtf" = ["nvim.desktop"];
      "text/rust" = ["nvim.desktop"];
      "text/sgml" = ["nvim.desktop"];
      "text/spreadsheet" = ["nvim.desktop"];
      "text/tab-separated-values" = ["nvim.desktop"];
      "text/tcl" = ["nvim.desktop"];
      "text/troff" = ["nvim.desktop"];
      "text/turtle" = ["nvim.desktop"];
      "text/uri-list" = ["nvim.desktop"];
      "text/vbs" = ["nvim.desktop"];
      "text/vbscript" = ["nvim.desktop"];
      "text/vcard" = ["nvim.desktop"];
      "text/vnd" = ["nvim.desktop"];
      "text/vtt" = ["nvim.desktop"];
      "text/x" = ["nvim.desktop"];
      "text/x-adasrc" = ["nvim.desktop"];
      "text/x-authors" = ["nvim.desktop"];
      "text/x-basic" = ["nvim.desktop"];
      "text/x-bibtex" = ["nvim.desktop"];
      "text/x-blueprint" = ["nvim.desktop"];
      "text/x-c" = ["nvim.desktop"];
      "text/x-changelog" = ["nvim.desktop"];
      "text/x-chdr" = ["nvim.desktop"];
      "text/x-cmake" = ["nvim.desktop"];
      "text/x-cobol" = ["nvim.desktop"];
      "text/x-comma-separated-values" = ["nvim.desktop"];
      "text/x-common-lisp" = ["nvim.desktop"];
      "text/x-component" = ["nvim.desktop"];
      "text/x-copying" = ["nvim.desktop"];
      "text/x-credits" = ["nvim.desktop"];
      "text/x-crystal" = ["nvim.desktop"];
      "text/x-csharp" = ["nvim.desktop"];
      "text/x-csrc" = ["nvim.desktop"];
      "text/x-csv" = ["nvim.desktop"];
      "text/x-dart" = ["nvim.desktop"];
      "text/x-dbus-service" = ["nvim.desktop"];
      "text/x-dcl" = ["nvim.desktop"];
      "text/x-devicetree-binary" = ["nvim.desktop"];
      "text/x-devicetree-source" = ["nvim.desktop"];
      "text/x-diff" = ["nvim.desktop"];
      "text/x-dsl" = ["nvim.desktop"];
      "text/x-dsrc" = ["nvim.desktop"];
      "text/x-dtd" = ["nvim.desktop"];
      "text/x-eiffel" = ["nvim.desktop"];
      "text/x-elixir" = ["nvim.desktop"];
      "text/x-emacs-lisp" = ["nvim.desktop"];
      "text/x-erlang" = ["nvim.desktop"];
      "text/x-fish" = ["nvim.desktop"];
      "text/x-fortran" = ["nvim.desktop"];
      "text/x-gcode-gx" = ["nvim.desktop"];
      "text/x-genie" = ["nvim.desktop"];
      "text/x-gettext-translation" = ["nvim.desktop"];
      "text/x-gettext-translation-template" = ["nvim.desktop"];
      "text/x-gherkin" = ["nvim.desktop"];
      "text/x-go" = ["nvim.desktop"];
      "text/x-google-video-pointer" = ["nvim.desktop"];
      "text/x-gradle" = ["nvim.desktop"];
      "text/x-groovy" = ["nvim.desktop"];
      "text/x-haskell" = ["nvim.desktop"];
      "text/x-idl" = ["nvim.desktop"];
      "text/x-iMelody" = ["nvim.desktop"];
      "text/x-install" = ["nvim.desktop"];
      "text/x-iptables" = ["nvim.desktop"];
      "text/x-java" = ["nvim.desktop"];
      "text/x-kaitai-struct" = ["nvim.desktop"];
      "text/x-kotlin" = ["nvim.desktop"];
      "text/x-ldif" = ["nvim.desktop"];
      "text/x-lilypond" = ["nvim.desktop"];
      "text/x-literate-haskell" = ["nvim.desktop"];
      "text/x-log" = ["nvim.desktop"];
      "text/x-lua" = ["nvim.desktop"];
      "text/x-lyx" = ["nvim.desktop"];
      "text/x-makefile" = ["nvim.desktop"];
      "text/x-markdown" = ["nvim.desktop"];
      "text/x-matlab" = ["nvim.desktop"];
      "text/x-maven" = ["nvim.desktop"];
      "text/xmcd" = ["nvim.desktop"];
      "text/x-meson" = ["nvim.desktop"];
      "text/x-microdvd" = ["nvim.desktop"];
      "text/xml" = ["nvim.desktop"];
      "text/xml-external-parsed-entity" = ["nvim.desktop"];
      "text/x-moc" = ["nvim.desktop"];
      "text/x-modelica" = ["nvim.desktop"];
      "text/x-mof" = ["nvim.desktop"];
      "text/x-mpl2" = ["nvim.desktop"];
      "text/x-mpsub" = ["nvim.desktop"];
      "text/x-mrml" = ["nvim.desktop"];
      "text/x-ms-regedit" = ["nvim.desktop"];
      "text/x-mup" = ["nvim.desktop"];
      "text/x-nfo" = ["nvim.desktop"];
      "text/x-nim" = ["nvim.desktop"];
      "text/x-nimscript" = ["nvim.desktop"];
      "text/x-nu" = ["nvim.desktop"];
      "text/x-objc" = ["nvim.desktop"];
      "text/x-objcsrc" = ["nvim.desktop"];
      "text/x-ocaml" = ["nvim.desktop"];
      "text/x-ocl" = ["nvim.desktop"];
      "text/x-octave" = ["nvim.desktop"];
      "text/x-ooc" = ["nvim.desktop"];
      "text/x-opencl-src" = ["nvim.desktop"];
      "text/x-opml" = ["nvim.desktop"];
      "text/x-pascal" = ["nvim.desktop"];
      "text/x-patch" = ["nvim.desktop"];
      "text/x-perl" = ["nvim.desktop"];
      "text/x-po" = ["nvim.desktop"];
      "text/x-pot" = ["nvim.desktop"];
      "text/x-python" = ["nvim.desktop"];
      "text/x-python3" = ["nvim.desktop"];
      "text/x-qml" = ["nvim.desktop"];
      "text/x-readme" = ["nvim.desktop"];
      "text/x-reject" = ["nvim.desktop"];
      "text/x-rpm-spec" = ["nvim.desktop"];
      "text/x-rst" = ["nvim.desktop"];
      "text/x-sagemath" = ["nvim.desktop"];
      "text/x-sass" = ["nvim.desktop"];
      "text/x-scala" = ["nvim.desktop"];
      "text/x-scheme" = ["nvim.desktop"];
      "text/x-scons" = ["nvim.desktop"];
      "text/x-scss" = ["nvim.desktop"];
      "text/x-setext" = ["nvim.desktop"];
      "text/x-sh" = ["nvim.desktop"];
      "text/x-sql" = ["nvim.desktop"];
      "text/x-ssa" = ["nvim.desktop"];
      "text/x-subviewer" = ["nvim.desktop"];
      "text/x-svhdr" = ["nvim.desktop"];
      "text/x-svsrc" = ["nvim.desktop"];
      "text/x-systemd-unit" = ["nvim.desktop"];
      "text/x-tcl" = ["nvim.desktop"];
      "text/x-tex" = ["nvim.desktop"];
      "text/x-texinfo" = ["nvim.desktop"];
      "text/x-todo-txt" = ["nvim.desktop"];
      "text/x-troff" = ["nvim.desktop"];
      "text/x-troff-me" = ["nvim.desktop"];
      "text/x-troff-mm" = ["nvim.desktop"];
      "text/x-troff-ms" = ["nvim.desktop"];
      "text/x-twig" = ["nvim.desktop"];
      "text/x-txt2tags" = ["nvim.desktop"];
      "text/x-typst" = ["nvim.desktop"];
      "text/x-uil" = ["nvim.desktop"];
      "text/x-uri" = ["nvim.desktop"];
      "text/x-uuencode" = ["nvim.desktop"];
      "text/x-vala" = ["nvim.desktop"];
      "text/x-vb" = ["nvim.desktop"];
      "text/x-vcalendar" = ["nvim.desktop"];
      "text/x-vcard" = ["nvim.desktop"];
      "text/x-verilog" = ["nvim.desktop"];
      "text/x-vhdl" = ["nvim.desktop"];
      "text/x-xmi" = ["nvim.desktop"];
      "text/x-xslfo" = ["nvim.desktop"];
      "text/x-yaml" = ["nvim.desktop"];
      "text/yaml" = ["nvim.desktop"];
    };
  };

  # AutoRandr
  services.autorandr.enable = true;
  
  # Awesomewm
  home.file.".config/awesome" = { source = ../../configs/awesome; recursive = true;};

  # Picom
  # services.picom = {
  #   enable = true;
  #   shadow = false;
  #   fade = false;
  #   activeOpacity = 1.0;
  #   inactiveOpacity = 1.0;
  #   menuOpacity = 1.0;
  #   backend = "glx";
  #   package = pkgs.picom-next;
  # };

  # Copyq
  services.copyq.enable = true;
  home.file.".config/copyq/copyq.conf" = { source = ../../configs/copyq.conf; recursive = false; force = false; };
}
