import 'package:banking/utils/theme.dart';
import 'package:flutter/material.dart';

import 'package:banking/pages/dashboard.dart';
import 'package:provider/provider.dart';

class LimitBar extends StatelessWidget {
  final String title;
  final icon;
  final String limit;


  const LimitBar({
    Key? key,
    required this.title,
    this.icon,
    required this.limit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                SizedBox(width: 7,),
                Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
              ],
            ),
            Text("\$10,000"),
          ],
        ),
        SizedBox(height: 10,),
        TweenAnimationBuilder<double>(
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
          tween: Tween<double>(
            begin: 0,
            end: transactionCost.toInt()/10000,
          ),
          builder: (context, value, _) =>
              LinearProgressIndicator(
                value: value,
                color: Colors.red,
                backgroundColor: themeProvider.isDarkMode ? Color(0xFF373737) : Colors.grey.shade300,
                minHeight: 8,
              ),
        ),
      ],
    );
  }
}
