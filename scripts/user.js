/* 🔧 Required Setup */
/* Enables userChrome.css support. Required for FlexFox to work correctly. */
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
/* Allows FlexFox SVG icons to follow Firefox light and dark themes. */
user_pref("svg.context-properties.content.enabled",              true);
/* Required for FlexFox vertical tabs. Equivalent to disabling "Expand sidebar on hover". */
user_pref("sidebar.visibility",                         "always-show");

/* 🚫 FlexFox Control */
/* Instantly disables all FlexFox styles without restarting Firefox. Useful for troubleshooting. */
user_pref("uc.flex.disable-flexfox",                            false);
/* Skips loading specific uc-*.css files from ./components/ or ./content. Use to disable individual features or troubleshoot conflicts. */
// user_pref("uc.flex.skip-loading-uc-*.css",                   false);

/* 🦊 Sidebar Button (Firefox Logo) */
/* Sets the sidebar button icon.
   0 = Firefox default
   1 = Firefox Master Brand (default)
   2 = Firefox Browser
   3 = Firefox System 1
   4 = Mozilla Flag */
user_pref("uc.flex.style-sidebar-button",                           1);

/* 🌈 Sidebar Stripe & Accent Color */
/* Removes the sidebar stripe. Sidebar tools must then be accessed by keyboard shortcuts. */
user_pref("uc.flex.remove-sidebar-stripe",                      false);
/* Sets FlexFox's accent color for the sidebar stripe, tab highlights, and related icons.
   0 = Classic (default), 1 = Red, 2 = Orange, 3 = Yellow, 4 = Green,
   5 = Cyan, 6 = Blue, 7 = Violet, 8 = Purple, 9 = Pink, 10 = Gray */
user_pref("uc.flex.style-sidebar-stripe-color",                     0);
/* Applies the selected accent color to all icons. In Dark Mode, also affects interface borders. */
user_pref("uc.flex.style-sidebar-stripe-color-apply-to-all-icons",  false);
/* Applies a gradient version of the selected accent color. Affects the sidebar stripe, sidebar button, bookmark star, and folder icons. */
user_pref("uc.flex.style-sidebar-stripe-color-use-gradient",        false);

/* 📚 Sidebery & Vertical Tabs */
/* ### Shared Settings */
/* Completely hides Sidebery and native vertical tabs until the cursor reaches the screen edge. */
user_pref("uc.flex.fully-hide-sidebery",                        false);
/* Keeps Sidebery and native vertical tabs permanently expanded. */
user_pref("uc.flex.disable-sidebery-autohide",                  false);
/* Increases the expanded width of Sidebery and native vertical tabs. */
user_pref("uc.flex.increase-sidebery-expanded-width",           false);
/* Speeds up expand/collapse animations for Sidebery and native vertical tabs. */
user_pref("uc.flex.sidebery-fast-hover-expand",                 false);
/* Slows down expand/collapse animations for Sidebery and native vertical tabs. */
user_pref("uc.flex.sidebery-slow-hover-expand",                 false);
/* Applies sidebar expand/collapse speed to the navigation bar and toolbars. */
user_pref("uc.flex.sidebery-apply-expand-speed-to-toolbars",    false);
/* ### Sidebery Only */
/* Removes the icon enlargement effect for Sidebery pinned tabs and navigation panels. */
user_pref("uc.flex.sidebery-disable-icon-scaling",              false);
/* Disables Sidebery auto-collapse and allows manual width adjustment via the sidebar splitter. */
user_pref("uc.flex.sidebery-allow-resizable-width",             false);
/* Sets the navigation icon shown when Sidebery is collapsed.
   0 = Active panel icon (default)
   1 = Sidebery Logo
   2 = Chevron */
user_pref("uc.flex.style-sidebery-nav-icon",                        0);
/* Applies the active panel color to the Sidebery navigation icon. */
user_pref("uc.flex.style-sidebery-nav-icon-use-active-panel-color", false);
/* ### Native Vertical Tabs Only */
/* Shows a draggable separator below pinned tabs to resize the pinned tabs area. */
user_pref("uc.flex.show-pin-tabs-separator-in-expanded-state",  false);

/* 📑 Horizontal Tabs */
/* Auto-hides horizontal tabs while keeping the navigation bar visible.
   0 = Tabs remain visible (default)
   1 = Show tabs below the navigation bar
   2 = Show tabs above the navigation bar
   3 = Show tabs above the navigation bar only when the cursor reaches the top edge */
user_pref("uc.flex.auto-hide-horizontal-tabs-and-keep-navbar",      0);
/* Auto-hides the navigation bar while keeping horizontal tabs visible.
   0 = Navigation bar remains visible (default)
   1 = Show navigation bar when hovering over tabs */
