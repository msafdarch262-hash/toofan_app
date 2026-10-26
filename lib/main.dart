import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main()=>runApp(const ToofanApp());
class ToofanApp extends StatelessWidget{const ToofanApp({super.key}); @override Widget build(BuildContext c){return MaterialApp(debugShowCheckedModeBanner:false, home:const ToofanHome());}}

class ToofanHome extends StatefulWidget{const ToofanHome({super.key}); @override State<ToofanHome> createState()=>_ToofanHomeState();}
class _ToofanHomeState extends State<ToofanHome>{
int idx=0;
List<Map<String,String>> users=[
{"name":"Ali Khan","phone":"03001234567"},
{"name":"Sara Public","phone":"03009876543"},
];
List<String> videos=["Public Video 1","Public Video 2","Public Video 3"];
List<Map<String,String>> posts=[{"name":"Toofan Official","text":"Welcome to Toofan - Yahan har banda call, video call, chat aur videos dekh sakta hai!"}];

Future<void> voiceCall(String phone) async {
  final Uri url = Uri(scheme: 'tel', path: phone);
  if(await canLaunchUrl(url)) await launchUrl(url);
}

void addUser(){
TextEditingController n=TextEditingController(), p=TextEditingController();
showDialog(context:context, builder:(c)=>AlertDialog(
title:const Text("Naya Banda Add Karo - Public"),
content:Column(mainAxisSize:MainAxisSize.min, children:[
TextField(controller:n, decoration:const InputDecoration(labelText:"Naam")),
TextField(controller:p, decoration:const InputDecoration(labelText:"Phone Number"), keyboardType:TextInputType.phone),
]),
actions:[ElevatedButton(onPressed:(){if(n.text.isNotEmpty && p.text.isNotEmpty){setState(()=>users.add({"name":n.text, "phone":p.text})); Navigator.pop(c);}}, child:const Text("Add to Toofan Public"))]));
}

Widget homePage(){
return ListView(padding:const EdgeInsets.all(12), children:[
// Video Section - Public Videos
Container(padding:const EdgeInsets.all(12), decoration:BoxDecoration(color:Colors.white, borderRadius:BorderRadius.circular(12)), child:Column(crossAxisAlignment:CrossAxisAlignment.start, children:[
const Text("Public Videos - Sab Dekh Sakte Hain", style:TextStyle(fontWeight:FontWeight.bold, fontSize:16)),
const SizedBox(height:10),
SizedBox(height:180, child:ListView(scrollDirection:Axis.horizontal, children:videos.map((v)=>Container(width:140, margin:const EdgeInsets.only(right:10), decoration:BoxDecoration(color:Colors.black, borderRadius:BorderRadius.circular(12)), child:InkWell(onTap:()=>Navigator.push(context, MaterialPageRoute(builder:(_)=>VideoPlay(title:v))), child:Column(mainAxisAlignment:MainAxisAlignment.center, children:[const Icon(Icons.play_circle_fill, color:Colors.white, size:50), Text(v, style:const TextStyle(color:Colors.white))])))).toList())),
])),
const SizedBox(height:12),
// Posts
...posts.map((po)=>Card(child:ListTile(title:Text(po["name"]!, style:const TextStyle(fontWeight:FontWeight.bold)), subtitle:Text(po["text"]!)))).toList()
]);
}

Widget callsPage(){
return Scaffold(appBar:AppBar(title:const Text("Toofan - Calls - Her Banda Call Kar Sake"), backgroundColor:Colors.white, foregroundColor:const Color(0xFF0E8ACB)), floatingActionButton:FloatingActionButton(onPressed:addUser, backgroundColor:const Color(0xFF0E8ACB), child:const Icon(Icons.person_add)), body:ListView(children:users.map((u)=>Card(margin:const EdgeInsets.all(8), child:ListTile(leading:const CircleAvatar(backgroundColor:Color(0xFF0E8ACB), child:Icon(Icons.person, color:Colors.white)), title:Text(u["name"]!), subtitle:Text(u["phone"]!), trailing:Row(mainAxisSize:MainAxisSize.min, children:[
IconButton(icon:const Icon(Icons.call, color:Colors.green, size:28), onPressed:()=>voiceCall(u["phone"]!)),
IconButton(icon:const Icon(Icons.videocam, color:Color(0xFF0E8ACB), size:28), onPressed:()=>Navigator.push(context, MaterialPageRoute(builder:(_)=>VideoCallPage(name:u["name"]!)))),
])))).toList()));
}

Widget chatsPage(){
return Scaffold(appBar:AppBar(title:const Text("Toofan - Chats"), backgroundColor:Colors.white), body:ListView(children:users.map((u)=>ListTile(leading:const CircleAvatar(child:Icon(Icons.person)), title:Text(u["name"]!), subtitle:const Text("Tap to chat - Public chat"), onTap:()=>Navigator.push(context, MaterialPageRoute(builder:(_)=>ChatPage(name:u["name"]!))), trailing:IconButton(icon:const Icon(Icons.chat, color:Color(0xFF0E8ACB)), onPressed:()=>Navigator.push(context, MaterialPageRoute(builder:(_)=>ChatPage(name:u["name"]!)))))).toList()));
}

@override Widget build(BuildContext context){
List<Widget> pages=[homePage(), chatsPage(), callsPage(), const Center(child:Text("Toofan Profile - Public App", style:TextStyle(fontSize:20, fontWeight:FontWeight.bold)))];
return Scaffold(
appBar: idx==0 ? AppBar(title:const Text("🌪️ TOOFAN - Public App", style:TextStyle(color:Color(0xFF0E8ACB), fontWeight:FontWeight.bold)), backgroundColor:Colors.white, actions:[IconButton(icon:const Icon(Icons.person_add, color:Color(0xFF0E8ACB)), onPressed:addUser)]) : null,
body:pages[idx],
bottomNavigationBar:BottomNavigationBar(currentIndex:idx, onTap:(i)=>setState(()=>idx=i), selectedItemColor:const Color(0xFF0E8ACB), unselectedItemColor:Colors.grey, type:BottomNavigationBarType.fixed, items:const[
BottomNavigationBarItem(icon:Icon(Icons.home), label:"Home Videos"),
BottomNavigationBarItem(icon:Icon(Icons.chat_bubble), label:"Chat"),
BottomNavigationBarItem(icon:Icon(Icons.call), label:"Voice & Video Call"),
BottomNavigationBarItem(icon:Icon(Icons.person), label:"Profile"),
]),
);
}
}

