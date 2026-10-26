import 'package:flutter/material.dart';
void main()=>runApp(const ToofanApp());
class ToofanApp extends StatelessWidget{const ToofanApp({super.key}); @override Widget build(BuildContext context){return MaterialApp(debugShowCheckedModeBanner:false, theme:ThemeData(scaffoldBackgroundColor:const Color(0xFFF5F7FB)), home:const ToofanHome());}}
class ToofanHome extends StatefulWidget{const ToofanHome({super.key}); @override State<ToofanHome> createState()=> _ToofanHomeState();}
class _ToofanHomeState extends State<ToofanHome>{
int _index=0;
List<Map<String,String>> posts=[{"name":"Sara Khan","time":"2 hours ago","title":"Community Cleanup","desc":"Join us this Saturday at Central Park for community cleanup drive!"}];
TextEditingController postCtrl=TextEditingController();
void msg(String t){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(t), backgroundColor:const Color(0xFF0E8ACB)));}

Widget homeFeed(){return ListView(padding:const EdgeInsets.all(12), children:[
Container(padding:const EdgeInsets.all(12), decoration:box(), child:Column(crossAxisAlignment:CrossAxisAlignment.start, children:[const Text("Your Story", style:TextStyle(fontWeight:FontWeight.bold)), const SizedBox(height:12), SingleChildScrollView(scrollDirection:Axis.horizontal, child:Row(children:[
story("Your Story", true, ()=>msg("Camera khulega - Story add karo")),
story("Aiza", false, ()=>msg("Aiza ki story")),
story("Bilal", false, ()=>msg("Bilal ki story")),
story("Zara", false, ()=>msg("Zara ki story")),
]))])),
const SizedBox(height:12),
Container(padding:const EdgeInsets.all(12), decoration:box(), child:InkWell(onTap:()=>showPostDialog(), child:Row(children:[const CircleAvatar(backgroundColor:Color(0xFF0E8ACB), child:Icon(Icons.person, color:Colors.white)), const SizedBox(width:10), const Expanded(child:Text("What's happening? Post likho...")), Icon(Icons.image, color:Colors.blue.shade400)]))),
const SizedBox(height:12),
...posts.map((p)=>Container(margin:const EdgeInsets.only(bottom:12), padding:const EdgeInsets.all(12), decoration:box(), child:Column(crossAxisAlignment:CrossAxisAlignment.start, children:[
Row(children:[const CircleAvatar(backgroundColor:Colors.purpleAccent, child:Icon(Icons.person)), const SizedBox(width:10), Column(crossAxisAlignment:CrossAxisAlignment.start, children:[Text(p["name"]!, style:const TextStyle(fontWeight:FontWeight.bold)), Text("${p["time"]} • Public", style:const TextStyle(color:Colors.grey, fontSize:12))])]),
const SizedBox(height:10), Text(p["title"]!, style:const TextStyle(fontSize:18, fontWeight:FontWeight.bold, color:Color(0xFF0B2E5B))), Text(p["desc"]!),
const SizedBox(height:12), Row(children:[
Expanded(child:ElevatedButton.icon(onPressed:()=>msg("Calling ${p["name"]}..."), icon:const Icon(Icons.call), label:const Text("Call"), style:btn())),
const SizedBox(width:10),
Expanded(child:ElevatedButton.icon(onPressed:(){setState(()=>_index=4); msg("Chat with ${p["name"]}");}, icon:const Icon(Icons.chat), label:const Text("Chat"), style:btn())),
])]))).toList()
]);}

void showPostDialog(){showDialog(context:context, builder:(c)=>AlertDialog(title:const Text("Create Post"), content:TextField(controller:postCtrl, decoration:const InputDecoration(hintText:"Kya ho raha hai?"), maxLines:3), actions:[TextButton(onPressed:()=>Navigator.pop(c), child:const Text("Cancel")), ElevatedButton(onPressed:(){if(postCtrl.text.isNotEmpty){setState(()=>posts.insert(0, {"name":"You","time":"Just now","title":"New Post","desc":postCtrl.text})); postCtrl.clear(); Navigator.pop(c); msg("Post Public Ho Gaya!");}}, child:const Text("Post"))]));}

