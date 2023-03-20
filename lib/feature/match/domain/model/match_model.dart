import 'package:equatable/equatable.dart';

class MatchModel extends Equatable{
  final String championship;
  final String stadium;
  final String shortDate;
  final String completeDate;
  final String time;
  final List<String> channels;
  final TeamModel teamAway;
  final TeamModel teamHome;

  const MatchModel(
      {required this.championship,
        required this.stadium,
        required this.shortDate,
        required this.completeDate,
        required this.time,
        required this.channels,
        required this.teamAway,
        required this.teamHome});

  factory MatchModel.fromJson(Map doc) {
    return MatchModel(
        championship: doc['campeonato'].toString(),
        stadium: doc['estadio'].toString(),
        shortDate: doc['dataCurta'].toString(),
        completeDate: doc['dataCompleta'].toString(),
        time: doc['horario'].toString(),
        channels: (doc['canaisTransmissao'] as List).map((data) => data.toString()).toList(),
        teamAway: TeamModel.fromJson(doc['visitante']),
        teamHome: TeamModel.fromJson(doc['casa']),
    );
  }

  @override
  List<Object> get props => [championship, stadium, shortDate, completeDate, time, channels, teamAway, teamHome];

}

class TeamModel {
  final String shortName;
  final String name;
  final String shield;

  TeamModel(
      {
        required this.shortName,
        required this.name,
        required this.shield
      });

  factory TeamModel.fromJson(Map doc) {
    return TeamModel(
        shortName: doc['abreviacao'],
        name: doc['nome'],
        shield: doc['urlEscudo']
    );
  }
}