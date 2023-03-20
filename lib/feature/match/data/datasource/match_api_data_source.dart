import 'package:futebol_tv/commons/exception/exception.dart';
import 'package:futebol_tv/feature/match/data/model/response/match_api_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class IMatchApiDataSource {
  Future<MatchApiResponse> getMatchList();
}

@Injectable(as: IMatchApiDataSource)
class MatchApiDataSource implements IMatchApiDataSource{

  final _baseUrl = "https://onde-vai-passar-o-jogo.herokuapp.com/api/";

  final Dio _dio;

  MatchApiDataSource(this._dio);

  @override
  Future<MatchApiResponse> getMatchList() async {
    try {
      return MatchApiResponse.fromJson(
          (await _dio.get("$_baseUrl/matches/list")).data
      );
    } catch (e, _) {
      String cause = "There is an exception on api datasource layer. MatchApiDataSource getMatchList ${e.toString()}";
      throw DataApiException(cause);
    }
  }
}
