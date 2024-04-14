import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_shop/bottom_nav.dart';
import 'package:swift_shop/view_model/user/user_provider.dart';
import 'package:swift_shop/views/auth/screens/sign_up_screen.dart';

import '../../../constants/images.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_fields.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(signUpBgImage), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.white10,
        body: Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            clipBehavior: Clip.none,
            child: Column(
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: height / 3,
                  width: width * 0.85,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBEFF8),
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        const Color(0xFFF6E9FB).withOpacity(0.9),
                        const Color(0xFFDDEBFA),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableTextField(
                        hintText: 'Email',
                        obscure: false,
                        iconButton: SizedBox(),
                        // controller: authProvider.emailController,
                        validator: (value) {
                          var pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern);
                          if (value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!regex.hasMatch(value)) {
                            return 'Please enter a valid Email';
                          } else {
                            return null;
                          }
                        },
                        onTap: () {
                          // authProvider.scrollToTextField(
                          //     authProvider.emailController,
                          //     _scrollController);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ReusableTextField(
                        hintText: 'Password',
                        obscure: false,
                        iconButton: SizedBox(),
                        // controller: authProvider.passwordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter password';
                          } else if (value.length < 6) {
                            return 'Please password should be at least 6 characters long';
                          } else {
                            return null;
                          }
                        },
                        onTap: () {
                          // authProvider.scrollToTextField(
                          //     authProvider.passwordController,
                          //     _scrollController);
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.indigo),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AuthButton(
                        text: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const BottomNav(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account ?',
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const SignUpScreen()));
                        // Routes.instance
                        //     .push(const SignUpAuthScreen(), context);
                      },
                      child: const Text(
                        ' Sign Up',
                        style: TextStyle(fontSize: 17, color: Colors.indigo),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
