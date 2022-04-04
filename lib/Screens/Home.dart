// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:data/build/lottie.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
  List<String> items = ["Centre", "Mugumo", "Makedonia", "pioneer"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 7, 9, 15),
        title: const Text("Youth Data"),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.phone)
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.settings)
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SvgPicture.asset("assets/chat.svg",
                height: size.height * 0.3),
            // SvgPicture.asset("assets/chat.svg",height: 100, width: 100),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.21,
                width: size.width,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 7, 9, 15),
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
                    Itemz(size, "Name", "assets/person_2.json", name),
                    Itemz(size, "Gender", "assets/gender_3.json", gender),
                  ],
                ),
              ),
            ),
            Contact(size),
          ],
        ),
      ),
    );
  }

  Padding Contact(Size size) {
    return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              height: size.height * 0.29,
              width: size.width,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 7, 9, 15),
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
                  Itemz(size, "Phone Number", "assets/phone_2.json", phone),
                  Itemz(size, "Email", "assets/mail_3.json", email),
                  DistrictDropdown(size),
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
          LottieContain(lottieUrl: "assets/district_1.json"),
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
            iconDisabledColor: Color.fromARGB(255, 255, 255, 255),
            buttonHeight: size.height * 0.06,
            buttonWidth: size.width * 0.65,
            items: items
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

  Padding Itemz(
      Size size, String name, String lottieUrl, TextEditingController action) {
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
              //keyboardType: TextInputType.multiline,
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
}
