import 'dart:ffi';

import 'package:banking/utils/previewcard.dart';
import 'package:banking/utils/buy.dart';
import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:provider/provider.dart';

import '../utils/button.dart';
import '../utils/limit.dart';
import '../utils/theme.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _HomeState();
}

List<Transakce> getTransakce(){
  return [];
}

double transactionCost = 0;

List<Transakce> transaction = [
  Transakce(title: "SHEIN", date: "Sep 18, 2022", cost: 17.99),
  Transakce(title: "Adobe", date: "Sep 17, 2022", cost: 34.99),
  Transakce(title: "Alza", date: "Sep 17, 2022", cost: 12.99),
  Transakce(title: "YouTube", date: "Sep 17, 2022", cost: 9.99),
  Transakce(title: "CZC", date: "Sep 16, 2022", cost: 15.99),
  Transakce(title: "DPD", date: "Sep 11, 2022", cost: 8.99),
  Transakce(title: "CK GANG", date: "Sep 9, 2022", cost: 36.99),
];

class _HomeState extends State<Dashboard> {
  int aktualniIndex = 0;

  void countTransaction() {
    transactionCost = 0;
    for(var transakce in transaction) {
      transactionCost+=transakce.cost;
    }
    print(transactionCost.toInt()/100);
  }

  @override
  Widget build(BuildContext context) {
    countTransaction();
    final themeProvider = Provider.of<ThemeProvider>(context);
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
                  Text("ACCOUNT", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w700, fontSize: 18),),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/imgs/jr.png"),
                    radius: 20,
                  )

                ],
              ),
            ),

            SizedBox(height: 10,),

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

            SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(title: "Send", icon: Icons.attach_money_outlined,),
                SizedBox(width: 15,),
                Button(title: "Deposit", icon: Icons.add_outlined,),
              ],
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 36),
              child: LimitBar(title: 'Transfer limit', icon: Icons.money, limit: "10,000",),
            ),

            const BuyCard(
              title: "Get plus",
              desc: "For everyday, protection for purchases, refunds and more.",
              cost: "2,99",
              expiry: "month",
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Transactions", style: TextStyle(fontFamily: "Inter", fontSize: 13),),
                  Row(
                    children: [
                      Text("\$", style: TextStyle(fontFamily: "Inter", fontSize: 15, fontWeight: FontWeight.w600),),
                      McCountingText(
                        begin: 0,
                        end: transactionCost,
                        precision: 2,
                        duration: Duration(seconds: 1),
                        curve: Curves.linear,
                        style: TextStyle(fontFamily: "Inter", fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )

                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Column(
                  children: [
                    for(var i = 0; i < transaction.length; i++)
                      if(i < 1)
                        PreviewCard(icon: transaction[i].title, title: transaction[i].title, date: transaction[i].date, cost: transaction[i].cost)
                      else if (i == 3)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("More in Transactions", style: TextStyle(fontFamily: "Inter"),),
                            SizedBox(width: 10,),
                            Icon(Icons.arrow_forward_outlined),
                          ],
                        ),
                        SizedBox(height: 10,),
                  ]
              ),
            )


          ],
        ),
      ),
    );
  }
}
