import 'package:flutter/material.dart';
import 'package:com.petroimensharif.pishco/utils/commons/text_styles.dart';

class LoginScreenBody extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController passWordController;
  final String? validationMessage;

  const LoginScreenBody({
    Key? key,
    required this.controller,
    required this.passWordController,
    this.validationMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Stack(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Colors.green[100],
                  height: 230,
                ),
              ),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Colors.green[300],
                  height: 220,
                ),
              ),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Colors.green[500],
                  height: 210,
                ),
              ),
            ],
          ),
          BodyLogin()
        ],
    );
  }

  BodyLogin(){
    return Container(
      child:
      Column(
        children: [
          // const Text('Login', style: headerStyle),
          // const SizedBox(
          //   height: 20,
          // ),
          // const Text('Enter your email and password to login',
          //     style: subHeaderStyle),
          const SizedBox(
            height: 20,
          ),
          LoginTextField(
            controller: controller,
            type: TextInputType.emailAddress,
            hint: "نام کاربری",
          ),
          LoginTextField(
            controller: passWordController,
            type: TextInputType.visiblePassword,
            hint: "کلمه عبور",
          ),
          const SizedBox(
            height: 20,
          ),
          validationMessage != null
              ? Text(validationMessage!,
              style: const TextStyle(color: Colors.red))
              : Container()
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    var firstStart = Offset(size.width / 4, size.height);
    var firstEnd = Offset(size.width / 2, size.height - 40);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width - (size.width / 4), size.height - 80);
    var secondEnd = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String hint;

  const LoginTextField({Key? key, required this.controller, required this.type, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String phoneNumber = "";
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
        ),
        margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: TextField(
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Color(0xFFF1F1FB), width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Color(0xFFF1F1FB), width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Color(0xFFF1F1FB), width: 2.0),
            ),
            hintText: hint,
            contentPadding: const EdgeInsets.all(10.0),
          ),
          controller: controller,
          onSubmitted: (value) {
            if(value.isNotEmpty) {
              phoneNumber = value;
            }
          },
        ),
    );
  }
}
