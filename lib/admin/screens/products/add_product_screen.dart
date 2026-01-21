import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frip_trading/admin/screens/constants.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

// ***************************************************************
// NOTE: يرجى التأكد من استبدال هذه المتغيرات والثوابت بالقيم الفعلية في مشروعك
// ***************************************************************
// import 'package:frip_trading/admin/screens/constants.dart'; // افترض وجود apiBaseUrl
// import 'package:frip_trading/core/network/api_constances.dart'; // افترض وجود getToken()

// مثال لـ getToken()
// ***************************************************************

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
  File? _image; // الصورة الرئيسية (Key: 'image')
  final List<File> _additionalImages = []; // قائمة الصور الإضافية (Key: 'images[]')

  // دالة لاختيار صورة رئيسية واحدة فقط
  Future<void> _pickPrimaryImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // دالة لاختيار صور إضافية متعددة
  Future<void> _pickAdditionalImages() async {
    final pickedFiles = await ImagePicker().pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      setState(() {
        // نضيف الصور الجديدة إلى القائمة الإضافية
        _additionalImages.addAll(pickedFiles.map((x) => File(x.path)).toList());
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

    // يمكنك إضافة تحقق: إذا كانت الصورة الرئيسية مطلوبة
    // if (_image == null) { /* Show error */ return; }

    final uri = Uri.parse('$apiBaseUrl/products');
    final token = ApiConstances.getToken();
    var request = http.MultipartRequest('POST', uri);

    // Fields and Headers
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['name'] = _nameController.text;
    request.fields['serial_number'] = _serialNumberController.text;
    request.fields['description'] = _descriptionController.text;
    request.fields['price'] = _priceController.text;
    request.fields['request_number'] = _requestNumberController.text;
    request.fields['category_id'] = widget.categoryId.toString();
    request.fields['active'] = _isActive ? '1' : '0';

    // 1. إرسال الصورة الرئيسية (Key: 'image')
    if (_image != null) {
      request.files
          .add(await http.MultipartFile.fromPath('image', _image!.path));
    }

    // 2. إرسال الصور الإضافية (Key: 'images[]')
    for (var file in _additionalImages) {
      request.files
          .add(await http.MultipartFile.fromPath('images[]', file.path));
    }

    // إرسال الطلب
    var response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ تم إضافة المنتج بنجاح')),
      );
      Navigator.pop(context, true);
    } else {
      final responseBody = await response.stream.bytesToString();
      print('Submission Failed Status: ${response.statusCode}');
      print('Submission Failed Body: $responseBody');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('❌ فشل في إضافة المنتج: الرمز ${response.statusCode}')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _serialNumberController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _requestNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalAdditionalImages = _additionalImages.length;

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
              // Name Field
              const Text("Name", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration("Enter name..."),
                validator: (value) =>
                    value!.isEmpty ? 'الرجاء إدخال الاسم' : null,
              ),
              const SizedBox(height: 16),

              // Serial Number Field
              const Text("Serial Number", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _serialNumberController,
                decoration: _inputDecoration("Enter serial number"),
              ),
              const SizedBox(height: 16),

              // -------------------------------------------------------------
              // 1. حقل الصورة الرئيسية (Key: 'image')
              // -------------------------------------------------------------
              const Text("Image (Primary)", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: _pickPrimaryImage,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6FA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _image != null
                        ? "✔ Primary Image Selected"
                        : "Select Primary Image",
                    style: TextStyle(
                        color: _image != null
                            ? Colors.green.shade700
                            : Colors.grey),
                  ),
                ),
              ),
              // عرض مصغر للصورة الرئيسية
              if (_image != null)
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 20),
                      child: Image.file(_image!,
                          height: 80, width: 80, fit: BoxFit.cover),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        icon: const Icon(Icons.close,
                            color: Colors.red, size: 20),
                        onPressed: () => setState(() => _image = null),
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 16),

              // -------------------------------------------------------------
              // 2. حقل الصور الإضافية (Key: 'images[]')
              // -------------------------------------------------------------
              const Text("صور أخرى (اختياري)", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: _pickAdditionalImages,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6FA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    totalAdditionalImages > 0
                        ? "✔ $totalAdditionalImages Additional Image(s) Selected"
                        : "Select Additional Images (Optional)",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              // عرض مصغرات الصور الإضافية
              if (_additionalImages.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _additionalImages.asMap().entries.map((entry) {
                      int index = entry.key;
                      File file = entry.value;
                      return Stack(
                        children: [
                          Image.file(file,
                              height: 60, width: 60, fit: BoxFit.cover),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: () => setState(
                                  () => _additionalImages.removeAt(index)),
                              child: const Icon(Icons.close,
                                  color: Colors.red, size: 16),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),

              const SizedBox(height: 16),

              // Request Number Field
              const Text("Request Number", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _requestNumberController,
                decoration: _inputDecoration("Enter number"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Description Field
              const Text("Description", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _descriptionController,
                decoration: _inputDecoration("Enter description"),
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              // Price Field
              const Text("Price", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _priceController,
                decoration: _inputDecoration("Enter price"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 6),
              const SizedBox(height: 16),

              // Active Switch
              SwitchListTile(
                title: const Text("Active"),
                value: _isActive,
                onChanged: (val) => setState(() => _isActive = val),
                activeColor: const Color(0xFF70b9be),
              ),

              const SizedBox(height: 20),

              // Save Button
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
