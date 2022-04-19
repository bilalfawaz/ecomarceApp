import 'package:ecomarceapp/utils/themes.dart';
import 'package:ecomarceapp/view/widget/payment_widget/radio_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../service/firebase_database.dart';
import '../../../service/get_location.dart';
import '../search_text_home.dart';


class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  static bool isLoading = false;
  @override
  State<DeliveryContainerWidget> createState() => _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  TextEditingController phoneController = TextEditingController();
  int groupIndex = 1;
  bool changeColors = false;
  String phoneNumber = "";
  String username = "";
  String location = "";


  Future<void> updateLocation()async{
    setState(() {
      DeliveryContainerWidget.isLoading = true;
    });
    Position position = await getPosition();
    List<Placemark> placeMarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark mark = placeMarks[0];
    setState(() {
      location = "${mark.locality!} / ${mark.street!}";
      DeliveryContainerWidget.isLoading = false;
    });
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
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserName();
    updateLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RadioContainer(
          icon: Container(), ///  no need icon it just for delivery selector
          groupValue :groupIndex,
          title: "Assro Shop",
          address: "asas",
          name: "3oesa",
          phone: "3131x",
          value: 1,
          color:changeColors ?  Colors.white : Colors.grey.shade300,
          onChange: (value){
            setState(() {
              groupIndex = value;
              changeColors = !changeColors;
            });
          },
        ),
        const SizedBox(height: 10,),
        RadioContainer(
          icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: "Enter Your Phone Number",
                  titleStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  radius: 10,
                  textCancel: "Cancel",
                  confirmTextColor: Colors.black,
                  cancelTextColor: Colors.black,
                  textConfirm: "Save",
                  onConfirm: (){
                    Get.back();
                    setState(() {
                      phoneNumber = phoneController.text;
                    });
                  },
                  buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  content: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: phoneController,
                      maxLength: 10,
                      onSubmitted: (value){
                        phoneController.text = value;
                      },
                      style: const TextStyle(
                          color: Colors.black
                      ),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter Your Phone Number",
                        hintStyle: const TextStyle(
                            color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: mainColor.withOpacity(0.2),
                        focusColor: Colors.red,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: mainColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: (){
                            phoneController.clear();
                          },
                          icon: const Icon(Icons.close),
                        )
                      ),
                    ),
                  ),
                );
              },
              child: Icon(Icons.contact_phone,
                  size: 20, color: Get.isDarkMode ? pinkClr : mainColor)),
          groupValue: groupIndex,
          title: "Delivery",
          address: location,
          name: username,
          phone: phoneNumber,
          value: 2,
          color: changeColors ? Colors.grey.shade300 : Colors.white,
          onChange: (value) {
            setState(() {
              groupIndex = value;
              changeColors = !changeColors;
            });
          },
        ),
      ],
    );
  }
}
