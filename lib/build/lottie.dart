
import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';

import 'lottie_container.dart';


class LottieContain extends StatelessWidget {
  
  final String lottieUrl;
  // final Function() func;
  const LottieContain({Key? key, required this.lottieUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        child: BuildContain(
          color: Color.fromARGB(255, 189, 139, 31),
          child: Lottie.asset(lottieUrl,height:30,width: 30 ),
        ));
  }
}