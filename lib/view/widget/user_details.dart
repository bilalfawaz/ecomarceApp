import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/firebase_database.dart';
import '../../utils/themes.dart';


class UserDetails extends StatefulWidget {
   UserDetails({Key? key,this.darkMode}) : super(key: key);
  Color? darkMode;

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  String? email = FirebaseAuth.instance.currentUser?.email;
  String username = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserName();
  }

  /// load user name for current user
  loadUserName()async{
    await FireDatabase.getData(FirebaseAuth.instance.currentUser?.uid).once().then((value) {
      var contact = value.snapshot.value as Map;
      setState(() {
        username = contact['Username'];
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(username),
                  Text(email!),
                ],
              ),
            ),

          ],
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.2,
      decoration:  BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          color: widget.darkMode
      ),
    );
  }
}
