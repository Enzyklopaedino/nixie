{
  inputs,
  pkgs,
  ...
}:

{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock
      # "khgocmkkpikpnmmkgmdnfckapcdkgfaf" # 1Password
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # DarkReader
      "gppongmhjkpfnbhagpmjfkannfbllamg" # Wappalyzer
      "hkgfoiooedgoejojocmhlaklaeopbecg" # Picture-in-Picture
      # "oldceeleldhonbafppcapldpdifcinji" # LanguageTool
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      # "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
      "iiikidmnimlpahbeknmkeonmemajpccj" # Button Stealer
      "cimpffimgeipdhnhjohpbehjkcdpjolg" # Watch2Gether
      "pljfkbaipkidhmaljaaakibigbcmmpnc" # Atom Material Icons
    ];
  };
}
