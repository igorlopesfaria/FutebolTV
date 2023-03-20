import 'package:futebol_tv/feature/match/domain/model/match_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CreateListTeamUseCase {

  Future<List<String>> invoke(List<MatchModel> listMatch) async {
    List<String> teamsLists = [];
    for (var matchItemModel in listMatch) {
      if (!teamsLists.contains(matchItemModel.teamHome.name)) {
        teamsLists.add(matchItemModel.teamHome.name);
      }
      if (!teamsLists.contains(matchItemModel.teamAway.name)) {
        teamsLists.add(matchItemModel.teamAway.name);
      }
    }
    teamsLists.sort();
    teamsLists.insert(0, "Todos");
    return teamsLists;
  }
}