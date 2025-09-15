/* ✅ Required for FlexFox Styles */
/* Enables userChrome.css for custom styles. Required — do not modify. */
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
/* Enables icon color to auto-adjust between light and dark themes. Required — do not modify. */
user_pref("svg.context-properties.content.enabled",              true);
/* Enables FlexFox's vertical tabs auto-collapse and layout. Required — do not modify. */
user_pref("sidebar.visibility",                         "always-show");

/* 🪄 Add or Enable Features */
/* Boldens the text in the Firefox interface. */
user_pref("uc.flex.add-ui-text-stroke",                         false);
/* Fully hides the Sidebery sidebar and native vertical tabs. */
user_pref("uc.flex.fully-hide-sidebery",                        false);
/* Fully hides the top tab bar, navigation bar, and bookmarks toolbar. */
user_pref("uc.flex.fully-hide-toolbox",                         false);
/* Auto-hide tabs in horizontal tab mode when Sidebery is inactive; 
   0 = off, 1 = below navbar, 2 = above navbar */
user_pref("uc.flex.auto-hide-horizontal-tabs-and-keep-navbar",      0);
/* Auto-hide navbar in horizontal tab mode when Sidebery is inactive; 
   0 = off, 1 = on; overrides horizontal tabs setting if both enabled */
user_pref("uc.flex.auto-hide-navbar-and-keep-horizontal-tabs",      0);
/* Auto-hides navigation bar icons until the cursor hovers over the toolbar. */
user_pref("uc.flex.auto-hide-navbar-icons",                     false);
/* Hide navigation bar window controls (minimize, maximize, close); show on navigation bar edge hover. */
user_pref("uc.flex.auto-hide-window-controls",                  false);
/* Allows toolbar colors from extensions like Firefox Color to apply when no background image is set. */
user_pref("uc.flex.allow-addons-to-change-toolbar-color",       false);
/* Sets gradient style for the highlight color (0 = off, 1–X = select style). Applies to logo, stripe, and star icon. */
user_pref("uc.flex.enable-gradient-highlight",                      0);
/* Enables colored icons for bookmark folders.
   0 = disabled, 1 = use first icon set, 2 = use second icon set (labels auto-hidden). */
user_pref("uc.flex.enable-colored-bookmarks-folder-icons",          0);
/* Removes icons from bookmark folders. */
user_pref("uc.flex.remove-bookmarks-folder-icons",              false);
/* Removes labels from bookmarks. */
user_pref("uc.flex.remove-bookmarks-labels",                    false);
/* Shows a confirmation message and version number in the about:config page. */
user_pref("uc.flex.show-flexfox-version-info-in-about-config",   true);
/* Show a draggable separator between pinned and regular tabs in expanded vertical tabs */
user_pref("uc.flex.show-pin-tabs-separator-in-expanded-state",  false);
/* Shows the tab close button when hovering over a tab's favicon in horizontal tabs mode. */
user_pref("uc.flex.show-tab-close-button-on-favicon-hover",     false);
/* Shows the total number of tabs in the "List All Tabs" button.
   0 = disabled
   1 = show icon and number (all tabs)
   2 = show icon and number (only loaded tabs)
   3 = show number only (all tabs)
   4 = show number only (only loaded tabs) */
user_pref("uc.flex.show-tab-count-in-alltabs-button",               0);
/* Shows a numeric index before each tab's label text. */
user_pref("uc.flex.show-tab-number-in-tab-label",               false);
/* Moves PiP window volume button to the top */
user_pref("uc.flex.move-pip-volume-to-top",                     false);
/* Darkens background when URL bar dropdown is open (0 = off, 1–2 = dim intensity). */
user_pref("uc.flex.dim-urlbar-popup-backdrop",                      0);
/* Adds margin, shadow, and rounded corners to web content (0 = off, 1–2 = more margin). */
user_pref("uc.flex.enable-rounded-web-content",                     0);

