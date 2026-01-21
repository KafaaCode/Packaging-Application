import 'package:flutter/material.dart';
import 'package:frip_trading/admin/screens/categories/add_category_screen.dart';
import 'package:frip_trading/admin/screens/categories/edit_category_screen.dart';
import 'package:frip_trading/admin/screens/products/products_by_category_screen.dart';
import 'category_controller.dart';
import 'category_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryController _controller = CategoryController();
  late Future<List<CategoryModel>> _futureCategories;

  @override
  void initState() {
    super.initState();
    _futureCategories = _controller.fetchCategories();
  }

  void _navigateToEditScreen(CategoryModel category) async {
    // 🛑 1. نستخدم 'await' على Navigator.push() للحصول على النتيجة
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditCategoryScreen(category: category),
      ),
    );

    // 🛑 2. التحقق من النتيجة المُعادة
    // (result == true) تعني أن عملية التعديل نجحت وتم إرسال 'true' من شاشة التعديل
    if (result == true) {
      // 3. إعادة جلب البيانات لتحديث القائمة
      // 💡 يجب استدعاء الدالة المسؤولة عن جلب الفئات هنا مرة أخرى
      _controller.fetchCategories();
      if (mounted) {
        setState(() {});
      } // استخدم اسم دالة جلب البيانات الخاصة بك
    }
  }

  void _onMenuSelected(String choice, CategoryModel category) async {
    switch (choice) {
      case 'view':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductsByCategoryScreen(
                  categoryId: category.id, categoryName: category.name),
            ));
        print(category.id);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('عرض الفئة: ${category.name}')),
        // );
        break;
      case 'edit':
        _navigateToEditScreen(category);
        break;
      case 'delete':
        await _controller.deleteCategory(category.id);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('حذف الفئة: ${category.name}')),
        );
        setState(() {
          _futureCategories = _controller.fetchCategories();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('جميع الفئات'),
        backgroundColor: const Color(0xFF70b9be),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'إضافة فئة',
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddCategoryScreen()),
              );

              if (result == true) {
                setState(() {
                  _futureCategories =
                      _controller.fetchCategories(); // إعادة تحميل الفئات
                });
              }
            },
          ),
        ],
      ),
      body: FutureBuilder<List<CategoryModel>>(
        future: _futureCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('لا توجد فئات حالياً'));
          }

          final categories = snapshot.data!;

          return RefreshIndicator(
            onRefresh: () async {
              setState(() {
                _futureCategories = _controller.fetchCategories();
              });
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductsByCategoryScreen(
                            categoryId: cat.id,
                            categoryName: cat.name,
                          ),
                        ),
                      );
                    },
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: cat.image != null
                          ? Container(
                              width: 60,
                              height: 60,
                              color: Colors.grey[300],
                              child: Image.network(
                                cat.image!,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                      color: const Color(0xFF70b9be),
                                    ),
                                  );
                                },
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  print(
                                      'Failed to load image for category ${cat.name}: $exception');
                                  return Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.grey[300],
                                    child: const Icon(
                                      Icons.image_not_supported,
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(
                              width: 60,
                              height: 60,
                              color: Colors.grey[300],
                              child: const Icon(Icons.image_not_supported),
                            ),
                    ),
                    title: Text(
                      cat.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (choice) => _onMenuSelected(choice, cat),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'view',
                          child: Text('عرض الفئة'),
                        ),
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text('تعديل'),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('حذف'),
                        ),
                      ],
                      icon: const Icon(Icons.more_vert),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
