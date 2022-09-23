import 'package:banking/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  final String title;
  final icon;

  const Button({
    Key? key,
    required this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      width: 140,
      height: 50,
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(15),
          boxShadow: themeProvider.isDarkMode ? [
            BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.grey.shade800,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            )
          ] : [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            )
          ]
      ),
      child: MaterialButton(
        onPressed: () {
          print("eee");
        },
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(color: themeProvider.isDarkMode ? Colors.grey : Colors.black),),
              Icon(icon, color: themeProvider.isDarkMode ? Colors.grey : Colors.black,),
            ]
        ),
      ),
    );
  }
}



