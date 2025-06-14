import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/presentation/controllers/cart/cart_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/counter/counter_bloc.dart';

class CartWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image, size: 30),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.product.name ?? 'Product Name',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xFF70b9be)),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        cartItem.product.category?.name ?? 'category Name',
                        style: const TextStyle(
                            color: Color(0xFF70b9be), fontSize: 12),
                      ),
                      BlocBuilder<CounterBloc, CounterState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              IconButton(
                                onPressed: state.count > state.min
                                    ? () {
                                        context.read<CounterBloc>().add(
                                            const CounterEvent.decrement());
                                        context.read<CartBloc>().add(
                                              CartEvent.updateQuantity(
                                                  product: cartItem.product,
                                                  quantity: state.count-state.min),
                                            );
                                      }
                                    : null,
                                icon: const Icon(Icons.remove_circle_outline),
                              ),
                              Text(
                                state.count.toString(),
                                style: const TextStyle(fontSize: 15),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<CounterBloc>()
                                      .add(const CounterEvent.increment());
                                  context.read<CartBloc>().add(
                                        CartEvent.updateQuantity(
                                            product: cartItem.product,
                                            quantity: state.count + state.min),
                                      );
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/IconArtwork.svg',
                                  height: 22,
                                  width: 22,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 4,
             left: Directionality.of(context) == TextDirection.rtl ? 4 : null,
  right: Directionality.of(context) == TextDirection.ltr ? 4 : null,
            child: IconButton(
              onPressed: () {
                // Remove item from cart logic here
                context
                    .read<CartBloc>()
                    .add(CartEvent.removeProduct(cartItem.product));
              },
              icon: Image.asset(
                'assets/images/IconArtwork.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
