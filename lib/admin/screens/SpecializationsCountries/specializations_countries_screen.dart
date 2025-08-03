import 'package:flutter/material.dart';
import 'package:frip_trading/admin/screens/SpecializationsCountries/simple_item_controller.dart';
import 'package:frip_trading/admin/screens/SpecializationsCountries/simple_item_model.dart';

class SpecializationsCountriesScreen extends StatefulWidget {
  const SpecializationsCountriesScreen({super.key});

  @override
  State<SpecializationsCountriesScreen> createState() =>
      _SpecializationsCountriesScreenState();
}

class _SpecializationsCountriesScreenState
    extends State<SpecializationsCountriesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _countryController = SimpleItemController(endpoint: 'countries');
  final _specializationController =
      SimpleItemController(endpoint: 'specializations');

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Future<void> _showItemDialog({
    required String title,
    String? initialValue,
    required void Function(String name) onSubmit,
  }) async {
    final controller = TextEditingController(text: initialValue ?? '');
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'الاسم'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء')),
          ElevatedButton(
            onPressed: () {
              onSubmit(controller.text);
              Navigator.pop(context);
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(SimpleItemController controller, int id, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('حذف $title'),
        content: Text('هل أنت متأكد أنك تريد حذف هذا $title؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              // احفظ الـ context محليًا قبل أي pop
              final dialogContext = context;

              try {
                await controller.deleteItem(id);

                if (!mounted) return;

                Navigator.pop(dialogContext); // أغلق الـ Dialog بعد النجاح

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم الحذف بنجاح')),
                );
                setState(() {});
              } catch (e) {
                if (!mounted) return;

                Navigator.pop(dialogContext); // أغلق الـ Dialog بعد الخطأ أيضًا
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('فشل في الحذف: $e')),
                );
              }
            },
            child: const Text('حذف', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildItemTab({
    required String title,
    required SimpleItemController controller,
  }) {
    return FutureBuilder<List<SimpleItemModel>>(
      future: controller.fetchItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('خطأ: ${snapshot.error}'));
        }
        final items = snapshot.data ?? [];

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.name),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'edit') {
                            _showItemDialog(
                              title: 'تعديل $title',
                              initialValue: item.name,
                              onSubmit: (newName) async {
                                await controller.updateItem(item.id, newName);
                                if (!mounted) return;
                                setState(() {});
                              },
                            );
                          } else if (value == 'delete') {
                            _confirmDelete(controller, item.id, title);
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('تعديل'),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('حذف'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => _showItemDialog(
                title: 'إضافة $title',
                onSubmit: (name) async {
                  await controller.addItem(name);
                  setState(() {});
                },
              ),
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                'إضافة',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF70b9be),
              ),
            ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('التخصصات والمناطق'),
        backgroundColor: const Color(0xFF70b9be),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.white,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: 'المناطق'),
            Tab(text: 'التخصصات'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildItemTab(title: 'منطقة', controller: _countryController),
          _buildItemTab(title: 'تخصص', controller: _specializationController),
        ],
      ),
    );
  }
}
