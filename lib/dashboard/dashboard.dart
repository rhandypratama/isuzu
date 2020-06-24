import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isuzu/catalog/catalog-home.dart';
import 'package:isuzu/credit/simulation.dart';
import 'package:isuzu/promo/detail-promo.dart';
import 'package:isuzu/utils/menu-item.dart';
import 'package:isuzu/utils/strings.dart';
import 'package:isuzu/utils/tips-content.dart';
import 'package:isuzu/utils/widget-model.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // _paypalCard(context),
                  _headerHome(context),
                  // _menuUtama(context),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: InkWell(
                          onTap: () {
                            navigationManager(context, CatalogHome(), isPushReplaced: false);
                          },
                          child: Container(
                            // alignment: Alignment(1.0, 1.0),
                            height: 55,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0))),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    "ISUZU CARS",
                                    style: TextStyle(fontSize: 20.0, color: Colors.white, fontFamily: "Oswald"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: InkWell(
                          onTap: () {
                            navigationManager(context, WebViewExample() , isPushReplaced: false);
                          },
                          child: Container(
                            height: 55,
                            width: 190,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                bottomLeft: Radius.circular(16.0))),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "CREDIT SIMULATION",
                                    style: TextStyle(fontSize: 20.0, color: Colors.white, fontFamily: "Oswald"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 10.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            dynamicText('DEAL PROMO',
                              fontSize: 16,
                              // fontWeight: FontWeight.w700,
                              fontFamily: "Oswald",
                              color: Colors.black87),
                            dynamicText('VIEW ALL',
                            fontSize: 12,
                            // fontWeight: FontWeight.w700,
                            fontFamily: "Oswald",
                            color: Colors.orange[800]
                              ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width / 2.4,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _tipsCard(
                                "PENTINGNYA TEKNOLOGI MIMAMORI PADA KENDARAAN KOMERSIAL",
                                "assets/images/promo/promo-1.jpg",
                                TipsContent.promo1),
                            _tipsCard(
                                "ISUZU KUASAI BANYAK PASAR GLOBAL",
                                "assets/images/promo/promo-2.jpg",
                                TipsContent.promo2),
                            _tipsCard(
                                "ISUZU SANGAT SIAP MENGHADAPI STANDAR EURO 4",
                                "assets/images/promo/promo-3.jpg",
                                TipsContent.promo3),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 10.0),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 10.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            dynamicText('NEWS & EVENT',
                              fontSize: 16,
                              // fontWeight: FontWeight.w700,
                              fontFamily: "Oswald",
                              color: Colors.black87),
                            dynamicText('VIEW ALL',
                              fontSize: 12,
                              // fontWeight: FontWeight.w700,
                              fontFamily: "Oswald",
                              color: Colors.orange[800]),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width / 2.4,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _tipsCard(
                                "PENTINGNYA TEKNOLOGI MIMAMORI PADA KENDARAAN KOMERSIAL",
                                "assets/images/promo/promo-3.jpg",
                                TipsContent.promo1),
                            _tipsCard(
                                "ISUZU KUASAI BANYAK PASAR GLOBAL",
                                "assets/images/promo/promo-1.jpg",
                                TipsContent.promo2),
                            _tipsCard(
                                "ISUZU SANGAT SIAP MENGHADAPI STANDAR EURO 4",
                                "assets/images/promo/promo-2.jpg",
                                TipsContent.promo3),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     Padding(
                  //       padding: EdgeInsets.only(left: 12.0, right: 10.0, bottom: 10.0),
                  //       child: Row(
                  //         children: <Widget>[
                  //           dynamicText('News & Event',
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w700,
                  //             color: Colors.black87),
                  //         ],
                  //       ),
                  //     ),
                  //     Container(
                  //       height: MediaQuery.of(context).size.width / 2.2,
                  //       child: ListView(
                  //         scrollDirection: Axis.horizontal,
                  //         children: <Widget>[
                  //           _tipsCard(
                  //               "Tips bekerja secara fleksibel di Paruhwaktu",
                  //               "assets/images/porsche.png",
                  //               TipsContent.kTipsFlexible),
                  //           _tipsCard(
                  //               "Pengenalan Customer Service dan bagaimana cara kerjanya",
                  //               "assets/images/porsche.png",
                  //               TipsContent.kTipsCS),
                  //           _tipsCard(
                  //               "Tips mendapatkan uang tambahan yang signifikan di Paruhwaktu",
                  //               "assets/images/porsche.png",
                  //               TipsContent.kTipsMoney),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // _mainMenu(context),
                  // _pencapaianText(),
                  // _pencapaian(),
                  // _activityList(),
                  
                ],
              ),
            ),
          ),
          _buildDraggableScrollableSheet()
          ]
        ),
      ),
    );
  }

  Widget _tipsCard(String title, String img, String tipsContent) {
    return InkWell(
      onTap: () {
        navigationManager(
          context,
          DetailPromo(
            title: title,
            img: img,
            tipsContent: tipsContent,
          ),
        );
      },
      child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 14.0),
          decoration: BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(width: 1.0, color: Colors.grey[300])
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black26,
              //       offset: Offset(0.0, 1.0),
              //       blurRadius: 3.0)
              // ]
              ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      ),
                      child: Image(
                        height: MediaQuery.of(context).size.width,
                        width: MediaQuery.of(context).size.width / 1.5,
                        image: AssetImage(img),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              // Positioned(
              //   bottom: 0.0,
              //   child: Container(
              //     height: 60,
              //     width: MediaQuery.of(context).size.width / 1.5,
              //     decoration: BoxDecoration(
              //         // borderRadius: BorderRadius.circular(8.0),
              //         // color: Colors.black.withOpacity(0.5)
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(14.0),
              //       child: dynamicText(title,
              //           fontSize: 12.0,
              //           color: Colors.white,
              //           // fontWeight: FontWeight.bold,
              //           overflow: TextOverflow.ellipsis,
              //           maxLines: 2),
              //     ),
              //   ),
              // ),
            ],
          )),
    );
  }
}



