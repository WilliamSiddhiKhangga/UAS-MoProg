import 'package:flutter/material.dart';
import 'package:tugasuas/auth/auth_gate.dart';
import 'package:tugasuas/widgets/app_large_text.dart';
import 'package:tugasuas/widgets/app_text.dart';
import 'package:tugasuas/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double scale = 1.0;
              double opacity = 1.0;

              if (_pageController.position.haveDimensions) {
                double pageOffset = _pageController.page! - index;
                scale = 1 - (pageOffset.abs() * 0.3); // Scaling effect
                opacity = 1 - (pageOffset.abs() * 0.5); // Fade effect
              }

              return Opacity(
                opacity: opacity.clamp(0.0, 1.0),
                child: Transform.scale(
                  scale: scale.clamp(0.7, 1.0),
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("img/" + images[index]),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 150, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppLargeText(
                                text: content[index]["title"]!,
                              ),
                              AppText(
                                text: content[index]["subtitle"]!,
                                size: 20,
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 250,
                                child: AppText(
                                  text: content[index]["description"]!,
                                  color: Colors.black54,
                                  size: 14,
                                ),
                              ),
                              const SizedBox(height: 40),
                              ResponsiveButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      // builder: (context) => MainPage(),
                                      builder: (context) => AuthGate(),
                                      // builder: (context) => Login(),
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
                                height: index == indexDots ? 25 : 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == indexDots
                                      ? Colors.black54
                                      : Colors.black54.withOpacity(0.3),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
