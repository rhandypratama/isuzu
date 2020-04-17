import 'package:flutter/material.dart';
import 'package:isuzu/utils/widget-model.dart';

class Spec extends StatefulWidget {
  @override
  _SpecState createState() => _SpecState();
}

class _SpecState extends State<Spec> with SingleTickerProviderStateMixin {
  TabController tabController;
  
  void _handleTabSelection() {
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 6);
    tabController.addListener(_handleTabSelection);

    

  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
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
              controller: tabController,
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
            controller: tabController,
            children: <Widget>[
              dynamicText("ok"),
              dynamicText("ok"),
              dynamicText("ok"),
              dynamicText("ok"),
              dynamicText("ok"),
              dynamicText("ok"),
            ],
          ),
        ),
    );
  }
}