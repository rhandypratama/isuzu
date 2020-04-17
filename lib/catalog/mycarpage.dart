import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter/services.dart';
import 'package:isuzu/utils/strings.dart';
import 'package:isuzu/utils/widget-model.dart';
import 'title_n_ImageWidget.dart';
import 'cardatamodel.dart';

class MyCarPage extends StatefulWidget {
  final CarDataModel carDataModel;
  MyCarPage(this.carDataModel);
  @override
  _MyCarPageState createState() => _MyCarPageState();
}

class _MyCarPageState extends State<MyCarPage> with SingleTickerProviderStateMixin {
  TabController tabController;
  int _counter = 4;
  String section = "mesin";
  String _platformVersion = 'Unknown';

  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }
  
  @override
  void initState() {
    super.initState();
    initPlatformState();
    tabController = TabController(vsync: this, initialIndex: 0, length: 8);
    tabController.addListener(() {
      if (tabController.index == 0) {
        setState(() { section = "mesin";});
      } else if (tabController.index == 1) {
        setState(() { section = "dimensi";});
      } else if (tabController.index == 2) {
        setState(() { section = "berat";});
      } else if (tabController.index == 3) {
        setState(() { section = "transmisi";});
      } else if (tabController.index == 4) {
        setState(() { section = "ban";});
      } else if (tabController.index == 5) {
        setState(() { section = "rem";});
      } else if (tabController.index == 6) {
        setState(() { section = "suspensi";});
      } else if (tabController.index == 7) {
        setState(() { section = "lain";});
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget showPage(bool isView, String model) {
    return Center(child: dynamicText("$model"),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.carDataModel.cardColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(
                Icons.arrow_back,
                color: widget.carDataModel.fontColor,
                size: 30,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TitleContainer(
                        EdgeInsets.only(left: 16),
                        widget.carDataModel.title,
                        42.0,
                        widget.carDataModel.fontColor),
                      TitleContainer(
                        EdgeInsets.only(left: 16),
                        widget.carDataModel.company,
                        20.0,
                        widget.carDataModel.fontColor),
                    ],
                  ),
                  
                  BookBtn(
                    title: "BOOK NOW", 
                    onPres: () {
                      FlutterOpenWhatsapp.sendSingleMessage(GlobalVar.salesNumb, "Hallo, saya tertarik dengan ${widget.carDataModel.title}");
                    }
                  ),
                ],
              ),
              
              
              Stack(
                children: <Widget>[
                  widget.carDataModel.heroTag == "image_car"
                      ? My360Image(counter: _counter, category: widget.carDataModel.category,)
                      : SingleImage(
                          widget.carDataModel.imageUrl, 
                          widget.carDataModel.category,
                          widget.carDataModel.heroTag),
                  widget.carDataModel.heroTag == "image_car"
                      ? Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 190),
                    child: Slider(
                      value: _counter.toDouble(),
                      min: 0.0,
                      max: 15.0,
                      activeColor: Colors.black,
                      inactiveColor: Colors.black,
                      onChanged: (double newValue) {
                        setState(() {
                          _counter = newValue.toInt();
                        });
                      },
                    ),
                  )
                      : Padding(
                    padding: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 190),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      PriceContainer(widget.carDataModel.price, widget.carDataModel.fontColor),
                      BookBtn(
                        title: "TEST DRIVE",
                        onPres: () {
                          FlutterOpenWhatsapp.sendSingleMessage(GlobalVar.salesNumb, "Hallo, saya tertarik untuk melakukan test drive ${widget.carDataModel.title}. Apakah bisa dibuatkan jadwalnya?");
                        }
                      ),

                    ],
                  ),

                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              // ExpansionTile(
              //   title: Padding(
              //     padding: const EdgeInsets.only(left: 0),
              //     child: Row(
              //       children: <Widget>[
              //         FeatureCard("power", "Power", widget.carDataModel.isWhite, widget.carDataModel.fontColor),
              //         dynamicText('ENGINE', fontFamily: 'Oswald', fontSize: 16, color: widget.carDataModel.fontColor),

              //       ],
              //     ),
              //   ),
              //   children: <Widget>[
              //     specUnit(
              //       "Model", 
              //       widget.carDataModel.mesinModel, 
              //       widget.carDataModel.fontColor
              //     ),
              //     specUnit(
              //       "Tipe", 
              //       widget.carDataModel.mesinTipe, 
              //       widget.carDataModel.fontColor
              //     ),
              //     specUnit(
              //       "Diameter x Langkah", 
              //       widget.carDataModel.mesinDiameter, 
              //       widget.carDataModel.fontColor
              //     ),
              //     specUnit(
              //       "Isi Silinder", 
              //       widget.carDataModel.mesinSilinder, 
              //       widget.carDataModel.fontColor
              //     ),
              //     specUnit(
              //       "Tenaga Maksimum", 
              //       widget.carDataModel.mesinTenagaMax, 
              //       widget.carDataModel.fontColor
              //     ),
              //     specUnit(
              //       "Torsi Maksimum", 
              //       widget.carDataModel.mesinTorsiMax, 
              //       widget.carDataModel.fontColor
              //     ),
              //   ],
              // ),
              DefaultTabController(
                initialIndex: 0,
                length: 8,
                child: Column(
                  children: <Widget>[
                    TabBar(
                      controller: tabController,
                      isScrollable: true,
                      indicatorColor: Colors.red,
                      indicatorWeight: 6.0,
                      labelColor: widget.carDataModel.fontColor,
                      labelStyle: TextStyle(fontSize: 14.0, fontFamily: "Oswald",),
                      tabs: <Widget>[
                        Tab(text: "MESIN"),
                        Tab(text: "DIMENSI"),
                        Tab(text: "BERAT"),
                        Tab(text: "TRANSMISI"),
                        Tab(text: "BAN & VELG"),
                        Tab(text: "REM"),
                        Tab(text: "SUSPENSI"),
                        Tab(text: "LAIN - LAIN"),
                      ],
                      
                    ),
                    // TabBarView(
                    //   // controller: tabController,
                    //   children: <Widget>[
                    //     Center(child: maintenancePage("Oops!", "The page under maintenance")),
                    //     Center(child: maintenancePage("Oops!", "The page under maintenance")),
                    //     Center(child: maintenancePage("Oops!", "The page under maintenance")),
                    //     Center(child: maintenancePage("Oops!", "The page under maintenance")),
                    //     Center(child: maintenancePage("Oops!", "The page under maintenance")),
                    //     Center(child: maintenancePage("Oops!", "The page under maintenance")),
                        
                    //   ],
                    // ),
                  ],
                ),

              ),
              // SizedBox(height: 10,),
              (section == "mesin") 
                ? Column(
                    children: <Widget>[
                      specUnit(
                        "Model", 
                        widget.carDataModel.mesinModel, 
                        widget.carDataModel.fontColor
                      ),
                      specUnit(
                        "Tipe", 
                        widget.carDataModel.mesinTipe, 
                        widget.carDataModel.fontColor
                      ),
                      specUnit(
                        "Diameter x Langkah", 
                        widget.carDataModel.mesinDiameter, 
                        widget.carDataModel.fontColor
                      ),
                      specUnit(
                        "Isi Silinder", 
                        widget.carDataModel.mesinSilinder, 
                        widget.carDataModel.fontColor
                      ),
                      specUnit(
                        "Tenaga Maksimum", 
                        widget.carDataModel.mesinTenagaMax, 
                        widget.carDataModel.fontColor
                      ),
                      specUnit(
                        "Torsi Maksimum", 
                        widget.carDataModel.mesinTorsiMax, 
                        widget.carDataModel.fontColor
                      ),
                    ],
                  )
                : (section == "dimensi")
                  ? Column(
                      children: <Widget>[
                        specUnit(
                          "Panjang", 
                          widget.carDataModel.dimensiPanjang, 
                          widget.carDataModel.fontColor
                        ),
                        specUnit(
                          "Lebar", 
                          widget.carDataModel.dimensiLebar, 
                          widget.carDataModel.fontColor
                        ),
                        specUnit(
                          "Tinggi", 
                          widget.carDataModel.dimensiTinggi, 
                          widget.carDataModel.fontColor
                        ),
                        specUnit(
                          "Jarak Sumbu", 
                          widget.carDataModel.dimensiJarakSumbu, 
                          widget.carDataModel.fontColor
                        ),
                        specUnit(
                          "Jarak Terendah Ke Tanah", 
                          widget.carDataModel.dimensiJarakTanah, 
                          widget.carDataModel.fontColor
                        ),
                        specUnit(
                          "Tempat Duduk", 
                          widget.carDataModel.dimensiTempatDuduk, 
                          widget.carDataModel.fontColor
                        ),
                        specUnit(
                          "Kapasitas Tangki", 
                          widget.carDataModel.dimensiKapasitasTangki, 
                          widget.carDataModel.fontColor
                        ),
                        specUnit(
                          "Radius Putar", 
                          widget.carDataModel.dimensiRadiusPutar, 
                          widget.carDataModel.fontColor
                        ),
                      ],
                    )
                  : (section == "berat")
                    ? Center(child: maintenancePage("Oops!", "The page under maintenance"))
                    : (section == "transmisi")
                      ? Center(child: maintenancePage("Oops!", "The page under maintenance"))
                      : (section == "ban")
                        ? Center(child: maintenancePage("Oops!", "The page under maintenance"))
                        : (section == "rem")
                          ? Center(child: maintenancePage("Oops!", "The page under maintenance"))
                          : (section == "suspensi")
                            ? Center(child: maintenancePage("Oops!", "The page under maintenance"))
                            : (section == "lain")
                              ? Center(child: maintenancePage("Oops!", "The page under maintenance"))
                              : (section == " ---- "),

              // TabBarView(
              //   // controller: tabController,
              //   children: <Widget>[
              //     Center(child: maintenancePage("Oops!", "The page under maintenance")),
              //     Center(child: maintenancePage("Oops!", "The page under maintenance")),
              //     Center(child: maintenancePage("Oops!", "The page under maintenance")),
              //     Center(child: maintenancePage("Oops!", "The page under maintenance")),
              //     Center(child: maintenancePage("Oops!", "The page under maintenance")),
              //     Center(child: maintenancePage("Oops!", "The page under maintenance")),
                  
              //   ],
              // ),

              // ExpansionTile(
              //   title: Padding(
              //     padding: const EdgeInsets.only(left: 0, top: 0, bottom: 0),
              //     child: Row(
              //       children: <Widget>[
              //         FeatureCard("power", "Power", widget.carDataModel.isWhite, widget.carDataModel.fontColor),
              //         dynamicText('ENGINE', fontFamily: 'Oswald', fontSize: 16, color: widget.carDataModel.fontColor),

              //       ],
              //     ),
              //   ),
              //   children: <Widget>[
              //     specUnit(
              //       "Model", 
              //       widget.carDataModel.mesinModel, 
              //       widget.carDataModel.fontColor
              //     ),
              //     specUnit(
              //       "Tipe", 
              //       widget.carDataModel.mesinTipe, 
              //       widget.carDataModel.fontColor
              //     ),
              //     specUnit(
              //       "Diameter x Langkah", 
              //       widget.carDataModel.mesinDiameter, 
              //       widget.carDataModel.fontColor
              //     ),
              //     specUnit(
              //       "Isi Silinder", 
              //       widget.carDataModel.mesinSilinder, 
              //       widget.carDataModel.fontColor
              //     ),
              //     specUnit(
              //       "Tenaga Maksimum", 
              //       widget.carDataModel.mesinTenagaMax, 
              //       widget.carDataModel.fontColor
              //     ),
              //     specUnit(
              //       "Torsi Maksimum", 
              //       widget.carDataModel.mesinTorsiMax, 
              //       widget.carDataModel.fontColor
              //     ),
              //   ],
              // ),
              
              // Spec(),
              // SizedBox(height: 10,),
            ],
          ),
        ),
    );
  }
}

class BookBtn extends StatelessWidget {
  final String title;
  final Function onPres;

  const BookBtn({Key key, this.title, this.onPres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPres,
      child: Container(
        alignment: Alignment(1.0, 1.0),
        height: 50,
        width: 140,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              dynamicText(
                title,
                fontSize: 18.0, 
                color: Colors.white,
                fontFamily: "Oswald"
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
