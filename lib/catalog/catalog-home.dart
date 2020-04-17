import 'package:flutter/material.dart';
import 'package:isuzu/catalog/car-page.dart';
import 'package:isuzu/utils/widget-model.dart';

class CatalogHome extends StatefulWidget {
  @override
  _CatalogHomeState createState() => _CatalogHomeState();
}

class _CatalogHomeState extends State<CatalogHome> with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool showFab;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 6);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            iconSize: 30.0,
            padding: EdgeInsets.all(0.0),
            icon: Icon(Icons.arrow_back, color: Colors.black87,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: dynamicText("ISUZU CARS", color: Colors.black87, fontFamily: "Oswald", fontSize: 20),
          elevation: 0,
          backgroundColor: Colors.white,
          // centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.red,
            indicatorWeight: 6.0,
            labelColor: Colors.black87,
            labelStyle: TextStyle(fontSize: 14.0, fontFamily: "Oswald"),
            tabs: <Widget>[
              Tab(text: "MPV"),
              Tab(text: "SUV"),
              Tab(text: "PICK UP"),
              Tab(text: "COMMERCIAL"),
              Tab(text: "TRUCK"),
              Tab(text: "TRACTOR"),
            ],
          ),

        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Column(
              children: <Widget>[
                CarPage(),
              ],
            ),
            Center(child: maintenancePage("Oops!", "The page under maintenance")),
            Center(child: maintenancePage("Oops!", "The page under maintenance")),
            Center(child: maintenancePage("Oops!", "The page under maintenance")),
            Center(child: maintenancePage("Oops!", "The page under maintenance")),
            Center(child: maintenancePage("Oops!", "The page under maintenance")),
            
          ],
        ),
      ),
    );
  }
}