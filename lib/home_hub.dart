import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeHub extends StatefulWidget {
  const HomeHub({super.key});
  @override
  State<HomeHub> createState() => _HomeHubState();
}

class _HomeHubState extends State<HomeHub> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeContent(),
    const Center(child: Text("Chat Screen")),
    const Center(child: Text("Search Screen")),
    const Center(child: Text("Profile Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flash Hub"), backgroundColor: Colors.green.shade50),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("User"),
              accountEmail: Text(FirebaseAuth.instance.currentUser?.email ?? "Guest"),
              currentAccountPicture: const CircleAvatar(backgroundImage: AssetImage('assets/images/pic1.jpg')),
            ),
            ListTile(leading: const Icon(Icons.logout), title: const Text("Logout"), onTap: () => Navigator.pushReplacementNamed(context, '/')),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int _current = 0;
  final List<String> imgList = [
    'assets/images/pic1.jpg', 'assets/images/pic2.jpg', 'assets/images/pic3.jpg',
    'assets/images/pic4.jpg', 'assets/images/pic5.jpg', 'assets/images/pic6.jpg', 'assets/images/pic7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CarouselSlider(
          options: CarouselOptions(
            height: 220,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) => setState(() => _current = index),
          ),
          items: imgList.map((path) => ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(path, fit: BoxFit.cover, width: 1000),
          )).toList(),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _current == entry.key ? 22 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _current == entry.key ? const Color(0xFFB2D8B2) : Colors.grey.shade300,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}