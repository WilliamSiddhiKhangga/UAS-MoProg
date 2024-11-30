import 'package:flutter/material.dart';

class BarItemPage extends StatelessWidget {
  BarItemPage({super.key});

  final List<Map<String, dynamic>> destinations = [
    {
      "image": "fuji.png",
      "name": "Majestic Mt. Fuji",
      "likes": 93,
      "dislikes": 15,
      "neutral": 5,
    },
    {
      "image": "paris.png",
      "name": "Romantic Paris",
      "likes": 84,
      "dislikes": 13,
      "neutral": 8,
    },
    {
      "image": "liberty.png",
      "name": "Vibrant New York",
      "likes": 65,
      "dislikes": 25,
      "neutral": 10,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Rated"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(215, 24, 157, 239),
      ),
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final destination = destinations[index];
          final totalVotes = destination["likes"] +
              destination["dislikes"] +
              destination["neutral"];
          final likePercentage = (destination["likes"] / totalVotes) * 100;
          final dislikePercentage =
              (destination["dislikes"] / totalVotes) * 100;
          final neutralPercentage = (destination["neutral"] / totalVotes) * 100;

          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage("img/${destination['image']}"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination["name"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                flex: destination["likes"],
                                child: Container(
                                  height: 10,
                                  color: Colors.green,
                                ),
                              ),
                              Expanded(
                                flex: destination["dislikes"],
                                child: Container(
                                  height: 10,
                                  color: Colors.red,
                                ),
                              ),
                              Expanded(
                                flex: destination["neutral"],
                                child: Container(
                                  height: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Likes: ${likePercentage.toStringAsFixed(1)}%",
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Dislikes: ${dislikePercentage.toStringAsFixed(1)}%",
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Neutral: ${neutralPercentage.toStringAsFixed(1)}%",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (likePercentage >= 80 && destination["likes"] >= 20)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "Top Picks",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
