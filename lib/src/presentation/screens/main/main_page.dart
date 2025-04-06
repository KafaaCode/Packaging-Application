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

class ProductDetailsPage extends StatefulWidget {


  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 10;
  final int minQuantity = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            // Header image and icons
            Stack(
              children: [
               Image.asset(
                                 'images/imagesss.jpeg',
                              
                                 fit: BoxFit.cover,
                               ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
           
            // Details Card
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                            
                  ),
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
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Price",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Text(
                        "\$99",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Description",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "The minimum order for this product is: $minQuantity",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            style: const TextStyle(fontSize: 18),
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
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
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
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
