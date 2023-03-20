import 'package:flutter/material.dart';
import 'package:futebol_tv/feature/onboarding/presentation/splash/widget/splash_page.dart';
import 'package:futebol_tv/feature/onboarding/presentation/welcome/widget/welcome_page.dart';
import 'package:futebol_tv/router/routes.dart';
import 'package:injectable/injectable.dart';

import '/di/injection.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(Environment.prod);

  runApp(
    MaterialApp(
      title: 'Teste',
      initialRoute: Routes.splash.path,
      routes: {
          Routes.splash.path: (context) => const SplashPageWidget(),
          Routes.welcome.path: (context) => const WelcomePageWidget(),
        },
    ),
  );
}