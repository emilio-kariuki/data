// ignore_for_file: non_constant_identifier_names

import 'package:data/build/lottie.dart';
import "package:flutter/material.dart";
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                    
                    Itemz(size,"Name","assets/person_2.json",name),
                    Itemz(size,"Gender","assets/gender_3.json",gender),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8, right: 8),
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
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                        height: 10,
                      ),
                    ),
                    
                    Itemz(size,"Phone Number","assets/person_2.json",phone),
                    Itemz(size,"Email","assets/mail_1.json",email),
                    Itemz(size,"Email","assets/mail_1.json",email),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding Itemz(Size size,String name,String lottieUrl,TextEditingController action) {
    return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 8, top: 5),
                          child: Row(
                            children: [
                               LottieContain(
                                  lottieUrl: lottieUrl,),
                              SizedBox(width: size.width * 0.06),
                              Flexible(
                                flex: 1,
                                child: TextFormField(
                                  //keyboardType: TextInputType.multiline,
                                  // style: TextStyle(height:10),

                                  decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(15, 20, 15, 15),
                                      // contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      // icon: Icon(Icons.person,size:30,color: Colors.black),
                                      filled: true,
                                      hintStyle:
                                          TextStyle(color: Colors.grey[800]),
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
