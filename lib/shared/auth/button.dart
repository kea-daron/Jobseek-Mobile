import 'package:flutter/material.dart';
import 'package:jobseek/shared/themes.dart';

class ShareButton extends StatelessWidget {
  final String label;
  final Widget link;
  final String? routeName;
  const ShareButton({
    super.key,
    required this.label,
    required this.link,
    this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              settings: routeName != null
                  ? RouteSettings(name: routeName)
                  : null,
              builder: (_) => link,
            ),
          );
        },
        child: Text(label, style: TextStyle(fontSize: AppFonts.body)),
      ),
    );
  }
}
