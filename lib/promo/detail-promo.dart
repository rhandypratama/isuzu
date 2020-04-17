import 'package:flutter/material.dart';
import 'package:isuzu/utils/widget-model.dart';

class DetailPromo extends StatefulWidget {
  // static final String path = "lib/src/pages/misc/sliver_appbar.dart";
  final String title;
  final String img;
  final String tipsContent;

  const DetailPromo({Key key, this.title, this.img, this.tipsContent}) : super(key: key);

  @override
  _DetailPromoState createState() => _DetailPromoState();
}

class _DetailPromoState extends State<DetailPromo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black87,
            expandedHeight: 180.0,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(widget.img, fit: BoxFit.fill),
            ),
            leading: Material(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.black.withOpacity(0.7),
              child: IconButton(
                icon: Icon(Icons.arrow_back, size: 30,),
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            elevation: 0.0,
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: dynamicText(widget.title, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: dynamicText(widget.tipsContent,
                      fontSize: 16.0,
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
