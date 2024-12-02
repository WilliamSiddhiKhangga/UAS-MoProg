import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<int> _searchResults = [];
  bool _isFocused = false;

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

  void _performSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _searchResults = [];
        for (int i = 0; i < texts.length; i++) {
          if (texts[i].toLowerCase().contains(query.toLowerCase()) ||
              countries[i].toLowerCase().contains(query.toLowerCase())) {
            _searchResults.add(i);
          }
        }
      });
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore Destinations"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(215, 24, 157, 239),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Focus(
              onFocusChange: (focus) => setState(() => _isFocused = focus),
              child: TextField(
                controller: _searchController,
                onChanged: _performSearch,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: "Search for destinations...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: _isFocused ? Colors.white : Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _searchResults.isEmpty
                  ? const Center(
                      child: Text(
                        "No matches found",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4 / 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final resultIndex = _searchResults[index];
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                              ),
                              builder: (context) {
                                final List<String> hotels = [
                                  'Travoy Hotel',
                                  'Aston',
                                  'Swiss Belhotel',
                                  'Haris Hotel',
                                  'Ibis Styles',
                                  'Fave Hotel'
                                ];
                                String? selectedHotel;
                                final List<String> units = ['1', '2', '3'];
                                String? selectedUnit;
                                final List<String> breakfast = ['Breakfast', 'Without Breakfast'];
                                String? selectedBreakfast;

                                return Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "${texts[resultIndex]}, ${countries[resultIndex]}",
                                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: AssetImage(images[resultIndex]),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.47),
                                              BlendMode.darken,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        prices[resultIndex],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(215, 24, 157, 239),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        "Price written above is for 5 days 4 nights. Fill your preferences below:",
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 10),
                                      StatefulBuilder(
                                        builder: (BuildContext context, StateSetter setState) {
                                          return DropdownButton<String>(
                                            hint: const Text('Select 3-star hotel'),
                                            value: selectedHotel,
                                            items: hotels
                                                .map((hotel) => DropdownMenuItem<String>(
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
                                        builder: (BuildContext context, StateSetter setState) {
                                          return DropdownButton<String>(
                                            hint: const Text('Select Room Units'),
                                            value: selectedUnit,
                                            items: units
                                                .map((unit) => DropdownMenuItem<String>(
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
                                        builder: (BuildContext context, StateSetter setState) {
                                          return DropdownButton<String>(
                                            hint: const Text('Select breakfast option'),
                                            value: selectedBreakfast,
                                            items: breakfast
                                                .map((bf) => DropdownMenuItem<String>(
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
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(215, 24, 157, 239),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                        ),
                                        child: const Text(
                                          "Book Now",
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(images[resultIndex]),
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
                                    Text(
                                      texts[resultIndex],
                                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      prices[resultIndex],
                                      style: const TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}