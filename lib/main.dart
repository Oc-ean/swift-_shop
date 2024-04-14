import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:swift_shop/models/category_item_model.dart';
import 'package:swift_shop/models/user_model.dart';
import 'package:swift_shop/view_model/category/category_provider.dart';
import 'package:swift_shop/view_model/category_item/category_item_provider.dart';
import 'package:swift_shop/view_model/user/user_provider.dart';
import 'package:swift_shop/views/auth/screens/sign_in_screen.dart';

import 'models/category_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(CategoryItemModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const SignInScreen(),
      ),
    );
  }
}
