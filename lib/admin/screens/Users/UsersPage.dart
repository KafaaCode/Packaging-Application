import 'package:flutter/material.dart';
import 'package:frip_trading/admin/screens/Users/Add_User_page.dart';
import 'UserModel.dart';
import 'UserService.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late Future<List<UserModel>> futureUsers;
  TextEditingController searchController = TextEditingController();
  String searchTerm = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    setState(() {
      futureUsers = UserService.fetchUsers(search: searchTerm);
    });
  }

  void showUserDetails(UserModel user) {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl, // ✅ لجعل الاتجاه عربي
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          title: Center(
            child: Text(
              'تفاصيل المستخدم',
              style: const TextStyle(
                color: Color(0xFF70b9be),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userInfoRow(Icons.person, 'الاسم', user.name),
              const SizedBox(height: 8),
              userInfoRow(Icons.email, 'البريد الإلكتروني', user.email),
              const SizedBox(height: 8),
              userInfoRow(
                Icons.verified_user,
                'الحالة',
                user.status == 1 ? 'مفعل' : 'غير مفعل',
                iconColor: user.status == 1 ? Colors.green : Colors.red,
              ),
              const SizedBox(height: 8),
              userInfoRow(Icons.calendar_today, 'تاريخ الإنشاء',
                  user.createdAt.split('T')[0]),
            ],
          ),
          actions: [
            Center(
              child: TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Colors.red),
                label: const Text(
                  'إغلاق',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userInfoRow(IconData icon, String label, String value,
      {Color? iconColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor ?? Color(0xFF70b9be), size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: '$label: ',
              style: const TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'قائمة المستخدمين',
                        style: TextStyle(
                          color: Color(0xFF70b9be),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddUserPage(),
                                ));
                          },
                          icon: const Icon(Icons.add,
                              size: 40, color: Color(0xFF70b9be))),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'مرحبا بك في لوحة إدارة المستخدمين',
                      style: TextStyle(color: Color(0xFF70b9be), fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'ابحث بالاسم أو البريد',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onSubmitted: (val) {
                            setState(() {
                              searchTerm = val;
                              fetchData();
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {
                          searchController.clear();
                          searchTerm = '';
                          fetchData();
                        },
                        icon: const Icon(Icons.refresh, color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  FutureBuilder<List<UserModel>>(
                    future: futureUsers,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text("حدث خطأ: ${snapshot.error}"));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text("لا يوجد مستخدمون"));
                      }

                      final users = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: ListTile(
                              title: Text(user.name),
                              subtitle: Text(user.email),
                              trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF70b9be),
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text("عرض التفاصيل",
                                    style: TextStyle(fontSize: 12)),
                                onPressed: () => showUserDetails(user),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
