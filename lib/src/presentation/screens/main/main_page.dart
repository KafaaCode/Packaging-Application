import 'package:flutter/material.dart';
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
            child: TextField(
  decoration: InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
    hintText: 'Search...',
    hintStyle: TextStyle(color: Color(0xFFBDC1C8)), // تغيير لون النص هنا
    prefixIcon: const Icon(Icons.search ,color: Color(0xFFBDC1C8),),
    filled: true,
    
    fillColor: Color(0xFFF5F6FA),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  ),
)

          ),
              const SizedBox(width: 8),
              // هنا الصورة اللي تبيها
            Container(
  width: 50,
  height: 40,
  decoration: BoxDecoration(
    color: Color(0xFF70b9be), // لون الخلفية (تقدر تغيره أو تشيله)
    borderRadius: BorderRadius.circular(10), // زوايا دائرية
  ),
  child: Center(
    child: Image.asset(
      'images/FontAwesomeIcons.png', // غيّر المسار حسب صورتك
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
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
  'images/Rectangle569.png',
  height: 150,
  width: 150,
  fit: BoxFit.cover,
),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                         'Product Name',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    );
                  },
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

