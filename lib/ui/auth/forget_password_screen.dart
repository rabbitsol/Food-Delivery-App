import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/app_icons.dart';
import 'package:fooddeliveryapp/model/app_string.dart';
import 'package:fooddeliveryapp/model/utils.dart';
import 'package:fooddeliveryapp/ui/auth/verify_code_screen.dart';
import 'package:fooddeliveryapp/widgets/back_button_widget.dart';
import 'package:fooddeliveryapp/widgets/round_button_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    Text('Forget Password',
                        style: Theme.of(context).textTheme.displayMedium),
                    const SizedBox(height: 25),
                    Text(AppString.resetpassnote,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 30),
                    TextFormField(
                      cursorColor: Colors.black12,
                      controller: phoneNumberController,
                      // obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: ' Enter your phone number',
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
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return ' Enter your phone number';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.28),
                    RoundButtonWidget(
                        title: 'Send OTP',
                        loading: loading,
                        onpres: () {
                          setState(() {
                            loading = true;
                          });
                          auth.verifyPhoneNumber(
                              phoneNumber:
                                  phoneNumberController.text.toString(),
                              verificationCompleted: (_) {
                                setState(() {
                                  loading = false;
                                });
                              },
                              verificationFailed: (e) {
                                setState(() {
                                  loading = false;
                                });
                                Utils().toastmessage(e.toString());
                              },
                              codeSent: (String verificationID, int? token) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VerifyCodeScreen(
                                            verificationID: verificationID)));
                                setState(() {
                                  loading = false;
                                });
                              },
                              codeAutoRetrievalTimeout: (e) {
                                setState(() {
                                  loading = false;
                                });
                                Utils().toastmessage(e.toString());
                              });
                        }),
                    const SizedBox(height: 20),
                    // const Spacer(),
                  ]),
            ),
          ),
        ));
  }
}
