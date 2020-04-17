import 'package:flutter/material.dart';
import 'package:isuzu/catalog/cardatamodel.dart';
import 'package:isuzu/catalog/cardlistdata.dart';
import 'package:isuzu/catalog/mycarpage.dart';
import 'package:isuzu/catalog/title_n_ImageWidget.dart';

class CarPage extends StatefulWidget {
  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: ListView.builder(
          key: const PageStorageKey<String>("MySearchKey"),
          itemCount: cardListData.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index){
            return CarCard(cardListData[index]);

          },
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final CarDataModel _carDataModel;
  CarCard(this._carDataModel);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyCarPage(_carDataModel)),
        );
      },
      child: Container(
        // margin: EdgeInsets.only(bottom: 30.0, left: 20, right: 20),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.only(topLeft: Radius.circular(28.0)),
        // ),
        child: Card(
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(topLeft: Radius.circular(28.0))
          // ),
          color: _carDataModel.cardColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Hero(
                child: Image.asset('assets/images/${_carDataModel.category}/${_carDataModel.imageUrl}'),
                tag: _carDataModel.heroTag,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TitleContainer(
                          EdgeInsets.only(top: 0, left: 2), 
                          _carDataModel.title,
                          30.0, 
                          _carDataModel.fontColor),
                        TitleContainer(
                          EdgeInsets.only(top: 0, left: 2),
                          _carDataModel.company, 
                          16.0, 
                          _carDataModel.fontColor),
                      ],
                    ),
                    TitleContainer(
                      EdgeInsets.only(left: 16), 
                      "\IDR ${_carDataModel.price}", 
                      20.0, 
                      _carDataModel.fontColor),
                  ],
                ),
              ),
              Container(
                alignment: Alignment(1.0, 1.0),
                height: 58,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(0.0))),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        "Detail ",
                        style: TextStyle(fontSize: 22.0, color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
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
            ],
          ),
        ),
      ),
    );
  }
}