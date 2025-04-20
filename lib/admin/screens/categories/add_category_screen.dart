import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frip_trading/admin/screens/constants.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  File? _imageFile;
  bool _isLoading = false;
  bool _loadingDropdowns = true;

  int? _selectedCountryId;
  int? _selectedSpecializationId;

  List<Map<String, dynamic>> _countries = [];
  List<Map<String, dynamic>> _specializations = [];

  // تحميل البيانات من API
  Future<void> _loadDropdownData() async {
    try {
      final response = await http.get(
          Uri.parse('$apiBaseUrl/api/specialization-and-country'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];

        setState(() {
          _countries = List<Map<String, dynamic>>.from(data['countries']);
          _specializations =
              List<Map<String, dynamic>>.from(data['specializations']);
          _loadingDropdowns = false;
        });
      } else {
        throw Exception('فشل تحميل البيانات');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطأ في تحميل التخصصات والدول: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadDropdownData();
  }

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  Future<void> _submitCategory() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedCountryId == null || _selectedSpecializationId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى اختيار الدولة والتخصص')),
      );
      return;
    }

    setState(() => _isLoading = true);

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$apiBaseUrl/api/categories'),
    );

    request.headers['Authorization'] = 'Bearer $authToken';

    request.fields['name'] = _nameController.text;
    request.fields['country_id'] = _selectedCountryId.toString();
    request.fields['specialization_id'] = _selectedSpecializationId.toString();
    request.fields['active'] = '1';

    if (_imageFile != null) {
      request.files
          .add(await http.MultipartFile.fromPath('image', _imageFile!.path));
    }

    var response = await request.send();

    setState(() => _isLoading = false);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.pop(context, true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تمت إضافة الفئة بنجاح')),
      );
    } else {
      final resBody = await response.stream.bytesToString();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل الإضافة: $resBody')),
      );
    }
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          validator: (value) => value!.isEmpty ? 'الرجاء إدخال $label' : null,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFFF6F6F6),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String hint,
    required List<Map<String, dynamic>> items,
    required int? selectedValue,
    required void Function(int?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 6),
        DropdownButtonFormField<int>(
          value: selectedValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF6F6F6),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          hint: Text(hint),
          items: items
              .map((item) => DropdownMenuItem<int>(
                    value: item['id'],
                    child: Text(item['name']),
                  ))
              .toList(),
          onChanged: onChanged,
          validator: (value) => value == null ? 'يرجى اختيار $label' : null,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Image',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _imageFile == null ? 'Select Image' : 'Image Selected',
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Add New Category',
          style: TextStyle(
            color: Color(0xFF70b9be),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: _loadingDropdowns
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField(
                      label: 'Name',
                      hint: 'Enter category name...',
                      controller: _nameController,
                    ),
                    _buildImagePicker(),
                    _buildDropdown(
                      label: 'Specialization',
                      hint: 'Select specialization',
                      items: _specializations,
                      selectedValue: _selectedSpecializationId,
                      onChanged: (value) =>
                          setState(() => _selectedSpecializationId = value),
                    ),
                    _buildDropdown(
                      label: 'Country',
                      hint: 'Select country',
                      items: _countries,
                      selectedValue: _selectedCountryId,
                      onChanged: (value) =>
                          setState(() => _selectedCountryId = value),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _submitCategory,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF70b9be),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                'Save',
                                style: TextStyle(fontSize: 16,color: Colors.white),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
