import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
final firebaseApp = Firebase.app();
final rtdb = FirebaseDatabase.instanceFor(app: firebaseApp, databaseURL: 'https://driving-5d23b-default-rtdb.firebaseio.com/');
DatabaseReference ref = rtdb.ref('https://driving-5d23b-default-rtdb.firebaseio.com//apk');