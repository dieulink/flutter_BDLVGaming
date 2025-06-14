class ReviewModel {
  final int reviewId;
  final String comment;
  final String createDate;
  final double score;
  final int gameId;
  final String userName;
  final int userId;

  ReviewModel({
    required this.reviewId,
    required this.comment,
    required this.createDate,
    required this.score,
    required this.gameId,
    required this.userName,
    required this.userId,
  });

  factory ReviewModel.fromJson(List<dynamic> json) {
    return ReviewModel(
      reviewId: json[0],
      comment: json[1],
      createDate: json[2],
      score: json[3].toDouble(),
      gameId: json[4],
      userName: json[5],
      userId: json[6],
    );
  }
}
