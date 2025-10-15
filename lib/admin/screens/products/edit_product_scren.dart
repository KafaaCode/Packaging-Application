import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frip_trading/admin/screens/categories/categories_page.dart';
import 'package:frip_trading/admin/screens/constants.dart';
import 'package:frip_trading/admin/screens/products/product_controller.dart';
import 'package:frip_trading/admin/screens/products/product_model.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:frip_trading/src/presentation/screens/main/products.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class EditProductScren extends StatefulWidget {
  final ProductModel product;
  const EditProductScren({super.key, required this.product});

  @override
  State<EditProductScren> createState() => _EditProductScrenState();
}

class _EditProductScrenState extends State<EditProductScren> {
  bool _isActive = true;
  File? _image;
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _serialNumberController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _requestNumberController =
      TextEditingController();
  ProductController controller = ProductController();
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: const Color(0xFFF5F6FA),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Product',
            style: TextStyle(color: Color(0xFF70b9be))),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Color(0xFF70b9be)),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text('Name', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration(widget.product.name),
                validator: (value) =>
                    value!.isEmpty ? 'الرجاء إدخال الاسم' : null,
              ),
              const SizedBox(height: 16),
              const Text("Serial Number", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _serialNumberController,
                decoration: _inputDecoration(widget.product.serialNumber),
              ),
              const SizedBox(height: 16),
              const Text("Image", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6FA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _image != null ? "✔ Image Selected" : "Select Image",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Request Number", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _requestNumberController,
                decoration:
                    _inputDecoration(widget.product.requestNumber.toString()),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              const Text("Description", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _descriptionController,
                decoration: _inputDecoration(widget.product.description),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              const Text("Price", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _priceController,
                decoration: _inputDecoration(widget.product.price.toString()),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 6),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text("Active"),
                value: widget.product.active,
                onChanged: (val) => setState(() => _isActive = val),
                activeColor: const Color(0xFF70b9be),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    final bool success = await controller.editProduct(
                      productId: widget.product.id,
                      description: _descriptionController.text,
                      imageFile: _image,
                      name: _nameController.text,
                      price: _priceController.text,
                      serialNumber: _serialNumberController.text,
                    );
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('تم التعديل بنجاح')));
                      Navigator.pop(context, true);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF70b9be),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Save",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
