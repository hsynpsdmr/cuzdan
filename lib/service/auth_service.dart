
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuzdan/core/constant/db/collection_names.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> createUserWithEmailAndPassword({required String email, required String password}) async {
    String result = AuthResultMessage.kUnExpectedErrorMessage;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
          email: email, password: password);
      await _firebaseFirestore.collection(CollectionNames.USERS).doc(userCredential.user!.uid).set({
        'email' : email,
      });
      result = AuthResultMessage.kAuthSuccessRegister;
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthResultMessage.kWeakPassword) {
        result = AuthResultMessage.kWeakPassword;
      } else if (e.code == AuthResultMessage.kEmailAlreadyInUse) {
        result = AuthResultMessage.kEmailAlreadyInUse;
      }
    } catch (e) {
      result = AuthResultMessage.kUnExpectedErrorMessage;
    }
    return result;
  }
  Future<String> loginWithEmailAndPassword({required String email, required String password}) async {
    String result = AuthResultMessage.kUnExpectedErrorMessage;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      result = AuthResultMessage.kAuthSuccessLogin;
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthResultMessage.kUserNotFound) {
        result = AuthResultMessage.kUserNotFound;
      } else if (e.code == AuthResultMessage.kWrongPassword) {
        result = AuthResultMessage.kWrongPassword;
      }
  }
  return result;
  }
  Future<String> logOut()async{
    String result = AuthResultMessage.kUnExpectedErrorMessage;
    await _auth.signOut().then((value) {
      result = AuthResultMessage.kLogOutMessage;
    }).catchError((e){
      result = AuthResultMessage.kUnExpectedErrorMessage;
    });
    return result;
  }

  Future signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  UserCredential _userCredential =  await FirebaseAuth.instance.signInWithCredential(credential);

  await FirebaseFirestore.instance
    .collection(CollectionNames.USERS)
    .doc(_userCredential.user!.uid)
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        _firebaseFirestore.collection(CollectionNames.USERS).doc(_userCredential.user!.uid).set({
        'email' : _userCredential.user!.email,
      });
      }
    });
}
}