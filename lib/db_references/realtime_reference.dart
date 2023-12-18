import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';

final databaseRef = FirebaseDatabase.instance.ref();
class RealTime{
  static fetchUsernameByEmail(String userEmail) async {
    String? username;
    final FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference userRef = database.reference().child('Users').child('ListRegister');
    await userRef.once().then((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        dynamic userData = event.snapshot.value;

        userData.forEach((key, value) {
          if (value['email'] == userEmail) {
            username = value['username'];
          }
        });
      }
    }).catchError((error) {
      print('Error fetching data: $error');
      return null;
    });

    return username;
  }

  static InsertData(String username , String email,){
    databaseRef.child('Users').child('ListRegister').push().set({
      'username': username,
      'email' : email,
    });
  }

  static RegistrationData(String email, String password) async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }

  static LoginData(String email, String password) async{

    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  static signInWithgoogle() async{
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    // email = userCredential.user!.email!;
    // email = userCredential.user!.displayName!;
    await RealTime.InsertData(
        userCredential.user!.email!.toString(),
        userCredential.user!.displayName!.toString());
    print(userCredential.user?.displayName);
  }
}