import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/cors/utils/color.dart';
import 'package:flutter_expense_tracker/feature/models/bill_model.dart';
import 'package:flutter_expense_tracker/feature/models/subscription_model.dart';
import 'package:flutter_expense_tracker/feature/widgets/custom_arc_painter.dart';
import 'package:flutter_expense_tracker/feature/widgets/subscription_items.dart';

import '../widgets/upcoming_bill_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSubscription = true;

  @override
  Widget build(BuildContext context) {
    final items = isSubscription ? subscriptions : bills;

    return Scaffold(
      backgroundColor: gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(context),
            subscriptionAndBill(),
            ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  if (isSubscription) {
                    final yourSub = items[index] as Subscription;
                    return SubscriptionItems(subItems: {
                      "name": yourSub.name,
                      "icon": yourSub.icon,
                      "price": yourSub.price,
                    });
                  }else{
                    final bill  = items[index] as Bill;
                    return UpcomingBillItems(
                      subItems: {
                        "name": bill.name,
                        "price":bill.price
                      },
                    );
                  }
                }),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }

  Container subscriptionAndBill() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(8),
      height: 58,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
              child: segmentButton(
                  isActive: isSubscription,
                  title: "Your Subscription",
                  onPressed: () {
                    setState(() {
                      isSubscription = true;
                    });
                  })),
          Expanded(
              child: segmentButton(
                  isActive: !isSubscription,
                  title: "Upcoming Bills",
                  onPressed: () {
                    setState(() {
                      isSubscription = false;
                    });
                  })),

        ],
      ),
    );
  }

  InkWell segmentButton({onPressed, required bool isActive, title}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                border: Border.all(color: border.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(13))
            : null,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.white : gray30,
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Stack currentStatusButton({title, value, statusColor}) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: border.withOpacity(0.15),
            ),
            color: gray60.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 12, color: gray40, fontWeight: FontWeight.w600),
              ),
              Text(
                value,
                style: TextStyle(
                    fontSize: 14, color: gray40, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
          width: 65,
          height: 1.5,
          color: statusColor,
        )
      ],
    );
  }

  Widget header(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: width * 1.1,
      decoration: BoxDecoration(
        color: gray70.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/img/home_bg.png"),
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.only(
                  bottom: width * 0.05,
                ),
                width: width * 0.72,
                height: height * 0.72,
                child: CustomPaint(
                  painter: CustomArcPainter(end: 216),
                ),
              ),
              Positioned(
                  right: -25,
                  top: 40,
                  child: Icon(
                    Icons.settings_outlined,
                    color: Colors.white54,
                    size: 32,
                  )),
              Column(
                children: [
                  SizedBox(
                    height: width * 0.3,
                  ),
                  Image.asset(
                    "assets/img/app_logo.png",
                    width: width * 0.25,
                  ),
                  SizedBox(
                    height: width * 0.07,
                  ),
                  Text(
                    "\$1,222",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: width * 0.055,
                  ),
                  Text(
                    "This month bills",
                    style: TextStyle(
                        fontSize: 12,
                        color: gray40,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: width * 0.07,
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: border.withOpacity(0.15),
                        ),
                        color: gray60,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "See Your Budget",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: currentStatusButton(
                              title: "Active",
                              value: "\$2.19",
                              statusColor: secondary),
                        ),
                        Expanded(
                          child: currentStatusButton(
                              title: "Highest",
                              value: "\$19.99",
                              statusColor: primary10),
                        ),
                        Expanded(
                          child: currentStatusButton(
                              title: "Lowest",
                              value: "\$5.12",
                              statusColor: secondaryG),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
