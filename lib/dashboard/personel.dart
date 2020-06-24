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

class Personel extends StatefulWidget {
  @override
  _PersonelState createState() => _PersonelState();
}

class _PersonelState extends State<Personel> {
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
        length: 3,
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
                      width: 260,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 4),
                            child: Icon(Icons.timer, size: 14,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: dynamicText("Attendance", fontSize: 13, fontWeight: FontWeight.bold)
                          )
                        ]
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 240,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 4),
                            child: Icon(Icons.dashboard, size: 14,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: dynamicText("Dashboard", fontSize: 14, fontWeight: FontWeight.bold)
                          )
                        ]
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 240,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 4),
                            child: Icon(Icons.settings, size: 14,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: dynamicText("Setting", fontSize: 14, fontWeight: FontWeight.bold)
                          )
                        ]
                      ),
                    ),
                  ),
                  
                ]
              ),
            ),
          ),
          
          // body: TabBarView(children: _tabPage)
          
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
              // _attandancePage()
              _dashboardPage()
            ],
          ),
        
        ),
      ),
    );
  }
}

DraggableScrollableSheet _attandancePage() {
  return DraggableScrollableSheet(
    initialChildSize: 0.55,
    minChildSize: 0.55,
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
        child: SingleChildScrollView(
          controller: scrollController,
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
                        
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(blurRadius: 2.0, color: Colors.grey)
                    ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: dynamicText(
                        '09:00 AM - 06:00 PM',
                        fontSize: 29.0),
                    ),        
                    Container(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: dynamicText(
                        'WORKING HOURS',
                        fontFamily: 'Quicksand',
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.pin_drop, color: Colors.green),
                          SizedBox(width: 20,),
                          Expanded(
                            child: dynamicText(
                              "Jalan Tebet Barat 1 No. 2 RT/RW 001/002 Tebet - Jakarta Selatan - DKI Jakarta - Indonesia",
                              overflow: TextOverflow.fade,
                              color: Colors.black54,
                              fontSize: 14
                          ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 0, bottom: 20),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          
                          ButtonBar(
                            alignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: (){},
                                child: dynamicText("Check In", fontSize: 20),
                                color: Colors.blue,
                                elevation: 0,
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                              SizedBox(width: 2),
                              RaisedButton(
                                onPressed: () {},
                                child: dynamicText("Check Out", fontSize: 20),
                                color: Colors.redAccent,
                                elevation: 0,
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                    ),

                  ]
                ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 20),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          dynamicText(
                            'TODAY ATTENDANCE ACTIVITY',
                            color: Colors.grey,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          dynamicText(
                            'VIEW ALL',
                            color: Colors.green,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ), 
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.access_time, size: 40, color: Colors.blue,),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  dynamicText(
                                    'CHECK IN',
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                  dynamicText(
                                    ' - 20/06/2020 09:34 AM',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Container(
                                width: MediaQuery.of(context).size.width - 100,
                                child: dynamicText(
                                  'Jalan Tebet Barat 1 No. 2 RT/RW 001/002 Tebet - Jakarta Selatan - DKI Jakarta - Indonesia',
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  overflow: TextOverflow.fade
                                )
                              ),
                            ],
                          ),
                           
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.access_time, size: 40, color: Colors.redAccent,),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  dynamicText(
                                    'CHECK OUT',
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                  dynamicText(
                                    ' - 20/06/2020 09:34 AM',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Container(
                                width: MediaQuery.of(context).size.width - 100,
                                child: dynamicText(
                                  'Jalan Tebet Barat 1 No. 2 RT/RW 001/002 Tebet - Jakarta Selatan - DKI Jakarta - Indonesia',
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  overflow: TextOverflow.fade
                                )
                              ),
                            ],
                          ),
                           
                        ],
                      ),
                    ),

                  ],
                )
              ),

              // Container(
              //   padding: const EdgeInsets.all(20.0),
              //   child: ListView.builder(
              //     itemCount: 3,
              //     itemBuilder: (BuildContext context, int index) { 
              //       return Card(
              //         child: dynamicText("$index"),
              //       );
              //     },
              //   ),
              // ),

            ],
          ),
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