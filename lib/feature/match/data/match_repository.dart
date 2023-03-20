import 'package:futebol_tv/feature/match/data/datasource/match_api_data_source.dart';
import 'package:futebol_tv/feature/match/data/model/match_mapper.dart';
import 'package:futebol_tv/feature/match/domain/model/match_model.dart';
import 'package:injectable/injectable.dart';

abstract class IMatchRepository {
  Future<List<MatchModel>> getMatches();
}

@Injectable(as: IMatchRepository)
class MatchRepository implements IMatchRepository {
  final IMatchApiDataSource _apiDataSource;

  MatchRepository(this._apiDataSource);

  @override
  Future<List<MatchModel>> getMatches() async =>
    (await _apiDataSource.getMatchList()).matches.map((e) => e.mapResponseToModel).toList();
}

