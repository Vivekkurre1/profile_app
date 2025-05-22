import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:profile_app/mock/mock_data.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageAndNameCard(user: user),
            IconTextCard(),
            const SizedBox(height: 16),
            profileRowItem(
              'credit score',
              user.creditScore.toString(),
              true,
              true,
            ),
            divider(),
            profileRowItem(
              'lifetime cashback',
              '₹${user.lifetimeCashback.toStringAsFixed(0)}',
              true,
            ),
            divider(),
            profileRowItem('bank balance', 'check', true),
            const SizedBox(height: 32),

            _yourRAndB(user),
          ],
        ),
      ),
    );
  }

  _yourRAndB(UserModel user) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 800,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'YOUR REWARDS & BENEFITS',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          rewardsCard(title: 'cashback balance', value: '₹0', isArrow: true),
          Divider(color: Colors.white24),
          rewardsCard(
            title: 'coins',
            value: user.coins.toString(),
            isArrow: true,
          ),
          Divider(color: Colors.white24),
          rewardsCard(
            title: 'win upto Rs 1000',
            value: 'refer and earn',
            isArrow: true,
          ),
          const SizedBox(height: 32),
          const Text(
            'TRANSACTIONS & SUPPORT',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          rewardsCard(title: 'all transactions', isArrow: true),
        ],
      ),
    );
  }

  Widget profileRowItem(
    String title,
    String value, [
    bool arrow = false,
    bool refresh = false,
  ]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.white70),
                ),
                padding: const EdgeInsets.all(4),
                child: Icon(getIcon(title), size: 18, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              if (refresh) ...[
                const SizedBox(width: 4),
                Text(
                  "* REFRESH AVAILABLE ",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              if (arrow) ...[
                const SizedBox(width: 6),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.white,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  IconData getIcon(String title) {
    switch (title.toLowerCase()) {
      case 'credit score':
        return Icons.speed_rounded;
      case 'lifetime cashback':
        return Icons.currency_rupee_sharp;
      case 'bank balance':
        return Icons.account_balance_wallet_outlined;
      default:
        return Icons.circle;
    }
  }

  Widget divider() {
    return Divider(
      color: Colors.white54,
      indent: 12,
      endIndent: 12,
      thickness: 0.5,
    );
  }

  Widget rewardsCard({
    required String title,
    String? value,
    bool isArrow = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              if (value != null)
                Text(
                  value,
                  style: const TextStyle(color: Colors.white38, fontSize: 14),
                ),
            ],
          ),
          Row(
            children: [
              if (isArrow) ...[
                const SizedBox(width: 6),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.white,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class IconTextCard extends StatelessWidget {
  const IconTextCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(width: 1, color: Colors.white24),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.directions_car, color: Colors.white),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'get to know your vehicles, inside out',
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'CRED garage',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_forward, size: 16, color: Colors.white),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      elevation: 0,
      leading: const Icon(Icons.arrow_back, color: Colors.white),
      title: const Text('Profile', style: TextStyle(color: Colors.white)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'support',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
      ],
    );
  }
}

class ImageAndNameCard extends StatelessWidget {
  const ImageAndNameCard({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(user.imageUrl)),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "member since ${user.memberSince}",
                style: const TextStyle(color: Colors.white54, fontSize: 14),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.white70),
            ),
            child: IconButton(
              icon: const Icon(Icons.edit_outlined, size: 24),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
