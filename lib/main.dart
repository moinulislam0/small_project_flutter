import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Fregment/AlarmFregment.dart';
import 'Fregment/BalanceFregment.dart';
import 'Fregment/ContactFregment.dart';
import 'Fregment/EmailFregment.dart';
import 'Fregment/HomeFregment.dart';
import 'Fregment/PersonFregment.dart';
import 'Fregment/SearchFregment.dart';
import 'Fregment/SettingFregment.dart';

void main(){
  runApp(
    MaterialApp(
      title: "Tab bar",
      home: TabBar1(),
    )
  );
}
class TabBar1 extends StatefulWidget {
  const TabBar1({super.key});

  @override
  State<TabBar1> createState() => _TabBar1State();
}

class _TabBar1State extends State<TabBar1> {
  MySnakBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
            title: Text("Tab Bar"),
            bottom: TabBar(
              isScrollable:true,
                tabs:[
                  Tab(icon: Icon(Icons.home),text: "Home",),
                  Tab(icon: Icon(Icons.search),text: "Search"),
                  Tab(icon: Icon(Icons.email),text: "Email"),
                  Tab(icon: Icon(Icons.contact_mail),text: "Contact"),
                  Tab(icon: Icon(Icons.settings),text: "Settings"),
                  Tab(icon: Icon(Icons.person),text: "Person"),
                  Tab(icon: Icon(Icons.alarm),text: "Alarm"),
                  Tab(icon: Icon(Icons.balance),text: "Balance"),
                ],
              labelColor: Colors.white, // Color of the selected tab
              unselectedLabelColor: Colors.grey, // Color of unselected tabs
              indicatorColor: Colors.orange, // Underline color of the selected tab
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Selected text style
              unselectedLabelStyle: TextStyle(fontSize: 14),
            ),

          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(

                    padding: EdgeInsets.all(0),
                    child:UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.blue
                        ),
                        accountName: Text("Moin"),
                        accountEmail: Text("moinul@gmail.com")) ),
                ListTile(leading: Icon(Icons.home),title: Text("Home"),onTap: (){MySnakBar("Home", context);},),
                ListTile(leading: Icon(Icons.contact_mail),title: Text("Contact"),onTap: (){MySnakBar("contact", context);}),
                ListTile(leading: Icon(Icons.settings),title: Text("setting"),onTap: (){MySnakBar("setting", context);})
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){MySnakBar("add", context);},child: Icon(Icons.add),),
          bottomNavigationBar: BottomNavigationBar(
              items:[
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.contact_mail),label: "Contact"),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting")
              ] ,
              onTap: (int index){
                if(index==0){
                  MySnakBar("Home", context);
                };
                if(index==1){
                MySnakBar("Contact", context);
                };
                if(index==2){
                MySnakBar("Setting", context);
                }
              },
          ),
          body: TabBarView(
              children: [
                HomeFregment(),
                SearchFregment(),
                EmailFregment(),
                ContactFregment(),
                SettingFregment(),
                PersonFregment(),
                AlarmFregment(),
                BalanceFregment(),
              ]),
        ));
  }
}
