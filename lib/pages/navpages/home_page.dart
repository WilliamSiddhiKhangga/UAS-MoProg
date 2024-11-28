// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugasuas/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
  TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top:70, left: 20),
            child: Row(
              children: [
                Icon(Icons.menu, size:30, color:Colors.black54),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5)
                  ),
                ),
                SizedBox(height: 40,),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Welcome Back!"),
          ),
          SizedBox(height: 40,),
          // tab bar
          Container(
            child: Align(
              alignment: Alignment.center,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 80),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: Colors.lightBlue, radius: 4),
                tabs: [
                  Tab(text: "Destinations"),
                  Tab(text: "Promo"),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    final List<String> images = [
                      "img/fuji.png",
                      "img/liberty.png",
                      "img/paris.png",
                    ];

                    return Container(
                      margin: EdgeInsets.only(bottom:15, top: 5),
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        fit:BoxFit.cover
                        ),
                      ),
                    ); 
                  },
                ),
              Text("there"),
            ]),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color, radius:radius);
  }

  
}

class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2-radius/2, configuration.size!.height-radius);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }
    
}