import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/models.dart';

class OrderCard extends StatelessWidget {
  final int length;
  final MyOrder order;
  final int index;
  OrderCard({required this.length, required this.order, required this.index});
  



 Color getStatusColor(String status) {
  switch (status) {
    case 'completed':
      return const Color(0xFFc9d0e3);
    case 'delivery':
      return const Color(0xFFbaffc8);
    case 'pending':
      return const Color(0xFFffe8ab);
    case 'partial delivery':
      return const Color(0xFFc5f0ff);
    case 'canceled':
      return const Color(0xFFffd1d1);
    default:
      return Colors.grey;
  }
}

Color getStatusTextColor(String status) {
  switch (status) {
    case 'completed':
      return const Color(0xFF667dc0);
    case 'delivery':
      return const Color(0xFF2cdd50);
    case 'pending':
      return const Color(0xFFf68f18);
    case 'partial delivery':
      return const Color(0xFF2596be);
    case 'canceled':
      return const Color(0xFFd14c4c);
    default:
      return const Color(0xFF667dc0);
  }
}

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                                              order.serial_number.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  color: Color(0xFF726c6c),
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(formatCustomDate(order.created_at.toString()),
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
                                               order.status),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                           order.status,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: getStatusTextColor(
                                                order.status),
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
                              if (index !=length- 1)
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
  }
  String formatCustomDate(String originalDate) {
  DateTime dateTime = DateTime.parse(originalDate).toLocal(); // نحول للـ local لو بتحب

  String dayShort = DateFormat('E').format(dateTime);       // Wed
  String dayNum = DateFormat('dd').format(dateTime);        // 24
  String monthShort = DateFormat('MMM').format(dateTime);   // Jun
  String year = DateFormat('yyyy').format(dateTime);        // 2024
  String time = DateFormat('h:mm a').format(dateTime);      // 8:00 AM

  return ' $dayShort, $dayNum, $monthShort, $year, $time';
}
}