import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart'; // Import plugin baterai
import 'home_page.dart';
import 'crypto_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final Battery _battery = Battery(); // Inisialisasi baterai
  int _batteryLevel = 100;

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  // Fungsi untuk ambil level baterai
  void _getBatteryLevel() async {
    final level = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      const HomePage(),
      const CryptoPage(),
      // TAMPILAN PROFIL BARU
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.pinkAccent,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sindi Rahmadani',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'NIM: 20123040',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            // UI STATUS BATERAI
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.battery_charging_full,
                    color: Colors.pinkAccent,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Status Baterai HP: $_batteryLevel%',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getBatteryLevel,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
              ),
              child: const Text(
                'Refresh Baterai',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_bitcoin),
            label: 'Crypto',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
