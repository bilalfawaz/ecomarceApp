import 'package:ecomarceapp/service/firebase_database.dart';
import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/widget/check_widget.dart';
import 'package:ecomarceapp/view/widget/text_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/firebase_auth.dart';
import '../../../utils/my_string.dart';
import '../../../utils/route/route.dart';
import '../../widget/auth_text_from_field.dart';
import '../../widget/elevated_button_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, this.pageId}) : super(key: key);
  int? pageId;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameControllerLogin = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passControllerLogin = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailControllerLogin = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool checkBoxValue = false;

  ///Unused
  Color mode = Get.isDarkMode ? Colors.white : darkGreyClr;

  var args = Get.arguments;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: args[0] == "2" ? "SIGN" : 'LOG',
                            color: Get.isDarkMode ? pinkClr : mainColor,
                            underLine: TextDecoration.none),
                        const SizedBox(
                          width: 3,
                        ),
                        TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: args[0] == "2" ? "UP" : "IN",
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            underLine: TextDecoration.none),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Form(
                        key: _form,
                        child: Column(
                          children: [
                            args[0] == "2"
                                ? AuthTextFromField(
                                    hintText: "UserName",
                                    suffixIcon: const Text(""),
                                    prefixIcon: Get.isDarkMode
                                        ? const Icon(
                                      Icons.person,
                                      color: pinkClr,
                                    ):Image.asset("assets/images/user.png"),

                                    controller:  args[0]=="2"?nameController:nameControllerLogin,
                                    validator: (value) {
                                      if(value == "" ){
                                        return "Enter Valid Name";
                                      }else {
                                        return null;
                                      }
                                    })
                                : SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                            const SizedBox(
                              height: 20,
                            ),
                            AuthTextFromField(
                                hintText: "Email",
                                suffixIcon: const Text(""),
                                prefixIcon: Get.isDarkMode
                                    ? const Icon(
                                  Icons.email,
                                  color: pinkClr,
                                ):Image.asset("assets/images/email.png"),
                                controller: args[0]=="2"?emailController : emailControllerLogin,
                                validator: (value) {
                                  if(value == "" || !RegExp(validationEmail).hasMatch(value)){
                                    return "Enter Valid Email";
                                  }else {
                                    return null;
                                  }
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            AuthTextFromField(
                              obscureText: true,
                              hintText: "PassWord",
                              suffixIcon: const Text(""),
                              prefixIcon: Get.isDarkMode
                                  ?const Icon(
                                Icons.lock,
                                color: pinkClr,
                              ): Image.asset("assets/images/lock.png"),

                              controller:  args[0]=="2"?passController:passControllerLogin,
                              validator: (value) {
                                if(value == "" || value.toString().length<6){
                                  return "Enter Valid Password";
                                }else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    CheckBoxWidget(
                        secondTextDecoration: args[0] == "2"
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        firstText: args[0] == "2" ? "I Accept " : "Remember ",
                        secondText: args[0] == "2" ? "terms & condition" : "me",
                        value: checkBoxValue,
                        onChange: (value) {
                          setState(() {
                            checkBoxValue = value;
                          });
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    Row(
                      children:  [
                         TextUtils( fontSize: 16,
                            fontWeight: FontWeight.normal,
                            text: args[0] == "2"
                                ? 'Already have an account? '
                                : "Don't have account? ",
                            color:Get.isDarkMode ? pinkClr : mainColor,
                            underLine: TextDecoration.none),
                        TextButton(
                          onPressed: (){
                            if (args[0] == "2") {
                              setState(() {
                                args[0] = "1";
                              });
                              print(args[0]);
                            } else if (args[0] == "1") {
                              setState(() {
                                args[0] = "2";
                              });
                              print(args[0]);
                            }
                          },
                          child:  TextUtils( fontSize: 16,
                              fontWeight: FontWeight.normal,
                              text: args[0] == "2" ? "Log In" : "SignUp",
                              color: Get.isDarkMode?  Colors.white : Colors.black,
                              underLine: TextDecoration.underline),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: MediaQuery.of(context).size.height*0.1,
                    ),
                    ElevatedButtonWidget(
                      onPressed: () async{
                        if(_form.currentState!.validate()){
                          if(args[0] == "2"){
                            /// SignUp

                            User? user =
                                await FireAuth.registerUsingEmailPassword(
                                    email: emailController.text,
                                    password: passController.text,
                                    username: nameController.text);

                            if (user != null) {
                              FireDatabase.addData(nameController.text, user.uid, emailController.text);
                              _showErrorDialog("Create Email Done");
                              setState(() {
                                emailController.text = "";
                                passController.text = "";
                                nameController.text = "";
                                args[0] = "1";
                              });
                            }
                          }else if(args[0] == "1"){
                            ///LogIn
                            User? user =
                            await FireAuth.signInUsingEmailPassword(
                                email: emailControllerLogin.text,
                                password: passControllerLogin.text,
                                context: context);
                            if (user != null) {
                              //print("aaa");
                              Get.offNamed(Routes.mainScreen,arguments: [user.uid]);
                            }
                          }
                        }else{
                            if(args[0] == "2" && checkBoxValue != true && GetPlatform.isAndroid){
                              showDialog(context: context, builder: (context){
                                return  AlertDialog(
                                  title: const Text("Warning",style: TextStyle(color: Colors.red),),
                                  content: const Text("Please Accept Terms and Conditions"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text("Ok"))
                                  ],
                                );
                              });
                            }else if(args[0] == "2" && checkBoxValue != true && GetPlatform.isIOS){
                              showCupertinoDialog<void>(
                                  context: context,
                                  builder: (BuildContext context){
                                    return  CupertinoAlertDialog(
                                      title: const Text("Warning",style: TextStyle(color: Colors.red),),
                                      content: const Text(
                                          'Please Accept Terms and Conditions'),
                                      actions: <CupertinoDialogAction>[
                                        CupertinoDialogAction(
                                          child: const Text('No'),
                                          onPressed: () {
                                            Get.back();
                                          },
                                        ),

                                      ],
                                    );
                                  });
                            }
                          }
                      },
                      buttonText: args[0] == "2" ? "SignUp" : "Login",
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
  void _showErrorDialog(String msg)
  {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Done'),
          content: Text(msg),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Okay'),
              onPressed: (){
                Navigator.of(ctx).pop();
              },
            )
          ],
        )
    );
  }
}