Widget chatPage(){return ListView(padding:const EdgeInsets.all(12), children:[
const Text("Messages", style:TextStyle(fontSize:22, fontWeight:FontWeight.bold)),
ListTile(leading:const CircleAvatar(child:Icon(Icons.person)), title:const Text("Sara Khan"), subtitle:const Text("Community cleanup?"), trailing:IconButton(icon:const Icon(Icons.call, color:Color(0xFF0E8ACB)), onPressed:()=>msg("Calling Sara")) , onTap:()=>msg("Chat open with Sara")),
ListTile(leading:const CircleAvatar(child:Icon(Icons.person)), title:const Text("Aiza"), subtitle:const Text("Story dekhi?"), onTap:()=>msg("Chat with Aiza")),
]);}
Widget videoPage(){return Center(child:Column(mainAxisAlignment:MainAxisAlignment.center, children:[const Icon(Icons.video_library, size:80, color:Color(0xFF0E8ACB)), const Text("Video Feed", style:TextStyle(fontSize:22)), ElevatedButton(onPressed:()=>msg("Video play hoga"), child:const Text("Play Video"))]));}
Widget explorePage(){return Center(child:Column(mainAxisAlignment:MainAxisAlignment.center, children:[const Icon(Icons.explore, size:80, color:Color(0xFF0E8ACB)), const Text("Explore Public Posts"), ElevatedButton(onPressed:()=>setState(()=>_index=0), child:const Text("Go to Home"))]));}
Widget familyPage(){return Center(child:Column(mainAxisAlignment:MainAxisAlignment.center, children:[const Icon(Icons.family_restroom, size:80, color:Color(0xFF0E8ACB)), const Text("Family Members"), ElevatedButton(onPressed:()=>msg("Family group ban gaya"), child:const Text("Create Family Group"))]));}
Widget societyPage(){return Center(child:Column(mainAxisAlignment:MainAxisAlignment.center, children:[const Icon(Icons.groups, size:80, color:Color(0xFF0E8ACB)), const Text("Society - Sab log yahan"), ElevatedButton(onPressed:()=>msg("Society joined"), child:const Text("Join Society"))]));}
Widget profilePage(){return Center(child:Column(mainAxisAlignment:MainAxisAlignment.center, children:[const CircleAvatar(radius:50, child:Icon(Icons.person, size:50)), const SizedBox(height:10), const Text("Your Profile - Public App", style:TextStyle(fontSize:18, fontWeight:FontWeight.bold)), ElevatedButton(onPressed:()=>msg("Logout"), child:const Text("Logout"))]));}

@override Widget build(BuildContext context){
Widget page; switch(_index){case 0: page=homeFeed(); break; case 1: page=videoPage(); break; case 2: page=explorePage(); break; case 3: page=familyPage(); break; case 4: page=chatPage(); break; case 5: page=profilePage(); break; default: page=homeFeed();}
return Scaffold(body:SafeArea(child:Column(children:[
Container(color:Colors.white, padding:const EdgeInsets.symmetric(horizontal:12, vertical:10), child:Row(children:[
const Text("🌪️ TOOFAN", style:TextStyle(fontSize:22, fontWeight:FontWeight.bold, color:Color(0xFF0E8ACB))), const Spacer(),
topIcon(Icons.call, ()=>msg("Call List")), topIcon(Icons.videocam, ()=>msg("Video Call")), topIcon(Icons.search, ()=>setState(()=>_index=2)), topIcon(Icons.chat_bubble_outline, ()=>setState(()=>_index=4)), topIcon(Icons.notifications, ()=>msg("No notifications")), topIcon(Icons.account_circle_outlined, ()=>setState(()=>_index=5)),
])),
Expanded(child:page),
Container(color:Colors.white, padding:const EdgeInsets.symmetric(vertical:8), child:Row(mainAxisAlignment:MainAxisAlignment.spaceAround, children:[
bottom(Icons.home, "Home", 0), bottom(Icons.video_library_outlined, "Video", 1), bottom(Icons.explore_outlined, "Explore", 2), bottom(Icons.family_restroom, "Family", 3), bottom(Icons.groups_outlined, "Society", 4), bottom(Icons.person_outline, "Profile", 5),
]))
])),);
}
Widget topIcon(IconData i, VoidCallback t)=>Padding(padding:const EdgeInsets.symmetric(horizontal:4), child:InkWell(onTap:t, child:Icon(i, color:const Color(0xFF0E8ACB), size:22)));
BoxDecoration box()=>BoxDecoration(color:Colors.white, borderRadius:BorderRadius.circular(16), boxShadow:[BoxShadow(color:Colors.black.withOpacity(0.05), blurRadius:10)]);
ButtonStyle btn()=>ElevatedButton.styleFrom(backgroundColor:const Color(0xFF0E8ACB), foregroundColor:Colors.white, shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(25)));
Widget story(String n, bool add, VoidCallback t)=>Padding(padding:const EdgeInsets.only(right:14), child:InkWell(onTap:t, child:Column(children:[Container(padding:const EdgeInsets.all(2), decoration:BoxDecoration(shape:BoxShape.circle, border:Border.all(color:const Color(0xFF0E8ACB), width:2)), child:CircleAvatar(radius:26, backgroundColor:Colors.grey.shade200, child:Icon(add?Icons.add:Icons.person, color:const Color(0xFF0E8ACB)))), const SizedBox(height:4), Text(n, style:const TextStyle(fontSize:12))])) );
Widget bottom(IconData ic, String lb, int idx){bool a=_index==idx; return InkWell(onTap:()=>setState(()=>_index=idx), child:Column(children:[Icon(ic, color:a?const Color(0xFF0E8ACB):Colors.grey), Text(lb, style:TextStyle(fontSize:11, color:a?const Color(0xFF0E8ACB):Colors.grey, fontWeight:a?FontWeight.bold:FontWeight.normal))]));}
}
