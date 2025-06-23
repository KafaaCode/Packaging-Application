import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/presentation/controllers/myorder/myorder_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/myorder_card.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/option_filter.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/search.dart';

class MyOrdersPage extends StatelessWidget {
  final List<MyOrder> orders = [
    MyOrder(
      id: 1,
      status: 'pending',
      serial_number: 'SN12345',
      delivery_time: '10:00 AM',
      created_at: DateTime.now(),
    ),
    MyOrder(
      id: 2,
      status: 'delivery',
      serial_number: 'SN67890',
      delivery_time: '12:30 PM',
      created_at: DateTime.now().subtract(const Duration(days: 1)),
    ),
    MyOrder(
      id: 3,
      status: 'completed',
      serial_number: 'SN67890',
      delivery_time: '12:30 PM',
      created_at: DateTime.now().subtract(const Duration(days: 1)),
    ),
    MyOrder(
      id: 3,
      status: 'canceled',
      serial_number: 'SN67890',
      delivery_time: '12:30 PM',
      created_at: DateTime.now().subtract(const Duration(days: 1)),
    ),
    MyOrder(
      id: 3,
      status: 'partial delivery',
      serial_number: 'SN67890',
      delivery_time: '12:30 PM',
      created_at: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Lang lang = Lang.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        lang.myOrdersTitle,
                        style: const TextStyle(
                          color: Color(0xFF70b9be),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/Group940.svg',
                        height: 36,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Search(
                          onChanged: (value) => context
                              .read<MyOrdersBloc>()
                              .add(MyOrdersEvent.search(value: value)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      OptionFilter(
                        onTap: () {
                          // يمكنك إضافة نافذة منبثقة لتصفية الحالة
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<MyOrdersBloc, MyOrdersState>(
                builder: (context, state) {
                  if (state.loading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Color(0xFF70b9be)),
                      ),
                    );
                  } else if (state.error) {
                    return Center(
                      child: Text(
                        lang.ordersNotFoundMessage,
                        style: const TextStyle(
                          color: Color(0xFF70b9be),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    );
                  }

                  final ordersToDisplay = state.search ?? state.myorders;

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: ordersToDisplay.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return OrderCard(
                        length: ordersToDisplay.length,
                        index: index,
                        order: ordersToDisplay[index],
                        lang: lang,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
