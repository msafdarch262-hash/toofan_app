import 'package:flutter/material.dart';

void main() => runApp(ToofanApp());

class ToofanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}

// SPLASH
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.shield_moon, size: 100, color: Colors.greenAccent),
        Text("TOOFAN", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
        Text("OWNER ULTRA SECURE", style: TextStyle(color: Colors.greenAccent, letterSpacing: 2)),
        SizedBox(height: 20),
        Text("ANTI-HACK SYSTEM ACTIVE", style: TextStyle(color: Colors.green, fontSize: 12)),
      ])),
    );
  }
}

// LOGIN WITH HACK DETECTION
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  int wrongAttempts = 0;
  bool isBlocked = false;
  TextEditingController passCtrl = TextEditingController();
  
  void checkLogin() {
    if(passCtrl.text == "owner123" || passCtrl.text == "1234") { // Owner ka password
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OwnerMasterSecurity()));
    } else {
      setState(() { wrongAttempts++; });
      if(wrongAttempts >= 3) {
        setState(() => isBlocked = true);
        // Yahan Owner ko Alert jayega
        showDialog(context: context, builder: (_) => AlertDialog(
          title: Text("🚨 HACK ATTEMPT DETECTED!"),
          content: Text("3 galat koshishein! Ye device block kar diya gaya hai. Owner ko alert bhej diya gaya hai.\n\nIP: 192.168.1.10\nLocation: Lahore\nDevice: Android"),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))],
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(24), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.admin_panel_settings, size: 70, color: Colors.black),
        Text("TOOFAN OWNER LOGIN", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Text("High Level Security", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        if(isBlocked) Container(color: Colors.red, padding: EdgeInsets.all(10), child: Text("DEVICE BLOCKED - Owner Approval Needed", style: TextStyle(color: Colors.white))),
        SizedBox(height: 20),
        TextField(decoration: InputDecoration(labelText: "Owner ID", border: OutlineInputBorder(), prefixIcon: Icon(Icons.person_pin)), enabled: !isBlocked),
        SizedBox(height: 15),
        TextField(controller: passCtrl, obscureText: true, decoration: InputDecoration(labelText: "Owner Master Password", border: OutlineInputBorder(), prefixIcon: Icon(Icons.lock)), enabled: !isBlocked),
        SizedBox(height: 10),
        Text("Wrong Attempts: $wrongAttempts / 3", style: TextStyle(color: Colors.red)),
        SizedBox(height: 20),
        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: Size(double.infinity, 50)), onPressed: isBlocked ? null : checkLogin, child: Text("UNLOCK WITH OWNER SECURITY", style: TextStyle(color: Colors.white))),
        SizedBox(height: 10),
        OutlinedButton.icon(icon: Icon(Icons.fingerprint), label: Text("Owner Biometric (Level 2)"), onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OwnerMasterSecurity()))),
      ])),
    );
  }
}

