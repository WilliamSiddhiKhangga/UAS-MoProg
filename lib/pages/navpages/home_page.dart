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
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, left: 20, bottom: 20),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu, size: 30, color: Colors.black54),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.lightBlue,
                                      ),
                                      padding: EdgeInsets.all(20),
                                      width: 200,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppLargeText(
                                            text: "About the Developer:",
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            'Alfian',
                                            style: TextStyle(fontSize: 18),                                            
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            'Brandon',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            'Felix',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            'Kevin',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            'Marco',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Back Button
                                  Positioned(
                                    top: 350,
                                    right: 80,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(
                                            context); // Close the dialog
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.bottomLeft,
                                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), ),
                                        // color: Colors.white,
                                        child: AppLargeText(
                                          text: "Back",
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'img/logo.png',
                        scale: 15,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(text: "Welcome Back!"),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20), // Set the margin for the Text widget
                child: Text(
                  "Discover where do you want to go today and get the fascinating promo too!",
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // Tab bar
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 80),
                    controller: _tabController,
                    labelColor: Colors.lightBlue,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.lightBlue,
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
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      final List<String> images = [
                        "img/fuji.png",
                        "img/liberty.png",
                        "img/paris.png",
                      ];

                      final List<String> texts = [
                        "Tokyo",
                        "New York",
                        "Paris",
                      ];

                      final List<String> countries = [
                        "Japan",
                        "USA",
                        "France",
                      ];

                      return Container(
                        margin: EdgeInsets.only(
                            bottom: 15, top: 5, left: 5, right: 5),
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.45),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLargeText(
                                  text: texts[index],
                                  color: Colors.white,
                                ),
                                AppLargeText(
                                  text: countries[index],
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      final List<String> images = [
                        "img/fuji.png",
                        "img/liberty.png",
                      ];

                      final List<String> amount = [
                        "30%",
                        "50%",
                      ];

                      final List<String> texts = [
                        "Tokyo",
                        "New York",
                      ];

                      return Container(
                        margin: EdgeInsets.only(
                            bottom: 15, top: 5, left: 5, right: 5),
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.45),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLargeText(
                                  text: amount[index],
                                  color:
                                      const Color.fromARGB(255, 105, 190, 229),
                                ),
                                AppLargeText(
                                  text: texts[index],
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
