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
                          barrierDismissible: true,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              child: GestureDetector(
                                  behavior: HitTestBehavior.opaque, 
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
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
                                          Text(
                                            'William',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
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
                height: MediaQuery.of(context).size.height * 0.48,
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

                        final List<String> prices = [
                          "Rp10,250,000",
                          "Rp16,500,000",
                          "Rp20,500,000",
                        ];

                        return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                  ),
                                  builder: (context) {
                                    final List<String> hotels = ['Travoy Hotel', 'Aston', 'Swiss Belhotel', 'Haris Hotel', 'Ibis Styles', 'Fave Hotel'];
                                    String? selectedHotel;
                                    final List<String> units = [
                                    '1',
                                    '2',
                                    '3',
                                    ];
                                    String? selectedUnit;
                                    final List<String> breakfast = [
                                    'Breakfast',
                                    'Without Breakfast',
                                    ];
                                    String? selectedBreakfast;

                                    return Container(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                            AppLargeText(text: texts[index] + ", " + countries[index], size: 22),
                                            SizedBox(height: 10),
                                            Container(
                                              height: 200, // Set a fixed height for the image
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  image: AssetImage(images[index]),
                                                  fit: BoxFit.cover,
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.black.withOpacity(0.47),
                                                    BlendMode.darken,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10, width: double.maxFinite),
                                            AppLargeText(text: prices[index] , color: Colors.lightBlueAccent),
                                            SizedBox(height: 10),
                                            Text("Price written above is for 5 days 4 nights. Fill your preferences below:", textAlign: TextAlign.center),
                                            SizedBox(height: 10),
                                            // Define a list of hotels

                                            StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return DropdownButton<String>(
                                                  hint: Text('Select 3-star hotel'),
                                                  value: selectedHotel,
                                                  items: hotels
                                                      .map((hotel) =>
                                                          DropdownMenuItem<String>(
                                                            value: hotel,
                                                            child: Text(hotel),
                                                          ))
                                                      .toList(),
                                                  onChanged: (String? hotel) {
                                                    setState(() {
                                                      selectedHotel =
                                                          hotel; 
                                                    });
                                                  },
                                                );
                                              },
                                            ),

                                             StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return DropdownButton<String>(
                                                  hint: Text('Select Room Units'),
                                                  value: selectedUnit,
                                                  items: units
                                                      .map((unit) =>
                                                          DropdownMenuItem<String>(
                                                            value: unit,
                                                            child: Text(unit),
                                                          ))
                                                      .toList(),
                                                  onChanged: (String? unit) {
                                                    setState(() {
                                                      selectedUnit =
                                                          unit;
                                                    });
                                                  },
                                                );
                                              },
                                            ),

                                             StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return DropdownButton<String>(
                                                  hint: Text('Select breakfast option'),
                                                  value: selectedBreakfast,
                                                  items: breakfast
                                                      .map((bf) =>
                                                          DropdownMenuItem<String>(
                                                            value: bf,
                                                            child: Text(bf),
                                                          ))
                                                      .toList(),
                                                  onChanged: (String? bf) {
                                                    setState(() {
                                                      selectedBreakfast =
                                                          bf; 
                                                    });
                                                  },
                                                );
                                              },
                                            ),

                                            SizedBox(height: 20),
                                            Center(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.lightBlue,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30), 
                                                  ),
                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                                ),
                                                child: Text(
                                                  "Book Now",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],

                                      ),
                                    );
                                  },
                                );
                              },
                        child:  Container(
                          margin: const EdgeInsets.only(
                            bottom: 15,
                            top: 5,
                            left: 5,
                            right: 5,
                          ),
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.47),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
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
                        )
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

                        final List<String> prices = [
                          "Rp10,250,000",
                          "Rp16,500,000",
                        ];

                        final List<String> hotels = [
                          'Travoy Hotel',
                          'Aston',
                          'Swiss Belhotel',
                          'Haris Hotel',
                          'Ibis Styles',
                          'Fave Hotel'
                        ];

                        String? selectedHotel;
                        final List<String> units = [
                          '1',
                          '2',
                          '3',
                        ];
                        String? selectedUnit;
                        final List<String> breakfast = [
                          'Breakfast',
                          'Without Breakfast',
                        ];
                        String? selectedBreakfast;


                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "${texts[index]}", 
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(width: 10),
                                      const SizedBox(height: 20),
                                      Container(
                                        height:
                                            200, // Set a fixed height for the image
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                          image: DecorationImage(
                                            image: AssetImage(images[index]),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.47),
                                              BlendMode.darken,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: 10, width: double.maxFinite),
                                      AppLargeText(
                                          text: prices[index],
                                          color: Colors.lightBlueAccent),
                                      Text(
                                        "Promo: ${amount[index]}",
                                        style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                          "Price written above is for 5 days 4 nights. Fill your preferences below:",
                                          textAlign: TextAlign.center),
                                      SizedBox(height: 10),
                                      StatefulBuilder(
                                        builder: (BuildContext context,
                                            StateSetter setState) {
                                          return DropdownButton<String>(
                                            hint: Text('Select 3-star hotel'),
                                            value: selectedHotel,
                                            items: hotels
                                                .map((hotel) =>
                                                    DropdownMenuItem<String>(
                                                      value: hotel,
                                                      child: Text(hotel),
                                                    ))
                                                .toList(),
                                            onChanged: (String? hotel) {
                                              setState(() {
                                                selectedHotel = hotel;
                                              });
                                            },
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (BuildContext context,
                                            StateSetter setState) {
                                          return DropdownButton<String>(
                                            hint: Text('Select Room Units'),
                                            value: selectedUnit,
                                            items: units
                                                .map((unit) =>
                                                    DropdownMenuItem<String>(
                                                      value: unit,
                                                      child: Text(unit),
                                                    ))
                                                .toList(),
                                            onChanged: (String? unit) {
                                              setState(() {
                                                selectedUnit = unit;
                                              });
                                            },
                                          );
                                        },
                                      ),
                                      StatefulBuilder(
                                        builder: (BuildContext context,
                                            StateSetter setState) {
                                          return DropdownButton<String>(
                                            hint:
                                                Text('Select breakfast option'),
                                            value: selectedBreakfast,
                                            items: breakfast
                                                .map((bf) =>
                                                    DropdownMenuItem<String>(
                                                      value: bf,
                                                      child: Text(bf),
                                                    ))
                                                .toList(),
                                            onChanged: (String? bf) {
                                              setState(() {
                                                selectedBreakfast = bf;
                                              });
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(height: 20),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.lightBlue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 12),
                                          ),
                                          child: Text(
                                            "Book Now",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 15,
                              top: 5,
                              left: 5,
                              right: 5,
                            ),
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
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppLargeText(
                                      text: amount[index],
                                      color: Colors.lightBlueAccent,
                                    ),
                                    AppLargeText(
                                      text: texts[index],
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}