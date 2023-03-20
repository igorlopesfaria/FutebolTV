import 'package:futebol_tv/feature/onboarding/data/data_source/onboarding_local_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class IOnboardingRepository {
  Future<bool> isFirstTime();
  Future<void> insertFirstTime(bool isFirstTime);
}

@Injectable(as: IOnboardingRepository)
class OnboardingRepository implements IOnboardingRepository {

  final IOnboardingLocalDataSource _localDataSource;

  OnboardingRepository( this._localDataSource);

  @override
  Future<void> insertFirstTime(bool isFirstTime) async {
    return await _localDataSource.insertFirstTime(isFirstTime);
  }

  @override
  Future<bool> isFirstTime()  async {
    return await _localDataSource.isFirstTime();
  }

}