user_pref("uc.flex.auto-hide-navbar-and-keep-horizontal-tabs",      0);
/* Shows the close button when hovering over a tab favicon. */
user_pref("uc.flex.show-tab-close-button-on-favicon-hover",     false);
/* Hides close buttons on inactive tabs. */
user_pref("uc.flex.disable-tab-close-button-on-inactive-horizontal-tabs", false);
/* Increases the width of the active tab.
   0 = Disabled
   1 = 1.8× width, no animation (default)
   2 = 1.8× width, with animation
   3 = 2× width, no animation
   4 = 2× width, with animation */
user_pref("uc.flex.increase-active-horizontal-tab-min-width",       1);

/* 📌 Pinned Tabs */
/* Sets the maximum number of pinned tabs per row.
   Vertical tabs: additional tabs wrap to the next row.
   1–5 = 1–5 visible tabs

   Horizontal tabs: additional tabs collapse automatically.
   0 = Unlimited (disable auto-collapse)
   1–5 = 2–10 visible tabs */
user_pref("uc.flex.max-visible-horizontal-pinned-tabs",             5);
/* Sets the maximum number of pinned tabs per column.
   0 = Unlimited
   2–8 = Maximum visible tabs before scrolling (default: 4) */
user_pref("uc.flex.max-visible-vertical-pinned-tabs",               4);

/* 🗂️ Tab Groups */
/* ### Native Vertical Tabs Only */
/* Sets the appearance of tab groups.
   0 = Tree layout, no state indicator
   1 = Tree layout with triangle indicator (default)
   2 = Box layout with folder icon */
user_pref("uc.flex.style-tab-groups",                               1);
/* Sets expand/collapse animations for tab groups.
   0 = No animation
   1 = Expand/collapse animation
   2 = Animation with animated state indicators (default) */
user_pref("uc.flex.style-tab-groups-add-transition",                2);
/* Centers tab group labels. */
user_pref("uc.flex.style-tab-groups-center-label-text",         false);

/* 🧩 Tab Appearance */
/* ### Sidebery & Native Vertical Tabs Only */
/* Sets the appearance of tab items.
   Active tabs always use both a border and background highlight.
   1 = Pinned tabs use borders only (default)
   2 = Pinned tabs use background highlights only */
user_pref("uc.flex.style-tab-items",                                1);
/* Adds a trailing highlight effect when hovering over tabs. */
user_pref("uc.flex.style-tab-items-add-hover-trail",             true);

/* 🔖 Bookmarks */
/* ### Bookmark Items */
/* Sets bookmark folder icons.
   0 = Firefox default icons (default)
   1 = Solid-color folder icons
   2 = Patterned folder icons with labels hidden */
user_pref("uc.flex.enable-colored-bookmarks-folder-icons",          0);
/* Hides bookmark folder icons. */
user_pref("uc.flex.remove-bookmarks-folder-icons",              false);
/* Hides bookmark folder labels. */
user_pref("uc.flex.remove-bookmarks-labels",                    false);
/* ### Bookmark Star */
/* Restores Firefox's default bookmark star icon and color. */
user_pref("uc.flex.revert-to-original-bookmark-star-icon",      false);

/* 🧭 Navigation Bar & Toolbars */
/* Completely hides all top toolbars until the cursor reaches the top edge of the screen. */
user_pref("uc.flex.fully-hide-toolbox",                         false);
/* Keeps the bookmarks toolbar always visible. */
user_pref("uc.flex.disable-bookmarks-autohide",                 false);
/* Removes the extra spacing after the first navigation bar item. */
user_pref("uc.flex.disable-nav-bar-first-item-right-padding",   false);
/* Increases the navigation bar height by 3px for compatibility with older FlexFox styles. */
user_pref("uc.flex.increase-navbar-height",                     false);

/* 🛠️ Toolbar Buttons */
/* Automatically fades toolbar icons in and out on hover. */
user_pref("uc.flex.auto-hide-navbar-icons",                     false);
/* Sets the icon for the "List All Tabs" button.
   0 = Firefox default
   1 = Filter (default)
   2 = Chevron */
user_pref("uc.flex.style-all-tabs-button",                          1);

/* 🔎 Address Bar */
/* Auto-hides URL bar icons and reveals them with a slide-in animation on hover. */
user_pref("uc.flex.auto-hide-urlbar-icons",                      true);
/* Sets the appearance of the URL bar.
   1 = Flat (default)
   2 = Inset
   3 = Debossed
   4 = Seamless */
