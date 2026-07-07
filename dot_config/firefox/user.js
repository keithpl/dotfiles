/* Disable warning when entering about:config */
user_pref("browser.aboutConfig.showWarning", false);

/* New windows should open new tabs instead */
user_pref("browser.link.open_newwindow", 3);

/* Required for libva-nvidia-drver */
user_pref("media.hardware-video-decoding.force-enabled", true);

/* Disable slop */
user_pref("browser.ai.control.default", "blocked");
user_pref("browser.ml.enable", false);
user_pref("browser.ml.chat.enabled", false);
user_pref("browser.ml.chat.menu", false);
user_pref("browser.tabs.groups.smart.enabled", false);
user_pref("browser.ml.linkPreview.enabled", false);

/*
 * Set startup page:
 * 	0: blank page
 * 	1: home page
 * 	2: last visited page
 * 	3: resume previous session
 */
user_pref("browser.startup.page", 0);

/* Set home page and new window page */
user_pref("browser.startup.homepage", "https://www.google.com/");

/* Disable new tab page */
user_pref("browser.newtabpage.enabled", false);

/* Disable sponsored content on firefox home */
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredCheckboxes", false);

/* Clear default top site list */
user_pref("browser.newtabpage.activity-stream.default.sites", "");

/* Disallow leveraging the OS for gelocation */
user_pref("geo.provider.ms-windows-location", false);
user_pref("geo.provider.use_corelocation", false);
user_pref("geo.provider.use_geoclue", false);

/* Disable recommendations in about:addons */
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("browser.discovery.enabled", false);

/* Disable firefox home telemetry */
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);

/* Disable firefox home recommended extensions and features */
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons",
	  false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features",
	  false);

/* Disable studies */
user_pref("app.shield.optoutstudies.enabled", false);

/* Disable normandy/shield telemtry system */
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

/* Disable crash reports */
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

/* Disable captive portal detection */
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false);

/* Disable network connectivity checks */
user_pref("network.connectivity-service.enabled", false);

/* Disable safe browsing checks for downloads */
user_pref("browser.safebrowsing.downloads.remote.enabled", false);

/* Disable link prefetching */
user_pref("network.prefetch-next", false);

/* Disable DNS prefetching */
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);

/* Disable speculative connections from non-click mouse events */
user_pref("network.http.speculative-parallel-limit", 0);
user_pref("browser.places.speculativeConnect.enabled", false);

/* Disable speculative connections from address bar */
user_pref("browser.urlbar.speculativeConnect.enabled", false);

/* Disable address bar contextual suggestions */
user_pref("browser.urlbar.quicksuggest.enabled", false); // [FF92+]
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false); // [FF95+]
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false); // [FF92+]

/* Disable live search suggestions */
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.suggest.searches", false);

/* Disable address bar search terms */
user_pref("browser.urlbar.showSearchTerms.enabled", false);

/* Disable address bar trending search suggestions */
user_pref("browser.urlbar.trending.featureGate", false);

/* Disable more address bar suggestion types */
user_pref("browser.urlbar.addons.featureGate", false);
user_pref("browser.urlbar.amp.featureGate", false);
user_pref("browser.urlbar.importantDates.featureGate", false);
user_pref("browser.urlbar.market.featureGate", false);
user_pref("browser.urlbar.mdn.featureGate", false);
user_pref("browser.urlbar.weather.featureGate", false);
user_pref("browser.urlbar.wikipedia.featureGate", false);
user_pref("browser.urlbar.yelp.featureGate", false);
user_pref("browser.urlbar.yelpRealtime.featureGate", false);

/* Disable disk cache */
user_pref("browser.cache.disk.enable", false);

/* Set media cache in private browsing to in-memory */
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);

/* Increase the in-memory cache maximum size */
user_pref("media.memory_cache_max_size", 65536);

/* Disable new data submission */
user_pref("datareporting.policy.dataSubmissionEnabled", false);

/* Disable health reports */
user_pref("datareporting.healthreport.uploadEnabled", false);

/* Disable generic telemetry */
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);

/* Disable telemetry coverage */
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
