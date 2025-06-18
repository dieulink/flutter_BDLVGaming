class AccountGameDto {
  final String gamename;
  final String username;
  final String password;
  final String? gameImg;

  AccountGameDto({
    required this.gamename,
    required this.username,
    required this.password,
    this.gameImg,
  });

  factory AccountGameDto.fromJson(Map<String, dynamic> json) {
    return AccountGameDto(
      gamename: json['gamename'],
      username: json['username'],
      password: json['password'],
      gameImg: json['gameImg'],
    );
  }

  get gameId => null;
}
