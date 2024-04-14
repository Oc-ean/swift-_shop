import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:swift_shop/views/auth/screens/sign_in_screen.dart';

import '../../constants/api_url.dart';
import '../../constants/info_message.dart';
import '../../constants/services/user_service.dart';
import '../../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  final UserService apiService = UserService(ApiUrl.baseUrl);

  GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Method to register a new user
  Future<void> registerUser(UserRole role, BuildContext context) async {
    try {
      if (!(signupKey.currentState?.validate() ?? false)) {
        log("Invalid Data");
        return infoSnackBar(context, 'Invalid Data');
      }
      // Create a new UserModel instance
      UserModel newUser = UserModel(
        id: '',
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
        role: role,
      );

      // Call the register method from the UserService
      UserModel registeredUser = await apiService.register(newUser);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SignInScreen()));
      // Optionally, you can do something with the registered user, such as saving it to local storage or displaying a success message
    } catch (error) {
      // Handle any errors that occur during registration
      print('Error registering user: $error');
    }
  }

  // Method to log in a user
  Future<void> loginUser(BuildContext context) async {
    if (!(loginKey.currentState?.validate() ?? false)) {
      log("Invalid Data");
      return infoSnackBar(context, 'Invalid Data');
    }
    try {
      final Map<String, dynamic> loginData = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      final response = await http.post(
        Uri.parse('${ApiUrl.baseUrl}/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(loginData),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final token = responseBody['token'];
        final user = responseBody['user'];
        final UserModel userModel = UserModel.fromJson(user);
      }

      // Optionally, you can do something with the logged-in user, such as saving it to local storage or navigating to the home screen
    } catch (error) {
      // Handle any errors that occur during login
      print('Error logging in: $error');
    }
  }
}
