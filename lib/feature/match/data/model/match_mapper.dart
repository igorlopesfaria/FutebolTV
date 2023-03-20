import 'package:futebol_tv/feature/match/data/model/response/match_api_response.dart';
import 'package:futebol_tv/feature/match/domain/model/match_model.dart';

extension MatchItemApiModelExtension on MatchItemApiResponse {
 MatchModel get mapResponseToModel {
    return MatchModel(
        championship: championship,
        stadium: stadium,
        shortDate: shortDate,
        completeDate: completeDate,
        channels: channels,
        teamAway: teamAway.mapResponseToModel,
        teamHome: teamHome.mapResponseToModel,
        time: time
    );
  }
}


extension TeamApiResponseExtension on TeamApiResponse {
  TeamModel get mapResponseToModel {
    return TeamModel(
        shortName: shortName,
        name: name,
        shield: shield
    );
  }
}
