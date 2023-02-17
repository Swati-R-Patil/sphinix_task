import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sphinix_test/colorConverter.dart';
import 'package:sphinix_test/sub_category_page.dart';

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return StateDashboard();
  }

}
class StateDashboard extends State{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: ColorConverter.hexToColor('#b5b5b5'),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Align(
            alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text("Smart Home",textAlign: TextAlign.center,
                  style: TextStyle(
                  fontWeight: FontWeight.normal, fontSize: 30,color: Colors.black54
                ),),
              )),

        ),
   body: Container(
     padding: EdgeInsets.all(20.0),
     child: Column(
       children: <Widget>[
         Expanded(
             child: GridView.count(
               crossAxisCount: 2,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10,
               children:  List.generate(roomCategories.length, (index) {
                 return Center(
                   child: InkWell(
                     onTap: (){
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (_) => SubCategoryPage(title: roomCategories[index].title,)));
                     },
                     child: Card(
                       color: Colors.transparent,
                       elevation: 0,
                       child: Container(
                         height: 200,
                         width: 200,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             image: new DecorationImage(
                               image: new AssetImage(roomCategories[index].image_),
                               fit: BoxFit.fill,
                             )),
                         child:  Container(
                           padding: EdgeInsets.only(bottom: 10),
                           child: Column(
                               mainAxisAlignment: MainAxisAlignment.end,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children:[
                                 Text(roomCategories[index].title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                               ]),
                         )
                       ),
                     ),
                   )
                 );
               }
               )))
       ],
     ),
   ),);
  }
}

class RoomCategories {
  const RoomCategories({required this.title, required this.image_});
  final String title;
  final String image_;
}

const List<RoomCategories> roomCategories =  <RoomCategories>[
  RoomCategories(title: 'Living Room', image_:"assets/app_images/living_room.jpg"),
  RoomCategories(title: 'Bed Room', image_:"assets/app_images/bed_room.jpg"),
  RoomCategories(title: 'Bath Room', image_:"assets/app_images/bathroom.jpg"),
  RoomCategories(title: 'Living Room', image_: "assets/app_images/livingroom2.png"),
];
