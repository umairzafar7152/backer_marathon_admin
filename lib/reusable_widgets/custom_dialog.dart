import 'package:flutter/material.dart';

Future<void> displayDialog(BuildContext context,String title, String content) async {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor:
          Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          content: Text(
            content,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text('OK',style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),),
            ),
          ],
        );
      });
}