import 'package:flutter/material.dart';

Future<void> displayLoadingDialog(BuildContext context) async {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Row(
            children: [
              const CircularProgressIndicator(strokeWidth: 5,),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text("Loading...", style: TextStyle(
                  color: Colors.black,
                ),),
              ),
            ],
          ),
        );
      });
}