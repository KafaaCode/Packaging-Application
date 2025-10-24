import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frip_trading/admin/screens/categories/categories_page.dart';
import 'package:frip_trading/admin/screens/categories/category_controller.dart';
import 'package:frip_trading/admin/screens/categories/category_model.dart';
import 'package:image_picker/image_picker.dart';

class EditCategoryScreen extends StatefulWidget {
  final CategoryModel category;
  const EditCategoryScreen({super.key, required this.category});

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  TextEditingController categoryNameController = TextEditingController();
  CategoryController controller = CategoryController();
  File? _newImageFile;
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _newImageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF70b9be),
        title: Text(widget.category.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(20),
                        child: _newImageFile != null
                            ? Image.file(_newImageFile!, fit: BoxFit.cover)
                            : widget.category.image != null
                                ? Image.network(
                                    widget.category.image!,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Center(
                                                child: Icon(
                                                    Icons.image_not_supported,
                                                    size: 50)),
                                  )
                                : const Center(
                                    child: Icon(Icons.image, size: 50),
                                  )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: _pickImage,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF70b9be),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              TextField(
                controller: categoryNameController,
                decoration: InputDecoration(
                    labelText: 'اسم الفئة',
                    labelStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: const Color(0xFFF5F6FA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'اسم الفئة'),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () async {
                    print(widget.category.id);
                    await controller.editCategory(
                      categoryId: widget.category.id,
                      categoryName: categoryNameController.text,
                      image: _newImageFile,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تم تعديل بنجاح')));
                    Navigator.pop(context, true);
                  },
                  child: const Text('حفظ'))
            ],
          ),
        ),
      ),
    );
  }
}
