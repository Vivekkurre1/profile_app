import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserModel {
  final String name;
  final String imageUrl;
  final String memberSince;
  final int creditScore;
  final double lifetimeCashback;
  final double cashbackBalance;
  final int coins;

  UserModel({
    required this.name,
    required this.imageUrl,
    required this.memberSince,
    required this.creditScore,
    required this.lifetimeCashback,
    required this.cashbackBalance,
    required this.coins,
  });
}

final userProvider = Provider<UserModel>((ref) {
  return UserModel(
    name: 'Vivek Kurre',
    imageUrl: 'assets/image.png',
    memberSince: 'Mar 2021',
    creditScore: 783,
    lifetimeCashback: 5374.0,
    cashbackBalance: 234.0,
    coins: 10432,
  );
});