class ChatPage extends StatefulWidget{final String name; const ChatPage({super.key, required this.name}); @override State<ChatPage> createState()=>_ChatPageState();}
class _ChatPageState extends State<ChatPage>{List<String> msgs=[]; TextEditingController c=TextEditingController(); @override Widget build(BuildContext context){return Scaffold(appBar:AppBar(title:Text("Chat with ${widget.name} - Public")), body:Column(children:[Expanded(child:ListView(children:msgs.map((e)=>Align(alignment:Alignment.centerRight, child:Container(margin:const EdgeInsets.all(8), padding:const EdgeInsets.all(12), decoration:BoxDecoration(color:const Color(0xFF0E8ACB), borderRadius:BorderRadius.circular(12)), child:Text(e, style:const TextStyle(color:Colors.white))))).toList())), Row(children:[Expanded(child:Padding(padding:const EdgeInsets.all(8), child:TextField(controller:c, decoration:const InputDecoration(hintText:"Public message likho...")))), IconButton(icon:const Icon(Icons.send, color:Color(0xFF0E8ACB)), onPressed:(){if(c.text.isNotEmpty){setState(()=>msgs.add(c.text)); c.clear();}})])]));}}

class VideoCallPage extends StatelessWidget{final String name; const VideoCallPage({super.key, required this.name}); @override Widget build(BuildContext context){return Scaffold(backgroundColor:Colors.black, body:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center, children:[const CircleAvatar(radius:60, child:Icon(Icons.person, size:60)), const SizedBox(height:15), Text("Video Call with $name", style:const TextStyle(color:Colors.white, fontSize:20)), const Text("Toofan Public Video Call", style:TextStyle(color:Colors.white70)), const SizedBox(height:30), Row(mainAxisAlignment:MainAxisAlignment.center, children:[CircleAvatar(backgroundColor:Colors.grey, radius:30, child:IconButton(icon:const Icon(Icons.mic_off), onPressed:(){})), const SizedBox(width:20), CircleAvatar(backgroundColor:Colors.red, radius:30, child:IconButton(icon:const Icon(Icons.call_end, color:Colors.white), onPressed:()=>Navigator.pop(context)))])])));}}

class VideoPlay extends StatelessWidget{final String title; const VideoPlay({super.key, required this.title}); @override Widget build(BuildContext context){return Scaffold(backgroundColor:Colors.black, appBar:AppBar(title:Text(title), backgroundColor:Colors.black), body:const Center(child:Column(mainAxisAlignment:MainAxisAlignment.center, children:[Icon(Icons.play_circle, color:Colors.white, size:100), SizedBox(height:10), Text("Public Video Playing...", style:TextStyle(color:Colors.white, fontSize:18)), Text("Her banda dekh sakta hai", style:TextStyle(color:Colors.white70))])));}}
