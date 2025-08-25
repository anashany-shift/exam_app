import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return  Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
        
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                  Text(title, style: theme.textTheme.titleLarge),
                ],
              );
  }
}