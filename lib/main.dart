import 'package:flutter/material.dart';

void main() => runApp(const ToofanApp());

class ToofanApp extends StatelessWidget {
  const ToofanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOOFAN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFDA252D)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F7F9),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int selected = 0;
  final pages = const [
    HomeScreen(),
    VideosScreen(),
    ExploreScreen(),
    FamilyScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selected]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (i) => setState(() => selected = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.play_circle_outline), selectedIcon: Icon(Icons.play_circle), label: 'Videos'),
          NavigationDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore), label: 'Explore'),
          NavigationDestination(icon: Icon(Icons.groups_outlined), selectedIcon: Icon(Icons.groups), label: 'Family'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class BrandHeader extends StatelessWidget {
  final String subtitle;
  const BrandHeader({super.key, this.subtitle = 'Connect • Share • Discover'});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
    child: Row(children: [
      Container(
        width: 46, height: 46,
        decoration: BoxDecoration(color: const Color(0xFFDA252D), borderRadius: BorderRadius.circular(14)),
        child: const Icon(Icons.bolt, color: Colors.white, size: 30),
      ),
      const SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('TOOFAN', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900, letterSpacing: 1.2)),
        Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
      ])),
      IconButton(onPressed: () => _message(context, 'Notifications are a demo feature.'), icon: const Icon(Icons.notifications_none)),
      IconButton(onPressed: () => _message(context, 'Settings are a demo feature.'), icon: const Icon(Icons.settings_outlined)),
    ]),
  );
}

void _message(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => ListView(children: [
    const BrandHeader(),
    Padding(padding: const EdgeInsets.symmetric(horizontal: 18), child: TextField(
      decoration: InputDecoration(
        hintText: 'Search TOOFAN',
        prefixIcon: const Icon(Icons.search),
        filled: true, fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      ),
    )),
    const SizedBox(height: 20),
    const SectionTitle('Stories', trailing: 'See all'),
    SizedBox(height: 105, child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.symmetric(horizontal: 14), children: const [
      StoryItem(label: 'Your story', icon: Icons.add),
      StoryItem(label: 'Ayesha', icon: Icons.face_3),
      StoryItem(label: 'Hamza', icon: Icons.face),
      StoryItem(label: 'Sana', icon: Icons.face_4),
      StoryItem(label: 'Usman', icon: Icons.face_6),
    ])),
    const SectionTitle('Your community'),
    const PostCard(name: 'TOOFAN Community', handle: '@toofan_official', text: 'Welcome to TOOFAN — your place to connect, share moments, and discover new people.', icon: Icons.bolt),
    const PostCard(name: 'Daily Inspiration', handle: '@dailyinspiration', text: 'A small step every day can take you a long way. Keep moving forward!', icon: Icons.auto_awesome),
  ]);
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String? trailing;
  const SectionTitle(this.title, {super.key, this.trailing});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(18, 20, 18, 12),
    child: Row(children: [
      Expanded(child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800))),
      if (trailing != null) Text(trailing!, style: const TextStyle(color: Color(0xFFDA252D), fontWeight: FontWeight.w600)),
    ]),
  );
}

class StoryItem extends StatelessWidget {
  final String label;
  final IconData icon;
  const StoryItem({super.key, required this.label, required this.icon});
  @override
  Widget build(BuildContext context) => SizedBox(width: 76, child: Column(children: [
    Container(width: 62, height: 62, margin: const EdgeInsets.only(bottom: 6), decoration: BoxDecoration(
      shape: BoxShape.circle, border: Border.all(color: const Color(0xFFDA252D), width: 2),
      color: Colors.white,
    ), child: Icon(icon, color: const Color(0xFFDA252D), size: 29)),
    Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11)),
  ]));
}

