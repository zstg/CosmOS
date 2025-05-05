// Mozilla User Preferences
// To change a preference value, you can either:
// - modify it via the UI (e.g. via about:config in the browser); or
// - set it within a user.js file in your profile.

user_pref("accessibility.typeaheadfind.flashBar", 0);
user_pref("app.normandy.first_run", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("browser.autofocus", false);
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.bookmarks.editDialog.confirmationHintShowCount", 3);
user_pref("browser.bookmarks.restore_default_bookmarks", false);
user_pref("browser.contentblocking.category", "strict"); // Enhanced Tracking Protection
user_pref("browser.discovery.enabled", false); // disable personalized Extension Recommendations in about:addons and AMO [FF65+]
user_pref("browser.display.use_system_colors", true);
user_pref("browser.download.panel.shown", true);
user_pref("browser.download.alwaysOpenPanel", true); // enable downloads panel opening on every download [FF96+]
user_pref("browser.download.useDownloadDir", false);
user_pref("browser.download.viewableInternally.typeWasRegistered.avif", true);
user_pref("browser.download.viewableInternally.typeWasRegistered.jxl", true);
user_pref("browser.download.viewableInternally.typeWasRegistered.webp", true);
user_pref("browser.engagement.ctrlTab.has-used", true);
user_pref("browser.engagement.downloads-button.has-used", true);
user_pref("browser.engagement.home-button.has-removed", true);
user_pref("browser.engagement.sidebar-button.has-used", true);
user_pref("browser.laterrun.bookkeeping.sessionCount", 1);
user_pref("browser.laterrun.enabled", true);
user_pref("browser.migrate.interactions.bookmarks", true);
user_pref("browser.migrate.interactions.history", true);
user_pref("browser.search.region", "US");
user_pref("browser.search.serpEventTelemetryCategorization.regionEnabled", false);
user_pref("browser.startup.page", 1);
user_pref("browser.tabs.allow_transparent_browser", false);
user_pref("browser.tabs.inTitlebar", 1);
user_pref("browser.tabs.groups.enabled", true); // beta feature
user_pref("browser.tabs.groups.smart.enabled", true); // beta feature
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.toolbars.bookmarks.showOtherBookmarks", false);
user_pref("browser.toolbars.bookmarks.visibility", "newtab");
// user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[\"78272b6fa58f4a1abaac99321d503a20_proton_me-browser-action\",\"addon_darkreader_org-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action\",\"plasma-browser-integration_kde_org-browser-action\"],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"customizableui-special-spring1\",\"vertical-spacer\",\"urlbar-container\",\"customizableui-special-spring2\",\"unified-extensions-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\"],\"vertical-tabs\":[],\"PersonalToolbar\":[\"personal-bookmarks\"],\"zen-sidebar-top-buttons\":[],\"zen-sidebar-bottom-buttons\":[\"preferences-button\",\"zen-workspaces-button\",\"zen-expand-sidebar-button\",\"downloads-button\",\"sidebar-button\"]},\"seen\":[\"78272b6fa58f4a1abaac99321d503a20_proton_me-browser-action\",\"addon_darkreader_org-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action\",\"developer-button\",\"plasma-browser-integration_kde_org-browser-action\"],\"dirtyAreaCache\":[\"unified-extensions-area\",\"nav-bar\",\"vertical-tabs\",\"zen-sidebar-bottom-buttons\",\"toolbar-menubar\",\"TabsToolbar\",\"PersonalToolbar\"],\"currentVersion\":21,\"newElementCount\":5}");
user_pref("browser.urlbar.placeholderName", "DuckDuckGo");
user_pref("browser.urlbar.placeholderName.private", "Google");
user_pref("browser.urlbar.quicksuggest.scenario", "history");
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.search.suggest.enabled.private", false);
user_pref("browser.search.separatePrivateDefault.ui.enabled", false); // Use this search engine in Private Windows
user_pref("browser.search.suggest.history", true);
user_pref("browser.search.suggest.openpage", false);
user_pref("browser.search.suggest.searches", false);
user_pref("browser.search.suggest.topsites", false);
user_pref("browser.sessionstore.resume_from_crash", true);
user_pref("browser.tabs.closeWindowWithLastTab", false);
user_pref("browser.tabs.hoverPreview.enabled", true);
user_pref("browser.tabs.hoverPreview.showThumbnails", true);
user_pref("browser.tabs.opentabfor.middleclick", true);
user_pref("browser.tabs.searchclipboardfor.middleclick", false); // middle click no longer pasts URLs!
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("browser.urlbar.switchTabs.searchAllContainers", true); // ensures that tab search works for containerized tabs too. Set to true by default.
user_pref("browser.urlbar.suggest.engines", false); // disable tab-to-search [FF85+]
user_pref("captchadetection.hasUnsubmittedData", false);
user_pref("devtools.aboutdebugging.collapsibilities.processes", false);
user_pref("devtools.debugger.remote-enabled", false);
user_pref("devtools.everOpened", false);
user_pref("distribution.iniFile.exists.value", false);
user_pref("doh-rollout.home-region", "US");
user_pref("dom.security.https_only_mode_ever_enabled", true);
user_pref("editor.use_custom_colors", true);
user_pref("extensions.activeThemeID", "default-theme@mozilla.org");
user_pref("extensions.blocklist.pingCountVersion", 0);
user_pref("extensions.pendingOperations", false);
user_pref("extensions.pictureinpicture.enable_picture_in_picture_overrides", true);
// user_pref("extensions.quarantineIgnoredByUser.78272b6fa58f4a1abaac99321d503a20@proton.me", false);
// user_pref("extensions.quarantineIgnoredByUser.plasma-browser-integration@kde.org", true);
// user_pref("extensions.quarantineIgnoredByUser.{d7742d87-e61d-4b78-b8a1-b469842139fa}", true);
// user_pref("extensions.quarantinedDomains.list", "autoatendimento.bb.com.br,ibpf.sicredi.com.br,ibpj.sicredi.com.br,internetbanking.caixa.gov.br,www.ib12.bradesco.com.br,www2.bancobrasil.com.br");
// user_pref("extensions.systemAddonSet", "{\"schema\":1,\"directory\":\"{700b36e5-2030-49eb-b749-26c5e3e5e63b}\",\"addons\":{\"webcompat@mozilla.org\":{\"version\":\"137.5.20250303.181531\"}}}");
// user_pref("extensions.ui.dictionary.hidden", true);
user_pref("extensions.ui.extension.hidden", false);
user_pref("extensions.ui.lastCategory", "addons://list/extension");
user_pref("extensions.ui.locale.hidden", true);
user_pref("extensions.ui.sitepermission.hidden", true);
user_pref("extensions.webcompat.enable_shims", true);
user_pref("extensions.webcompat.perform_injections", true);
user_pref("extensions.webcompat.perform_ua_overrides", true);
// user_pref("extensions.webextensions.ExtensionStorageIDB.migrated.78272b6fa58f4a1abaac99321d503a20@proton.me", true);
// user_pref("extensions.webextensions.ExtensionStorageIDB.migrated.addon@darkreader.org", true);
// user_pref("extensions.webextensions.ExtensionStorageIDB.migrated.plasma-browser-integration@kde.org", true);
// user_pref("extensions.webextensions.ExtensionStorageIDB.migrated.screenshots@mozilla.org", true);
// user_pref("extensions.webextensions.ExtensionStorageIDB.migrated.uBlock0@raymondhill.net", true);
// user_pref("extensions.webextensions.ExtensionStorageIDB.migrated.{d7742d87-e61d-4b78-b8a1-b469842139fa}", true);
// user_pref("extensions.webextensions.uuids", "{\"formautofill@mozilla.org\":\"a3aab478-68ed-4632-9f9c-c8c2c645bde7\",\"pictureinpicture@mozilla.org\":\"d6191b6c-956a-47f0-83f2-75caab85f834\",\"screenshots@mozilla.org\":\"a79f4691-2612-4ec0-b974-a760c1674606\",\"webcompat-reporter@mozilla.org\":\"3693b0b3-7623-47a4-9c69-a119a0fcf7c4\",\"webcompat@mozilla.org\":\"f1d9abad-f09e-4f36-9f23-d7c314be79d7\",\"firefox-compact-dark@mozilla.org\":\"a4f45f76-7b28-4759-959e-3854ae852053\",\"addons-search-detection@mozilla.com\":\"5519a386-48d1-41eb-a44c-9f0001a9605e\",\"78272b6fa58f4a1abaac99321d503a20@proton.me\":\"30352c8d-4dd3-4891-afa7-cc28fad7d2b1\",\"uBlock0@raymondhill.net\":\"f357f5a2-0a39-42da-9d21-19264f6d6783\",\"default-theme@mozilla.org\":\"ab90122b-fb83-4b90-965e-eb32c2f522e9\",\"firefox-compact-light@mozilla.org\":\"ad8d3abc-f1f0-411b-92bf-2fa8c6785122\",\"{d7742d87-e61d-4b78-b8a1-b469842139fa}\":\"22a0f9de-3ba6-4dc0-b307-18b79b1beae9\",\"addon@darkreader.org\":\"50463fc2-f555-4dc0-a0fa-37588f74517c\",\"plasma-browser-integration@kde.org\":\"fd788e45-d31e-4d96-924a-b798f579d476\"}");
user_pref("gecko.handlerService.defaultHandlersVersion", 1);
user_pref("geo.provider.use_geoclue", false); // disable using the OS's geolocation service
user_pref("apz.overscroll.enabled", true);
user_pref("general.autoScroll", true);
user_pref("general.smoothScroll", true);
// user_pref("general.smoothScroll.msdPhysics.enabled", true);
// user_pref("mousewheel.default.delta_multiplier_y", 300); // 250-400; adjust this number to your liking
// user_pref("general.smoothScroll.pages", true);
user_pref("apz.gtk.kinetic_scroll.enabled", false); // really visually irritating
user_pref("apz.gtk.pangesture.delta_mode", 2);
user_pref("apz.gtk.pangesture.pixel_delta_mode_multiplier", 25);


user_pref("browser.preferences.defaultPerformanceSettings.enabled", false); // defaults enable hardware acceleration
user_pref("layers.acceleration.disabled", false); // keep this as is, this makes a huge difference!
user_pref("gfx.webrender.all", true);
user_pref("gfx.webrender.software", false);
user_pref("gfx.blacklist.accelerated-canvas2d", 6);
user_pref("gfx.blacklist.accelerated-canvas2d.failureid", "FEATURE_FAILURE_DL_BLOCKLIST_NO_ID");

// Disable WebRTC. Setting to false BREAKS WebRTC software like Jitsi!
// +Setting this to true here, configuring uBO to prevent IP leak instead - rather than disabling WebRTC altogether.+
user_pref("media.peerconnection.enabled", false);

user_pref("media.ffmpeg.vaapi.enabled", true);
user_pref("media.gmp-gmpopenh264.abi", "x86_64-gcc3");
user_pref("media.gmp-widevinecdm.abi", "x86_64-gcc3");
user_pref("media.gmp.storage.version.observed", 1);
// These settings BREAK quite some websites! Don't change these!! Fiddle around with the gradient and the accent colour options, but DO NOT change this. 
// user_pref("mod.sameerasw.zen_bg_color_enabled", false);
// user_pref("mod.sameerasw.zen_empty_page_transparency", true);
// user_pref("mod.sameerasw.zen_transparency_color", "#363636");
user_pref("network.cookie.cookieBehavior.optInPartitioning", true);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.http.referer.disallowCrossSiteRelaxingDefault.top_navigation", true);
user_pref("network.http.speculative-parallel-limit", 0);
user_pref("network.IDN_show_punycode", false);
user_pref("network.predictor.enabled", false);
user_pref("network.prefetch-next", false);
/*
https://sites.google.com/view/a-bit-better-privacy/trr-dns-over-https
A value of 0 means that it is disabled and not used.
A value of 1 that Firefox uses either native DNS or TRR depending on which is faster.
A value of 2 uses TRR by default but will fall back to the native resolver if the name resolve fails for whatever reason.
A value of 3 enables TRR only mode. Only TRR is used and there is no fallback.
A value of 4 runs it in shadow mode which means that TRR is run in parallel for gathering data but that the native resolver is used.
A value of 5 - Off by choice. This is the same as 0 but marks it as done by choice and not done by default. 
*/
user_pref("network.trr.mode", 2);
user_pref("network.trr.uri", "https://all.dns.mullvad.net/dns-query");
user_pref("network.trr.custom_uri", "https://all.dns.mullvad.net/dns-query");
/*
From https://mullvad.net/en/help/dns-over-https-and-dns-over-tls#how-to-use:

    https://dns.mullvad.net/dns-query
    https://adblock.dns.mullvad.net/dns-query
    https://base.dns.mullvad.net/dns-query
    https://extended.dns.mullvad.net/dns-query
    https://family.dns.mullvad.net/dns-query
    https://all.dns.mullvad.net/dns-query

    https://dns.adguard-dns.com/dns-query -> blocks ads and trackers
*/  
user_pref("network.security.esni.enabled", true);
user_pref("network.dns.https_only_mode", true);
// user_pref("network.trr.custom_uri", "https://firefox.dns.nextdns.io/");
user_pref("pdfjs.enabledCache.state", true);
/*
    0 => auto-detect 
    1 => Light background
    2 => Dark background
*/    
// user_pref("pdfjs.viewerCssTheme",2); // doesn't take effect due to privacy.resistFingerprinting
user_pref("pdfjs.forcePageColours", true);
// user_pref("pdfjs.pageColorsForeground", "#61afef"); // this changes the colour of text and images on the PDF. Stick to black for readability purposes!
// user_pref("pdfjs.pageColorsBackground", "#000000"); // this changes the PDF colour. Stick to white for readability purposes!
user_pref("pdfjs.pageColorsForeground", "#000000"); 
user_pref("pdfjs.pageColorsBackground", "#FFFFFF"); 

user_pref("pdfjs.migrationVersion", 2);
user_pref("privacy.annotate_channels.strict_list.enabled", true);
user_pref("privacy.bounceTrackingProtection.hasMigratedUserActivationData", true);
user_pref("privacy.bounceTrackingProtection.mode", 1);
user_pref("privacy.clearOnShutdown.downloads", false);
user_pref("privacy.clearHistory.cookiesAndStorage", false);
user_pref("privacy.clearHistory.formdata", true);
user_pref("privacy.clearOnShutdown_v2.formdata", true);
user_pref("privacy.fingerprintingProtection", true);
user_pref("privacy.globalprivacycontrol.enabled", true);
user_pref("privacy.globalprivacycontrol.was_ever_enabled", true);
user_pref("privacy.history.custom", true);
user_pref("privacy.purge_trackers.date_in_cookie_database", "0");
user_pref("privacy.query_stripping.enabled", true);
user_pref("privacy.query_stripping.enabled.pbmode", true);
user_pref("privacy.resistFingerprinting", true);
user_pref("pdfjs.viewerCssTheme",2); // doesn't take effect due to privacy.resistFingerprinting
// user_pref("privacy.resistFingerprinting.letterboxing", true);
user_pref("privacy.userContext.enabled", true);
user_pref("privacy.userContext.ui.enabled", true);
user_pref("privacy.userContext.newTabContainerOnLeftClick.enabled", true);
user_pref("privacy.sanitize.clearOnShutdown.hasMigratedToNewPrefs3", true);
user_pref("privacy.sanitize.cpd.hasMigratedToNewPrefs3", true);
user_pref("privacy.sanitize.pending", "[{\"id\":\"newtab-container\",\"itemsToClear\":[],\"options\":{}}]");
user_pref("privacy.sanitize.timeSpan", 0);
user_pref("privacy.trackingprotection.emailtracking.enabled", true);
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.socialtracking.enabled", true);
user_pref("services.settings.clock_skew_seconds", 0);
user_pref("services.sync.clients.lastSync", "0");
user_pref("services.sync.declinedEngines", "");
user_pref("services.sync.globalScore", 0);
user_pref("services.sync.nextSync", 0);
user_pref("sidebar.backupState", "{\"command\":\"\",\"panelWidth\":537,\"launcherExpanded\":false,\"launcherVisible\":false}");
user_pref("sidebar.visibility", "hide-sidebar");
user_pref("signon.autofillForms", false);
user_pref("signon.firefoxRelay.feature", "disabled");
user_pref("signon.generation.enabled", false);
user_pref("signon.management.page.breach-alerts.enabled", false);
user_pref("signon.rememberSignons", false);
user_pref("theme.better_find_bar.transparent_background", false);
user_pref("uc.tabs.dim_unloaded", true);
// user_pref("widget.wayland.fractional-scale.enabled", true); // absolutely unnecessary for my current setup
user_pref("widget.gtk.global-menu.enabled", true);
user_pref("widget.gtk.global-menu.wayland.enabled", true);
user_pref("widget.gtk.rounded-bottom-corners.enabled", true);
user_pref("zen.theme.accent-color", "#61afef");
user_pref("zen.theme.color-prefs.use-workspace-colors", false);
user_pref("zen.theme.content-element-separation", 8); // width of loading bar
user_pref("zen.theme.gradient.show-custom-colors", true);
user_pref("zen.themes.updated-value-observer", true);
user_pref("zen.view.grey-out-inactive-windows", false);

user_pref("zen.urlbar.behavior", "floating-on-type");
user_pref("zen.urlbar.show-domain-only-in-sidebar", false); // display full URL in side search bar
user_pref("zen.urlbar.hide-one-offs", false); // always floating urlbar!!
user_pref("zen.urlbar.replace-newtab", true); // IMPORTANT!

user_pref("zen.view.show-newtab-button-border-top", false);
user_pref("zen.view.show-newtab-button-top", false);
user_pref("zen.workspaces.show-workspace-indicator", false);
user_pref("zen.watermark.enabled", true);
user_pref("zen.welcome-screen.seen", true);
user_pref("zen.widget.linux.transparency", false); // Enables transparency on Linux.
user_pref("zen.workspaces.container-specific-essentials-enabled", true); // if this isn't enabled, restored essentials leak cookies outside their container.
user_pref("zen.workspaces.hide-deactivated-workspaces", true);
// Refer ~/.dots/librewolf/librewolf.overrides.cfg
/*
user_pref("apz.overscroll.enabled", true);
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.search.suggest.history", false);
user_pref("browser.sessionstore.resume_from_crash", false);
user_pref("browser.urlbar.shortcuts.tabs", false);
user_pref("browser.urlbar.update2.engineAliasRefresh", true);
user_pref("privacy.clearOnShutdown.downloads", true);
user_pref("privacy.clearOnShutdown.history", true);
user_pref("toolkit.tabbox.switchByScrolling", true);
*/
