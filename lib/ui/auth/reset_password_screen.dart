import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/app_icons.dart';
import 'package:fooddeliveryapp/model/app_string.dart';
import 'package:fooddeliveryapp/widgets/back_button_widget.dart';
import 'package:fooddeliveryapp/widgets/round_button_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final newpassController = TextEditingController();
  final confirmpassController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  bool loading = false;

  // @override
  // void dispose() {
  //   newpassController.dispose();
  //   confirmpassController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.white,
          // automaticallyImplyLeading: true,
          leading: const BackButtonWidget(),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 160),
                    Center(
                        child: Image.asset(AppIcons.appicon,
                            height: 90, width: 90)),
                    const SizedBox(height: 50),
                    Text('Reset Password',
                        style: Theme.of(context).textTheme.displayMedium),
                    const SizedBox(height: 25),
                    Text(AppString.resetpassnote,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 30),
                    TextFormField(
                      cursorColor: Colors.black12,
                      controller: newpassController,
                      // obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          hintText: ' Enter your new password',
                          hintStyle: TextStyle(color: Colors.black38),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black12)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black12))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' Enter your new password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      cursorColor: Colors.black12,
                      controller: confirmpassController,
                      // obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          hintText: ' Confirm password',
                          hintStyle: TextStyle(color: Colors.black38),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black12)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black12))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' Confirm password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                    RoundButtonWidget(
                        title: 'Reset Password',
                        onpres: () {
                          if (_formKey.currentState!.validate()) {
                            resetpass();
                          }
                        }),
                    const SizedBox(height: 20),
                    // const Spacer(),
                  ]),
            ),
          ),
        ));
  }

  void resetpass() async {}
}
