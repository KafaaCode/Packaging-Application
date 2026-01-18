import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/presentation/controllers/cart/cart_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/counter/counter_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/main_bage/main_page_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/cart_widget.dart';
import 'package:frip_trading/src/presentation/screens/main/main_page.dart';

class CartDetailsPage extends StatelessWidget {
  const CartDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Lang lang = Lang.of(context);
    String? token = ApiConstances.tokenOrGuest();

    return BlocListener<MainPageBloc, MainPageState>(
      listener: (context, state) {
        if (state.isLoading) {
          // عند تحميل البيانات
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text(lang.Addingorder),
          //     backgroundColor: Colors.orange,
          //     // duration: Duration(seconds: 1),
          //   ),
          // );
        }
        if (state.successMessage != null) {
          context.read<CartBloc>().add(const CartEvent.clearCart());
          // في حالة النجاح
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text(state.successMessage!),
          //     backgroundColor: Colors.green,
          //     duration: Duration(seconds: 1),
          //   ),
          // );
          context.read<MainPageBloc>().add(const MainPageEvent.resetState());

          // context.read<MainPageBloc>().add(const MainPageEvent.resetState());
          // AppRouter.router.navigateTo(context, RoutesNames.myOrders);
          // Navigator.pop(context);
          // state.copyWith(errorMessage: '',isLoading: false,successMessage: '');
        } else if (state.errorMessage != null &&
            state.errorMessage!.isNotEmpty) {
          // في حالة حدوث خطأ
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 1),
            ),
          );
          // context.read<MainPageBloc>().emit(
          //       state.copyWith(errorMessage: ''),
          //     );
          state.errorMessage == '';
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: token == 'guest'
            ? Center(
                child: Text(
                  lang.loginFirst,
                  style: const TextStyle(
                    color: Color(0xFF70b9be),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 45, right: 16, left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lang.cartDetailsTitle,
                          style: const TextStyle(
                            color: Color(0xFF70b9be),
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
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
                            return BlocProvider(
                              create: (context) => CounterBloc(
                                min: cartItem.product.request_number ?? 1,
                                initial: cartItem.quantity ?? 0,
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
                        BoxShadow(color: Colors.black12, blurRadius: 10)
                      ],
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  lang.TotalPrice,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 110, 106, 106),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "${state.total_price.toStringAsFixed(2)} \$",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF70b9be),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        Text(
                          lang.continueToConfirmOrderButton,
                          style: const TextStyle(
                            color: Color(0xFF70b9be),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF70b9be),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  if (state.total_price == 0) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Cart is Empty!'),
                                      backgroundColor: Colors.red,
                                    ));
                                    return;
                                  } else {
                                    context.read<MainPageBloc>().add(
                                          MainPageEvent.addOrder(
                                            orderData:
                                                generateOrderDataFromState(
                                              state.items,
                                              state.total_price,
                                            ),
                                          ),
                                        );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(lang.Ordersentsuccessfully),
                                      backgroundColor: Colors.green,
                                    ));
                                  }
                                },
                                child: Text(
                                  lang.payButton,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Map<String, dynamic> generateOrderDataFromState(
    List<CartItem> cartItems,
    double totalPrice,
  ) {
    final orderDetails = cartItems.map((item) {
      return {
        "product_id": item.product.id,
        "quantity": item.quantity,
      };
    }).toList();

    return {
      "total_price": totalPrice,
      "order_details": orderDetails,
    };
  }
}
