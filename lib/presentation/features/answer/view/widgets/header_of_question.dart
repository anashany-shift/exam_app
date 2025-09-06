import 'package:flutter/material.dart';

class HeaderOfQuestion extends StatelessWidget {
  const HeaderOfQuestion({
    super.key,
    
  });


  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Column(
      children: [
        Text(
          "Select the correctly punctuated sentence.",
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}

