import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticklet_app/base/res/styles/app_styles.dart';

class FindTickets extends StatelessWidget {
  const FindTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Center(
        child: Text(
          "Find Tickets",
          style: AppStyles.textStyle.copyWith(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppStyles.findTicketColor,
      )
    );
  }
}