Stack _headerHome(context) {
  return Stack(
    children : <Widget> [
      Container(
        // height: MediaQuery.of(context).size.height,
        height: 200,
        color: Colors.white,
      ),
      Positioned(
        bottom: 40,
        right: 50,
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular((300.0)),
          ),
        ),
      ),
      
      Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  // alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 30),
                  height: 40.0,
                  // width: 100.0,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(40.0),
                    // border: Border.all(
                    //   color: Colors.white,
                    //   style: BorderStyle.solid,
                    //   width: 2.0,
                    // ),
                    image: DecorationImage(

                      image: AssetImage("assets/images/logo/logo.png"),
                          //  image: (provider.imgProfile == null) ? AssetImage(defaultPhotoProfile) : FileImage(provider.imgProfile),
//                       image: AssetImage(defaultPhotoProfile),
//                       image: FutureBuilder<File>(
//                         future: _getF(),
//                         builder: (context, AsyncSnapshot<File> snapshot) {
//                           if (snapshot.hasData) {
//                             return AssetImage();
//                           }
//                         },
//                       ),
                      fit: BoxFit.cover,
                      ),
                      ),
                    )

              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 15.0),
                    // child: 
                    // FutureBuilder<String>(
                    //   future: getDataUser(),
                    //   builder: (context, AsyncSnapshot<String> snapshot) {
                    //     if (snapshot.hasData) {
                    //       var data = json.decode(snapshot.data);
                    //       // return Text(defaultPhotoProfile,
                    //         return Text(data['data']['attributes']['full_name'],
                    //           style: TextStyle(
                    //             fontSize: 20.0,
                    //             color: Colors.white,
                    //           ),
                            
                    //       );
                    //     }
                    //     // return CircularProgressIndicator();
                    //     return Container();
                    //   }
                    // ),
                    // Text(
                    //   (dataAgent != null) ? dataAgent['data']['attributes']['full_name'].toString() : '',
                    //   style: TextStyle(
                    //     fontSize: 24.0,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ),
                  

                ]
              ),

            ],
          ),
          
          SizedBox(height: 20.0),
          
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                    // height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 14, bottom: 6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Hai, Partner ISUZU ...',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54, 
                                  fontFamily: 'Oswald',
                                ),
                              ),
                              // Text(
                              //   'Rp 0',
                              //   style: TextStyle(
                              //     fontSize: 18.0,
                              //     fontWeight: FontWeight.bold,
                              //     color: Colors.black54, 
                              //     // fontFamily: 'Montserrat',
                              //   ),
                              // ),
                              
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(height: 2),
                      Divider(),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Ingin langsung TEST DRIVE? Saat ini kalian bisa langsung untuk melakukan test drive dengan cepat',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.grey,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 40.0,),
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.black.withOpacity(0.4),
                              child: IconButton(
                                icon: Icon(Icons.arrow_forward_ios),
                                color: Colors.white,
                                onPressed: () {
                                  FlutterOpenWhatsapp.sendSingleMessage(GlobalVar.salesNumb, "Hallo, saya tertarik untuk melakukan test drive. Apakah bisa dibuatkan jadwalnya?");
                                },
                              ),
                            ),
                            

                          ],
                        ),
                      ),
                      SizedBox(height: 15,)
                            
                    ],

                  ),
                ),
              ),

            ),
          ),
          SizedBox(height: 10.0)
        ],
      )

    ],
  );
}

