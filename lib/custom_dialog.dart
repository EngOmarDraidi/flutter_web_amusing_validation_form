import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'Success',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: CircleAvatar(
        backgroundColor: Colors.green,
        radius: 45,
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(
              45,
            ),
          ),
          child: Icon(
            Icons.check,
            size: 50,
          ),
        ),
      ),
    );
  }
}
