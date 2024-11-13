import 'package:flutter/material.dart';
import 'package:tugasuas/pages/navpages/main_page.dart';
import 'package:tugasuas/widgets/app_large_text.dart';
import 'package:tugasuas/widgets/app_text.dart';
import 'package:tugasuas/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  int _currentIndex = 0;

  List images = [
    "fuji.png",
    "paris.png",
    "liberty.png",
  ];

  List<Map<String, String>> content = [
    {
      "title": "Majestic Mt. Fuji",
      "subtitle": "Symbol of Japan",
      "description":
          "Witness the breathtaking beauty of Mount Fuji, Japan's iconic peak. From serene lakes to stunning views, an adventure around this sacred mountain is unforgettable.",
    },
    {
      "title": "Romantic Paris",
      "subtitle": "City of Lights",
      "description":
          "Experience the romance of Paris with its iconic Eiffel Tower, charming cafes, and world-class art museums. Let Paris enchant you.",
    },
    {
      "title": "Vibrant New York",
      "subtitle": "The City That Never Sleeps",
      "description":
          "Dive into the energy of New York City, from Times Square to Central Park, and discover the dynamic cultural scene and iconic skyline.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 0.2),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/" + images[index]),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLargeText(
                                  text: content[index]["title"]!,
                                  color: Colors.white,
                                ),
                                const SizedBox(height: 10),
                                AppText(
                                  text: content[index]["subtitle"]!,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: 250,
                                  child: AppText(
                                    text: content[index]["description"]!,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          if (index ==
                              images.length -
                                  1) // Hanya tampilkan di halaman terakhir
                            ResponsiveButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainPage(),
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                      Column(
                        children: List.generate(images.length, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 3),
                            width: 8,
                            height: _currentIndex == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _currentIndex == indexDots
                                  ? Colors.black54
                                  : Colors.black54.withOpacity(0.3),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // Panah ke bawah dengan animasi, disembunyikan di halaman terakhir
          if (_currentIndex != images.length - 1)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white.withOpacity(0.7),
                    size: 60,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
