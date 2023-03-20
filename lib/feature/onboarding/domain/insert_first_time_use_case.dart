import 'package:futebol_tv/feature/onboarding/data/onboarding_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class InsertFirstTimeUseCase {

  final IOnboardingRepository _repository;

  InsertFirstTimeUseCase(this._repository);

  Future<void> invoke(bool isFirstTime) async {
    return _repository.insertFirstTime(isFirstTime);
  }
}