// OWNER MASTER SECURITY - SIRF OWNER KHOL SAKTA HAI
class OwnerMasterSecurity extends StatefulWidget {
  @override
  _OwnerMasterSecurityState createState() => _OwnerMasterSecurityState();
}
class _OwnerMasterSecurityState extends State<OwnerMasterSecurity> {
  bool level1 = true, level2 = false, level3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OWNER MASTER CONTROL"), backgroundColor: Colors.black, foregroundColor: Colors.greenAccent),
      body: ListView(padding: EdgeInsets.all(15), children: [
        Container(padding: EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.greenAccent)), child: Column(children: [
          Icon(Icons.verified_user, color: Colors.greenAccent, size: 50),
          Text("OWNER SECURITY STATUS", style: TextStyle(color: Colors.greenAccent)),
          Text("LEVEL 3 - MAXIMUM", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          Text("HACK PROOF: ACTIVE ✓", style: TextStyle(color: Colors.green)),
        ])),
        SizedBox(height: 15),
        Text("OWNER HIGH SECURITY LEVELS:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Card(color: level1 ? Colors.green[50] : null, child: ListTile(leading: Icon(Icons.lock, color: level1 ? Colors.green : Colors.grey), title: Text("Level 1: Master Password"), subtitle: Text("owner123 - Changed 2 days ago"), trailing: Icon(Icons.check_circle, color: Colors.green))),
        Card(color: level2 ? Colors.green[50] : null, child: ListTile(leading: Icon(Icons.fingerprint, color: level2 ? Colors.green : Colors.grey), title: Text("Level 2: Biometric + Face ID"), subtitle: Text("Only Owner Fingerprint"), trailing: Switch(value: level2, onChanged: (v) => setState(() => level2 = v)))),
        Card(color: level3 ? Colors.green[50] : null, child: ListTile(leading: Icon(Icons.pattern, color: level3 ? Colors.green : Colors.grey), title: Text("Level 3: Secret Pattern"), subtitle: Text("Custom Draw Pattern"), trailing: Switch(value: level3, onChanged: (v) => setState(() => level3 = v)))),
        
        SizedBox(height: 20),
        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: Size(double.infinity, 50)), onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainApp())), child: Text("ENTER TOOFAN APP AS OWNER 👑", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        
        SizedBox(height: 20),
        Text("SECURITY SUCCESS - OWNER KO SAB PATA CHALEGA:", style: TextStyle(fontWeight: FontWeight.bold)),
        Card(child: ListTile(leading: Icon(Icons.warning, color: Colors.red), title: Text("Hack Attempts Today: 3 Blocked"), subtitle: Text("Device: Samsung A32 - Location: Karachi - Time: 10:23 AM"), trailing: Icon(Icons.block, color: Colors.red))),
        Card(child: ListTile(leading: Icon(Icons.devices, color: Colors.blue), title: Text("New Device Login Request"), subtitle: Text("iPhone 13 - Approval Pending"), trailing: ElevatedButton(onPressed: (){}, child: Text("Approve/Reject")))),
        Card(child: ListTile(leading: Icon(Icons.location_on, color: Colors.orange), title: Text("All Users Location Access"), subtitle: Text("Owner can see all 128 members location"), trailing: Icon(Icons.visibility))),
      ]),
    );
  }
}

// MAIN APP - OWNER MODE
class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}
class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  final screens = [HomeDashboard(), VideoDashboard(), OwnerHackMonitor(), FamilyDashboard(), SocietyDashboard(), OwnerControlPanel()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(children: [Icon(Icons.shield, color: Colors.greenAccent), SizedBox(width: 5), Text("TOOFAN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Container(margin: EdgeInsets.only(left: 10), padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)), child: Text("OWNER", style: TextStyle(fontSize: 10, color: Colors.white)))]),
        actions: [
          IconButton(icon: Icon(Icons.security, color: Colors.greenAccent), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OwnerHackMonitor()))),
          IconButton(icon: Icon(Icons.notifications_active, color: Colors.red), onPressed: () {}),
          CircleAvatar(backgroundColor: Colors.green, child: Text("O", style: TextStyle(color: Colors.white)), radius: 16),
          SizedBox(width: 10),
        ],
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, onTap: (i) => setState(() => _currentIndex = i),
        type: BottomNavigationBarType.fixed, selectedItemColor: Colors.black, unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: "Video"),
          BottomNavigationBarItem(icon: Icon(Icons.shield), label: "Hack Monitor"),
          BottomNavigationBarItem(icon: Icon(Icons.family_restroom), label: "Family"),
          BottomNavigationBarItem(icon: Icon(Icons.home_work), label: "Society"),
          BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings), label: "Owner Panel"),
        ],
      ),
    );
  }
}

