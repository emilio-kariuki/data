// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:io';

import 'package:data/Screens/contact_page.dart';
import 'package:data/build/lottie.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final phone = TextEditingController();
  final email = TextEditingController();
  final gender = TextEditingController();
  final name = TextEditingController();
  final district = TextEditingController();
  String? selectedDistrict;
  String? selectedGender;
  String? selectedCommissioned;
  bool loading = false;
  List<String> items = [
    "Beraka",
    "Centre",
    "Ebenezar",
    "Gatero",
    "Imani",
    "Jordan",
    "Marmanet",
    "Mugumo",
    "Macendonia",
    "pioneer",
    "Siron",
    "Shalom",
  ];
  List<String> itemGender = ["Male", "Female"];
  List<String> itemCommissioned = ["Yes", "No"];

  final picker = ImagePicker();
  File? image;

  void takePhoto(ImageSource source) async {
    final image = await picker.pickImage(
        source: source, maxHeight: 480, maxWidth: 640, imageQuality: 60);
    try {
      if (image == null) return;

      final imageTempo = File(image.path);
      setState(() {
        this.image = imageTempo;
      });
    } on PlatformException catch (e) {
      Fluttertoast.showToast(
          backgroundColor: Colors.red,
          msg: "Failed to pick image $e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 7, 9, 15),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Youth Data"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () {
                  Get.to(const Conntact());
                },
                icon: const Icon(Icons.phone)),
          ),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 6),
                  child: Stack(
                    children: [
                      Material(
                        color: Color.fromARGB(255, 36, 47, 53),
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          //  color: Colors.grey,
                          // color: Color.fromARGB(255, 36, 47, 53),
                          child: Center(
                            child: image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.file(
                                      image!,
                                      width: size.width,
                                      height: size.height * 0.32,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Text("Select Image",
                                    style: GoogleFonts.roboto(
                                        fontSize: 20, color: Colors.white)),
                          ),
                          height: size.height * 0.3,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[800],
                            // boxShadow: [
                            //   BoxShadow(
                            //     color:
                            //         Color.fromARGB(255, 255, 255, 255)
                            //             .withOpacity(0.6),
                            //     spreadRadius: 5,
                            //     blurRadius: 7,
                            //     offset: Offset(0,
                            //         3), // changes position of shadow
                            //   ),
                            // ],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Color.fromARGB(255, 14, 14, 20),
                                width: 1),
                          ),
                          // image: image
                        ),
                      ),
                      Positioned(
                          top: 5,
                          right: 5,
                          child: IconButton(
                              onPressed: () {
                                // takePhoto(ImageSource.camera);
                                setState(() {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Container(
                                      width: size.width,
                                      height: size.height * 0.2,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Color.fromARGB(255, 14, 14, 20),
                                            width: 1),
                                        //border: Border.all(color: Color.fromARGB(255, 182, 36, 116),width:1 ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        contentPadding: EdgeInsets.all(5),
                                        title:
                                            const Text('choose image from: '),
                                        content: SingleChildScrollView(
                                          child: ListBody(children: [
                                            ListTile(
                                              selectedColor: Colors.grey,
                                              onTap: () {
                                                takePhoto(ImageSource.camera);
                                                Navigator.pop(context);
                                              },
                                              leading: Icon(Icons.camera,
                                                  color: Color.fromARGB(
                                                      255, 255, 123, 0)),
                                              title: Text("Camera"),
                                            ),
                                            ListTile(
                                              selectedColor: Colors.grey,
                                              onTap: () {
                                                setState(() {
                                                  takePhoto(
                                                      ImageSource.gallery);
                                                  Navigator.pop(context);
                                                });
                                              },
                                              leading: Icon(Icons.layers,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                              title: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      takePhoto(
                                                          ImageSource.gallery);
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Text("Gallery")),
                                            ),
                                            ListTile(
                                              selectedColor: Colors.grey,
                                              onTap: () {
                                                Get.back();
                                              },
                                              leading: Icon(Icons.cancel,
                                                  color: Colors.red),
                                              title: Text("Cancel"),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              },
                              icon: Icon(Icons.add_a_photo,
                                  size: 35,
                                  color: image != null
                                      ? Colors.white
                                      : Color.fromARGB(255, 223, 152, 1))))
                    ],
                  ),
                ),
                // SvgPicture.asset("assets/chat.svg",height: 100, width: 100),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height * 0.23,
                    width: size.width,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 7, 9, 15),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text("Personal",
                                  style: GoogleFonts.redressed(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                            height: 10,
                          ),
                        ),
                        Itemz(size, "Name", "assets/person_2.json", name,
                            TextInputType.text),
                        GenderDropdown(size),
                      ],
                    ),
                  ),
                ),
                Contact(size),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.06,
                        width: size.width * 0.36,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 14, 14, 20)),
                            // MaterialStateProperty<Color?>?
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: const BorderSide(
                                  color: Color.fromARGB(255, 14, 14, 20),
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          child: Text('Close',
                              style: GoogleFonts.roboto(fontSize: 20)),
                          onPressed: () => exit(0),
                        ),
                      ),
                      SizedBox(width: size.width * 0.08),
                      //the submit button for the application
                      loading
                          ? const CircularProgressIndicator()
                          //the code to show the dialog box
                          : SizedBox(
                              height: size.height * 0.06,
                              width: size.width * 0.36,
                              child: ElevatedButton(
                                // disabledColor: isActivated ? Colors.grey : Color.fromARGB(255, 14, 14, 20),
                                // color: Color.fromARGB(255, 14, 14, 20),
                                // shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(30)),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 14, 14, 20)),
                                  // MaterialStateProperty<Color?>?
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: const BorderSide(
                                        color: Color.fromARGB(255, 14, 14, 20),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Text('Submit',
                                    style: GoogleFonts.roboto(
                                        fontSize: 20, color: Colors.white)),
                                onPressed: () async {
                                  if (selectedGender == null &&
                                      name == null &&
                                      phone == null) {
                                    Fluttertoast.showToast(
                                        backgroundColor: Colors.red,
                                        msg: "Fill Empty Fields",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        fontSize: 16.0);
                                  } else {
                                    setState(() {
                                      loading = true;
                                    });
                                    await _makeGetRequest();
                                    loading
                                        ? const CircularProgressIndicator(
                                            color: Color.fromARGB(
                                                255, 240, 144, 1),
                                          )
                                        : await Fluttertoast.showToast(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 105, 228, 4),
                                            msg:
                                                "Information Sent Successfully !!",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            fontSize: 16.0);
                                    // Future.delayed(const Duration(milliseconds: 1670),
                                    //     () => Navigator.of(context).pop());
                                    setState(() {
                                      loading = false;
                                    });

                                    //selectedMethod = null;
                                  }
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Padding Contact(Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        height: size.height * 0.46,
        width: size.width,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 7, 9, 15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text("Contact",
                      style: GoogleFonts.redressed(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 7, right: 10),
              child: Divider(
                color: Colors.white,
                thickness: 1,
                height: 10,
              ),
            ),
            Itemz(size, "Phone Number", "assets/phone_2.json", phone,
                TextInputType.number),
            Itemz(
                size, "Email", "assets/mail_3.json", email, TextInputType.text),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("Church",
                      style: GoogleFonts.redressed(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                color: Colors.white,
                thickness: 1,
                height: 10,
              ),
            ),
            DistrictDropdown(size),
            CommissionedDropdown(size),
          ],
        ),
      ),
    );
  }

  Padding DistrictDropdown(Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 8, top: 5),
      child: Row(
        children: [
          const LottieContain(lottieUrl: "assets/district_1.json"),
          SizedBox(width: size.width * 0.06),
          DropdownButton2(
            hint: Text("Select",
                style:
                    GoogleFonts.roboto(color: Color.fromARGB(255, 49, 49, 49))),
            value: selectedDistrict,
            onChanged: (value) {
              setState(() {
                // getLocation();
                selectedDistrict = value as String;
                print(selectedDistrict);
              });
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 18,
            iconEnabledColor: Colors.indigo,
            iconDisabledColor: const Color.fromARGB(255, 255, 255, 255),
            buttonHeight: size.height * 0.06,
            buttonWidth: size.width * 0.65,
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.notoSerif(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 58, 57, 57),
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(255, 180, 182, 184),
              ),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            buttonElevation: 5,
            itemHeight: 35,
            itemPadding: const EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 250,
            dropdownWidth: 200,
            dropdownPadding: const EdgeInsets.only(top: 3),
            dropdownDecoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 235, 235),
            ),
            dropdownElevation: 5,
            scrollbarRadius: const Radius.circular(20),
            scrollbarThickness: 10,
            scrollbarAlwaysShow: true,
            offset: const Offset(18, -50),
          ),
        ],
      ),
    );
  }

  Padding CommissionedDropdown(Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 8, top: 5),
      child: Row(
        children: [
          LottieContain(lottieUrl: "assets/commission.json"),
          SizedBox(width: size.width * 0.06),
          DropdownButton2(
            hint: Text("Are you commissioned",
                style:
                    GoogleFonts.roboto(color: Color.fromARGB(255, 49, 49, 49))),
            value: selectedCommissioned,
            onChanged: (value) {
              setState(() {
                // getLocation();
                selectedCommissioned = value as String;
                print(selectedCommissioned);
              });
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 18,
            iconEnabledColor: Colors.indigo,
            iconDisabledColor: Color.fromARGB(255, 255, 255, 255),
            buttonHeight: size.height * 0.06,
            buttonWidth: size.width * 0.65,
            items: itemCommissioned
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.notoSerif(
                            fontSize: 18,
                            color: Color.fromARGB(255, 58, 57, 57),
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Color.fromARGB(255, 180, 182, 184),
              ),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            buttonElevation: 5,
            itemHeight: 35,
            itemPadding: const EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 250,
            dropdownWidth: 200,
            dropdownPadding: EdgeInsets.only(top: 3),
            dropdownDecoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 235, 235),
            ),
            dropdownElevation: 5,
            scrollbarRadius: const Radius.circular(20),
            scrollbarThickness: 10,
            scrollbarAlwaysShow: true,
            offset: const Offset(18, -50),
          ),
        ],
      ),
    );
  }

  Padding GenderDropdown(Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 8, top: 5),
      child: Row(
        children: [
          LottieContain(lottieUrl: "assets/gender_3.json"),
          SizedBox(width: size.width * 0.06),
          DropdownButton2(
            hint: Text("Gender",
                style:
                    GoogleFonts.roboto(color: Color.fromARGB(255, 49, 49, 49))),
            value: selectedGender,
            onChanged: (value) {
              setState(() {
                // getLocation();
                selectedGender = value as String;
                print(selectedGender);
              });
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 18,
            iconEnabledColor: Colors.indigo,
            iconDisabledColor: Color.fromARGB(255, 255, 255, 255),
            buttonHeight: size.height * 0.06,
            buttonWidth: size.width * 0.65,
            items: itemGender
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.notoSerif(
                            fontSize: 18,
                            color: Color.fromARGB(255, 58, 57, 57),
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Color.fromARGB(255, 180, 182, 184),
              ),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            buttonElevation: 5,
            itemHeight: 35,
            itemPadding: const EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 250,
            dropdownWidth: 200,
            dropdownPadding: EdgeInsets.only(top: 3),
            dropdownDecoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 235, 235),
            ),
            dropdownElevation: 5,
            scrollbarRadius: const Radius.circular(20),
            scrollbarThickness: 10,
            scrollbarAlwaysShow: true,
            offset: const Offset(18, -50),
          ),
        ],
      ),
    );
  }

  Padding Itemz(Size size, String name, String lottieUrl,
      TextEditingController action, TextInputType type) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 8, top: 5),
      child: Row(
        children: [
          LottieContain(
            lottieUrl: lottieUrl,
          ),
          SizedBox(width: size.width * 0.06),
          Flexible(
            flex: 1,
            child: TextFormField(
              keyboardType: type,
              // style: TextStyle(height:10),

              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(15, 20, 15, 15),
                  // contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // icon: Icon(Icons.person,size:30,color: Colors.black),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  focusColor: Colors.red,
                  hintText: name,
                  // suffixText: "10",
                  // prefixIcon: Icon(Icons.mail,color: Colors.blueGrey[900]),
                  fillColor: Colors.grey[200]),
              controller: action,
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }

  _makeGetRequest() async {
    final String name_1 = name.text;
    final String phone_1 = phone.text;
    final String email_1 = email.text;
    print(name_1);
    print(phone_1);
    print(email_1);
    print(selectedGender);
    print(selectedCommissioned);
    print(selectedDistrict);

    var dio = Dio();
    var response = await dio
        .post("http://be5a-41-84-155-242.ngrok.io/user/register", data: {
      "name": name_1,
      "gender": selectedGender,
      "phone": phone_1,
      "email": email_1,
      "district": selectedDistrict,
      "isCommissioned": selectedCommissioned
    });
  }
}
