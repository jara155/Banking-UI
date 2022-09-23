import 'package:banking/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyCard extends StatelessWidget {
  final String title;
  final desc;
  final String cost;
  final String expiry;
  final button;

  const BuyCard({
    Key? key,
    required this.title,
    this.desc,
    required this.cost,
    required this.expiry,
    this.button,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
        width: 330,
        height: 150,
        decoration: BoxDecoration(
          color: themeProvider.isDarkMode ? Colors.black : Colors.transparent,
          border: Border.all(
              color: Colors.black,
              width: 2
          ),
          borderRadius: BorderRadius.circular(20),
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

          // ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Text(desc, style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.attach_money_rounded),
                  Row(
                    children: [
                      Text(cost, style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.bold,fontSize: 18),),
                      Text(" / $expiry", style: TextStyle(fontSize: 14, fontFamily: "Inter"),),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
