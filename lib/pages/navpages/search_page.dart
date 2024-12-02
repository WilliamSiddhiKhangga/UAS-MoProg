import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _pastSearches = [];
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

  List<int> _searchResults = [];

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
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Focus(
                onFocusChange: (focus) => setState(() => _isFocused = focus),
                child: TextField(
                  controller: _searchController,
                  onChanged: _performSearch,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                  decoration: InputDecoration(
                    hintText: "Search for destinations...",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.blueAccent),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.redAccent),
                            onPressed: () {
                              _searchController.clear();
                              _performSearch('');
                            },
                          )
                        : null,
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
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final resultIndex = _searchResults[index];
                          return Card(
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  images[resultIndex],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                texts[resultIndex],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                countries[resultIndex],
                                style: const TextStyle(
                                  color: Colors.grey,
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
      ),
    );
  }
}
