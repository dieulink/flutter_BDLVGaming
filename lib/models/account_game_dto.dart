import 'dart:ffi';

class AccountGameDto {
  final String gamename;
  final int gameId;
  final String username;
  final String password;
  final String? gameImg;

  AccountGameDto({
    required this.gamename,
    required this.gameId,
    required this.username,
    required this.password,
    this.gameImg,
  });

  factory AccountGameDto.fromJson(Map<String, dynamic> json) {
    return AccountGameDto(
      gamename: json['gamename'],
      gameId: json['gameId'],
      username: json['username'],
      password: json['password'],
      gameImg: json['gameImg'],
    );
  }
}