user_pref("uc.flex.style-urlbar",                                   1);
/* Centers the text in the URL bar. */
user_pref("uc.flex.style-urlbar-center-text",                   false);
/* Repositions the URL bar popup to the center of the browser window.
   0 = Disabled (default)
   1 = Center when focused
   2 = Center only while typing */
user_pref("uc.flex.move-urlbar-popup-to-center",                    0);
/* Dims the browser interface while the URL bar popup is open.
   0 = Disabled (default)
   1 = Light dimming
   2 = Strong dimming */
user_pref("uc.flex.dim-urlbar-popup-backdrop",                      0);

/* 🧩 Extensions Panel */
/* Switches to a compact extensions panel that displays extension names. */
user_pref("uc.flex.switch-to-alternate-condensed-panel",        false);

/* 🪟 Window Controls */
/* Auto-hides window controls and slides them into view when the cursor reaches the screen edge. */
user_pref("uc.flex.auto-hide-window-controls",                  false);
/* Restores Firefox's default window control placement in horizontal tabs mode. */
user_pref("uc.flex.restore-window-controls-on-tabbar",          false);
/* Restores Firefox's default window control icons. */
user_pref("uc.flex.revert-to-original-window-controls",         false);
/* Sets the window control icons.
   1 = Traffic Light (default)
   2 = Yosemite Buttons
   3 = Yosemite GTK */
user_pref("uc.flex.style-window-controls",                          1);
/* Restores Firefox's original higher window control position. */
user_pref("uc.flex.style-window-controls-shift-up",             false);
/* Reduces the size of the window controls. */
user_pref("uc.flex.style-window-controls-shrink-size",          false);
/* Moves window controls to the left side of the window. Not recommended on macOS. */
user_pref("uc.flex.move-window-controls-to-left",               false);

/* 📋 Menus */
/* Removes icons from menus and panels. */
user_pref("uc.flex.disable-menu-icons",                         false);
/* Sets vertical spacing in menus and panels.
   "1" / "small" = Compact
   "2" / "medium" = Default
   "3" / "large" = Spacious */
user_pref("uc.flex.menu-item-spacing",                        "small");

/* 🌐 Web Content Area */
/* Adds margins, shadows, and rounded corners to web content.
   0 = Disabled (default)
   1–2 = Increase margins and spacing */
user_pref("uc.flex.enable-rounded-web-content",                     0);
/* Rounds all four web content corners when the sidebar stripe is visible. */
user_pref("uc.flex.enable-rounded-web-content-at-sidebery-corner", false);
/* Shows outlines around web content areas.
   0 = No outline (default)
   1 = Highlight focused panel in Tab Split View
   2 = Show outlines on all web content areas */
user_pref("uc.flex.style-web-content-outline",                      0);

/* 🔍 Findbar */
/* Prevents the Findbar from hiding automatically. Press Esc to close it. */
user_pref("uc.flex.disable-findbar-autohide",                   false);
/* Sets the Findbar position.
   "1" / "top-center-left" = Top center-left
   "2" / "top-right" = Top right
   "3" / "bottom-right" = Bottom right */
user_pref("uc.flex.findbar-position",                     "top-right");

/* 🎨 Browser Appearance */
/* Adds an outline to UI text for improved readability. */
user_pref("uc.flex.add-ui-text-stroke",                         false);
/* Forces toolbar colors from themes and extensions without background images. */
user_pref("uc.flex.allow-addons-to-change-toolbar-color",       false);
/* Sets the toolbar color scheme for Firefox's built-in Light and Dark themes.
   1 = Tokyo Night (default)
   2 = Firefox Acorn Design */
user_pref("uc.flex.style-toolbar-bgcolor",                          1);
/* Sets the interface corner style.
   0 = Small rounded corners (default)
   1 = Large rounded corners
   2 = Square corners
   3 = Rounded URL bar only */
user_pref("uc.flex.revert-to-original-flat-corner-style",           0);

/* 🧰 Utilities & Extras */
/* Shows the installed FlexFox version in about:config. */
user_pref("uc.flex.show-flexfox-version-info-in-about-config",   true);
/* Shows the tab count on the "List All Tabs" button.
   0 = Off
   1 = All tabs
   2 = Loaded tabs only */
user_pref("uc.flex.show-tab-count-in-alltabs-button",               0);
/* Shows a numeric index before each native tab label. */
user_pref("uc.flex.show-tab-number-in-tab-label",               false);
/* Moves the PiP volume button to the top of the window. */
user_pref("uc.flex.move-pip-volume-to-top",                     false);

