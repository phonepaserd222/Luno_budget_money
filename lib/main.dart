import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luno_budget_money/constants/color_contants.dart';

import 'firebase_options.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    initialRoute: Routes.login,
    onGenerateRoute: Routes.generateRoute,
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      primaryColor: ColorConstants.colors4,
      appBarTheme: const AppBarTheme(color: ColorConstants.colors4),
    ),
  ));
}
