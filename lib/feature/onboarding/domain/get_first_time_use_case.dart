import 'package:futebol_tv/feature/onboarding/data/onboarding_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetFirstTimeUseCase {

  final IOnboardingRepository _repository;

  GetFirstTimeUseCase(this._repository);

  Future<bool> invoke() async {
    return _repository.isFirstTime();
  }
}
