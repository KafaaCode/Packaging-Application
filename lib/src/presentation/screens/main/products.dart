import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frip_trading/core/services/services_locator.dart';
import 'package:frip_trading/src/presentation/controllers/products/products_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/cardproductandCatogry.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/option_filter.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/search.dart';
import 'package:frip_trading/src/presentation/screens/main/deitels_product.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(mainRepository: sl())
        ..add(const ProductEvent.getProducts(categoryId: 3)),
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                        const Text(
                          'Products ',
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
                  'Clothing Packaging Category Products',
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Products',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        child: Center(
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 5,
                            children: List.generate(10, (i) {
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
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsPage(product: state.products[i]),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: SizedBox(
                                    width: itemWidth,
                                    child: MainCard(
                                      name: 'product',
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
