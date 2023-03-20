import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futebol_tv/feature/onboarding/domain/get_first_time_use_case.dart';
import 'package:futebol_tv/feature/onboarding/domain/insert_first_time_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

@Injectable()
class SplashCubit extends Cubit<SplashState> {

  SplashCubit({
    required this.getFirstTimeUseCase,
    required this.insertFirstTimeUseCase
  }) : super(SplashInitialState());

  final GetFirstTimeUseCase getFirstTimeUseCase;
  final InsertFirstTimeUseCase insertFirstTimeUseCase;

  void loadSplashScreen() async {
    try {
      emit(SplashLoadingState());
      bool isFirstAccess = await getFirstTimeUseCase.invoke();

      if(isFirstAccess) {
        emit(SplashFirstAccessState());
        insertFirstTimeUseCase.invoke(false);
      } else {
        emit(SplashLoadedState());
      }
    } catch (exception, _) {
      emit(SplashFirstAccessState());
    }
  }
}

