import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticklet_app/base/res/media.dart';
import 'package:ticklet_app/base/res/styles/app_styles.dart';
import 'package:ticklet_app/base/utils/app_routes.dart';
import 'package:ticklet_app/base/widgets/app_double_text.dart';
import 'package:ticklet_app/base/widgets/ticket_view.dart';

import '../base/utils/app_json.dart';
import 'home/widgets/hotel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyles.bgColor,
        body: ListView(
          children: [
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Good morning", style: AppStyles.headLineStyle3),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Book Ticket", style: AppStyles.headLineStyle1)
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(AppMedia.logo))),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF4F6FD),
                    ),
                    child: const Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          FluentSystemIcons.ic_fluent_search_regular,
                          color: Color(0xFFBFC205),
                        ),
                        Text("Search")
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AppDoubleText(
              bigText: '   Upcoming Flights',
              smallText: 'View All  ',
              func: () => Navigator.pushNamed(context, "/all_tickets"),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ticketList
                      .map((singleTicket) => TicketView(ticket: singleTicket))
                      .toList(),
                )),
            const SizedBox(
              height: 40,
            ),
            AppDoubleText(
              bigText: '   Hotels',
              smallText: 'View All  ',
              func: () {
                Navigator.pushNamed(context, AppRoutes.allHotels);
              },
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: hotelList
                      .map((singleHotel) => Hotel(hotel: singleHotel))
                      .toList(),
                )
            )
          ],
        ));
  }
}