/* 🚫 Disable or Revert Features */
/* Disables all FlexFox features without restarting Firefox */
user_pref("uc.flex.disable-flexfox",                            false);
/* Skips loading specific uc-*.css files in ./components/ and ./content/ */
// user_pref("uc.flex.skip-loading-uc-*.css",                   false);
/* Disables the auto-hide feature of the bookmarks toolbar. */
user_pref("uc.flex.disable-bookmarks-autohide",                 false);
/* Disables the auto-hide feature of the find bar. */
user_pref("uc.flex.disable-findbar-autohide",                   false);
/* Disables the auto-collapse feature of Sidebery and native vertical tabs. */
user_pref("uc.flex.disable-sidebery-autohide",                  false);
/* Disables the close button on inactive horizontal tabs. */
user_pref("uc.flex.disable-tab-close-button-on-inactive-horizontal-tabs", false);
/* Disables the extra right padding after the first item in the navigation bar. */
user_pref("uc.flex.disable-nav-bar-first-item-right-padding",   false);
/* Disables custom menu icons added by FlexFox. */
user_pref("uc.flex.disable-menu-icons",                         false);
/* Restores the window control buttons (minimize, maximize, close) to the tab bar in horizontal tabs mode. */
user_pref("uc.flex.restore-window-controls-on-tabbar",          false);
/* Reverts the window control buttons (minimize, maximize, close) to Firefox's default design. */
user_pref("uc.flex.revert-to-original-window-controls",         false);
/* Reverts the rounded corner radius of the urlbar, searchbar, and findbar to Firefox's original flatter style. */
user_pref("uc.flex.revert-to-original-flat-corner-style",       false);
/* Reverts the bookmark star icon to Firefox's default design. */
user_pref("uc.flex.revert-to-original-bookmark-star-icon",      false);
/* Reverts the sidebar button icon to Firefox's default design. */
user_pref("uc.flex.revert-to-original-sidebar-icon",            false);
/* Removes the sidebar stripe when Sidebery is active. */
user_pref("uc.flex.remove-sidebar-stripe",                      false);

/* 🪛 Modify or Adjust Features */
/* Increases Sidebery's expanded width; also applies to native vertical tabs when kept open. */
user_pref("uc.flex.increase-sidebery-expanded-width",           false);
/* Increases navbar height, instead of Firefox's compact default. */
user_pref("uc.flex.increase-navbar-height",                     false);
/* Keeps the active horizontal tab wider when tabs shrink, making it easier to distinguish from others.
   Values: 0 = disabled, 1 = 1.8× no animation, 2 = 1.8× with animation, 3 = 2× no animation, 4 = 2× with animation */
user_pref("uc.flex.increase-active-horizontal-tab-min-width",       1);
/* Switches to a different, condensed extension panel. */
user_pref("uc.flex.switch-to-alternate-condensed-panel",        false);
/* Allow resizing Sidebery width; disables auto-collapse but allows toggling expand/collapse with Sidebar button */
user_pref("uc.flex.sidebery-allow-resizable-width",             false);
/* Speeds up the hover expand/collapse transitions for Sidebery. */
user_pref("uc.flex.sidebery-fast-hover-expand",                 false);
/* Slows down the hover expand/collapse transitions for Sidebery. */
user_pref("uc.flex.sidebery-slow-hover-expand",                 false);
/* Applies Sidebery's expand/collapse animation speed to the navigation bar and bookmarks toolbar. */
user_pref("uc.flex.sidebery-apply-expand-speed-to-toolbars",    false);
/* Set tabs per row for pinned tabs in Sidebery and native vertical tabs (2–5, default 5) */
user_pref("uc.flex.max-visible-horizontal-pinned-tabs",             5);
/* Set max visible rows for pinned tabs in Sidebery and native vertical tabs (2–8, 0 = unlimited) */
user_pref("uc.flex.max-visible-vertical-pinned-tabs",               4);
/* Sets findbar position (string: "top-center-left"/"1", "top-right"/"2", "bottom-right"/"3"). */
user_pref("uc.flex.findbar-position",                     "top-right");
/* Sets vertical spacing between items in app/bookmark/context menus (string: "1"/"small", "2"/"medium", "3"/"large"). */
user_pref("uc.flex.menu-item-spacing",                        "small");

