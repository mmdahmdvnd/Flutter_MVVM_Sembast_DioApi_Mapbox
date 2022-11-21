import 'package:com.petroimensharif.pishco/utils/commons/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:com.petroimensharif.pishco/domain/enums/view_state.dart';
import 'package:com.petroimensharif.pishco/domain/viewmodel/login_view_model.dart';
import 'package:com.petroimensharif.pishco/pages/home_screen.dart';
import 'package:com.petroimensharif.pishco/utils/commons/app_colors.dart';
import 'package:com.petroimensharif.pishco/widgets/base_widget.dart';
import 'package:com.petroimensharif.pishco/widgets/login_screen_body.dart';
import 'dart:developer';

import '../widgets/map_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen<LoginViewModel>(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            LoginScreenBody(
              validationMessage: model.errorMessage,
              controller: _emailController,
              passWordController: _passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            model.state == ViewState.BUSY
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                   margin: const EdgeInsets.all(30),
                   child: ElevatedButton(
                      child: const Text('ورود',style: TextStyle(color: Colors.white)),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                        minimumSize: const Size(double.infinity, 50),
                        padding: const EdgeInsets.all(10.0),
                      ),
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        var loginSuccess = await model.login(
                            _emailController.text, _passwordController.text);
                        if (loginSuccess) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                        }
                      },
                   ),
               ),
            TextButton(
              child: const Text(
                'skip',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              onPressed: () {
                // model.errorMessage = "";
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const HomeScreen()));
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MapWidget()));
              },
            )
          ],
        ),
      ),
    );
  }
}
