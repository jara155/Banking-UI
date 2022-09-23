import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final String desc;
  final bool allowSwitch;
  final switchButton;

  const DetailCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.desc,
    required this.allowSwitch,
    this.switchButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 4,),
              icon,

              SizedBox(width: 10,),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontFamily: "Inter", fontSize: 10, fontWeight: FontWeight.w600),),
                    SizedBox(height: 5,),
                    Text(desc, style: TextStyle(fontFamily: "Inter", fontSize: 18, fontWeight: FontWeight.bold),),
                  ]
              ),
            ],
          ),
          if(allowSwitch) switchButton,
        ],
      ),
    );
  }
}

