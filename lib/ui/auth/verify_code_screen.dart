// import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:fooddeliveryapp/model/app_colors.dart';
import 'package:fooddeliveryapp/model/app_icons.dart';
import 'package:fooddeliveryapp/model/utils.dart';
import 'package:fooddeliveryapp/ui/auth/reset_password_screen.dart';
import 'package:fooddeliveryapp/widgets/back_button_widget.dart';
import 'package:fooddeliveryapp/widgets/round_button_widget.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationID;
  const VerifyCodeScreen({super.key, required this.verificationID});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  String currentText = "";
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final verificationCodeController = TextEditingController();
  // StreamController<ErrorAnimationType>? errorController;
  // // final otpController = OtpFieldController();

  // @override
  // void initState() {
  //   errorController = StreamController<ErrorAnimationType>();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   errorController!.close();
  //   verificationCodeController.dispose();
  //   super.dispose();
  // }
  // @override
  // void dispose() {

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.white,
          // automaticallyImplyLeading: true,
          leading: const BackButtonWidget()),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 160),
              Center(
                  child: Image.asset(AppIcons.appicon, height: 90, width: 90)),
              const SizedBox(height: 50),
              Text('Forget Password',
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 25),
              // const SizedBox(height: 80),
TextFormField(
  controller: verificationCodeController,

)
              // PinFormField(
                // appContext: context,
                // pastedTextStyle: const TextStyle(
                //   color: AppColors.redwhite,
                //   fontWeight: FontWeight.bold,
                // ),
                // length: 6,
                // obscureText: true,
                // obscuringCharacter: '*',
                // obscuringWidget: const FlutterLogo(
                //   size: 24,
                // ),
                // blinkWhenObscuring: true,
                // animationType: AnimationType.fade,
                // validator: (v) {
                //   if (v!.length < 3) {
                //     return "I'm from validator";
                //   } else {
                //     return null;
                //   }
                // },
              //   pinTheme: PinTheme(
              //     // fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 5),
              //     shape: PinCodeFieldShape.box,
              //     borderRadius: BorderRadius.circular(5),
              //     fieldHeight: 50,
              //     fieldWidth: 40,
              //     activeFillColor: Colors.white,
              //   ),
              //   cursorColor: Colors.black,
              //   animationDuration: const Duration(milliseconds: 300),
              //   enableActiveFill: true,
              //   errorAnimationController: errorController,
              //   controller: verificationCodeController,
              //   keyboardType: TextInputType.number,
              //   boxShadows: const [
              //     BoxShadow(
              //       offset: Offset(0, 1),
              //       color: Colors.black12,
              //       blurRadius: 10,
              //     )
              //   ],
              //   onCompleted: (v) {
              //     debugPrint("Completed");
              //   },
              //   // onTap: () {
              //   //   print("Pressed");
              //   // },
              //   onChanged: (value) {
              //     debugPrint(value);
              //     setState(() {
              //       currentText = value;
              //     });
              //   },
              //   beforeTextPaste: (text) {
              //     debugPrint("Allowing to paste $text");
              //     //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //     //but you can show anything you want here, like your pop up saying wrong paste format or etc
              //     return true;
              //   },
              //   // )),
            
              ,SizedBox(height: MediaQuery.of(context).size.height * 0.38),
              RoundButtonWidget(
                  title: 'Verify',
                  loading: loading,
                  onpres: () async {
                    setState(() {
                      loading = true;
                    });
                    final credential = PhoneAuthProvider.credential(
                        verificationId: widget.verificationID,
                        smsCode: verificationCodeController.text.toString());
                    try {
                      await auth.signInWithCredential(credential);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ResetPasswordScreen()));
                    } catch (e) {
                      setState(() {
                        loading = false;
                      });
                      Utils().toastmessage(e.toString());
                    }
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
