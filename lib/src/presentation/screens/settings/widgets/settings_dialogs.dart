import 'package:flutter/material.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';

class SettingsDialogs {
  static void aboutUs(BuildContext context) {
    Lang lang = Lang.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(lang.aboutUs),
        content: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            child: const Text(
              'نحن Frip Trading، شركة رائدة ومتخصصة في مجالات التجارة والتغليف.\n\n'
              'تتمثل مهمتنا الأساسية في قيادة أنشطة التجارة الإلكترونية بالجملة، حيث نعمل على تسهيل العمليات التجارية '
              'وتوفير مجموعة واسعة من المنتجات عالية الجودة لشركائنا وعملائنا من الشركات.\n\n'
              'نلتزم بتطبيق أحدث ممارسات التغليف لضمان وصول البضائع بحالة ممتازة، '
              'ونبني شراكاتنا على الكفاءة، الجودة، والموثوقية العالية في جميع مراحل سلسلة التوريد.',
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(lang.close),
          ),
        ],
      ),
    );
  }

  static void privacyPolicy(BuildContext context) {
    const String _privacyPolicyContent = '''
This Privacy Policy governs the manner in which our application collects, uses, maintains, and discloses information collected from users (each, a "User") of the app.

---

1. Information Collection
We may collect personal information such as name, email, phone number, and address to process orders, provide customer support, and improve the overall user experience.

2. Use of Information
The collected information is primarily used to process your orders, improve our services, and deliver relevant promotions and offers.

3. Information Sharing
Your personal data will only be shared if required by law or when necessary to provide our services. We never sell your information to third parties.

4. Information Protection
We use industry-standard security measures, including encryption and security protocols, to ensure the protection and integrity of your data.

5. User Rights
You have the right to access, correct, or delete your personal data. You may exercise these rights upon request.

6. Cookies
Our app or associated website uses cookies to enhance and personalize your experience. You can manage or disable cookies in your browser settings if you prefer.

7. Children's Privacy
Our services are not directed to children under 13, and we do not knowingly collect data from them.

8. Changes to This Policy
We may update our privacy policy from time to time. The latest updates will always be posted on this page, and we encourage you to review it periodically.

9. Contact Us
For any questions regarding this Privacy Policy, you can reach us at: support@yourapp.com
''';
    Lang lang = Lang.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(lang.privacyPolicy),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Directionality(
                textDirection: TextDirection.ltr,
                child: Text(_privacyPolicyContent)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(lang.close),
          ),
        ],
      ),
    );
  }

  static void termsAndConditions(BuildContext context) {
    Lang lang = Lang.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(lang.termsAndConditions),
        content: const Text('This is the terms and conditions dialog.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(lang.close),
          ),
        ],
      ),
    );
  }
}
