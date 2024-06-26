// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyCs4NmNxltww8xtP2R-kch4IqOJ6b1yHGY",
  authDomain: "translator-c40f5.firebaseapp.com",
  projectId: "translator-c40f5",
  storageBucket: "translator-c40f5.appspot.com",
  messagingSenderId: "1037285807160",
  appId: "1:1037285807160:web:c900e587cd54df731bc2cd",
  
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
export const auth = getAuth(app);