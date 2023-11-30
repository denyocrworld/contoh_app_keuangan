import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      transform: Matrix4.translationValues(0.0, 10, 0),
                      child: Icon(
                        MdiIcons.cashRegister,
                        size: 64.0,
                        color: Color(0xff263238),
                      ),
                    ),
                    Text(
                      "RizkyApp",
                      style: GoogleFonts.blackOpsOne(
                        fontSize: 46.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff263238),
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0.0, -10, 0),
                      child: Text(
                        "Investasi",
                        style: GoogleFonts.blackOpsOne(
                          fontSize: 16.0,
                          color: Color(0xff263238),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              QTextField(
                label: "Email",
                validator: Validator.email,
                suffixIcon: Icons.email,
                value: null,
                onChanged: (value) {},
              ),
              QTextField(
                label: "Password",
                obscure: true,
                validator: Validator.required,
                suffixIcon: Icons.password,
                value: null,
                onChanged: (value) {},
              ),
              QButton(
                label: "Login",
                onPressed: () => Get.offAll(MainNavigationView()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
