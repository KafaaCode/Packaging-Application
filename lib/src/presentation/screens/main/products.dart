import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frip_trading/src/presentation/screens/main/deitels_product.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const Text(
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
                    child: TextField(
                      style: const TextStyle(fontSize: 14),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        filled: true,
                        fillColor: const Color(0xFFF5F6FA),
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 13),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFFBDC1C8),
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 30,
                          minHeight: 40,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xFF70b9be),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF70b9be),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/FontAwesomeIcons.png',
                        width: 25,
                        height: 25,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(width: 25, height: 25);
                        },
                      ),
                    ),
                  ),
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
                child: SingleChildScrollView(
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
                                builder: (context) => ProductDetailsPage(),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            width: itemWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'assets/images/Rectangle569.png',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const SizedBox(
                                        width: 25,
                                        height: 25,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  'Product Name sample data',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