class PostCard extends StatelessWidget {
  final String name, handle, text;
  final IconData icon;
  const PostCard({super.key, required this.name, required this.handle, required this.text, required this.icon});
  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.fromLTRB(16, 4, 16, 12),
    elevation: 0,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18), side: BorderSide(color: Colors.grey.shade200)),
    child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        CircleAvatar(backgroundColor: const Color(0xFFFFE8E8), child: Icon(icon, color: const Color(0xFFDA252D))),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(handle, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        ])),
        const Icon(Icons.more_horiz),
      ]),
      const SizedBox(height: 14),
      Text(text, style: const TextStyle(height: 1.45)),
      const SizedBox(height: 14),
      Row(children: [
        IconButton(onPressed: () => _message(context, 'Like tapped (demo).'), icon: const Icon(Icons.favorite_border)),
        IconButton(onPressed: () => _message(context, 'Comments are a demo feature.'), icon: const Icon(Icons.chat_bubble_outline)),
        IconButton(onPressed: () => _message(context, 'Share is a demo feature.'), icon: const Icon(Icons.share_outlined)),
      ]),
    ])),
  );
}

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});
  @override
  Widget build(BuildContext context) => ListView(children: [
    const BrandHeader(subtitle: 'Watch something interesting'),
    const SectionTitle('Trending videos'),
    for (final item in ['Community moments', 'Travel & places', 'Funny clips'])
      Card(margin: const EdgeInsets.fromLTRB(16, 5, 16, 10), elevation: 0, child: Container(
        height: 170, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: const LinearGradient(colors: [Color(0xFF252538), Color(0xFFDA252D)])),
        child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.play_circle_fill, color: Colors.white, size: 52),
          const SizedBox(height: 8),
          Text(item, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
          const Text('Video preview placeholder', style: TextStyle(color: Colors.white70)),
        ])),
      )),
  ]);
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) => ListView(children: [
    const BrandHeader(subtitle: 'Find what you love'),
    const SectionTitle('Explore categories'),
    for (final pair in [
      ('People & friends', Icons.people_alt_outlined),
      ('Local communities', Icons.location_on_outlined),
      ('Popular posts', Icons.trending_up),
      ('Events & activities', Icons.event_outlined),
      ('Creators', Icons.star_outline),
    ])
      ListTile(
        leading: CircleAvatar(backgroundColor: const Color(0xFFFFE8E8), child: Icon(pair.$2, color: const Color(0xFFDA252D))),
        title: Text(pair.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => _message(context, '${pair.$1} selected (demo).'),
      ),
  ]);
}

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key});
  @override
  Widget build(BuildContext context) => ListView(children: [
    const BrandHeader(subtitle: 'Your people, your circle'),
    const SectionTitle('Family & society'),
    Container(
      margin: const EdgeInsets.all(16), padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: const Column(children: [
        Icon(Icons.diversity_3, size: 60, color: Color(0xFFDA252D)),
        SizedBox(height: 12),
        Text('Build your circle', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Create groups, share updates, and stay connected with your community.', textAlign: TextAlign.center),
      ]),
    ),
    Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: FilledButton.icon(
      onPressed: () => _message(context, 'Group creation will be connected to the backend later.'),
      icon: const Icon(Icons.add), label: const Text('Create a group'),
    )),
  ]);
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => ListView(children: [
    const BrandHeader(subtitle: 'Your TOOFAN account'),
    Container(margin: const EdgeInsets.all(16), padding: const EdgeInsets.all(22), decoration: BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: const Column(children: [
        CircleAvatar(radius: 42, backgroundColor: Color(0xFFFFE8E8), child: Icon(Icons.person, size: 48, color: Color(0xFFDA252D))),
        SizedBox(height: 12),
        Text('TOOFAN User', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
        Text('Add a bio to tell your story'),
      ]),
    ),
    for (final item in [
      ('Edit profile', Icons.edit_outlined),
      ('Privacy & security', Icons.lock_outline),
      ('Settings', Icons.settings_outlined),
      ('Help & support', Icons.help_outline),
      ('Log out', Icons.logout),
    ])
      ListTile(
        leading: Icon(item.$2), title: Text(item.$1), trailing: const Icon(Icons.chevron_right),
        onTap: () => _message(context, '${item.$1} is a demo feature.'),
      ),
  ]);
}
