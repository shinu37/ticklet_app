import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticklet_app/base/res/styles/app_styles.dart';
import 'package:ticklet_app/base/utils/app_json.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index=0;

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    // TODO: implement didChangeDependencies
    index = args["index"];
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: ()
                {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppStyles.primaryColor
                  ),
                  child: const Icon(Icons.arrow_back,
                  color: Colors.white,),
                ),
              ),
            ),
            floating: false,
            pinned: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Positioned.fill(child: Image.asset("assets/images/${hotelList[index]["image"]}",
                    fit: BoxFit.cover,)
                  ),
                  Positioned(
                    bottom:20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      color: Colors.black.withOpacity(0.3),
                        child: Text(
                            hotelList[index]["place"],
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: AppStyles.primaryColor,
                              offset: Offset(2.0,2.0)
                            )
                          ]
                        ),)),
                  )
                ],
              ),
            ),

          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              const Padding(padding: EdgeInsets.all(16.0),
                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been"
                    " the industry's standard dummy text ever since the 1500s, when an unk"
                    "nown printer took a galley of type and scrambled it to make a type specime"
                    "n book. It has survived not only five centuries, but also the leap into elec"
                    "tronic typesetting, remaining essentially unchanged. It was popularised in "
                    "the 1960s with the release of Letraset sheets containing Lorem Ipsum passag"
                    "es, and more recently with desktop publishing software like Aldus PageMake"
                    "r including versions of Lorem Ipsum.")),
              const Padding(padding: EdgeInsets.all(16.0),
                  child: Text("More Images",
                  style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold,
                  ),
                  )),
              Container(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: 10 ,
                    itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.all(16),
                      color: Colors.red,
                      child: Image.network("https://via.placeholder.com/200x200"));
                }),
              )
            ]
          ))
        ],
      ),
    );
  }
}
