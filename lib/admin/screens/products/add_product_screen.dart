import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frip_trading/admin/screens/constants.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  final int categoryId;

  const AddProductScreen({super.key, required this.categoryId});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _serialNumberController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _requestNumberController =
      TextEditingController();

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

  Future<void> _submitProduct() async {
    if (!_formKey.currentState!.validate()) return;
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء اختيار صورة')),
      );
      return;
    }

    final uri = Uri.parse('$apiBaseUrl/api/products');

    final request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] = 'Bearer $authToken'
      ..fields['name'] = _nameController.text
      ..fields['serial_number'] = _serialNumberController.text
      ..fields['description'] = _descriptionController.text
      ..fields['price'] = _priceController.text
      ..fields['request_number'] = _requestNumberController.text
      ..fields['category_id'] = widget.categoryId.toString()
      ..fields['active'] = _isActive ? '1' : '0'
      ..files.add(await http.MultipartFile.fromPath('image', _image!.path));

    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ تم إضافة المنتج بنجاح')),
      );
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('❌ فشل في إضافة المنتج')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Add New Product',
          style: TextStyle(color: Color(0xFF70b9be)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Color(0xFF70b9be)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text("Name", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration("Enter name..."),
                validator: (value) =>
                    value!.isEmpty ? 'الرجاء إدخال الاسم' : null,
              ),
              const SizedBox(height: 16),
              const Text("Serial Number", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _serialNumberController,
                decoration: _inputDecoration("Enter serial number"),
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
                decoration: _inputDecoration("Enter number"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              const Text("Description", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _descriptionController,
                decoration: _inputDecoration("Enter description"),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              const Text("Price", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _priceController,
                decoration: _inputDecoration("Enter price"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 6),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text("Active"),
                value: _isActive,
                onChanged: (val) => setState(() => _isActive = val),
                activeColor: const Color(0xFF70b9be),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitProduct,
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
