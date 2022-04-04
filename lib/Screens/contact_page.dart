import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class Conntact extends StatelessWidget {
  const Conntact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: ContactUs(
          logo: const AssetImage('assets/emilio.jpg'),
          email: 'emilio113kariuki@gmail.com',
          companyName: 'Emilio kariuki',
          phoneNumber: '+254 796 250 443',
          dividerThickness: 2,
          githubUserName: 'emilio-kariuki',
          linkedinURL: 'https://www.linkedin.com/in/emilio-kariuki/',
          tagLine: 'Flutter Developer',
          twitterHandle: 'HighTech113',
           cardColor: Color.fromARGB(255, 7, 9, 15), 
           companyColor: Colors.white, 
           taglineColor: Colors.white, 
           textColor: Colors.white,
          
        ),
      ),
    );
  }
}
