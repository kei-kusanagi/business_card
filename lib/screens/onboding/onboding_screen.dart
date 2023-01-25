import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:qr_flutter/qr_flutter.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String mail='kei.kusanagi.99@gmail.com';
  String phone= '+52 55 55 55 55 55';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 300,
            left: 100,
            child:
            Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 20),
              child: SizedBox(),
            ),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 20),
                child: const SizedBox(),
              ),
          ),
          SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 70.0,
                    backgroundImage: AssetImage('assets/images/twitter.jpg'),
                  ),
                  const Text(
                    "Kei Kusanagi",
                    style: TextStyle(
                      fontFamily: 'Silkscreen',
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "FLUTTER DEVELOPER",
                    style: TextStyle(
                      fontFamily: 'SourceSans3',
                      fontSize: 20.0,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox( height: 20.0,
                    width: 150.0,),
                  SizedBox(
                    height: 20.0,
                    width: 150.0,
                    child: Divider(
                      color: Colors.cyan.shade100,
                    ),
                  ),
                  NewCard(data: phone, selectedIcon: Icons.phone_android_rounded,),
                  NewCard(data: mail, selectedIcon: Icons.email_outlined,),
                ],
              ),

          ),
          Positioned(
              bottom: 16,
              right: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),

                child: QrImage(
                  data: "www.linkedin.com/in/JuanCarlosRobledoMorales",
                  version: QrVersions.auto,
                  size: 120.0,
                  foregroundColor: const Color(0xFF150050),
                  gapless: false,
                  backgroundColor: Colors.white,
                  // embeddedImage: const AssetImage('assets/images/linkedin.png'),
                  // embeddedImageStyle: QrEmbeddedImageStyle(
                  //   size: Size(20, 20),
                  // ),
                ),

              ),
          ),
        ],
      ),
    );
  }
}

class NewCard extends StatelessWidget {

  const NewCard({
    Key? key,
    required this.data,
    required this.selectedIcon,
  }) : super(key: key);

  final String data;
  final selectedIcon;



  @override
  Widget build(BuildContext context) {
    String _mail='kei.kusanagi.99@gmail.com';
    String _phone= '+52 55 55 55 55 55';
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: ListTile(
        leading: Icon(
          selectedIcon,
          color: Color(0xFFFB2576),
        ),
        title: Center(

          child: Text(data,
              style: const TextStyle(
                color: Color(0xFF150050),
                fontFamily: 'SourceSans3',
                fontSize: 17.0,

              )),
        ),
        trailing: IconButton(
          alignment: Alignment.topRight,
          iconSize: 15.0,
          icon: const Icon(Icons.content_copy, color: Color(0xFF150050),),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: data));
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(data== _phone? 'Phone is copied to clipboard': 'Mail is copied to clipboard'),

                  // content: Text('$data Copied to clipboard'),
                  backgroundColor: const Color(0xFF3F0071),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),

            ),
            );
          },
        ),
      ),
    );
  }
}

// Clipboard.setData(ClipboardData(text: mail));
// ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Mail copied to clipboard'),
