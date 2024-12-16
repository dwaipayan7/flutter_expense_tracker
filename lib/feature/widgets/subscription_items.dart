import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/cors/utils/color.dart';

class SubscriptionItems extends StatelessWidget {
  final Map subItems;
  const SubscriptionItems({super.key, required this.subItems});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: (){},
        child: Container(
          height: 70,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: border.withOpacity(0.15),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              Image.asset(
                subItems['icon'],
                height: 40,
                width: 40,
              ),
              SizedBox(width: 10,),
              Expanded(
                  child: Text(
                    subItems['name'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                  ),
              ),
              SizedBox(width: 10,),

              Text(
                "\$${subItems['price']}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
