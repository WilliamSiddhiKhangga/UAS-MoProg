import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _pastSearches = [];

  void _addSearchQuery(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _pastSearches.remove(query);
        _pastSearches.insert(0, query);
      });
      _searchController.clear();
    }
  }

  void _reuseSearchQuery(String query) {
    setState(() {
      _searchController.text = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(215, 24, 157, 239)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onSubmitted: _addSearchQuery,
              decoration: InputDecoration(
                hintText: "Search for destinations...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _searchController.clear(),
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: _pastSearches.isEmpty
                  ? const Center(
                      child: Text(
                        "No past searches",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _pastSearches.length,
                      itemBuilder: (context, index) {
                        final query = _pastSearches[index];
                        return ListTile(
                          title: Text(query),
                          trailing: IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () => _reuseSearchQuery(query),
                          ),
                          onTap: () => _reuseSearchQuery(query),
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
