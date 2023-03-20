import 'package:futebol_tv/feature/match/domain/model/match_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FilterMatchByTeamUseCase {

  Future<List<MatchModel>> invoke(String teamNameFilter, String dateFilter, String championshipFilter, List<MatchModel> listMatch) async {
    List<MatchModel> listMatchFiltered = listMatch;
    if (dateFilter.isNotEmpty) {
      listMatchFiltered = listMatchFiltered.where((match) => match.shortDate == dateFilter).toList();
    }

    if (teamNameFilter.isNotEmpty)  {
      listMatchFiltered = listMatchFiltered.where((match) => match.teamAway.name == teamNameFilter || match.teamHome.name == teamNameFilter).toList();
    }

    if (championshipFilter.isNotEmpty)  {
      listMatchFiltered = listMatchFiltered.where((match) => match.championship == championshipFilter).toList();

    }
    return listMatchFiltered;
  }
}
