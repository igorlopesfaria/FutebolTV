
import 'package:equatable/equatable.dart';

class MatchApiResponse extends Equatable{
  final String label;
  final List<MatchItemApiResponse> matches;

  const MatchApiResponse({required this.label, required this.matches});

  factory MatchApiResponse.fromJson(Map<String, dynamic> json) {
    return MatchApiResponse(
        label: json["label"],
        matches:  (json["jogos"] as List).map((data) => MatchItemApiResponse.fromJson(data)).toList()
    );
  }

  @override
  List<Object> get props => [label, matches];
}

class MatchItemApiResponse extends Equatable{
  final String championship;
  final String stadium;
  final String shortDate;
  final String completeDate;
  final String time;
  final List<String> channels;
  final TeamApiResponse teamAway;
  final TeamApiResponse teamHome;
  final String gameStatus;

  const MatchItemApiResponse(
      {required this.championship,
        required this.stadium,
        required this.shortDate,
        required this.completeDate,
        required this.time,
        required this.channels,
        required this.teamAway,
        required this.teamHome,
        required this.gameStatus});

  factory MatchItemApiResponse.fromJson(Map doc) {
    return MatchItemApiResponse(
        championship: doc['campeonato'].toString(),
        stadium: doc['estadio'].toString(),
        shortDate: doc['dataCurta'].toString(),
        completeDate: doc['dataCompleta'].toString(),
        time: doc['horario'].toString(),
        channels: (doc['canaisTransmissao'] as List).map((data) => data.toString()).toList(),
        teamAway: TeamApiResponse.fromJson(doc['visitante']),
        teamHome: TeamApiResponse.fromJson(doc['casa']),
        gameStatus: doc['statusJogo'].toString()
    );
  }

  @override
  List<Object> get props => [championship, stadium, shortDate, completeDate, time, channels, teamAway, teamHome, gameStatus];

}

class TeamApiResponse {
  final String shortName;
  final String name;
  final String shield;

  TeamApiResponse(
      {
        required this.shortName,
        required this.name,
        required this.shield
      });

  factory TeamApiResponse.fromJson(Map doc) {
    return TeamApiResponse(
        shortName: doc['abreviacao'],
        name: doc['nome'],
        shield: doc['urlEscudo']
    );
  }
}
