import 'package:firebase_database/firebase_database.dart';

class FireDatabase{
  static final _reference = FirebaseDatabase.instance.ref();
  static Query? _refData;
  static Future<void> addData(name, code,email) async{
    Map<String, dynamic> x = {
      "Username": name,
      "Email": email,
      "id":code,
    };
    FirebaseDatabase.instance.ref().child('Accounts').ref.child(code).update(x);

  }

  static getData(id){
    return _refData = _reference.child('Accounts').child(id);
  }
}