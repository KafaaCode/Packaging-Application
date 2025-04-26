import 'package:flutter/material.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';

class SettingsDialogs {
  static void aboutUs(BuildContext context) {
    Lang lang = Lang.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(lang.aboutUs),
        content: const Text('This is the about us dialog.'),
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
     Lang lang = Lang.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text(lang.privacyPolicy),
        content: const Text('This is the privacy policy dialog.'),
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