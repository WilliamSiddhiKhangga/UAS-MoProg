import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(215, 24, 157, 239),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 233, 245, 255),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Section: About Travoy
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(215, 24, 157, 239),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'About Travoy',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Your trusted travel partner for all your journeys.',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Section: Who We Are
          const Text(
            'Who We Are',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Travoy is dedicated to providing a seamless and reliable platform for travel planning. From flights to accommodations, we aim to make every journey simple and stress-free.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),

          // Section: Our Mission
          const Text(
            'Our Mission',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Our mission is to empower everyone to explore the world by offering trusted services, the best travel deals, and a platform that\'s easy to use.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),

          // Section: Why Choose Travoy
          const Text(
            'Why Choose Travoy?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Feature: Trusted Services
          _buildFeatureCard(
            icon: Icons.verified_user,
            title: 'Trusted Services',
            description:
                'Experience secure and reliable booking for flights, hotels, and more.',
          ),

          const SizedBox(height: 10),

          // Feature: Affordable Deals
          _buildFeatureCard(
            icon: Icons.local_offer,
            title: 'Affordable Deals',
            description:
                'Get the best deals that fit your budget without compromising on quality.',
          ),

          const SizedBox(height: 10),

          // Feature: User-Friendly Platform
          _buildFeatureCard(
            icon: Icons.phone_android,
            title: 'User-Friendly Platform',
            description:
                'Plan your trips easily with our intuitive interface and smart features.',
          ),

          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 24, 157, 239),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Contact Us',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.chat, color: Colors.white),
                  title: const Text(
                    'Chat with us',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: const Text(
                    'Instant help, at your convenience',
                    style: TextStyle(color: Colors.white70),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Chat now',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                const Divider(color: Colors.white),
                ListTile(
                  leading: const Icon(Icons.email, color: Colors.white),
                  title: const Text(
                    'Email us',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: const Text(
                    'TravoySupport@gmail.com',
                    style: TextStyle(color: Colors.white70),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Copy email',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.yellow[700],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.black, size: 24),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