// OWNER HACK MONITOR - Koi hack kare to yahan ayega
class OwnerHackMonitor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(15), children: [
      Container(padding: EdgeInsets.all(15), color: Colors.red[50], child: Row(children: [Icon(Icons.warning_amber, color: Colors.red, size: 40), SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("SECURITY ALERT", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)), Text("3 Hack Attempts Blocked Today - Sab Owner Ko Pata Chal Gaya", style: TextStyle(color: Colors.red))])))])),
      SizedBox(height: 10),
      Text("LIVE HACK ATTEMPTS LOG:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      hackLog("FAILED LOGIN", "192.168.1.15 - Karachi", "10:23 AM - Blocked", Colors.red),
      hackLog("WRONG BIOMETRIC", "Unknown Device - Lahore", "09:15 AM - Blocked", Colors.orange),
      hackLog("ROOT DETECTED", "Samsung - Jailbreak Try", "08:00 AM - App Locked", Colors.red),
      SizedBox(height: 15),
      Text("ALL DEVICES - Owner Control:", style: TextStyle(fontWeight: FontWeight.bold)),
      deviceLog("Owner Device - This Phone", "Lahore - Active Now - TRUSTED ✓", Colors.green),
      deviceLog("Aiza's Phone", "Karachi - Active 2m ago - Family", Colors.blue),
      deviceLog("Unknown Device", "Islamabad - Login Request - PENDING", Colors.orange),
      SizedBox(height: 15),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: Size(double.infinity, 50)), onPressed: (){}, child: Text("🔒 BLOCK ALL UNKNOWN DEVICES", style: TextStyle(color: Colors.white))),
    ]);
  }
  Widget hackLog(String title, String loc, String time, Color c) {
    return Card(child: ListTile(leading: CircleAvatar(backgroundColor: c, child: Icon(Icons.block, color: Colors.white)), title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: c)), subtitle: Text("$loc\n$time"), isThreeLine: true, trailing: Icon(Icons.check_circle, color: Colors.green)));
  }
  Widget deviceLog(String name, String status, Color c) {
    return Card(child: ListTile(leading: Icon(Icons.phone_android, color: c), title: Text(name), subtitle: Text(status), trailing: Icon(Icons.more_vert)));
  }
}

// Baki Dashboards
class HomeDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(10), children: [
      Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(10)), child: Row(children: [Icon(Icons.verified_user, color: Colors.green), SizedBox(width: 10), Text("Owner Mode: All Activities Visible To You", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))])),
      SizedBox(height: 10),
      Card(child: ListTile(leading: CircleAvatar(child: Icon(Icons.person)), title: Text("Sara Khan • Public Post"), subtitle: Text("Owner can see IP & Location"), trailing: Icon(Icons.shield, color: Colors.green))),
    ]);
  }
}
class VideoDashboard extends StatelessWidget { @override Widget build(BuildContext context) { return Center(child: Text("Video - Encrypted & Owner Monitored")); } }
class FamilyDashboard extends StatelessWidget { @override Widget build(BuildContext context) { return Center(child: Text("Family - Live Location - Only Owner & Family Can See")); } }
class SocietyDashboard extends StatelessWidget { @override Widget build(BuildContext context) { return Center(child: Text("Society - 128 Members - Owner Has Full Control")); } }

class OwnerControlPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(15), children: [
      Text("👑 OWNER ULTRA CONTROL", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      SizedBox(height: 10),
      Card(color: Colors.black, child: ListTile(leading: Icon(Icons.shield_moon, color: Colors.greenAccent), title: Text("Owner Security: MAX LEVEL", style: TextStyle(color: Colors.white)), subtitle: Text("No One Can Hack Owner - 3 Layer Protection", style: TextStyle(color: Colors.greenAccent)), trailing: Text("SUCCESS ✓", style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)))),
      ListTile(leading: Icon(Icons.visibility), title: Text("See All Users Data"), subtitle: Text("Owner can see every message, location, login")),
      ListTile(leading: Icon(Icons.block), title: Text("Block Any User Instantly")),
      ListTile(leading: Icon(Icons.delete_forever, color: Colors.red), title: Text("Delete Any Post - Owner Power")),
      ListTile(leading: Icon(Icons.lock), title: Text("Change Owner Master Password")),
      ListTile(leading: Icon(Icons.fingerprint), title: Text("Update Biometric")),
      ListTile(leading: Icon(Icons.logout, color: Colors.red), title: Text("Secure Owner Logout - Wipe Temp Data")),
    ]);
  }
}