/* ⚙️ Native Firefox Settings */
/* Improves startup speed by preventing pinned tabs from loading until selected. */
user_pref("browser.sessionstore.restore_pinned_tabs_on_demand",  true);
/* Fades out discarded tabs (manually unloaded) in Firefox's native vertical tabs. */
user_pref("browser.tabs.fadeOutExplicitlyUnloadedTabs",          true);
/* Fades out pending tabs (waiting to be restored at startup) in Firefox's native vertical tabs. */
user_pref("browser.tabs.fadeOutUnloadedTabs",                   false);
/* Sets animation duration for Firefox's native auto-collapse (only used if `sidebar.visibility` is set to `expand-on-hover`). */
user_pref("sidebar.animation.expand-on-hover.duration-ms",        120);

/* 🧊 Visual Background & Mica Effects */
/* Enables native Mica backdrop (Windows 11 only; requires System theme). */
user_pref("widget.windows.mica",                                false);
/* Enables Mica for popup menus (0 = off, 1 = on, 2 = auto). */
user_pref("widget.windows.mica.popups",                             2);
/* Sets Mica backdrop type (0 = auto/none, 1 = Mica, 2 = Acrylic, 3 = Mica Alt). */
user_pref("widget.windows.mica.toplevel-backdrop",                  2);
/* Allows full transparency for sidebars and panels (required for Mica and wallpaper in Sidebery). */
user_pref("browser.tabs.allow_transparent_browser",             false);
/* Sets Mica mask transparency level (0–4; higher = clearer). */
user_pref("uc.flex.browser-mica-transparency-level",                2);
/* Enables custom wallpaper as browser background. */
user_pref("uc.flex.browser-wallpaper-enabled",                  false);
/* Selects which image to use when multiple wallpapers are defined. */
user_pref("uc.flex.browser-wallpaper-index",                        1);
/* Disables acrylic-style blur effect on custom wallpaper. */
user_pref("uc.flex.browser-wallpaper-acrylic-disabled",         false);
/* Sets wallpaper mask transparency level (0–4; higher = clearer). */
user_pref("uc.flex.browser-wallpaper-transparency-level",           2);
/* Sets wallpaper contrast level in dark mode with acrylic (0–4; higher = more contrast). */
user_pref("uc.flex.browser-wallpaper-contrast-level",               2);

/* 🧩 Optional native Firefox preferences */
/* Adjusts the text scaling in the Firefox interface. 100 means no scaling. */
// user_pref("ui.textScaleFactor",                                 100);

/* Determines how Firefox handles OS text scaling settings.
   0 = Do not apply
   1 = Apply to the entire interface (default)
   2 = Apply to text only */
// user_pref("browser.display.os-zoom-behavior",                     2);

/* Sets the overall interface scaling. 1.25 means 125% scaling. */
// user_pref("layout.css.devPixelsPerPx",                         1.25);

/* Opens searches, typed URLs, and bookmarks in new tabs. */
// user_pref("browser.search.openintab",                          true);
// user_pref("browser.urlbar.openintab",                          true);
// user_pref("browser.tabs.loadBookmarksInTabs",                  true);

/* Uses the narrower scrollbar style from Windows 11. */
// user_pref("ui.useOverlayScrollbars",                              1);
// user_pref("widget.non-native-theme.scrollbar.style",              5);

/* Disables fade-in/out animations when entering and exiting fullscreen, for instant transitions. */
// user_pref("full-screen-api.transition-duration.enter",          0 0);
// user_pref("full-screen-api.transition-duration.leave",          0 0);

/* Enables browser chrome and add-on debugging toolboxes, and allows remote debugging without connection prompts. */
// user_pref("devtools.chrome.enabled",                           true);
// user_pref("devtools.debugger.remote-enabled",                  true);
// user_pref("devtools.debugger.prompt-connection",              false);