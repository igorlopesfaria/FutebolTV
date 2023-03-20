import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futebol_tv/feature/onboarding/presentation/splash/bloc/splash_cubit.dart';
import 'package:futebol_tv/router/routes.dart';
import 'package:get_it/get_it.dart';

class SplashPageWidget extends StatefulWidget {
  const SplashPageWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPageWidget> {

  final SplashCubit cubit = GetIt.I.get();

  @override
  void initState() {
    super.initState();
    cubit.loadSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.red,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Estado da Tela é: "),
                BlocProvider<SplashCubit>(
                    create: (context)  => cubit,
                    child: BlocBuilder<SplashCubit, SplashState>(
                        builder: (context, state) {
                          if (state is SplashLoadedState) {
                            redirectToWelcome();
                          } else if (state is SplashFirstAccessState) {
                            redirectToWelcome();
                          }
                          return Text("Iniciando a tela");

                        })
                )
              ],
            )

      )
    );
  }

  redirectToWelcome() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, Routes.welcome.path);
    });
  }
}