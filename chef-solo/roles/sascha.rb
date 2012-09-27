name File.basename(__FILE__, ".rb")
description "a role containing base build requirements for all dev workstations"
run_list  "developer_workstation::prep", 
	      "workstation",
              "mac_os_x",
              "build-essential", 
              "git", 
              "homebrew", 
              "developer_workstation::rvm_user", 
              "rvm::user", 
              "ghmac",
              "iterm2",
	      "firefox",
              "chrome",
              "dropbox"
override_attributes "rvm" => {
    "rvmrc" => {
        'rvm_project_rvmrc_default' => 1,
        'rvm_gemset_create_on_use_flag' => 1,
        'rvm_trust_rvmrcs_flag' => 1,
        'rvm_install_on_use_flag' => 1,
        'rvm_make_flags' => "-j 3"
    },
	"user_gems" => {
  	  'ruby-1.9.3-p194' => [ 
		{ 'name' => 'chef' },
		{ 'name' => 'vagrant'},
		{ 'name' => 'veewee'},
		{ 'name' => 'pry'},
		{ 'name' => 'knife-config'},
            	{ 'name' => 'knife-essentials'},
            	{ 'name' => 'knife-ec2'}
			]
	}
}

 # These attributes are used by the mac_os_x::settings recipe to
  # build dynamic data driven settings. See the mac_os_x cookbook's
  # README.md for more information about how this works. Note that the
  # "domain" key is required.
  # These are my personal preferences. If you don't know what a
  # particular setting does, remove it before running Chef.
  "mac_os_x" => {
    "settings" => {
      "dock" => {
        "domain" => "com.apple.dock",
        "autohide" => true,
        "dashboard-in-overlay" => true,
        "launchanim" => false,
        "magnification" => true,
        "mineffect" => "scale",
        "minimize-to-application" => true,
        "mru-spaces" => false,
        "showAppExposeGestureEnabled" => true,
        "showDesktopGestureEnabled" => false,
        "showLaunchpadGestureEnabled" => false,
        "tilesize" => 20,
        "wvous-bl-modifier" => 0,
        "wvous-bl-corner" => 5
      },
      "trackpad" => {
        "domain" => "com.apple.driver.AppleBluetoothMultitouch.trackpad",
        "Clicking" => true,
        "TrackpadThreeFingerDrag" => true,
        "TrackpadThreeFingerHorizSwipeGesture" => false,
        "TrackpadThreeFingerVertSwipeGesture" => false,
        "TrackpadFiveFingerPinchGesture" => false,
        "TrackpadFourFingerPinchGesture" => false
      },
      "finder" => {
        "domain" => "com.apple.finder",
        "EmptyTrashSecurely" => true,
        "FXArrangeGroupViewBy" => "Name",
        "FXPreferredViewStyle" => "Nlsv", # list view
        "NewWindowTarget" => "PfHm", # home directory
        "ShowExternalHardDrivesOnDesktop" => true
      },
      "global" => {
        "domain" => "NSGlobalDomain",
        "AppleEnableMenuBarTransparency" => false,
        "AppleShowScrollBars" => "Always",
        "InitialKeyRepeat" => 15,
        "KeyRepeat" => 2,
        "NSAutomaticSpellingCorrectionEnabled" => false,
        "NSUserReplacementItemsEnabled" => false,
        "WebAutomaticSpellingCorrectionEnabled" => false,
        "WebAutomaticTextReplacementEnabled" => 0,
        "com.apple.springing.delay" => "0.5",
        "com.apple.springing.enabled" => 1,
        "com.apple.trackpad.scaling" => 3
      },
      "safari" => {
        "domain" => "com.apple.Safari",
        "AutoFillFromAddressBook" => false,
        "AutoFillMiscellaneousForms" => false,
        "AutoFillPasswords" => false,
        "AutoOpenSafeDownloads" => false,
        "HistoryAgeInDaysLimit" => 365000,
        "IncludeDevelopMenu" => true,
        "NewTabBehavior" => 1,
        "NewWindowBehavior" => 1,
        "SafariGeolocationPermissionPolicy" => false,
        "SendDoNotTrackHTTPHeader" => true,
        "WebKitDefaultFixedFontSize" => 12
      },
      "screensaver" => {
        "domain" => "com.apple.screensaver",
        "askForPassword" => 1,
        "askForPasswordDelay" => 5
      },
      "networkbrowser" => {
        "domain" => "com.apple.NetworkBrowser",
        "DisableAirDrop" => true
      }
    }
  }
)


