import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spacepal/core/services/storage.dart';


class AuthenticationService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  late CollectionReference ref;
  String path = 'staff';
  Storage storage = Storage();
  Future createStaffProfile(email, unit, isAdmin, image, username, userId) async{
    ref = db.collection(path);
    var  url = await storage.uploadImage(image, userId);
    return ref.doc(userId).set(
      {
        "email": email,
        "username": username,
        "isAdmin": false,
        "unit": unit,
        "imageUrl": url

      }
    );
  }
  Future<User?> createStaff(email, password, unit, isAdmin, image, username)async{
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      createStaffProfile(email, unit, isAdmin, image, username, user?.uid);
      return user;

    }
}