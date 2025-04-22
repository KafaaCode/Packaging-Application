import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/dropdown_custom.dart';
import 'package:frip_trading/src/presentation/screens/settings/widgets/customAppbar.dart';
import 'package:frip_trading/src/presentation/screens/settings/widgets/custom_text_feild.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenHeight = mediaQuery.size.height;
    double screenWidth = mediaQuery.size.width;

    return Scaffold(
      body: CustomAppbar(
        tilte: 'Settings',
        icon: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 130, 20, 0),
                height: screenHeight,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ],
                  ),
                ),
              ),
              // profile image
              Positioned(
                left: screenWidth / 2 - 50,
                top: screenHeight / 4 - 143,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.person, size: 60, color: Colors.white),
                    ),
                    Positioned(
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset('assets/SVG/ar-camera.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              // conpany name, name, email, specialization and country feilds with labels text a radius 16px and padding 20px boreder color white and shadow
              Positioned(
                top: screenHeight / 4 - 30,
                left: 20,
                right: 20,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Company Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextFeild(
                        controller: TextEditingController(),
                        labelText: 'Company Name',
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextFeild(
                        controller: TextEditingController(),
                        labelText: 'Name',
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextFeild(
                        controller: TextEditingController(),
                        labelText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Specialization',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      DropdownCustom(
                        labelText: 'Select Country',
                        items: [],
                        defaultValue: null,
                        onChanged: (String? value) {},
                        svgIcon: 'assets/icons/arrow_down.svg',
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Select Country',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      DropdownCustom(
                        labelText: 'Select Country',
                        items: [],
                        defaultValue: null,
                        onChanged: (String? value) {},
                        svgIcon: 'assets/icons/arrow_down.svg',
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: screenHeight / 4 - 75,
                left: screenWidth / 2 - 90,
                child: Image.asset(
                  'assets/images/init_page.png',
                  width: 189,
                  height: 109,
                  filterQuality: FilterQuality.high,
                ),
              ),
              // bottom button with text save
              Positioned(
                bottom: screenHeight / 10 - 15,
                left: screenWidth / 2 - 150,
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
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
