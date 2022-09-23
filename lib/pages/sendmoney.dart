import 'package:banking/utils/previewcard.dart';
import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';

import '../main.dart';
import '../utils/button.dart';
import '../utils/detailcard.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  State<SendMoney> createState() => _StocksState();
}

class _StocksState extends State<SendMoney> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.account_balance_rounded),
                  Text("SEND", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w700, fontSize: 18),),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/imgs/jr.png"),
                    radius: 20,
                  )

                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("\$", style: TextStyle(fontFamily: "Inter", letterSpacing: 2, fontWeight: FontWeight.w600, fontSize: 50),),
                McCountingText(
                  begin: 0,
                  end: 6.230,
                  precision: 3,
                  style: TextStyle(fontFamily: "Inter", letterSpacing: 2, fontWeight: FontWeight.bold, fontSize: 50),
                  duration: Duration(seconds: 3),
                  curve: Curves.fastLinearToSlowEaseIn,
                ),
              ],
            ),
            SizedBox(height: 7,),
            Text("Available on your card", style: TextStyle(fontFamily: "Inter"),),

            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(title: 'Same', icon: Icons.account_balance_outlined,),
                SizedBox(width: 15,),
                Button(title: 'Different', icon: Icons.account_balance_sharp,),
              ],
            ),

            SizedBox(height: 25,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent accounts", style: TextStyle(fontFamily: "Inter", fontSize: 13),),
                ],
              ),
            ),

            Flexible(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 38),
                children: [
                  PreviewCard(
                    icon: "adobe",
                    title: "David Procházka",
                    date: "152351664787820",
                    widget: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_outlined, size: 18,),),
                  ),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