/* 🧊 Windows Mica */
/* Enables the Windows Mica backdrop in Firefox (Windows 11 only). */
user_pref("widget.windows.mica",                                false);
/* Controls Mica for popup menus.
   0 = Off
   1 = On
   2 = Auto (default) */
user_pref("widget.windows.mica.popups",                             2);
/* Sets the Windows backdrop type.
   0 = Auto or none
   1 = Mica
   2 = Acrylic (default)
   3 = Mica Alt */
user_pref("widget.windows.mica.toplevel-backdrop",                  2);
/* Forces Mica to work with all Firefox themes (requires widget.windows.mica). */
user_pref("uc.flex.browser-mica-force-enabled-on-all-themes",   false);
/* Sets Mica overlay transparency.
   0–4 = Higher values reveal more background */
user_pref("uc.flex.browser-mica-transparency-level",                2);

/* ✨ Transparent Browser */
/* Allows web content and Sidebery to become transparent. Restart Firefox to apply changes. */
user_pref("browser.tabs.allow_transparent_browser",             false);
/* Sets the Solid Page color scheme.
   0 = Black
   1 = White (default)
   2 = Follow Firefox's Website appearance setting */
user_pref("uc.flex.browser-solid-page-color-scheme",                1);
/* Enables translucent menus, panels, and URL bar popups without Mica or wallpapers. */
user_pref("uc.flex.enable-translucent-urlbar-popup-and-menus",  false);

/* 🖼️ Browser Wallpapers */
/* Enables custom browser wallpapers. */
user_pref("uc.flex.browser-wallpaper-enabled",                  false);
/* Selects the wallpaper source.
   0 = Current theme background
   1–9 = main-image-1.jpg through main-image-9.jpg */
user_pref("uc.flex.browser-wallpaper-index",                        0);
/* Enables SVG wallpapers. SVG files must retain the .svg extension. */
user_pref("uc.flex.browser-wallpaper-svg-enabled",              false);
/* Disables the acrylic blur effect applied to wallpapers. */
user_pref("uc.flex.browser-wallpaper-acrylic-disabled",         false);
/* Sets wallpaper alignment when images are cropped.
   "0" / "auto" = Automatic
   "1" / "left" = Left
   "2" / "center" = Center
   "3" / "right" = Right */
user_pref("uc.flex.browser-wallpaper-align-horizontal",        "auto");
/* Sets wallpaper overlay transparency.
   0–4 = Higher values reveal more background */
user_pref("uc.flex.browser-wallpaper-transparency-level",           2);
/* Sets wallpaper overlay contrast in dark mode with acrylic enabled.
   0–4 = Higher values increase contrast */
user_pref("uc.flex.browser-wallpaper-contrast-level",               2);

/* ⚙️ Firefox Native Settings */
/* Delays loading pinned tabs until selected to improve startup speed. */
user_pref("browser.sessionstore.restore_pinned_tabs_on_demand",  true);
/* Fades manually unloaded tabs in native tabs. */
user_pref("browser.tabs.fadeOutExplicitlyUnloadedTabs",          true);
/* Fades tabs that have not yet been restored after startup in native tabs. */
user_pref("browser.tabs.fadeOutUnloadedTabs",                   false);
/* Sets animation duration for Firefox's native auto-collapse (only used if `sidebar.visibility` is set to `expand-on-hover`). */
user_pref("sidebar.animation.expand-on-hover.duration-ms",        120);

/* 🧩 Optional native Firefox preferences */
/* Sets the overall Firefox interface scale. 1.25 = 125% scaling. */
// user_pref("layout.css.devPixelsPerPx",                         1.25);

/* Sets the Firefox text scale only. 100 = default size. */
// user_pref("ui.textScaleFactor",                                 100);

/* Opens searches, typed URLs, and bookmarks in new tabs. */
// user_pref("browser.search.openintab",                          true);
// user_pref("browser.urlbar.openintab",                          true);
// user_pref("browser.tabs.loadBookmarksInTabs",                  true);

/* Removes fullscreen transition animations for faster switching. */
// user_pref("full-screen-api.transition-duration.enter",          0 0);
// user_pref("full-screen-api.transition-duration.leave",          0 0);

/* 🧪 Developer & Testing Preferences */
/* Enables browser chrome and extension debugging, and disables remote debugging prompts. */
// user_pref("devtools.chrome.enabled",                           true);
// user_pref("devtools.debugger.remote-enabled",                  true);
// user_pref("devtools.debugger.prompt-connection",              false);

/* Sets Firefox's native sidebar hover animation duration in milliseconds.
   Only applies when sidebar.visibility = "expand-on-hover". */
// user_pref("sidebar.animation.expand-on-hover.duration_ms",      120);