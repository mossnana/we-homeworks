import * as firebase from "firebase";
import firestore from "firebase/firestore";

const settings = { timestampsInSnapshots: true };

const config = {
  apiKey: "AIzaSyDa8VH-8SZEDQtFssbuawhjjEYKWDGNMaU",
  authDomain: "testmyapp-xxxxx.firebaseapp.com",
  databaseURL: "https://testmyapp-xxxxx.firebaseio.com",
  projectId: "testmyapp-xxxxx",
  storageBucket: "testmyapp-xxxxx.appspot.com",
  messagingSenderId: "900345852931"
};
firebase.initializeApp(config);

// firebase.firestore().settings(settings);

export default firebase;
