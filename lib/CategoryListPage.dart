import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onelife3/DataModel.dart';
import 'package:onelife3/CategoryDetailsPage.dart';
import 'package:onelife3/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';


class CategoryListPage extends StatelessWidget {
  final GoogleSignInAccount user;

  CategoryListPage({
    Key? key,
    required this.user,
    }) : super(key: key);

    Future<List<DataModel>> _getCategories() async {
    var data = await http.get(Uri.parse("https://eu-west-1.aws.webhooks.mongodb-realm.com/api/client/v2.0/app/connect-fgbtt/service/getList/incoming_webhook/get_api"));
        // headers: {HttpHeaders.authorizationHeader: "diT9Q1nSVis9BdUJQhBNWzDLKzb7XwfgudrsLlT1aqI="});
    var jsonData = json.decode(data.body);

    List<DataModel> dataModels = [];

    for (var u in jsonData) {
      DataModel dataModel = DataModel(u["name"], u["short_desc"], u["full_desc"], u["category"], u["img_url"], u["cat_url"],);
      dataModels.add(dataModel);
    }

    // print(dataModels.length);
    return dataModels;
  }

  // @override
  // Widget build(BuildContext context) => ListView(
  //   padding: EdgeInsets.all(16),
  //   children: [
  //     buildCategories(),
  //   ],
  // );


  // Widget buildCategories() => Row(
  //   children: [
  //     Expanded(child: buildCategory()),
  //     const SizedBox(width: 12),
  //     Expanded(child: buildCategory()),
  //   ],
  // );



