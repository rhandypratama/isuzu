import 'package:flutter/material.dart';
// import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:isuzu/catalog/catalog-home.dart';
import 'package:isuzu/credit/simulation.dart';
// import 'package:isuzu/promo/detail-promo.dart';
// import 'package:isuzu/utils/menu-item.dart';
// import 'package:isuzu/utils/strings.dart';
// import 'package:isuzu/utils/tips-content.dart';
import 'package:isuzu/utils/widget-model.dart';

class Jj extends StatefulWidget {
  @override
  _JjState createState() => _JjState();
}

class _JjState extends State<Jj> {
  final _tabPage = <Widget>[
    Stack(
      children: <Widget>[
        
        SizedBox.expand(
          child: Container(
            // color: Colors.blueAccent,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/promo/2.jpg"),
                fit: BoxFit.cover,
              ),
            ),

          ) 
        ),
        _attandancePage()
      ],
    ),

    Stack(
      children: <Widget>[   
        SizedBox.expand(
          child: Container(
            // color: Colors.blueAccent,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/promo/2.jpg"),
                fit: BoxFit.cover,
              ),
            ),

          ) 
        ),
        _dashboardPage()
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              bottom: TabBar(
                indicatorWeight: 0,
                indicatorSize: TabBarIndicatorSize.label,
                // unselectedLabelColor: Colors.redAccent,
                indicator: BoxDecoration(
                  // gradient: LinearGradient(
                  //   colors: [Colors.redAccent, Colors.orangeAccent]
                  // ),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent.withOpacity(0.7)
                ),
                tabs: [
                  Tab(
                    child: Container(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.timer),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: dynamicText("Live Attendance")
                          )
                        ]
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.dashboard),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: dynamicText("Dashboard")
                          )
                        ]
                      ),
                    ),
                  ),
                ]
              ),
            ),
          ),
          body: Stack(
            children: <Widget>[
              
              SizedBox.expand(
                child: Container(
                  // color: Colors.blueAccent,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/promo/2.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),

                ) 
              ),
              _attandancePage()
            ],
          ),
        ),
      ),
    );
  }
}

DraggableScrollableSheet _attandancePage() {
  return DraggableScrollableSheet(
    initialChildSize: 0.87,
    minChildSize: 0.5,
    maxChildSize: 0.87,
    builder: (BuildContext context, ScrollController scrollController) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          )
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment(0.0, 0),
              height: 8.0,
              // color: Colors.black26, 
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  // side: BorderSide(color: Colors.red)
                ),
                color: Colors.black12,
                textColor: Colors.red,
                padding: EdgeInsets.all(0.0),
                onPressed: () {}, 
                child: null,
              )
            ),
                      
            SingleChildScrollView(
              controller: scrollController,
                child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      // SizedBox(height: 20,),
                      Container(
                        alignment: Alignment(0.0, -0.20),
                        height: 100.0,
                        child: dynamicText(
                          '09:00 AM - 06:00 PM',
                          fontSize: 29.0),
                      ),

                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, 90.0, 25.0, 0.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(blurRadius: 2.0, color: Colors.grey)
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                                  child: Text(
                                    'YOU HAVE',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(25.0, 40.0, 5.0, 25.0),
                                  child: Text(
                                    '206',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40.0),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 60.0),
                            Container(
                              height: 60.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent[100].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                child: dynamicText('Buy more', fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'MY COACHES',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0),
                        ),
                        Text(
                          'VIEW PAST SESSIONS',
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0),
                        )
                      ],
                    )),
                // SizedBox(height: 10.0),
                // GridView.count(
                //     crossAxisCount: 3,
                //     primary: false,
                //     crossAxisSpacing: 2.0,
                //     mainAxisSpacing: 4.0,
                //     shrinkWrap: true,
                //     children: <Widget>[
                //       _buildCard('Tom', 'Available', 1),
                //       _buildCard('Tom', 'Away', 2),
                //       _buildCard('Tom', 'Away', 3),

                //     ],
                //   )
                  
                  
                ]
              ),
            ),
          ],
        ),
      );
    }
  );
}

DraggableScrollableSheet _dashboardPage() {
  return DraggableScrollableSheet(
    initialChildSize: 0.87,
    minChildSize: 0.5,
    maxChildSize: 0.87,
    builder: (BuildContext context, ScrollController scrollController) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          )
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment(0.0, 0),
              height: 8.0,
              // color: Colors.black26, 
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  // side: BorderSide(color: Colors.red)
                ),
                color: Colors.black12,
                textColor: Colors.red,
                padding: EdgeInsets.all(0.0),
                onPressed: () {}, 
                child: null,
                
              )
              
            ),
                      
            SingleChildScrollView(
              controller: scrollController,
                child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      // SizedBox(height: 20,),
                      Container(
                        alignment: Alignment(0.0, -0.20),
                        height: 100.0,
                        child: Text(
                          'Get coaching',
                          style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, 90.0, 25.0, 0.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(blurRadius: 2.0, color: Colors.grey)
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                                  child: Text(
                                    'YOU HAVE',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(25.0, 40.0, 5.0, 25.0),
                                  child: Text(
                                    '206',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40.0),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 60.0),
                            Container(
                              height: 60.0,
                              width: 125.0,
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent[100].withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Center(
                                child: Text('Buy more',
                                    style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'MY COACHES',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0),
                        ),
                        Text(
                          'VIEW PAST SESSIONS',
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0),
                        )
                      ],
                    )),
                SizedBox(height: 10.0),
                GridView.count(
                    crossAxisCount: 2,
                    primary: false,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 4.0,
                    shrinkWrap: true,
                    children: <Widget>[
                      _buildCard('Tom', 'Available', 1),
                      _buildCard('Tom', 'Away', 2),

                    ],
                  )
                  
                  
                ]
              ),
            ),
          ],
        ),
      );
    }
  );
}

Widget _buildCard(String name, String status, int cardIndex) {
    return Card( 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      elevation: 7.0,
      child: Column(
        children: <Widget>[
          SizedBox(height: 12.0),
          Stack(
            children: <Widget>[
              Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.green,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'
                    )
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40.0),
                height: 20.0,
                width: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: status == 'Away' ? Colors.amber : Colors.green,
                  border: Border.all(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 2.0
                  )
                ),
              )
            ]),
              SizedBox(height: 8.0),
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                status,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: Colors.grey
                ),
              ),
              SizedBox(height: 15.0),
              Expanded(
                child: Container(
                  width: 175.0,
                  decoration: BoxDecoration(
                    color: status == 'Away' ? Colors.grey: Colors.green,
                    borderRadius: BorderRadius.only
                    (
                      bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)
                  ),
                ),
                child: Center(
                  child: Text('Request',
                  style: TextStyle(
                    color: Colors.white, fontFamily: 'Quicksand'
                  ),
                ),
              )
              )
              )
            ],
          ),
      margin: cardIndex.isEven? EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0):EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0)
     );
  }