// product_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frip_trading/admin/screens/products/product_model.dart'; // تأكد من المسار الصحيح

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // 1. تحديد قائمة الروابط لعرضها في الكاروسيل
    List<String> imageUrls = [];

    // إذا كانت images[] موجودة وغير فارغة، نستخدمها
    if (product.images != null && product.images!.isNotEmpty) {
      imageUrls = product.images!;
    } else {
      // إذا كانت images[] فارغة/مفقودة، نستخدم فقط الصورة الرئيسية
      imageUrls = [product.image];
    }

    // إزالة أي روابط فارغة أو null من القائمة للتأكد من سلامة العرض
    imageUrls.removeWhere((url) => url.isEmpty);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: const Color(0xFF70b9be),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------------------------------------------
            // 🖼️ كاروسيل الصور (Images Slider)
            // -------------------------------------------------------------
            if (imageUrls.isNotEmpty)
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: imageUrls.length >
                      1, // تشغيل تلقائي إذا كانت هناك أكثر من صورة
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
                items: imageUrls.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                  child: Icon(Icons.broken_image,
                                      size: 50, color: Colors.grey));
                            },
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              )
            else
              // في حالة عدم وجود أي صور (حتى الصورة الرئيسية مفقودة)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text('لا تتوفر صور لهذا المنتج'),
                ),
              ),

            const SizedBox(height: 24),

            // -------------------------------------------------------------
            // 📝 تفاصيل المنتج
            // -------------------------------------------------------------
            Text(
              product.name,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF70b9be)),
            ),
            const SizedBox(height: 8),
            Text(
              'السعر: ${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const Divider(height: 32),

            const Text(
              'الوصف:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              product.description.isEmpty
                  ? 'لا يوجد وصف متاح.'
                  : product.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),
            Text('الرقم التسلسلي: ${product.serialNumber}',
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
            Text('رقم الطلب: ${product.requestNumber ?? 'غير محدد'}',
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
            Text('الحالة: ${product.active ? 'نشط' : 'غير نشط'}',
                style: TextStyle(
                    fontSize: 14,
                    color: product.active ? Colors.green : Colors.red)),
          ],
        ),
      ),
    );
  }
}
