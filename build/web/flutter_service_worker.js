'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "4a7f9e2d2be567245da7a032a8a1f3ba",
"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "80b7f3c2a7bb29c643595523dbc0fc2e",
"/": "80b7f3c2a7bb29c643595523dbc0fc2e",
"main.dart.js": "6dd8d24310708ad46661433a229f9c82",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"assets/NOTICES": "4a5bc53e5eb0f65999511b504d42e6e3",
"assets/FontManifest.json": "a6d5767491e517e54e06d606a2dde9fe",
"assets/AssetManifest.bin.json": "69bcd8bfa19bb8893011794dac14882b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "837772fcc581a143e3c4b5b55706cd1c",
"assets/fonts/MaterialIcons-Regular.otf": "aceb7afac32cd5328560aa16def2da62",
"assets/assets/images/male.png": "30f7da028d712518cd8785559054ada0",
"assets/assets/images/credevnet_logo.jpeg": "cb5780796955870e49f5cfceca95e590",
"assets/assets/images/namibra_logo.jpeg": "0f15cfbb4e2cb0da7199c37c218e78b5",
"assets/assets/images/do-flutter-mobile-app-development-expert-ios-and-android-mobile-development-schedule-todo.png": "966538231d44b64f1df88a813d8c1818",
"assets/assets/images/do-flutter-mobile-app-development-expert-ios-and-android-mobile-development-realestate-furniture%2520app.png": "c759146b52044df39b4541f46df641c8",
"assets/assets/images/female.jpg": "e9cf4e1e362b947fa66039c66d69f574",
"assets/assets/images/do-flutter-mobile-app-development-expert-ios-and-android-mobile-development-beauty-cosmetics.png": "7b10084b7f89872360279baabc1f1c68",
"assets/assets/images/do-flutter-mobile-app-development-expert-ios-and-android-mobile-development-food-restaurant-eatery.png": "c9da2faa87ffdc7029eb91d7f6054037",
"assets/assets/images/do-flutter-mobile-app-development-expert-ios-and-android-mobile-development-real%2520estate.png": "de81585e9e2b4599da939ea3ab733184",
"assets/assets/images/do-flutter-mobile-app-development-expert-ios-and-android-mobile-development-food-restaurant-homefied.png": "a4b472a08f509019e97ef9b20ec2747e",
"assets/assets/icons/c_sharp_icon.svg": "7712b6b54f03262fde9b63b6ce07723d",
"assets/assets/icons/java_icon.svg": "9c7178ef7e6077ba7a063654def3c240",
"assets/assets/icons/api_icon.svg": "6dc62e852d916a18eb48cda2b289b966",
"assets/assets/icons/linkedin_icon.svg": "a7a8cd459b63f5f450c7e01656328362",
"assets/assets/icons/banner_icon.svg": "37a6aab88634525b6fa9a9faa3e8279a",
"assets/assets/icons/read_more_icon.svg": "aaf4301024d430a2f75014552a07193d",
"assets/assets/icons/android_icon.svg": "210fd652fb159ba22823f206fb6a7171",
"assets/assets/icons/postman_icon.svg": "fbfb57a181ce251926d686d12e6cee5a",
"assets/assets/icons/banner.svg": "0d84ba76c12f78a0cced20415587129d",
"assets/assets/icons/upwork_icon.svg": "1c298ace2b39ad73631ba61e02bc675b",
"assets/assets/icons/firebase_icon.svg": "ca478b88f589bc8715b6d27d311bcfaa",
"assets/assets/icons/dart_icon.svg": "77736b70355db3b992d712891749acd5",
"assets/assets/icons/about_me_icon.svg": "6352bbd6c7783e09eff2e130ce7687af",
"assets/assets/icons/download_icon.svg": "7ef11cde8d5c9d444f52898e83eec877",
"assets/assets/icons/github_icon.svg": "c7f4f8cd4e1d67c295179575eab41e59",
"assets/assets/icons/firebase_color_icon.svg": "7f1bf2795e067daf4ac3b42a2a140496",
"assets/assets/icons/ios_icon.svg": "d4021c14dd4a04f60cab21f86246b284",
"assets/assets/icons/vs_code_icon.svg": "2fef8b0a0de022a99183435e0cbe7302",
"assets/assets/icons/android_studio_icon.svg": "b3e261060473dc06e5270f0cb0b536b0",
"assets/assets/icons/logo_icon.svg": "6fa1e0a01355ba0db75a049b27b953a3",
"assets/assets/icons/flutter_icon.svg": "9a6e81be6ff5b09956f4f85fe1f0a89f",
"assets/assets/fonts/sora/Sora-Thin.ttf": "cf19f5c4ac432cd736815c489aa692d5",
"assets/assets/fonts/sora/Sora-ExtraBold.ttf": "d788f18b38a544fce1c35733d9d1a676",
"assets/assets/fonts/sora/Sora-Bold.ttf": "59f1a10513024e9d080536ea7a744293",
"assets/assets/fonts/sora/Sora-Light.ttf": "5662cb4703d0aeb2e42e9301ae42e0d3",
"assets/assets/fonts/sora/Sora-Regular.ttf": "e771c55096d16865a23c2795806fb01b",
"assets/assets/fonts/sora/Sora-Medium.ttf": "e3bb21ba620d898557d6537bbe0e9f10",
"assets/assets/fonts/sora/Sora-SemiBold.ttf": "921341e5f1c4ef800e1ee926676791e0",
"assets/assets/fonts/sora/Sora-ExtraLight.ttf": "39c9de554ff1a68219b5cdabc554bcc1",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
