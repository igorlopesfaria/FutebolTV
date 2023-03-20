// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../feature/match/data/datasource/match_api_data_source.dart' as _i8;
import '../feature/match/data/match_repository.dart' as _i9;
import '../feature/match/domain/create_list_championship_use_case.dart' as _i3;
import '../feature/match/domain/create_list_date_use_case.dart' as _i4;
import '../feature/match/domain/create_list_team_use_case.dart' as _i5;
import '../feature/match/domain/filter_match_use_case.dart' as _i7;
import '../feature/match/domain/get_match_use_case.dart' as _i11;
import '../feature/onboarding/data/data_source/onboarding_local_data_source.dart'
    as _i12;
import '../feature/onboarding/data/onboarding_repository.dart' as _i13;
import '../feature/onboarding/domain/get_first_time_use_case.dart' as _i15;
import '../feature/onboarding/domain/insert_first_time_use_case.dart' as _i14;
import '../feature/onboarding/presentation/splash/bloc/splash_cubit.dart'
    as _i16;
import '../module/app_module.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.CreateListChampionshipUseCase>(
      () => _i3.CreateListChampionshipUseCase());
  gh.factory<_i4.CreateListDateUseCase>(() => _i4.CreateListDateUseCase());
  gh.factory<_i5.CreateListTeamUseCase>(() => _i5.CreateListTeamUseCase());
  gh.factory<_i6.Dio>(() => appModule.dio);
  gh.factory<_i7.FilterMatchByTeamUseCase>(
      () => _i7.FilterMatchByTeamUseCase());
  gh.factory<_i8.IMatchApiDataSource>(
      () => _i8.MatchApiDataSource(get<_i6.Dio>()));
  gh.factory<_i9.IMatchRepository>(
      () => _i9.MatchRepository(get<_i8.IMatchApiDataSource>()));
  await gh.factoryAsync<_i10.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.factory<_i11.GetMatchUseCase>(
      () => _i11.GetMatchUseCase(get<_i9.IMatchRepository>()));
  gh.factory<_i12.IOnboardingLocalDataSource>(
      () => _i12.OnboardingLocalDataSource(get<_i10.SharedPreferences>()));
  gh.factory<_i13.IOnboardingRepository>(
      () => _i13.OnboardingRepository(get<_i12.IOnboardingLocalDataSource>()));
  gh.factory<_i14.InsertFirstTimeUseCase>(
      () => _i14.InsertFirstTimeUseCase(get<_i13.IOnboardingRepository>()));
  gh.factory<_i15.GetFirstTimeUseCase>(
      () => _i15.GetFirstTimeUseCase(get<_i13.IOnboardingRepository>()));
  gh.factory<_i16.SplashCubit>(() => _i16.SplashCubit(
        getFirstTimeUseCase: get<_i15.GetFirstTimeUseCase>(),
        insertFirstTimeUseCase: get<_i14.InsertFirstTimeUseCase>(),
      ));
  return get;
}

class _$AppModule extends _i17.AppModule {}
