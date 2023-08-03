import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/app_colors.dart';
import 'package:fooddeliveryapp/model/app_icons.dart';
import 'package:fooddeliveryapp/model/utils.dart';
import 'package:fooddeliveryapp/ui/auth/login_screen.dart';
import 'package:fooddeliveryapp/widgets/back_button_widget.dart';
import 'package:fooddeliveryapp/widgets/round_button_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

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
                    Text('SignUp',
                        style: Theme.of(context).textTheme.displayMedium),
                    const SizedBox(height: 25),
                    Text('Email',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 10),
                    TextFormField(
                      cursorColor: Colors.black12,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: ' Enter your email',
                          hintStyle: TextStyle(color: Colors.black38),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black12)),
                          // border: OutlineInputBorder(
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(15)),
                          //     borderSide:
                          //         BorderSide(width: 2, color: Colors.black12))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black12))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' Enter your email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    Text('Password',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 10),
                    TextFormField(
                      cursorColor: Colors.black12,
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          hintText: ' Enter your password',
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
                          return ' Enter your password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 50),
                    RoundButtonWidget(
                        title: 'Signup',
                        onpres: () {
                          if (_formKey.currentState!.validate()) {
                            signup();
                          }
                        }),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',
                            style: Theme.of(context).textTheme.bodyMedium),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppColors.red),
                            ))
                      ],
                    )
                    // const Spacer(),
                  ]),
            ),
          ),
        ));
  }

  void signup() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      auth
          .createUserWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        setState(() {
          loading = false;
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }).onError((error, stackTrace) {
        setState(() {
          loading = false;
        });
        Utils().toastmessage(error.toString());
      });
    } else {}
  }
}
