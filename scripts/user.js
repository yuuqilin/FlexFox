/* Enables userChrome.css for custom Firefox styles. Required setting. */
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
/* Enables SVG context properties to automatically adjust icon colors for light and dark themes. Required setting. */
user_pref("svg.context-properties.content.enabled",              true);
/* Boldens the text in the Firefox interface. */
user_pref("uc.flex.add-ui-text-stroke",                         false);
/* Fully hides the Sidebery sidebar. */
user_pref("uc.flex.fully-hide-sidebery",                        false);
/* Fully hides the top tab bar, navigation bar, and bookmarks toolbar. */
user_pref("uc.flex.fully-hide-toolbox",                         false);
/* Increases the expanded width of Sidebery. */
user_pref("uc.flex.increase-sidebery-expanded-width",           false);
/* Allows themes and extensions to customize the toolbar background. */
user_pref("uc.flex.allow-addons-to-change-toolbar-color",       false);
/* Sets gradient style for the highlight color (0 = off, 1–X = select style). Applies to logo, stripe, and star icon. */
user_pref("uc.flex.enable-gradient-highlight",                      0);
/* Disables the auto-hide feature of the bookmarks toolbar. */
user_pref("uc.flex.disable-bookmarks-autohide",                 false);
/* Disables the auto-hide feature of the horizontal tab bar. */
user_pref("uc.flex.disable-tabs-toolbar-autohide",              false);
/* Disables the auto-hide feature of the find bar. */
user_pref("uc.flex.disable-findbar-autohide",                   false);
/* Disables auto-collapse of native vertical tabs. */
user_pref("uc.flex.disable-native-vertical-tabs-autohide",      false);
/* Disables hover animations in Sidebery's expanded sidebar to prevent jittering. */
user_pref("uc.flex.disable-sidebery-hover-animations",          false);
/* Disables the auto-collapse feature of the Sidebery. */
user_pref("uc.flex.disable-sidebery-autohide",                  false);
/* Disables the extra right padding after the first item in the navigation bar. */
user_pref("uc.flex.disable-nav-bar-first-item-right-padding",   false);
/* Disables custom menu icons added by FlexFox. */
user_pref("uc.flex.disable-menu-icons",                         false);
/* Removes icons from bookmark folders. */
user_pref("uc.flex.remove-bookmarks-folder-icons",              false);
/* Removes labels from bookmarks. */
user_pref("uc.flex.remove-bookmarks-labels",                    false);
/* Switches to a different, condensed extension panel. */
user_pref("uc.flex.switch-to-alternate-condensed-panel",        false);
/* Reverts the window control buttons (minimize, maximize, close) to Firefox's default design. */
user_pref("uc.flex.revert-to-original-window-controls",         false);
/* Reverts the bookmark star icon to Firefox's default design. */
user_pref("uc.flex.revert-to-original-bookmark-star-icon",      false);
/* Reverts the sidebar button icon to Firefox's default design. */
user_pref("uc.flex.revert-to-original-sidebar-icon",            false);
/* Speeds up the hover expand/collapse transitions for Sidebery. */
user_pref("uc.flex.sidebery-fast-hover-expand",                 false);
/* Slows down the hover expand/collapse transitions for Sidebery. */
user_pref("uc.flex.sidebery-slow-hover-expand",                 false);
/* Shows a separator between pinned and regular tabs in vertical tabs. */
user_pref("uc.flex.show-pin-tabs-separator-in-expanded-state",  false);
/* Sets max pinned tabs per column in native vertical tabs (numeric, 4–6). */
user_pref("uc.flex.max-visible-vertical-pinned-tabs",               4);
/* Sets findbar position (string: "top-center-left"/"0", "top-right"/"1", "bottom-right"/"2"). */
user_pref("uc.flex.findbar-position",                     "top-right");
/* Disables Firefox's built-in auto-collapse for vertical tabs. */
user_pref("sidebar.visibility",                         "always-show");
/* Defines the animation duration for expanding/collapsing vertical tabs when `sidebar.visibility` is set to `expand-on-hover`. */
user_pref("sidebar.animation.expand-on-hover.duration-ms",        120);

/* Adjusts the text scaling in the Firefox interface. 100 means no scaling. */
// user_pref("ui.textScaleFactor",                                 100);

/* Determines how Firefox handles OS text scaling settings. 
   Value 2 applies OS text scaling to text only, not the entire interface. */
// user_pref("browser.display.os-zoom-behavior",                     2);

/* Sets the overall interface scaling. 1.25 means 125% scaling. */
// user_pref("layout.css.devPixelsPerPx",                         1.25);

/* Prevents pinned tabs from automatically loading at browser startup. */
// user_pref("browser.sessionstore.restore_pinned_tabs_on_demand",true);

/* Opens searches, typed URLs, and bookmarks in new tabs. */
// user_pref("browser.search.openintab",                          true);
// user_pref("browser.urlbar.openintab",                          true);
// user_pref("browser.tabs.loadBookmarksInTabs",                  true);

/* Uses the narrower scrollbar style from Windows 11. */
// user_pref("ui.useOverlayScrollbars",                              0);
// user_pref("widget.non-native-theme.scrollbar.style",              5);

/* Disables fade-in/out animations when entering and exiting fullscreen, for instant transitions. */
// user_pref("full-screen-api.transition-duration.enter",          0 0);
// user_pref("full-screen-api.transition-duration.leave",          0 0);

/* Enables browser chrome and add-on debugging toolboxes, and allows remote debugging without connection prompts. */
// user_pref("devtools.chrome.enabled",                           true);
// user_pref("devtools.debugger.remote-enabled",                  true);
// user_pref("devtools.debugger.prompt-connection",              false);