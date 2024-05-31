import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: DefaultTabController(length: 4, child: Home()),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  TextEditingController _searchText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Center(
          child: TabBarView(
            children: [
              _tabBarViewItem(Icons.home, "Mon appBar a moi"),
              _tabBarViewItem(Icons.group, "Group"),
              _tabBarViewItem(Icons.notifications, "Notification"),
              _tabBarViewItem(Icons.menu, "Menu"),
            ],
          ),
        ));
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(150),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: _boxDecoration(),
        child: SafeArea(
          child: Column(children: [
            _topBar(),
            SizedBox(
              height: 10,
            ),
            _searchBox(),
            _tabBar(),
          ]),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.teal.shade300,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ));
  }

  Widget _topBar() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CircleAvatar(
        radius: 20,
        //backgroundImage: AssetImage('assets/logo.png'),
      ),
      Expanded(
        child: Text(
          "My AppBar",
          textAlign: TextAlign.center,
        ),
      ),
      CircleAvatar(
        radius: 20,
        //backgroundImage: AssetImage('assets/profile.jpg'),
      )
    ]);
  }

  Widget _searchBox() {
    return SizedBox(
      height: 35,
      child: TextFormField(
        controller: _searchText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Recherher...',
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search),
          suffixIcon: InkWell(
            child: Icon(Icons.close),
            onTap: () {
              _searchText.clear();
            },
          ),
        ),
      ),
    );
  }

  Widget _tabBar() {
    return Expanded(
        child: TabBar(
      labelPadding: EdgeInsets.all(0),
      labelColor: Colors.white,
      indicatorColor: Colors.white,
      unselectedLabelColor: Colors.teal.shade800,
      tabs: [
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.home),
          text: 'Home',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.group),
          text: 'Group',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.notifications),
          text: 'Notification',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.menu),
          text: 'Menu',
        ),
      ],
    ));
  }

  Widget _tabBarViewItem(IconData icon, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 40),
        )
      ],
    );
  }
}
