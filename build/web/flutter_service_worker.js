'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "837772fcc581a143e3c4b5b55706cd1c",
"assets/AssetManifest.bin.json": "69bcd8bfa19bb8893011794dac14882b",
"assets/AssetManifest.json": "ee5e108615ce61644c6e761133419593",
"assets/assets/fonts/sora/Sora-Bold.ttf": "59f1a10513024e9d080536ea7a744293",
"assets/assets/fonts/sora/Sora-ExtraBold.ttf": "d788f18b38a544fce1c35733d9d1a676",
"assets/assets/fonts/sora/Sora-ExtraLight.ttf": "39c9de554ff1a68219b5cdabc554bcc1",
"assets/assets/fonts/sora/Sora-Light.ttf": "5662cb4703d0aeb2e42e9301ae42e0d3",
"assets/assets/fonts/sora/Sora-Medium.ttf": "e3bb21ba620d898557d6537bbe0e9f10",
"assets/assets/fonts/sora/Sora-Regular.ttf": "e771c55096d16865a23c2795806fb01b",
"assets/assets/fonts/sora/Sora-SemiBold.ttf": "921341e5f1c4ef800e1ee926676791e0",
"assets/assets/fonts/sora/Sora-Thin.ttf": "cf19f5c4ac432cd736815c489aa692d5",
"assets/assets/icons/about_me_icon.svg": "8f3961ba11e671e54908277388d5da11",
"assets/assets/icons/android_icon.svg": "707728ed3fd44239761b81ec818c6e7f",
"assets/assets/icons/android_studio_icon.svg": "471468b787814525e1ecb50591d98ee9",
"assets/assets/icons/api_icon.svg": "b019086f5047dfc0bbe5ae4d4d68ca6a",
"assets/assets/icons/banner.svg": "704e29a6e181c8d941cce59e5e6fb4a1",
"assets/assets/icons/banner_icon.svg": "cd8244fd16eccd0cbcd2a521211f86bf",
"assets/assets/icons/c_sharp_icon.svg": "5f949c70dc2618c372ea46d18585aed1",
"assets/assets/icons/dart_icon.svg": "77736b70355db3b992d712891749acd5",
"assets/assets/icons/download_icon.svg": "2d70e8538928ad9289c3b4e86471a2b2",
"assets/assets/icons/firebase_color_icon.svg": "cef7c97ac5ad507248af8075e5f58c50",
"assets/assets/icons/firebase_icon.svg": "2f9da1d1dda3bd55d2b703e27fbd6c10",
"assets/assets/icons/flutter_icon.svg": "9a6e81be6ff5b09956f4f85fe1f0a89f",
"assets/assets/icons/github_icon.svg": "c23a95fcb4b1d25765107e4e73b06438",
"assets/assets/icons/ios_icon.svg": "8ad92b35bff6fb7cbc76064bc00cb55a",
"assets/assets/icons/java_icon.svg": "9c7178ef7e6077ba7a063654def3c240",
"assets/assets/icons/linkedin_icon.svg": "64de5845c71d1e54fb6d3610ed949221",
"assets/assets/icons/logo_icon.svg": "b0f2535384d03a399611405f606b3252",
"assets/assets/icons/postman_icon.svg": "fbfb57a181ce251926d686d12e6cee5a",
"assets/assets/icons/read_more_icon.svg": "55aaf85422a9383e2cdca5eed3554e2a",
"assets/assets/icons/upwork_icon.svg": "53dc926e18a974b8d89eb811719ac616",
"assets/assets/icons/vs_code_icon.svg": "bf246f1a348a946a439ef4c8e4ef8466",
"assets/assets/images/credevnet_logo.jpeg": "cb5780796955870e49f5cfceca95e590",
"assets/assets/images/do-flutter-mobile-app-development-expert-ios-and-android-mobile-development-beauty-cosmetics.png": "7b10084b7f89872360279baabc1f1c68",
"assets/assets/images/do-flutter-mobile-app-development-expert-ios-and-android-mobile-development-food-restaurant-eatery.png": "c9da2faa87ffdc7029eb91d7f6054037",
"assets/assets/images/do-flutter-mobile-app-development-expert-ios-and-android-mobile-development-food-restaurant-homefied.png": "a4b472a08f509019e97ef9b20ec2747e",
"assets/assets/images/do-flutter-mobile-app-development-expert-ios-and-android-mobile-development-real%2520estate.png": "de81585e9e2b4599da939ea3ab733184",
"assets/assets/images/do-flutter-mobile-app-development-expert-ios-and-android-mobile-development-realestate-furniture%2520app.png": "c759146b52044df39b4541f46df641c8",
"assets/assets/images/do-flutter-mobile-app-development-expert-ios-and-android-mobile-development-schedule-todo.png": "966538231d44b64f1df88a813d8c1818",
"assets/assets/images/female.jpg": "e9cf4e1e362b947fa66039c66d69f574",
"assets/assets/images/male.png": "30f7da028d712518cd8785559054ada0",
"assets/assets/images/namibra_logo.jpeg": "0f15cfbb4e2cb0da7199c37c218e78b5",
"assets/FontManifest.json": "a6d5767491e517e54e06d606a2dde9fe",
"assets/fonts/MaterialIcons-Regular.otf": "aceb7afac32cd5328560aa16def2da62",
"assets/NOTICES": "2a5926a5c3f701f9b95046693a07e121",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "e93ec292b144884d983857928754dd5a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b3a089ab9fe29e08ea852386308c661d",
"/": "b3a089ab9fe29e08ea852386308c661d",
"main.dart.js": "f488fa255890fe9ffff816aba809b58d",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
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
