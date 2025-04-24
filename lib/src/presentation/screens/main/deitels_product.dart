import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/presentation/controllers/cart/cart_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/counter/counter_bloc.dart';
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
                  'images/image5.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
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
                  top: 10,
                  right: 10,
                  child: SvgPicture.asset(
                    'images/Group940.svg',
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
                  const Text("Price", style: TextStyle(color: Colors.grey)),
                  Text("\$${product.price}",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  const Text(
                    "Description",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ReadMoreText(
                        product.description ?? '',
                        trimLines: 3,
                        colorClickableText: Colors.teal,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' Read more',
                        trimExpandedText: ' Read less',
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
                                  const Text(
                                    "The minimum order for this",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "product is: ${state.min}",
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
                                    },
                                    icon: SvgPicture.asset(
                                      'images/IconArtwork.svg',
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
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF70b9be),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                            ),
                          ),
               onPressed: () {
  AddToCard(context) ;
},

                          child: const Text(
                            "Add To Cart",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
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
  void AddToCard(BuildContext context) {
 final cartBloc = context.read<CartBloc>();
  final counterBloc = context.read<CounterBloc>();
  final quantity = counterBloc.state.count;

  final existingItem = cartBloc.state.items.firstWhere(
    (item) => item.product.id == product.id,
    orElse: () => CartItem(product: product, quantity: -1), 
  );

  if (existingItem.quantity == quantity) {
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('the product is elready exist in the same quantity in cart',style: TextStyle(color: Color(0xFF70b9be) )),backgroundColor:Color.fromARGB(255, 239, 244, 245)),
    );
  } else {

    final newCartItem = CartItem(product: product, quantity: quantity);
    cartBloc.add(CartEvent.removeProduct(product));
    cartBloc.add(CartEvent.addProduct(newCartItem));
   

    ScaffoldMessenger.of(context).showSnackBar(
      
      const SnackBar(
        content: Text('Product Aded to card',style: TextStyle(color: Color(0xFF70b9be) )),backgroundColor:Color.fromARGB(255, 239, 244, 245)),
    );
  }
  }
}