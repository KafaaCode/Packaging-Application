import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/core/services/services_locator.dart';
import 'package:frip_trading/core/utils/loading_dialog.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/presentation/controllers/cart/cart_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/counter/counter_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/products/products_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/cardproductandCatogry.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/option_filter.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/search.dart';
import 'package:frip_trading/src/presentation/screens/main/deitels_product.dart';

class Products extends StatelessWidget {
   final int  cartegriesId;
  const Products({super.key, required this.cartegriesId});

  @override
  Widget build(BuildContext context) {
  Lang lang = Lang.of(context);
    return BlocProvider(
      create: (context) => ProductBloc(mainRepository: sl())
        ..add( ProductEvent.getProducts(categoryId: cartegriesId)),
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.only(
            top: 40,
            right: 16,
            left: 16,
            bottom: 16,
          ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
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
                        Text(
                          lang.productTitle,
                          style: TextStyle(
                              color: Color(0xFF70b9be),
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/images/Group940.svg',
                      height: 50,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(width: 25, height: 50);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                 lang.productCategoryDescription,
                  style: TextStyle(
                    color: Color(0xFF70b9be),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Search(),
                    ),
                    const SizedBox(width: 8),
                    OptionFilter(onTap: () {
                      print(1);
                    })
                  ],
                ),
                const SizedBox(height: 16),
                 Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    lang.productTitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: BlocBuilder<ProductBloc, ProductState>(
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
                        return Center(
                          child: Text(
                           lang.productsNotFoundMessage,
                            style: const TextStyle(color:  Color(0xFF70b9be),fontWeight: FontWeight.bold,fontSize: 15),
                          ),
                        );
                      }
                  
                    
                      return SingleChildScrollView(
                        child: Center(
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 5,
                            children: List.generate(state.products.length, (i) {
                              final width = MediaQuery.of(context).size.width;
                              final itemWidth = width > 971
                                  ? width * 0.31
                                  : width > 800
                                      ? width * 0.47
                                      : width > 621
                                          ? width * 0.30
                                          : width * 0.43;

                              return InkWell(
                             onTap: () {
                              
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return BlocProvider(
create: (_) => CounterBloc(
  min: state.products[i].request_number ?? 0,
  initial: context.read<CartBloc>().state.items
              .firstWhere(
                (item) => item.product.id == state.products[i].id,
                orElse: () => CartItem(product: state.products[i], quantity: state.products[i].request_number ?? 0),
              )
              .quantity,
),

          child: ProductDetailsPage(product: state.products[i]),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    ),
  );
},

                                borderRadius: BorderRadius.circular(12),
                                child: SizedBox(
                                    width: itemWidth,
                                    child: MainCard(
                                      name: state.products[i].name.toString(),
                                      imageUrl:
                                         'assets/images/Rectangle569.png',
                                    )),
                              );
                            }),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
