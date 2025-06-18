class ReviewRequest {
  final String comment;
  final double score;
  final int gameId;
  final int userId;

  ReviewRequest({
    required this.comment,
    required this.score,
    required this.gameId,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'score': score,
      'gameId': gameId,
      'userId': userId,
    };
  }
}
