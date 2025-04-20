import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';

class OrderCard extends StatelessWidget {
  final int length;
  final MyOrder order;
  final int index;
  OrderCard({required this.length, required this.order, required this.index});
  



  Color getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return const Color(0xFFc9d0e3);
      case 'Delivered':
        return const Color(0xFFbaffc8);
      case 'pending':
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
      case 'pending':
        return const Color(0xFFf68f18);
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
                                              order.id.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  color: Color(0xFF726c6c),
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(order.serial_number.toString(),
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
}