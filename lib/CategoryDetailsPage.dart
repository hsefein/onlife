import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:onelife3/CategoryListPage.dart';
import 'package:onelife3/DataModel.dart';

class CategoryDetailsPage extends StatelessWidget {

  final DataModel dataModel;
  CategoryDetailsPage(this.dataModel);

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
          title: Text((dataModel.name)),
          ),
          body: Container(
            child: ListView(
//          mainAxisAlignment: MainAxisAlignment.start,
//          mainAxisSize: MainAxisSize.max,
//          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           new ClipRRect(
             child: new Image.network(dataModel.img_url),
             borderRadius: BorderRadius.circular(0.0),
           ),
            new Padding(
                padding: EdgeInsets.all(16.0)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               new Text((dataModel.name).toUpperCase(),
                   style: TextStyle(color: Colors.white),
                  // style: Theme.of(context).textTheme.title,
                ),
                new SizedBox(height: 16.0),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // new Icon(Icons.hotel, color: Colors.amber, size: 50.0),
                    // new Icon(Icons.hot_tub, color: Colors.amber, size: 50.0,),
                    // new Icon(Icons.euro_symbol, color: Colors.amber, size: 50.0,)
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // new Text("2"),
                    // new Text("3"),
                    // new Text("280,000")
                  ],
                ),
               new Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Text(dataModel.full_desc, style: TextStyle(fontSize: 16.0, color: Colors.white))),
               // new Padding(
               //     padding: EdgeInsets.all(8.0),
               //     child: Text(user.description, style: TextStyle(fontSize: 16.0))),
              ],
            ),
          ],
        ),
      ),
    );

  }
}