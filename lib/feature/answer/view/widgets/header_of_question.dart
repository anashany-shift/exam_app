import 'package:flutter/material.dart';

class HeaderOfQuestion extends StatelessWidget {
  const HeaderOfQuestion({
    super.key, required this.header,
    
  });
final String header;

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Column(
      children: [
        Text(
         header,
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}