  // Widget buildCategory() {
  //   final urlCategory = 'https://scontent.flhr1-2.fna.fbcdn.net/v/t39.30808-6/241853678_923866481812075_3421472809979847756_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=730e14&_nc_ohc=Dsvz6yx5i1IAX-1nZ4E&_nc_ht=scontent.flhr1-2.fna&oh=f19b689cbf5fca6b1bdb71d569f65bc9&oe=615CB5EB';

  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(20),
  //     child: Container(
  //       padding: EdgeInsets.all(12),
  //       color: Color(0xFF0101),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Image.network(
  //               urlCategory,
  //               width: 200,
  //               height: 200,
  //               fit: BoxFit.cover),
  //           Text('Nutrition',
  //             style: TextStyle(
  //                 // FontWeight.bold,
  //                 color: Colors.white,
  //                 fontSize: 20),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Category List'),
      centerTitle: true,
      actions: [
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(user.photoUrl!),
        ),
        TextButton(
          onPressed: () async {
            await GoogleSignInApi.logout();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => MyHomePage(title: 'Connect - Sign In'),
            ));
          },
          child: Text('Logout', style: TextStyle(color: Colors.white),), )
      ],
    ),
    body: Container(
      child: FutureBuilder(
        future: _getCategories(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
  
          if (snapshot.data == null) {
            return SpinKitCircle(
              color: Colors.red,
              size: 80.0,
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network('https://scontent.flhr1-2.fna.fbcdn.net/v/t39.30808-6/241853678_923866481812075_3421472809979847756_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=730e14&_nc_ohc=Dsvz6yx5i1IAX-1nZ4E&_nc_ht=scontent.flhr1-2.fna&oh=f19b689cbf5fca6b1bdb71d569f65bc9&oe=615CB5EB'),
                Image.network('https://scontent.flhr1-2.fna.fbcdn.net/v/t39.30808-6/241853678_923866481812075_3421472809979847756_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=730e14&_nc_ohc=Dsvz6yx5i1IAX-1nZ4E&_nc_ht=scontent.flhr1-2.fna&oh=f19b689cbf5fca6b1bdb71d569f65bc9&oe=615CB5EB'),
                Image.network('https://scontent.flhr1-2.fna.fbcdn.net/v/t39.30808-6/241853678_923866481812075_3421472809979847756_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=730e14&_nc_ohc=Dsvz6yx5i1IAX-1nZ4E&_nc_ht=scontent.flhr1-2.fna&oh=f19b689cbf5fca6b1bdb71d569f65bc9&oe=615CB5EB'),
                Image.network('https://scontent.flhr1-2.fna.fbcdn.net/v/t39.30808-6/241853678_923866481812075_3421472809979847756_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=730e14&_nc_ohc=Dsvz6yx5i1IAX-1nZ4E&_nc_ht=scontent.flhr1-2.fna&oh=f19b689cbf5fca6b1bdb71d569f65bc9&oe=615CB5EB'),
            // snapshot.data[index].cat_url,
                  // urlCategory,
                  // width: 600,
                  // height: 200,
                  // fit: BoxFit.cover),

                // Text((snapshot.data[index].category).toUpperCase(),
                //   style: TextStyle(
                //     // FontWeight.bold,
                //     color: Colors.blueAccent,
                //     fontSize: 20),
                // ),

              ],
            );
            // return ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: snapshot.data.length,
            //     itemBuilder: (BuildContext context, int index) {
            //
            //
            //       Widget buildCategory() {
            //         final urlCategory = 'https://scontent.flhr1-2.fna.fbcdn.net/v/t39.30808-6/241853678_923866481812075_3421472809979847756_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=730e14&_nc_ohc=Dsvz6yx5i1IAX-1nZ4E&_nc_ht=scontent.flhr1-2.fna&oh=f19b689cbf5fca6b1bdb71d569f65bc9&oe=615CB5EB';
            //
            //         return ClipRRect(
            //           borderRadius: BorderRadius.circular(20),
            //           child: Container(
            //             padding: EdgeInsets.all(12),
            //             color: Color(0xFF0101),
            //             child: Column(
            //
            //               mainAxisAlignment: MainAxisAlignment.center,
            //
            //               mainAxisSize: MainAxisSize.min,
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 Image.network(
            //                     snapshot.data[index].cat_url,
            //                     // urlCategory,
            //                     width: 600,
            //                     height: 200,
            //                     fit: BoxFit.cover),
            //
            //                 Text((snapshot.data[index].category).toUpperCase(),
            //                   style: TextStyle(
            //                       // FontWeight.bold,
            //                       color: Colors.blueAccent,
            //                       fontSize: 20),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         );
            //       }
            //
            //
            //       Widget buildCategories() => Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Expanded(child: buildCategory()),
            //           // const SizedBox(width: 12),
            //           // Expanded(child: buildCategory()),
            //         ],
            //       );
            //
            //       return new Card(
            //         child: InkWell(
            //           onTap: (){
            //             Navigator.push(context,
            //                 new MaterialPageRoute(builder:
            //                     (context) => CategoryDetailsPage(snapshot.data[index]))
            //             );
            //           },
            //           child: buildCategories(),
            //           // child: new Column(
            //           //   mainAxisSize: MainAxisSize.min,
            //           //   // mainAxisAlignment: MainAxisAlignment.start,
            //           //   crossAxisAlignment: CrossAxisAlignment.start,
            //           //   children: <Widget>[
            //           //     new ClipRRect(
            //           //       // borderRadis: BorderRadius.all(12),
            //           //       child: new Image.network(snapshot.data[index].cat_url,
            //           //         // width: 400,
            //           //         // height: 200,
            //           //         // fit: BoxFit.contain,
            //           //       ),
            //           //       borderRadius: BorderRadius.circular(0.0),
            //           //     ),
            //           //     new Padding(
            //           //       padding: new EdgeInsets.all(16.0),
            //           //       child: new Column(
            //           //         mainAxisAlignment: MainAxisAlignment.start,
            //           //         crossAxisAlignment: CrossAxisAlignment.start,
            //           //         children: <Widget>[
            //           //           new Text((snapshot.data[index].category).toUpperCase(),
            //           //           ),
            //           //         ],
            //           //       ),
            //           //     ),
            //           //   ],
            //           // ),
            //         ),
            //         elevation: 2.0,
            //       );
            //     },
            //   );
          }
        },
      ),
    ),
  
  );
}