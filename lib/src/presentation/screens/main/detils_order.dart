import 'package:flutter/material.dart';

import 'package:frip_trading/core/localization/generated/l10n.dart';

import 'package:frip_trading/src/data/models/models.dart';

import 'package:frip_trading/src/presentation/screens/auth/widgets/order_detils_card.dart';

class OrderDetailsPage extends StatelessWidget {
  final MyOrder order;
  OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    Lang lang = Lang.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 45,
              right: 16,
              left: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lang.orderDetailsTitle,
                  style: TextStyle(
                    color: Color(0xFF70b9be),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF70b9be),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lang.TotalPrice,
                  style: TextStyle(
                    color: Color(0xFF70b9be),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '\$${order.total_price}',
                  style: TextStyle(
                    color: Color(0xFF70b9be),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: order.products?.length ?? 0,
              itemBuilder: (context, index) {
                return OrderDetilsCard(
                    product: order.products![index], lang: lang);
              },
            ),
          ),
        ],
      ),
    );
  }
}
