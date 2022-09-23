import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';

import '../main.dart';
import '../utils/limit.dart';
import '../utils/previewcard.dart';

import 'dashboard.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
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
                  Text("TRANSACTIONS", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w700, fontSize: 18),),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/imgs/jr.png"),
                    radius: 20,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 36),
              child: LimitBar(title: 'Transfer limit', icon: Icons.money, limit: "10,000",),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 36.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("History", style: TextStyle(fontFamily: "Inter", fontSize: 13),),
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

            Flexible(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                children: transaction.map((transakce) => PreviewCard(
                  icon: transakce.title,
                  title: transakce.title,
                  date: transakce.date,
                  cost: transakce.cost,
                )).toList(),
              ),
            )

          ],
        ),
      )
    );
  }
}
