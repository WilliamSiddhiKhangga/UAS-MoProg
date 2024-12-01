import 'package:flutter/material.dart';

class TopRatedPage extends StatefulWidget {
  const TopRatedPage({super.key});

  @override
  State<TopRatedPage> createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage> {
  final List<Map<String, dynamic>> destinations = [
    {
      "image": "fuji.png",
      "name": "Majestic Mt. Fuji",
      "likes": 93,
      "dislikes": 15,
      "neutral": 5,
      "isFavorite": false,
    },
    {
      "image": "paris.png",
      "name": "Romantic Paris",
      "likes": 840,
      "dislikes": 130,
      "neutral": 80,
      "isFavorite": false,
    },
    {
      "image": "liberty.png",
      "name": "Vibrant New York",
      "likes": 65,
      "dislikes": 25,
      "neutral": 10,
      "isFavorite": false,
    },
  ];

  bool showTopPicksOnly = false;
  bool showFavoritesOnly = false;
  String sortBy = "Most Likes";

  List<Map<String, dynamic>> getFilteredAndSortedDestinations() {
    List<Map<String, dynamic>> filteredDestinations = destinations;

    if (showTopPicksOnly) {
      filteredDestinations = filteredDestinations.where((destination) {
        final totalVotes = destination["likes"] +
            destination["dislikes"] +
            destination["neutral"];
        final likePercentage = (destination["likes"] / totalVotes) * 100;
        return likePercentage >= 80 && destination["likes"] >= 20;
      }).toList();
    }

    if (showFavoritesOnly) {
      filteredDestinations = filteredDestinations
          .where((destination) => destination["isFavorite"])
          .toList();
    }

    filteredDestinations.sort((a, b) {
      if (sortBy == "Most Likes") {
        return b["likes"].compareTo(a["likes"]);
      } else if (sortBy == "Likes Percentage") {
        final aTotalVotes = a["likes"] + a["dislikes"] + a["neutral"];
        final bTotalVotes = b["likes"] + b["dislikes"] + b["neutral"];
        final aLikePercentage = (a["likes"] / aTotalVotes) * 100;
        final bLikePercentage = (b["likes"] / bTotalVotes) * 100;
        return bLikePercentage.compareTo(aLikePercentage);
      }
      return 0;
    });

    return filteredDestinations;
  }

  void showDetailsModal(
      BuildContext context, Map<String, dynamic> destination) {
    final totalVotes =
        destination["likes"] + destination["dislikes"] + destination["neutral"];
    final likePercentage = (destination["likes"] / totalVotes) * 100;
    final dislikePercentage = (destination["dislikes"] / totalVotes) * 100;
    final neutralPercentage = (destination["neutral"] / totalVotes) * 100;

    bool likeButtonActive = false;
    bool dislikeButtonActive = false;

    showModalBottomSheet(   
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter modalSetState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      "img/${destination['image']}",
                      width: double.infinity,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination["name"],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            "Likes: ${destination["likes"]} (${likePercentage.toStringAsFixed(1)}%)"),
                        Text(
                            "Dislikes: ${destination["dislikes"]} (${dislikePercentage.toStringAsFixed(1)}%)"),
                        Text(
                            "Neutral: ${destination["neutral"]} (${neutralPercentage.toStringAsFixed(1)}%)"),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    modalSetState(() {
                                      if (likeButtonActive) {
                                        destination["likes"]--;
                                        likeButtonActive = false;
                                      } else {
                                        destination["likes"]++;
                                        likeButtonActive = true;

                                        if (dislikeButtonActive) {
                                          destination["dislikes"]--;
                                          dislikeButtonActive = false;
                                        }
                                      }
                                    });
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color.fromARGB(215, 24, 157, 239),
                                        width: 2,
                                      ),
                                      color: likeButtonActive
                                          ? const Color.fromARGB(215, 24, 157, 239)
                                          : Colors.transparent,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: const Icon(
                                      Icons.thumb_up,
                                      color: Color.fromARGB(255, 101, 101, 101),
                                      size: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    modalSetState(() {
                                      if (dislikeButtonActive) {
                                        destination["dislikes"]--;
                                        dislikeButtonActive = false;
                                      } else {
                                        destination["dislikes"]++;
                                        dislikeButtonActive = true;

                                        if (likeButtonActive) {
                                          destination["likes"]--;
                                          likeButtonActive = false;
                                        }
                                      }
                                    });
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color.fromARGB(215, 24, 157, 239),
                                        width: 2,
                                      ),
                                      color: dislikeButtonActive
                                          ? const Color.fromARGB(215, 24, 157, 239)
                                          : Colors.transparent,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: const Icon(
                                      Icons.thumb_down,
                                      color: Color.fromARGB(255, 101, 101, 101),
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                modalSetState(() {
                                  destination["isFavorite"] =
                                      !destination["isFavorite"];
                                });
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color.fromARGB(215, 24, 157, 239),
                                    width: 2,
                                  ),
                                  color: destination["isFavorite"]
                                      ? const Color.fromARGB(215, 24, 157, 239)
                                      : Colors.transparent,
                                ),
                                padding: const EdgeInsets.all(10),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredDestinations = getFilteredAndSortedDestinations();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Rated"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(215, 24, 157, 239),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PopupMenuButton<int>(
                  onSelected: (value) {
                    if (value == 0) {
                      setState(() {
                        sortBy = "Most Likes";
                      });
                    } else if (value == 1) {
                      setState(() {
                        sortBy = "Likes Percentage";
                      });
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 0,
                      child: Row(
                        children: const [
                          Icon(Icons.thumb_up, color: Color.fromARGB(215, 24, 157, 239)),
                          SizedBox(width: 10),
                          Text("Most Likes"),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: const [
                          Icon(Icons.percent, color: Colors.green),
                          SizedBox(width: 10),
                          Text("Likes Percentage"),
                        ],
                      ),
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem(
                      child: StatefulBuilder(
                        builder: (context, setMenuState) {
                          return CheckboxListTile(
                            title: const Text("Top Picks Only"),
                            value: showTopPicksOnly,
                            onChanged: (value) {
                              setState(() {
                                showTopPicksOnly = value ?? false;
                              });
                              setMenuState(() {});
                            },
                          );
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: StatefulBuilder(
                        builder: (context, setMenuState) {
                          return CheckboxListTile(
                            title: const Text("Favorites Only"),
                            value: showFavoritesOnly,
                            onChanged: (value) {
                              setState(() {
                                showFavoritesOnly = value ?? false;
                              });
                              setMenuState(() {});
                            },
                          );
                        },
                      ),
                    ),
                  ],
                  child: Row(
                    children: [
                      const Icon(Icons.sort, color: Colors.black),
                      Text(sortBy),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDestinations.length,
              itemBuilder: (context, index) {
                final destination = filteredDestinations[index];
                final totalVotes = destination["likes"] +
                    destination["dislikes"] +
                    destination["neutral"];
                return GestureDetector(
                  onTap: () => showDetailsModal(context, destination),
                  child: Stack(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Likes: ${destination["likes"]}",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "Dislikes: ${destination["dislikes"]}",
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "Neutral: ${destination["neutral"]} ",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
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
                      if ((destination["likes"] / totalVotes) * 100 >= 80 &&
                          destination["likes"] >= 20)
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
                      if (destination["isFavorite"])
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(215, 24, 157, 239),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 24,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
