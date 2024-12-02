import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String passengerName = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchPassengerName();
  }

  Future<void> fetchPassengerName() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          setState(() {
            passengerName = userDoc['Name'] ?? 'No Name';
          });
        } else {
          setState(() {
            passengerName = 'No Name';
          });
        }
      }
    } catch (e) {
      setState(() {
        passengerName = 'Error loading name';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
        backgroundColor: const Color(0xFF189DEF),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 233, 245, 255),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Ticket Cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildTicketCard(
                  route: 'Jakarta ➡ New York',
                  date: 'November 28, 2024',
                  passengerName: passengerName,
                  ticketCode: 'TK12345',
                  status: 'Confirmed',
                  statusColor: Colors.green,
                ),
                const SizedBox(height: 16),
                _buildTicketCard(
                  route: 'New York ➡ Tokyo',
                  date: 'January 1, 2025',
                  passengerName: passengerName,
                  ticketCode: 'TK67890',
                  status: 'Pending',
                  statusColor: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicketCard({
    required String route,
    required String date,
    required String passengerName,
    required String ticketCode,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFFF5EAE3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.flight, color: Colors.teal),
                const SizedBox(width: 8),
                Text(
                  route,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.orange),
                const SizedBox(width: 8),
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Passenger Name: $passengerName', // Tampilkan nama dinamis
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
            Text(
              'Ticket Code: $ticketCode',
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Status:',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(width: 8),
                Text(
                  status,
                  style: TextStyle(fontSize: 14, color: statusColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
