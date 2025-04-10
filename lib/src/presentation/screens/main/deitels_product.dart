import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsPage extends StatefulWidget {
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 10;
  final int minQuantity = 10;
  final String fullDescription =
      "The Nike Throwback Pullover Hoodie is made from premium French terry fabric. "
      "It’s designed for performance and comfort. Stylish and warm for everyday use. "
      "It’s a great choice for daily wear or workouts. Available in various sizes and colors.";

  bool showReadMore = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkIfTextOverflows();
    });
  }

  void checkIfTextOverflows() {
    final span = TextSpan(
      text: fullDescription,
      style: const TextStyle(color: Colors.grey),
    );

    final tp = TextPainter(
      text: span,
      maxLines: 3,
      textDirection: TextDirection.ltr,
    );

    tp.layout(
        maxWidth: MediaQuery.of(context).size.width -
            32); // 16 left + 16 right padding

    setState(() {
      showReadMore = tp.didExceedMaxLines;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
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

          // Details
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Men's Printed Pullover Hoodie",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Nike Club Fleece",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text("Price", style: TextStyle(color: Colors.grey)),
                  const Text("\$99",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),

                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),

                  // Scrollable area for description
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          showReadMore
                              ? ReadMoreText(
                                  fullDescription,
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
                                )
                              : Text(
                                  fullDescription,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Order + Quantity
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "The minimum order for this ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              Text(
                                "product is: $minQuantity",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: quantity > minQuantity
                                    ? () {
                                        setState(() {
                                          quantity--;
                                        });
                                      }
                                    : null,
                                icon: const Icon(Icons.remove_circle_outline),
                              ),
                              Text(
                                quantity.toString(),
                                style: const TextStyle(fontSize: 15),
                              ),
                           IconButton(
  onPressed: () {
    setState(() {
      quantity++;
    });
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
                            // handle add to cart
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
}
