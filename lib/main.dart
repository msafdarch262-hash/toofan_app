import 'package:flutter/material.dart';

void main() => runApp(const ToofanApp());

class ToofanApp extends StatelessWidget {
  const ToofanApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF5F7FB)),
      home: const ToofanHome(),
    );
  }
}

class ToofanHome extends StatelessWidget {
  const ToofanHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // HEADER - TOOFAN
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  const Text("🌪️", style: TextStyle(fontSize: 28)),
                  const SizedBox(width: 5),
                  const Text("TOOFAN", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0E8ACB))),
                  const Spacer(),
                  _topIcon(Icons.call),
                  _topIcon(Icons.videocam),
                  _topIcon(Icons.search),
                  _topIcon(Icons.chat_bubble_outline),
                  _topIcon(Icons.notifications),
                  _topIcon(Icons.account_circle_outlined),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  // STORIES
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: _box(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Your Story", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _story("Your Story", Icons.add, isAdd: true),
                              _story("Aiza", null),
                              _story("Bilal", null),
                              _story("Zara", null),
                              _story("Omar", null),
                              _story("Mina", null),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // WHAT'S HAPPENING
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: _box(),
                    child: Row(
                      children: [
                        const CircleAvatar(backgroundColor: Color(0xFF0E8ACB), child: Icon(Icons.person, color: Colors.white)),
                        const SizedBox(width: 10),
                        const Expanded(child: Text("What's happening?", style: TextStyle(color: Colors.grey))),
                        Icon(Icons.image, color: Colors.blue.shade400),
                        const SizedBox(width: 8),
                        Icon(Icons.attach_file, color: Colors.blue.shade400),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // POST - Sara Khan
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: _box(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(radius: 22, backgroundImage: NetworkImage("https://i.pravatar.cc/100?img=5")),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Sara Khan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Text("2 hours ago • Public", style: TextStyle(color: Colors.grey, fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text("Community Cleanup", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0B2E5B))),
                        const Text("Join us this Saturday at Central Park for the community cleanup drive! Let's make our neighborhood cleaner together. 🌿📦"),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network("https://images.unsplash.com/photo-1559027615-cd4628902d4a", height: 180, width: double.infinity, fit: BoxFit.cover),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(child: ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.call), label: const Text("Call"), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0E8ACB), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))))),
                            const SizedBox(width: 10),
                            Expanded(child: ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.chat_bubble), label: const Text("Chat"), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0E8ACB), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))))),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // SECURITY ALERT (Aapka wala)
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: Colors.red.withOpacity(0.1), border: Border.all(color: Colors.red), borderRadius: BorderRadius.circular(12)),
                    child: Row(children: const [
                      Icon(Icons.warning_amber, color: Colors.red, size: 40),
                      SizedBox(width: 10),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text("SECURITY ALERT", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                        Text("3 Hack Attempts Blocked Today - Sab Owner Ko Pata Chal Gaya", style: TextStyle(color: Colors.red)),
                      ]))
                    ]),
                  ),
                ],
              ),
            ),
            // BOTTOM NAV
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _bottom(Icons.home, "Home", true),
                  _bottom(Icons.video_library_outlined, "Video", false),
                  _bottom(Icons.explore_outlined, "Explore", false),
                  _bottom(Icons.family_restroom, "Family", false),
                  _bottom(Icons.groups_outlined, "Society", false),
                  _bottom(Icons.person_outline, "Profile", false),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget _topIcon(IconData icon) => Padding(padding: const EdgeInsets.symmetric(horizontal: 4), child: Icon(icon, color: const Color(0xFF0E8ACB), size: 22));
  static BoxDecoration _box() => BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]);
  static Widget _story(String name, IconData? icon, {bool isAdd = false}) => Padding(padding: const EdgeInsets.only(right: 14), child: Column(children: [
    Container(padding: const EdgeInsets.all(2), decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFF0E8ACB), width: 2)), child: CircleAvatar(radius: 26, backgroundColor: Colors.grey.shade200, child: isAdd ? const Icon(Icons.add, color: Color(0xFF0E8ACB)) : const Icon(Icons.person))),
    const SizedBox(height: 4),
    Text(name, style: const TextStyle(fontSize: 12))
  ]));
  static Widget _bottom(IconData icon, String label, bool active) => Column(children: [Icon(icon, color: active ? const Color(0xFF0E8ACB) : Colors.grey), Text(label, style: TextStyle(fontSize: 11, color: active ? const Color(0xFF0E8ACB) : Colors.grey, fontWeight: active ? FontWeight.bold : FontWeight.normal))]);
}
