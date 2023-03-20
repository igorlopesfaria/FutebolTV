import 'package:futebol_tv/feature/match/domain/model/match_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CreateListDateUseCase {

  Future<List<String>> invoke(List<MatchModel> listMatch) async {
    List<String> championshipLists = [];
    for (var matchModel in listMatch) {
      if (!listMatch.contains(matchModel.shortDate)) {
        championshipLists.add(matchModel.shortDate);
      }
    }
    championshipLists.sort();
    championshipLists.insert(0, "Todos");
    return championshipLists;
  }
}