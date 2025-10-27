{
config,
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;
    # package = pkgs.firefox;

	     package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
	           extraPolicies = {
	               DisableFirefoxStudies = true;
	               DisableTelemetry = true;
	               DisableFirefoxAccounts = false;
	               NoDefaultBookmarks = true;
	               OfferToSaveLogins = false;
	               OfferToSaveLoginsDefault = false;
	               PasswordManagerEnabled = false;
	               FirefoxHome = {
	                   Search = true;
	                   Pocket = false;
	                   Snippets = false;
	                   TopSites = false;
	                   Highlights = false;
	               	};
		};
	};

	   #  profiles.default = { TODO fix :( home manager error
	   #   extensions = with pkgs.nur.repos.rycee.firefox-addons; [
	   #     ghostery
	   #   ];
	   # };
  };
}
