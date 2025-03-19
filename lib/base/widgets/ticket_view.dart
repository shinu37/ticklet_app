import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticklet_app/base/res/styles/app_styles.dart';
import 'package:ticklet_app/base/widgets/app_column_text_layout.dart';
import 'package:ticklet_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticklet_app/base/widgets/big_circle.dart';
import 'package:ticklet_app/base/widgets/big_dot.dart';
import 'package:ticklet_app/base/widgets/text_style_fourth.dart';
import 'package:ticklet_app/base/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView(
      {super.key,
      required this.ticket,
      this.wholeScreen = false,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width * 0.85,
        height: 189,
        child: Container(
          margin: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: [
              //blue part of the ticket
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isColor == null
                      ? AppStyles.ticketBlue
                      : AppStyles.ticketColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21)),
                ),
                child: Column(
                  children: [
                    //show departure and destination with icons first line
                    Row(
                      children: [
                        TextStyleThird(
                          text: ticket["from"]["code"],
                          isColor: isColor,
                        ),
                        Expanded(child: Container()),
                        BigDot(
                          isColor: isColor,
                        ),
                        Expanded(
                            child: Stack(
                          children: [
                            const SizedBox(
                                height: 24,
                                child: AppLayoutBuilderWidget(
                                  randomDivider: 6,
                                )),
                            Center(
                                child: Transform.rotate(
                                    angle: 1.5,
                                    child: Icon(Icons.local_airport_rounded,
                                        color: isColor == null
                                            ? Colors.white
                                            : AppStyles.planeSecondColor)))
                          ],
                        )),
                        BigDot(isColor: isColor,),
                        Expanded(child: Container()),
                        TextStyleThird(
                          text: ticket["to"]["code"],
                          isColor : isColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    //show departure and destination with time

                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextStyleFourth(
                            text: ticket["from"]["name"],
                            isColor : isColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        TextStyleFourth(
                          text: ticket["flying_time"],
                          isColor : isColor,
                        ),
                        Expanded(child: Container()),
                        SizedBox(
                          width: 100,
                          child: TextStyleFourth(
                              text: ticket["to"]["name"],
                              isColor : isColor,
                              align: TextAlign.end),
                        )
                      ],
                    )
                  ],
                ),
              ),
              //circles and dots
              Container(
                height: 20,
                color: isColor==null?
                AppStyles.ticketOrange: AppStyles.ticketColor,
                child: Row(
                  children: [
                    BigCircle(
                      isRight: false,
                      isColor: isColor,
                    ),
                     Expanded(
                        child: AppLayoutBuilderWidget(
                      randomDivider: 16,
                      width: 6,
                          isColor: isColor,
                    )),
                    BigCircle(
                      isRight: true,
                      isColor: isColor,
                    ),
                  ],
                ),
              ),
              //red part of the ticket
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isColor== null? AppStyles.ticketOrange: AppStyles.ticketColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isColor==null? 21:0),
                      bottomRight: Radius.circular(isColor==null? 21:0)),
                ),
                child: Column(
                  children: [
                    //show departure and destination with icons first line
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: ticket["date"],
                          bottomText: "DATE",
                          alignment: CrossAxisAlignment.start,
                          isColor: isColor,
                        ),
                        AppColumnTextLayout(
                          topText: ticket["departure_time"],
                          bottomText: "Departure Time",
                          alignment: CrossAxisAlignment.center,
                          isColor: isColor,
                        ),
                        AppColumnTextLayout(
                          topText: ticket["number"].toString(),
                          bottomText: "Number",
                          alignment: CrossAxisAlignment.end,
                          isColor: isColor,
                        ),

                        /*Expanded(child: Container()),
                        Text(
                          "08:00 AM",
                          style:
                          AppStyles.headLineStyle3.copyWith(color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "23",
                          style:
                          AppStyles.headLineStyle3.copyWith(color: Colors.white),
                        )*/
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    //show departure and destination with time

                    /*Row(
                      children: [
                        Text(
                          "Date",
                          style:
                          AppStyles.headLineStyle3.copyWith(color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "Departure Time",
                          style:
                          AppStyles.headLineStyle3.copyWith(color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "Number",
                          style:
                          AppStyles.headLineStyle3.copyWith(color: Colors.white),
                        )
                      ],
                    )*/
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
