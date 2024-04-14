import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_shop/constants/images.dart';

import '../../../view_model/user/user_provider.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_fields.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;
  final ScrollController _scrollController = ScrollController();
  final formKey = GlobalKey<FormState>();

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
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    // AuthButtonItems(
                    //     imagePath: 'assets/phone.svg',
                    //     onTap: () {},
                    //     name: 'Continue with mobile'),

                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: height / 2.3,
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
                            controller: userProvider.firstNameController,
                            hintText: 'First Name',
                            obscure: false,
                            iconButton: const SizedBox(),
                            // controller: authProvider.emailController,
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
                            controller: userProvider.lastNameController,
                            hintText: 'Last Name',
                            obscure: false,
                            iconButton: const SizedBox(),
                            // controller: authProvider.emailController,
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
                            controller: userProvider.emailController,
                            hintText: 'Email',
                            obscure: false,
                            iconButton: const SizedBox(),
                            // controller: authProvider.emailController,
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
                            controller: userProvider.passwordController,
                            obscure: _obscureText,
                            iconButton: InkWell(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: _obscureText
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            onTap: () {
                              // authProvider.scrollToTextField(
                              //     authProvider.passwordController,
                              //     _scrollController);
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AuthButton(
                            text: const Text(
                              'Sign Up ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            onTap: () async {
                              // userProvider.registerUser(role, context);
                              // navigation(context, const ProfilePic());
                              // authProvider.signUp(context);
                              // bool isValidated = signUpValidation(
                              //     authProvider.emailController.text,
                              //     authProvider.passwordController.text,
                              //     authProvider.nameController.text);
                              // if (isValidated) {
                              //   bool isSignUp = await FirebaseAuthHelper
                              //       .instance
                              //       .signUp(
                              //       context,
                              //       _emailController.text,
                              //       _passwordController.text,
                              //       _nameController.text);
                              //   if (isSignUp) {
                              //     Routes.instance.pushAndRemoveUntil(
                              //         widget: const BottomNav(),
                              //         context: context);
                              //   }
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'If you already have an account ?',
                          style: TextStyle(fontSize: 16),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // Navigator.push(
                            //   context,
                            //   CupertinoPageRoute(
                            //     builder: (_) => const HomeScreen(),
                            //   ),
                            // );
                          },
                          child: const Text(
                            ' Sign In',
                            style:
                                TextStyle(fontSize: 17, color: Colors.indigo),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // body: SafeArea(
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: 150,
        //         width: MediaQuery.of(context).size.width,
        //         child: Padding(
        //           padding: const EdgeInsets.only(left: 20),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             children: const [
        //               IconButton(
        //                 onPressed: null,
        //                 icon: Icon(
        //                   Icons.light,
        //                   color: Colors.transparent,
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Text(
        //                 "Sign Up",
        //                 style: TextStyle(fontSize: 22, color: Colors.white),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       Expanded(
        //         child: Container(
        //           width: MediaQuery.of(context).size.width,
        //           decoration: const BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(28),
        //               topRight: Radius.circular(28),
        //             ),
        //           ),
        //           child: Padding(
        //             padding: const EdgeInsets.all(20),
        //             child: SingleChildScrollView(
        //               scrollDirection: Axis.vertical,
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   const SizedBox(
        //                     height: 20,
        //                   ),
        //                   const Text(
        //                     "Welcome Buddy!",
        //                     style: TextStyle(
        //                         fontSize: 22, color: AppColors.deepOrange),
        //                   ),
        //                   const Text(
        //                     "St tech fast and reliable.",
        //                     style: TextStyle(
        //                       fontSize: 17,
        //                       color: Color(0xFFBBBBBB),
        //                     ),
        //                   ),
        //                   const SizedBox(
        //                     height: 15,
        //                   ),
        //                   Row(
        //                     children: [
        //                       Container(
        //                         height: 48,
        //                         width: 41,
        //                         decoration: BoxDecoration(
        //                             color: AppColors.deepOrange,
        //                             borderRadius: BorderRadius.circular(12)),
        //                         child: const Center(
        //                           child: Icon(
        //                             Icons.person,
        //                             color: Colors.white,
        //                             size: 20,
        //                           ),
        //                         ),
        //                       ),
        //                       const SizedBox(
        //                         width: 10,
        //                       ),
        //                       Expanded(
        //                         child: TextField(
        //                           keyboardType: TextInputType.visiblePassword,
        //                           controller: _nameController,
        //                           decoration: InputDecoration(
        //                             hintText: "Fred",
        //                             hintStyle: TextStyle(
        //                               fontSize: 14,
        //                               color: Colors.grey.shade300,
        //                               // color: Color(0xFF414041),
        //                             ),
        //                             labelText: 'Full Name',
        //                             labelStyle: const TextStyle(
        //                               fontSize: 15,
        //                               color: AppColors.deepOrange,
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   Row(
        //                     children: [
        //                       Container(
        //                         height: 48,
        //                         width: 41,
        //                         decoration: BoxDecoration(
        //                             color: AppColors.deepOrange,
        //                             borderRadius: BorderRadius.circular(12)),
        //                         child: const Center(
        //                           child: Icon(
        //                             Icons.email_outlined,
        //                             color: Colors.white,
        //                             size: 20,
        //                           ),
        //                         ),
        //                       ),
        //                       const SizedBox(
        //                         width: 10,
        //                       ),
        //                       Expanded(
        //                         child: TextField(
        //                           keyboardType: TextInputType.visiblePassword,
        //                           controller: _emailController,
        //                           decoration: InputDecoration(
        //                             hintText: "thed9954@gmail.com",
        //                             hintStyle: TextStyle(
        //                               fontSize: 14,
        //                               color: Colors.grey.shade300,
        //                               // color: Color(0xFF414041),
        //                             ),
        //                             labelText: 'EMAIL',
        //                             labelStyle: const TextStyle(
        //                               fontSize: 15,
        //                               color: AppColors.deepOrange,
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   const SizedBox(
        //                     height: 10,
        //                   ),
        //                   Row(
        //                     children: [
        //                       Container(
        //                         height: 48,
        //                         width: 41,
        //                         decoration: BoxDecoration(
        //                             color: AppColors.deepOrange,
        //                             borderRadius: BorderRadius.circular(12)),
        //                         child: const Center(
        //                           child: Icon(
        //                             Icons.lock_outline,
        //                             color: Colors.white,
        //                             size: 20,
        //                           ),
        //                         ),
        //                       ),
        //                       const SizedBox(
        //                         width: 10,
        //                       ),
        //                       Expanded(
        //                         child: TextField(
        //                           controller: _passwordController,
        //                           obscureText: _obscureText,
        //                           decoration: InputDecoration(
        //                             hintText: "password must be 6 character",
        //                             hintStyle: TextStyle(
        //                               fontSize: 14,
        //                               color: Colors.grey.shade300,
        //                               // color: Color(0xFF414041),
        //                             ),
        //                             labelText: 'PASSWORD',
        //                             labelStyle: const TextStyle(
        //                               fontSize: 15,
        //                               color: AppColors.deepOrange,
        //                             ),
        //                             suffixIcon: _obscureText == true
        //                                 ? IconButton(
        //                                     onPressed: () {
        //                                       setState(() {
        //                                         _obscureText = false;
        //                                       });
        //                                     },
        //                                     icon: const Icon(
        //                                       Icons.remove_red_eye,
        //                                       size: 20,
        //                                     ))
        //                                 : IconButton(
        //                                     onPressed: () {
        //                                       setState(() {
        //                                         _obscureText = true;
        //                                       });
        //                                     },
        //                                     icon: const Icon(
        //                                       Icons.visibility_off,
        //                                       size: 20,
        //                                     )),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //
        //                   const SizedBox(
        //                     height: 50,
        //                   ),
        //                   // elevated button
        //                   SizedBox(
        //                     width: 200,
        //                     height: 56,
        //                     child: ElevatedButton(
        //                       onPressed: () async {
        //                         bool isValidated = signUpValidation(
        //                             _emailController.text,
        //                             _passwordController.text,
        //                             _nameController.text);
        //
        //                         if (isValidated) {
        //                           bool isSignUp =
        //                               await FirebaseAuthHelper.instance.signUp(
        //                                   context,
        //                                   _emailController.text,
        //                                   _passwordController.text,
        //                                   _nameController.text);
        //                           if (isSignUp) {
        //                             Routes.instance.pushAndRemoveUntil(
        //                                 widget: const HomeScreen(),
        //                                 context: context);
        //                           }
        //                         }
        //                       },
        //                       child: Text(
        //                         "Continue",
        //                         style:
        //                             TextStyle(color: Colors.white, fontSize: 18),
        //                       ),
        //                       style: ElevatedButton.styleFrom(
        //                         primary: AppColors.deepOrange,
        //                         elevation: 3,
        //                       ),
        //                     ),
        //                   ),
        //                   const SizedBox(
        //                     height: 20,
        //                   ),
        //                   Wrap(
        //                     children: [
        //                       const Text(
        //                         " Have an account?",
        //                         style: TextStyle(
        //                           fontSize: 13,
        //                           fontWeight: FontWeight.w600,
        //                           color: Color(0xFFBBBBBB),
        //                         ),
        //                       ),
        //                       GestureDetector(
        //                         child: const Text(
        //                           " Sign In",
        //                           style: TextStyle(
        //                             fontSize: 13,
        //                             fontWeight: FontWeight.w600,
        //                             color: AppColors.deepOrange,
        //                           ),
        //                         ),
        //                         onTap: () {
        //                           Navigator.push(
        //                               context,
        //                               CupertinoPageRoute(
        //                                   builder: (context) =>
        //                                       const SignInPage()));
        //                         },
        //                       )
        //                     ],
        //                   )
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
