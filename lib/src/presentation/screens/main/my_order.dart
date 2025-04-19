import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frip_trading/src/presentation/controllers/myorder/myorder_bloc.dart';

import '../../../../core/services/services_locator.dart';

class MyOrdersPage extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {
      "id": "Bp001717343401",
      "date": "Wed, 24,Jun,2024, 8:00AM",
      "status": "Completed"
    },
    {
      "id": "Bp001717343401",
      "date": "Wed, 24,Jun,2024, 8:00AM",
      "status": "Delivered"
    },
    {
      "id": "Bp001717343401",
      "date": "Wed, 24,Jun,2024, 8:00AM",
      "status": "Pending"
    },
    {
      "id": "Bp001717343401",
      "date": "Wed, 24,Jun,2024, 8:00AM",
      "status": "Completed"
    },
  ];

  MyOrdersPage({super.key});

  Color getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return const Color(0xFFc9d0e3);
      case 'Delivered':
        return const Color(0xFFbaffc8);
      case 'Pending':
        return const Color(0xFFffe8ab);
      default:
        return Colors.grey;
    }
  }

  Color getStatusTextColor(String status) {
    switch (status) {
      case 'Completed':
        return const Color(0xFF667dc0);
      case 'Delivered':
        return const Color(0xFF2cdd50);
      case 'Pending':
        return const Color(0xFFf68f18);
      default:
        return const Color(0xFF667dc0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyOrdersBloc(sl())..add(const MyOrdersEvent.getMyOrders()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Orders',
                        style: TextStyle(
                            color: Color(0xFF70b9be),
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      SvgPicture.asset(
                        'assets/images/Group940.svg',
                        height: 40,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(fontSize: 14),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              border: InputBorder.none,
                              hintText: 'Search...',
                              filled: true,
                              fillColor: const Color(0xFFF5F6FA),
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 13),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Color(0xFFBDC1C8),
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                minWidth: 30,
                                minHeight: 40,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color(0xFF70b9be),
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              isDense: true),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF70b9be),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/FontAwesomeIcons.png',
                            width: 25,
                            height: 25,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BlocBuilder<MyOrdersBloc, MyOrdersState>(
              builder: (context, state) {
                return Expanded(
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        return Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 16.0,
                                    bottom: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              order['id']!,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  color: Color(0xFF726c6c),
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(order['date']!,
                                                style: const TextStyle(
                                                    color: Color(0xFF726c6c),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: getStatusColor(
                                                order['status']!),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            order['status']!,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: getStatusTextColor(
                                                    order['status']!),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF70b9be),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Text(
                                          "Details Order",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (index != orders.length - 1)
                                SizedBox(
                                  height: 30,
                                  width: double.infinity,
                                  child: Container(
                                    color: const Color(0xFFf4f4f4),
                                    child: const Padding(
                                        padding: EdgeInsets.all(20)),
                                  ),
                                )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
