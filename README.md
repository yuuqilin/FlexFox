# FlexFox
A Firefox theme based on [VerticalFox](https://github.com/christorange/VerticalFox), offering enhanced flexibility options.

## Previews
![light theme](./assets/FlexFox-light.webp)
![dark theme](./assets/FlexFox-dark.webp)

## Features
- Based on [VerticalFox](https://github.com/christorange/VerticalFox), [EdgyArc-fr](https://github.com/artsyfriedchicken/EdgyArc-fr), and [firefox-csshacks](https://github.com/MrOtherGuy/firefox-csshacks).

- Automatically collapses sidebar, tabs toolbar, and bookmarks toolbar; expands on hover.

- Options to completely hide sidebar, nav-bar, or both for a full-screen-like experience with only web content visible; auto-expands when mouse moves to screen edges.

- Hidden elements expand using an overlap method, preventing content shifting and visual jumps.

- Compatible with menu bar and title bar display; sidebar can be placed on the right side; styles automatically adjust to the chosen configuration.

- Sidebery's Pinned Tabs Bar and Navigation Bar auto-collapse and expand; when expanded, all tabs maintain their positions, eliminating need for mouse repositioning.

- Floating find bar at the top of the screen.

- Compact uni-extensions panel and macOS-style window controls.

## Installation

> #### 1. Enter `about:config` in the URL bar and set `toolkit.legacyUserProfileCustomizations.stylesheets` to "True" to enable custom styles.
> #### 2. Install [Sidebery](https://addons.mozilla.org/en-US/firefox/addon/sidebery/).
> #### 3. Click `<>Code` at the top of this page and select [`Download ZIP`](https://github.com/yuuqilin/FlexFox/archive/refs/heads/main.zip) to download the FlexFox package.
> #### 4. Enter `about:support` in the URL bar and click `Open folder` in the `Profile folder` section to access your profile directory.
> #### 5. Copy the `chrome` folder and `user.js` file from the `Profiles` folder in the FlexFox package to your `Profile folder`, then restart Firefox.
> [!IMPORTANT] 
> #### After restarting, delete the `user.js` file you just copied to the `Profile folder`.
> #### 6. Click the gear icon to open Sidebery settings, select `Help`, then click `Import addon data`. Import `sidebery-settings.json` and `sidebery-styles.json` from the `Sidebery` folder in the FlexFox package.
> [!IMPORTANT] 
> #### Sidebery settings may occasionally fail to import properly. If you notice that Sidebery's appearance hasn't changed or the style seems incorrect, please try importing the settings again.
> #### 7. In `about:config`, search for `uc.flex` and modify FlexFox options as needed.

## Options
   - `uc.flex.add-ui-text-stroke`: Bolds Firefox interface text
   - `uc.flex.bookmarks-have-more-margin-left`: Increases left margin of bookmarks when placed in nav-bar
   - `uc.flex.hide-sidebery-completely`: Fully hides Sidebery
   - `uc.flex.hide-toolbox-completely`: Fully hides tabs-toolbar and nav-bar
   - `uc.flex.large-sidebery`: Increases expanded Sidebery width
   - `uc.flex.prevent-bookmarks-auto-hide`: Disables auto-hiding of bookmarks toolbar
   - `uc.flex.prevent-tabs-toolbar-auto-hide`: Disables auto-hiding of tabs-toolbar when Sidebery is disabled
   - `uc.flex.remove-bookmarks-folder-icons`: Removes bookmark folder icons
   - `uc.flex.remove-bookmarks-labels`: Removes bookmark labels
   - `uc.flex.restore-uni-extensions-panel`: Disables compact uni-extensions panel, switching to condensed uni-extensions panel
   - `uc.flex.restore-window-controls`: Disables macOS-style window controls, reverting to default controls
   - `uc.flex.sidebery-hover-fast-expand`: Speeds up Sidebery's expand/collapse on hover
   - `uc.flex.sidebery-hover-slow-expand`: Slows down Sidebery's expand/collapse on hover

## Known Issues
If you're using Firefox Nightly 129.0a1, please rename 'uc-urlbar-fix-for-129.0a1.css' to 'uc-urlbar.css' and replace the existing file. This will fix display issues with the URL bar.

This style has only been tested on Windows. Manual adjustments may be needed for other operating systems.
