import 'account_game_dto.dart';

class OrderHistory {
  final int orderId;
  final String createDate;
  final String? payAt;
  final double sumPrice;
  final List<AccountGameDto> accounts;

  OrderHistory({
    required this.orderId,
    required this.createDate,
    this.payAt,
    required this.sumPrice,
    required this.accounts,
  });

  factory OrderHistory.fromJson(Map<String, dynamic> json) {
    return OrderHistory(
      orderId: json['orderId'],
      createDate: json['createDate'],
      payAt: json['payAt'],
      sumPrice: (json['sumPrice'] as num).toDouble(),
      accounts:
          (json['accounts'] as List<dynamic>)
              .map((item) => AccountGameDto.fromJson(item))
              .toList(),
    );
  }
}
