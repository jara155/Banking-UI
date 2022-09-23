import 'package:banking/utils/button.dart';
import 'package:banking/utils/changenightmode.dart';
import 'package:banking/utils/detailcard.dart';
import 'package:banking/utils/previewcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../main.dart';
import '../utils/buy.dart';
import '../utils/theme.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ChatState();
}

class _ChatState extends State<Profile> {
  int aktualniIndex = 0;

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 73,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/imgs/jr.png"),
                      radius: 70,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("Jaroslav Matějný", style: TextStyle(fontFamily: "Inter", fontSize: 18, fontWeight: FontWeight.bold),),
                ],
              ),
            ),

            SizedBox(height: 15,),

            Button(title: "Subscribe", icon: Icons.attach_money_outlined,),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Align(alignment: Alignment.bottomLeft, child: Text("Details", style: TextStyle(fontFamily: "Inter", fontSize: 18, fontWeight: FontWeight.bold))),
            ),

            SizedBox(height: 10,),

            Container(
              width: 330,
              height: 180,
              child: PageView(
                  controller: _controller,
                  children: [
                    Column(
                      children: [
                        DetailCard(icon: Icon(Icons.account_balance_outlined, size: 24), title: "Name of the Bank:", desc: "Air Bank", allowSwitch: false,),
                        DetailCard(icon: Icon(Icons.perm_contact_cal_outlined, size: 24), title: "Name:", desc: "Jaroslav Matějný", allowSwitch: false,),
                        DetailCard(icon: Icon(Icons.numbers_outlined, size: 24), title: "Name of the Bank:", desc: "10345564475611412", allowSwitch: false,),
                      ],
                    ),
                    Column(
                      children: [
                        DetailCard(icon: Icon(Icons.account_balance_outlined, size: 24), title: "Name of the Bank:", desc: "Air Bank", allowSwitch: false,),
                        DetailCard(icon: Icon(Icons.perm_contact_cal_outlined, size: 24), title: "Name:", desc: "Jaroslav Matějný", allowSwitch: false,),
                        DetailCard(icon: Icon(Icons.numbers_outlined, size: 24), title: "Name of the Bank:", desc: "10345564475611412", allowSwitch: false,),
                      ],
                    ),
                    Column(
                      children: [
                        DetailCard(icon: Icon(Icons.account_balance_outlined, size: 24), title: "Name of the Bank:", desc: "Air Bank", allowSwitch: false,),
                        DetailCard(icon: Icon(Icons.perm_contact_cal_outlined, size: 24), title: "Name:", desc: "Jaroslav Matějný", allowSwitch: false,),
                        DetailCard(icon: Icon(Icons.numbers_outlined, size: 24), title: "Name of the Bank:", desc: "10345564475611412", allowSwitch: false,),
                      ],
                    ),
                  ]
              ),
            ),


            SizedBox(height: 20,),

            SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(activeDotColor: Colors.red),
            ),

            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Align(alignment: Alignment.bottomLeft, child: Text("Settings", style: TextStyle(fontFamily: "Inter", fontSize: 18, fontWeight: FontWeight.bold))),
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  DetailCard(
                      icon: Icon(Icons.dark_mode),
                      title: "Dark Mode",
                      desc: "",
                      allowSwitch: true,
                      switchButton: ChangeNightMode(),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
