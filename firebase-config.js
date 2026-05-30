/**
 * Firebase config for live shared comments on countdown-july-9.html
 *
 * Firestore rules (Console → Firestore → Rules):
 *   match /july9-comments/{id} {
 *     allow read, create, delete: if true;
 *     allow update: if false;
 *   }
 *
 * Storage rules (Console → Storage → Rules):
 *   match /july9-comments/{fileName} {
 *     allow read, write: if request.resource.size < 2 * 1024 * 1024
 *       && request.resource.contentType.matches('image/.*');
 *   }
 */
window.COUNTDOWN_FIREBASE = {
  apiKey: "AIzaSyBwXQy7Oxo5C1jHyg5FgL-PVplEeGVVGCI",
  authDomain: "jonlizcountdown.firebaseapp.com",
  projectId: "jonlizcountdown",
  storageBucket: "jonlizcountdown.firebasestorage.app",
  messagingSenderId: "756309325437",
  appId: "1:756309325437:web:279ad0b423e7f75d2b6314"
};

/** Free key from https://developers.giphy.com/dashboard/ — powers in-page GIF search */
window.COUNTDOWN_GIPHY_API_KEY = "SL4wskStjsIgsN0hZKtZYCAWqmiIL4Yg";
