import 'package:flutter/material.dart';
void main(){runApp(const ToofanApp());}
class ToofanApp extends StatelessWidget{
const ToofanApp({super.key});
@override
Widget build(BuildContext context){
return MaterialApp(
title:'TOOFAN',
debugShowCheckedModeBanner:false,
theme:ThemeData(primarySwatch:Colors.red,useMaterial3:true),
home:const ToofanHome());
}}
class ToofanHome extends StatefulWidget{
const ToofanHome({super.key});
@override
State<ToofanHome> createState()=>_ToofanHomeState();
}
class _ToofanHomeState extends State<ToofanHome>{
int _index=0;
final pages=const[ToofanDashboard(),ToofanNews(),ToofanProfile()];
@override
Widget build(BuildContext context){
return Scaffold(
body:pages[_index],
bottomNavigationBar:NavigationBar(
selectedIndex:_index,
onDestinationSelected:(i)=>setState(()=>_index=i),
destinations:const[
NavigationDestination(icon:Icon(Icons.home),label:'Home'),
NavigationDestination(icon:Icon(Icons.thunderstorm),label:'Toofan'),
NavigationDestination(icon:Icon(Icons.person),label:'Profile'),
]));
}}
class ToofanDashboard extends StatelessWidget{
const ToofanDashboard({super.key});
@override
Widget build(BuildContext context){
return Scaffold(
appBar:AppBar(title:const Text('TOOFAN 🌪️',style:TextStyle(fontWeight:FontWeight.bold)),backgroundColor:Colors.red,foregroundColor:Colors.white,centerTitle:true),
body:ListView(padding:const EdgeInsets.all(16),children:[
Container(padding:const EdgeInsets.all(20),decoration:BoxDecoration(gradient:const LinearGradient(colors:[Colors.red,Colors.orange]),borderRadius:BorderRadius.circular(20)),child:const Column(children:[Icon(Icons.thunderstorm,size:60,color:Colors.white),SizedBox(height:10),Text('TOOFAN APP',style:TextStyle(fontSize
