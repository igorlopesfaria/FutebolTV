import 'package:futebol_tv/feature/match/data/match_repository.dart';
import 'package:futebol_tv/feature/match/domain/model/match_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetMatchUseCase {

  final IMatchRepository _repository;

  const GetMatchUseCase(this._repository);

  Future<List<MatchModel>> invoke() async {
    return _repository.getMatches();
  }
}
