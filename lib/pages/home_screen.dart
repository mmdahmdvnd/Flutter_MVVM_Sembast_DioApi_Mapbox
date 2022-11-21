import 'package:flutter/material.dart';
import 'package:com.petroimensharif.pishco/domain/viewmodel/user_view_model.dart';
import 'package:com.petroimensharif.pishco/utils/commons/app_colors.dart';
import 'package:com.petroimensharif.pishco/widgets/base_widget.dart';
import 'package:com.petroimensharif.pishco/domain/viewmodel/user_view_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<UserViewModel>(
      onModelReady: (viewModel) async => await viewModel.isUserLoggedIn(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                model.user.name != null
                    ? Text("${model.user.name} is LoggedIn")
                    : const Text("Guest is LoggedIn")
              ],
            ),
          )),
    );
  }
}
