/* Enables userChrome.css for custom Firefox styles. Required setting. */
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
/* Enables SVG context properties to automatically adjust icon colors for light and dark themes. Required setting. */
user_pref("svg.context-properties.content.enabled",              true);
/* Boldens the text in the Firefox interface. */
user_pref("uc.flex.add-ui-text-stroke",                         false);
/* Adds extra left margin to bookmarks for alignment with other toolbar icons. */
user_pref("uc.flex.add-bookmarks-left-margin",                  false);
/* Fully hides the Sidebery sidebar. */
user_pref("uc.flex.fully-hide-sidebery",                        false);
/* Fully hides the top tab bar, navigation bar, and bookmarks toolbar. */
user_pref("uc.flex.fully-hide-toolbox",                         false);
/* Increases the expanded width of Sidebery. */
user_pref("uc.flex.increase-sidebery-expanded-width",           false);
/* Disables the auto-hide feature of the bookmarks toolbar. */
user_pref("uc.flex.disable-bookmarks-autohide",                 false);
/* Disables the auto-hide feature of the horizontal tab bar. */
user_pref("uc.flex.disable-tabs-toolbar-autohide",              false);
/* Disables the auto-hide feature of the find bar. */
user_pref("uc.flex.disable-findbar-autohide",                   false);
/* Removes icons from bookmark folders. */
user_pref("uc.flex.remove-bookmarks-folder-icons",              false);
/* Removes labels from bookmarks. */
user_pref("uc.flex.remove-bookmarks-labels",                    false);
/* Switches to a different, condensed extension panel. */
user_pref("uc.flex.switch-to-alternate-condensed-panel",        false);
/* Restores the original icons for minimize, maximize, and close window buttons. */
user_pref("uc.flex.revert-to-original-window-controls",         false);
/* Speeds up the hover expand/collapse transitions for Sidebery. */
user_pref("uc.flex.sidebery-fast-hover-expand",                 false);
/* Slows down the hover expand/collapse transitions for Sidebery. */
user_pref("uc.flex.sidebery-slow-hover-expand",                 false);

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

/* Enable browser chrome and add-on debugging toolboxes, and allow remote debugging without connection prompts. */
// user_pref("devtools.chrome.enabled",                           true);
// user_pref("devtools.debugger.remote-enabled",                  true);
// user_pref("devtools.debugger.prompt-connection",              false);