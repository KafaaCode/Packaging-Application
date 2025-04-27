import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/presentation/controllers/cart/cart_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/counter/counter_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/main_bage/main_page_bloc.dart';
import 'package:frip_trading/src/presentation/screens/main/main_page.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  final int minQuantity = 10;


  final String fullDescription =
      "The Nike Throwback Pullover Hoodie is made from premium French terry fabric. "
      "It’s designed for performance and comfort. Stylish and warm for everyday use. "
      "It’s a great choice for daily wear or workouts. Available in various sizes and colors.";

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Lang lang = Lang.of(context);
    
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/image5.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 45,
                  left: 10,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        
                        Icons.arrow_back,
                        color: Color(0xFF70b9be),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 45,
                  right: 10,
                  child: SvgPicture.asset(
                    'assets/images/Group940.svg',
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category?.name ?? '',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                   Text(lang.priceLabel, style: TextStyle(color: Colors.grey)),
                  Text("\$${product.price}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                Text(
                  lang.descriptionLabel,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ReadMoreText(
                        product.description ?? '',
                        trimLines: 3,
                        colorClickableText: Colors.teal,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: lang.readMoreButton,
                        trimExpandedText: lang.readLessButton,
                        style: const TextStyle(color: Colors.grey),
                        moreStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                        lessStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<CounterBloc, CounterState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
                                  lang.minimumOrderText,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "${lang.productIsText}: ${state.min}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: state.count > state.min
                                        ? () => context
                                            .read<CounterBloc>()
                                            .add(const CounterEvent.decrement())
                                        : null,
                                    icon:
                                        const Icon(Icons.remove_circle_outline),
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
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/images/IconArtwork.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                       Row(
                        children: [
                        
                  
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF70b9be),
                                padding: const EdgeInsets.symmetric(vertical: 13),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                              context.read<MainPageBloc>().add(const MainPageEvent.navigateToTab(2));
                              AppRouter.router.navigateTo(
                                          context, RoutesNames.mainRoute,
                                          transition:
                                              TransitionType.inFromRight,
                                          routeSettings: RouteSettings(
                                            ),
                                          transitionDuration: const Duration(
                                              milliseconds: 400));
                              },
                              child: const Icon(
                                 size: 31.0,
                                
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
        const SizedBox(width: 10),
                            Expanded(
                            flex: 3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF70b9be),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                AddToCard(context, lang);
                              },
                              child: Text(
                                lang.addToCartButton,
                                style: const TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void AddToCard(BuildContext context,Lang lang) {
    final cartBloc = context.read<CartBloc>();
    final counterBloc = context.read<CounterBloc>();
    final quantity = counterBloc.state.count;

    final existingItem = cartBloc.state.items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: -1),
    );

    if (existingItem.quantity == quantity) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
            content: Text(
                lang.productAlreadyExistsMessage,
                style: TextStyle(color: Color(0xFF70b9be))),
            backgroundColor: Color.fromARGB(255, 239, 244, 245)),
      );
    } else {
      final newCartItem = CartItem(product: product, quantity: quantity);
      cartBloc.add(CartEvent.removeProduct(product));
      cartBloc.add(CartEvent.addProduct(newCartItem));

      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
            content: Text(lang.productAddedToCartMessage,
                style: TextStyle(color: Color(0xFF70b9be))),
            backgroundColor: Color.fromARGB(255, 239, 244, 245)),
      );
    }
  }
}
