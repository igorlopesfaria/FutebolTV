import 'package:futebol_tv/feature/match/domain/model/match_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CreateListChampionshipUseCase {

  Future<List<String>> invoke(List<MatchModel> listMatch) async {
    List<String> championshipLists = [];
    for (var matchModel in listMatch) {
      if (!listMatch.contains(matchModel.championship)) {
        championshipLists.add(matchModel.championship);
      }
    }
    championshipLists.sort();
    championshipLists.insert(0, "Todos");
    return championshipLists;
  }
}