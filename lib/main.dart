import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://YOUR_PROJECT.supabase.co',
    anonKey: 'YOUR_ANON_KEY_HERE',
  );
  runApp(const ToofanApp());
}

class ToofanApp extends StatelessWidget {
  const ToofanApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TOOFAN',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A1931),
        primaryColor: const Color(0xFF0A1931),
      ),
      home: const SplashScreen(),
    );
  }
}

// 1. SPLASH SCREEN - 2 sec - Tumhari image Screen 1
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.storm, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            Text('TOOFAN', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, letterSpacing: 5, color: Colors.white)),
            const SizedBox(height: 10),
            Text('Connect • Communicate • Protect', style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}

// 2. LOGIN SCREEN - Tumhari image Screen 3
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final phoneCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF0A1931), title: const Text('TOOFAN Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            TextField(
              controller: phoneCtrl,
              decoration: InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder(), prefixText: '+92 '),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50), backgroundColor: Colors.blueAccent),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
              child: const Text('LOGIN WITH OTP'),
            ),
            const SizedBox(height: 20),
            const Text('Firebase nahi, Supabase Auth use hoga', style: TextStyle(color: Colors.white54, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

// 3. HOME - Tumhari image ke 5 Tabs
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final _pages = [const FeedTab(), const VideoTab(), const ExploreTab(), const FamilyTab(), const ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0A1931),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Videos'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.family_restroom), label: 'Family'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// FEED TAB
class FeedTab extends StatelessWidget {
  const FeedTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TOOFAN Feed'), backgroundColor: const Color(0xFF0A1931)),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) => Card(
          color: Colors.white10,
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(child: Text('U$i')),
            title: Text('User $i - Post ${i+1}'),
            subtitle: Text('Ye online post hai, Supabase se aayegi. Real time chat + call available hai.'),
            trailing: Icon(Icons.favorite_border),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
    );
  }
}
class VideoTab extends StatelessWidget { const VideoTab({super.key}); @override Widget build(BuildContext context) => Center(child: Text('Video Dashboard - TikTok Style\nAgora Video Call Ready', textAlign: TextAlign.center)); }
class ExploreTab extends StatelessWidget { const ExploreTab({super.key}); @override Widget build(BuildContext context) => Center(child: Text('Explore - #Trending Hashtags\nSupabase Search')); }
class FamilyTab extends StatelessWidget { const FamilyTab({super.key}); @override Widget build(BuildContext context) => Center(child: Text('Family Safety - Live Location\nSociety Alerts - Map View\nGoogle Maps Ready')); }
class ProfileTab extends StatelessWidget { const ProfileTab({super.key}); @override Widget build(BuildContext context) { return Scaffold(body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [CircleAvatar(radius: 50), SizedBox(height: 10), Text('TOOFAN User'), Text('Hijab Settings Available'), SizedBox(height: 20), ElevatedButton(onPressed: () {}, child: Text('Voice Call - Agora')) , SizedBox(height: 10), ElevatedButton(onPressed: () {}, child: Text('Video Call - Agora'))]))); } }
