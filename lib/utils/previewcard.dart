import 'package:flutter/material.dart';

class Transakce {
  String title;
  String date;
  double cost;

  Transakce({
    required this.title,
    required this.date,
    required this.cost,
  });
}

class PreviewCard extends StatelessWidget {
  final String title;
  final date;
  final cost;
  final String icon;
  final widget;

  const PreviewCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.date,
    this.cost,
    this.widget,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: Colors.black12, backgroundImage: AssetImage("assets/imgs/${icon.toLowerCase()}.png"), radius: 24,),

              SizedBox(width: 10,),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontFamily: "Inter", fontSize: 16, fontWeight: FontWeight.w600),),
                    SizedBox(height: 5,),
                    Text(date, style: TextStyle(fontFamily: "Inter", color: Colors.grey),),
                  ]
              ),
            ],
          ),
          if(cost != null)
            Text("\$$cost", style: TextStyle(fontWeight: FontWeight.w700),)
          else
            widget
        ],
      ),
    );
  }
}
