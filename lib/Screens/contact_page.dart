import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Conntact extends StatelessWidget {
  const Conntact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
          title:  Text("Contact",style: GoogleFonts.redressed(fontSize: 28, color: Colors.white,fontWeight: FontWeight.w500))),
        backgroundColor: const Color.fromARGB(255, 7, 9, 15),
        body: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            ContactUs(
              logo: const AssetImage('assets/emilio.jpg'),
              email: 'emilio113kariuki@gmail.com',
              companyName: 'Emilio kariuki',
              phoneNumber: '+254 796 250 443',
              dividerThickness: 1,
              companyFontSize: 30,
              githubUserName: 'emilio-kariuki',
              linkedinURL: 'https://www.linkedin.com/in/emilio-kariuki/',
              tagLine: 'Flutter Developer',
              twitterHandle: 'HighTech113',
              cardColor: Color.fromARGB(255, 158, 158, 158),
              companyColor: Colors.white,
              taglineColor: Colors.white,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
