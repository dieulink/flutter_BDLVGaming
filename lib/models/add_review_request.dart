class AddReviewRequest {
  final String comment;
  final int score;
  final int gameId;
  final int userId;

  AddReviewRequest({
    required this.comment,
    required this.score,
    required this.gameId,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
    'comment': comment,
    'score': score,
    'gameId': gameId,
    'userId': userId,
  };
}
