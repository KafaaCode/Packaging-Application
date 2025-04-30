import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/src/presentation/controllers/cart/cart_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/counter/counter_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/cart_widget.dart';

class CartDetailsPage extends StatelessWidget {
  const CartDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
     Lang lang = Lang.of(context);
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
                  lang.cartDetailsTitle,
                  style: const TextStyle(
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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                       itemBuilder: (context, index) {
      final cartItem = state.items[index];
      return    BlocProvider(
        create: (context) => CounterBloc(
    min: cartItem.product.request_number ?? 1,initial:cartItem.quantity??0 
        ),
        child: CartWidget(cartItem: cartItem),
      );
    },
                ),
              );
            },
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               Text(
                  lang.continueToConfirmOrderButton,
                  style: const TextStyle(
                    color: Color(0xFF70b9be),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF70b9be),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child:  Text(lang.payButton,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

