import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/presentation/controllers/cart/cart_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/counter/counter_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/cart_widget.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/order_detils_card.dart';

class OrderDetailsPage extends StatelessWidget {
 
MyOrder order;
  OrderDetailsPage({super.key, required this.order});
  @override
  Widget build(BuildContext context) {
    /*  Lang lang = Lang.of(context); */
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top:45,
              right: 16,
              left: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  'Detils ORDER',
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
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: order.products?.length??0 ,
                   itemBuilder: (context, index) {
      
               
                return   OrderDetilsCard(product:this.order.products![index],);
                
              },
            ),
          ),
        
        ],
      ),
    );
  }
}

