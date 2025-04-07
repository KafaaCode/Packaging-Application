/* import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

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
                       Text('User Name',style: TextStyle(color: Color(0xFF70b9be),fontWeight: FontWeight.bold,fontSize: 30
),),
              SvgPicture.asset(
  'images/Group940.svg',
  height: 50,
),
        
              ],),

SizedBox(height: 10,),

              Center(
                child: const Text(
                  'Welcome to Frip Trading',
                  style: TextStyle(
                    color: Color(0xFF70b9be),
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(children: [
                
          Expanded(
            child:
TextField(
                  
                                style: const TextStyle(fontSize: 14),
                                textAlignVertical: TextAlignVertical.center,
                              
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                filled: true,
    
    fillColor: Color(0xFFF5F6FA),
                                hintStyle: const TextStyle(color: Colors.grey,fontSize: 13),
                               prefixIcon: const Icon(Icons.search ,color: Color(0xFFBDC1C8),),
                                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 30,
                        minHeight: 40,
                      ),
                              
                           
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                 
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                    isDense: true
                              ),
                            ),

          ),
              const SizedBox(width: 8),
            
            Container(
  width: 50,
  height: 40,
  decoration: BoxDecoration(
    color: Color(0xFF70b9be),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Center(
    child: Image.asset(
      'images/FontAwesomeIcons.png',
      width: 25,
      height: 25,
      fit: BoxFit.contain,
    ),
  ),
)
,
              ],),
    
            
              const SizedBox(height: 16),
        
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Product categories',
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
                      children: List.generate(   10,(i)
                      {
                               return SizedBox(
                                 width: MediaQuery.of(context).size.width > 971
                                        ? MediaQuery.of(context).size.width * 0.31
                                        : MediaQuery.of(context).size.width > 800
                                            ? MediaQuery.of(context).size.width *
                                                0.47
                                            : MediaQuery.of(context).size.width >
                                                    621
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.30
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.43,
                                 child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                 'images/Rectangle569.png',
                              
                                 fit: BoxFit.cover,
                               ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                               'Product Name sample data',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                               );
                      }
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.support), label: 'Support'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

 */
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

    tp.layout(maxWidth: MediaQuery.of(context).size.width - 32); // 16 left + 16 right padding

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
                      icon: const Icon(Icons.arrow_back ,color: Color(0xFF70b9be),),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child:     SvgPicture.asset(
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
                                  style:
                                      const TextStyle(color: Colors.grey),
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
                                  style:
                                      const TextStyle(color: Colors.grey),
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
                                style:
                                    const TextStyle(fontWeight: FontWeight.bold),
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
                                icon: const Icon(Icons.add_circle_outline),
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