_mainMenu(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
    child: Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(6.0),
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: <Widget>[
              Container(
            // height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 14, bottom: 6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // IconButton(
                      //   icon: SvgPicture.asset(
                      //     "assets/images/icon-chat-group.svg",
                      //     height:40,
                      //     color: ParuhwaktuColors.Greeny,
                      //   ),
                      //   color: Colors.teal,
                      //   onPressed: () {}
                      // ),

                      Text(
                        'Mulai Kerja : ',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54, 
                          // fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(width: 1.0,),
                      Text(
                        'Telkomsel',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red, 
                          // fontFamily: 'Montserrat',
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 2),
              Divider(),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Pekerjaan ini akan otomatis dimulai ketika kalian mulai chat dengan pelanggan',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 40.0,),
                    Material(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.blueAccent.withOpacity(0.1),
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        color: Colors.teal,
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Ticket()));
                        },
                      ),
                    ),
                    

                  ],
                ),
              ),
              SizedBox(height: 15,)
                    
            ],

          ),
        ),
      ),

    ),
  );
}

Container _menuUtama(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 0),
    child: Container(
      decoration: BoxDecoration(
        // color: Colors.blue[800],
        borderRadius: BorderRadius.only(
          // bottomLeft: Radius.circular(8),
          // bottomRight: Radius.circular(8)
        )
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // MenuItem(
            //   images: 'assets/images/icon-desktop.svg',
            //   title: 'Pembelajaran',
            //   visibleBadge: true,
            //   totalBadge: "2",
            //   onTap: () {
            //     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ModulPembelajaran()));
            //   },
            // ),
            MenuItem(
              images: 'assets/images/icon-certificate.svg',
              title: 'Isuzu Cars',
              onTap: () {},
            ),
            MenuItem(
              images: 'assets/images/icon-target.svg',
              title: 'Test Drive',
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => TawaranKerja()));
              },
            ),
            MenuItem(
              images: 'assets/images/icon-chat-group.svg',
              title: 'Credit Simulation',
              onTap: () {},
            ),
          ],
        ),
      ),
    ),
  );
}

DraggableScrollableSheet _buildDraggableScrollableSheet() {
  return DraggableScrollableSheet(
    initialChildSize: 0.8,
    minChildSize: 0.5,
    maxChildSize: 0.8,
    builder: (BuildContext context, ScrollController scrollController) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.yellowAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)
          )
        ),
        child: Scrollbar(
          child: ListView.builder(
            controller: scrollController,
            itemCount: 20,
            itemBuilder: (BuildContext context, int idx) {
              return ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text('item $idx'),
              );
            }
          )
        ),
      );
    }
  );
}