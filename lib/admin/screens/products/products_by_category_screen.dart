import 'package:flutter/material.dart';
import 'package:frip_trading/admin/screens/products/add_product_screen.dart';
import 'package:frip_trading/admin/screens/products/edit_product_scren.dart';
import 'package:frip_trading/admin/screens/products/product_detail_screen.dart';
import 'product_controller.dart';
import 'product_model.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  final int categoryId;
  final String categoryName;

  const ProductsByCategoryScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  State<ProductsByCategoryScreen> createState() =>
      _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  final ProductController _controller = ProductController();
  late Future<List<ProductModel>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = _controller.fetchProductsByCategory(widget.categoryId);
  }

  void _confirmDelete(int productId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: const Text('هل أنت متأكد أنك تريد حذف هذا المنتج؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteProduct(productId);
            },
            child: const Text('نعم، حذف'),
          ),
        ],
      ),
    );
  }

  void _deleteProduct(int productId) async {
    await _controller.deleteProduct(produtId: productId);
    // هنا تضيف منطق الحذف الحقيقي إذا رغبت
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('🚮 تم حذف المنتج رقم $productId ')),
    );

    // إعادة تحميل المنتجات بعد الحذف
    setState(() {
      _futureProducts = _controller.fetchProductsByCategory(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('منتجات ${widget.categoryName}'),
        backgroundColor: const Color(0xFF70b9be),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'إضافة منتج',
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddProductScreen(categoryId: widget.categoryId),
                ),
              );

              if (result == true) {
                setState(() {
                  _futureProducts =
                      _controller.fetchProductsByCategory(widget.categoryId);
                });
              }
            },
          ),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            final errorMessage = snapshot.error.toString();
            if (errorMessage.contains('لا يوجد منتجات')) {
              return const Center(child: Text('لا توجد منتجات في هذه الفئة'));
            } else {
              return Center(child: Text('حدث خطأ: $errorMessage'));
            }
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('لا توجد منتجات في هذه الفئة'));
          }

          final products = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              // final imageUrl = product['image'] ?? '';
              final product = products[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailScreen(product: product),
                    )),
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: product.image.isNotEmpty
                          ? Image.network(
                              product.image,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/logo.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                );
                              },
                            )
                          : Image.asset(
                              'assets/images/logo.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                    ),
                    title: Text(product.name),
                    subtitle:
                        Text('السعر: ${product.price.toStringAsFixed(2)} '),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'edit') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditProductScren(product: product),
                              ));
                          // هنا يمكن إضافة التنقل إلى صفحة تعديل المنتج لاحقًا
                        } else if (value == 'delete') {
                          _confirmDelete(product.id);
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text('تعديل'),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('حذف'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
