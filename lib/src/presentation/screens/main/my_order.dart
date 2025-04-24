import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/presentation/controllers/myorder/myorder_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/myorder_card.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/option_filter.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/search.dart';

import '../../../../core/services/services_locator.dart';

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
    created_at: DateTime.now().subtract(Duration(days: 1)),
  ),
    MyOrder(
    id: 3,
    status: 'completed',
    serial_number: 'SN67890',
    delivery_time: '12:30 PM',
    created_at: DateTime.now().subtract(Duration(days: 1)),
  ),
    MyOrder(
    id: 3,
    status: 'canceled',
    serial_number: 'SN67890',
    delivery_time: '12:30 PM',
    created_at: DateTime.now().subtract(Duration(days: 1)),
  ),
    MyOrder(
    id: 3,
    status: 'partial delivery',
    serial_number: 'SN67890',
    delivery_time: '12:30 PM',
    created_at: DateTime.now().subtract(Duration(days: 1)),
  ),
  

];

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
                        child:Search(),
                      ),
                      const SizedBox(width: 8),
                     OptionFilter(onTap:(){
                      print(1);
                     } ,),
                    ],
                  ),
                ],
              ),
            ),
            BlocBuilder<MyOrdersBloc, MyOrdersState>(
              builder: (context, state) {
                    if(state.loading){

                        return Center(
  child: CircularProgressIndicator(
    backgroundColor: Colors.white,
    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF70b9be)),
  ),
);

                         
                      }
                      else if(state.error){
                        return Expanded(
                          child: Center(
                            child: Text(
                              'Orders not found',
                              style: const TextStyle(color:  Color(0xFF70b9be),fontWeight: FontWeight.bold,fontSize: 15),
                            ),
                          ),
                        );
                      }
                return Expanded(
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount:state.myorders.length /* orders.length */,
                      itemBuilder: (context, index) {
                        
                       return OrderCard(length:state.myorders.length,index:index,order:state.myorders[index]); 
         /*                return OrderCard(length:orders.length,index:index,order:orders[index]); */
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
