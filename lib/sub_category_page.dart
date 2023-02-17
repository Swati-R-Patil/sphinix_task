import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sphinix_test/colorConverter.dart';
import 'package:http/http.dart' as http;

class SubCategoryPage extends StatefulWidget{
  final title;

  const SubCategoryPage({super.key, required this.title});
  @override
  State<StatefulWidget> createState() {
    return SubCategoryPageState(title);
  }

}
class SubCategoryPageState extends State{
  final title;

  bool switchLampLight1 = false;

  double brightnessSlider = 20;
  List<RoomCategories> roomCategories=[];
  SubCategoryPageState(this.title);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    manageBrightness();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorConverter.hexToColor('#b5b5b5'),
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_rounded,color:Colors.black54 )),
        title: Text(title,textAlign: TextAlign.center,style: TextStyle(
            fontWeight: FontWeight.normal, fontSize: 20,color: Colors.black54
        ),),
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
                            },
                            child:  Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black54)
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child:new Image.asset(roomCategories[index].image_),
                                        ),
                                        Switch(value: switchLampLight1,
                                            onChanged: (value){
                                              setState(() {
                                                switchLampLight1 = value;
                                                print(switchLampLight1);
                                              });
                                            })
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Visibility(
                                      visible: roomCategories[index].isSliderEnable,
                                      child: SizedBox(
                                        height: 10,
                                       // width:Me ,
                                        child: SliderTheme(
                                          data: SliderThemeData(
                                            disabledActiveTrackColor: Colors.blue,
                                            disabledInactiveTrackColor: Colors.black12,
                                            trackHeight: 1,
                                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0),
                                            //trackShape: RoundSliderTrackShape(),
                                          ),
                                          child: Slider(
                                            activeColor: Colors.black,
                                            mouseCursor: MouseCursor.defer,
                                            min: 0.0,
                                            max: 100.0,

                                            value: double.parse(roomCategories[index].brighnessLevel.toString()),
                                            onChanged: (value) {
                                              setState(() {
                                                brightnessSlider = value;
                                              });
                                            },
                                          ),
                                        )
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Text(roomCategories[index].title,
                                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                            )
                          )
                      );
                    }
                    )))
          ],
        ),
      ),);
  }

  void manageBrightness() async{
    SharedPreferences sPref = await SharedPreferences.getInstance();

    var url = "https://forapi-dc639-default-rtdb.firebaseio.com/.json";

    var response = await http.get(Uri.parse(url));

    print(response.body);

    if(response.statusCode == 200){
      var resp = jsonDecode(response.body);
      print("resp-->$resp");
      print("resp-1->${resp["Brightness_10"]}");
      print("resp-2->${resp["Brightness_20"]}");
      print("resp-3->${resp["Brightness_30"]}");
      print("resp-4->${resp["Light_OFF"]}");
      print("resp-5->${resp["Light_ON"]}");

      var brightness10 = resp["Brightness_10"]!=null?resp["Brightness_10"]:"0";
      var brightness20 = resp["Brightness_20"]!=null?resp["Brightness_20"]:"0";
      var brightness30 = resp["Brightness_30"]!=null?resp["Brightness_30"]:"0";

      print("response ok");

      roomCategories =  <RoomCategories>[
        RoomCategories(title: 'Switch Master', image_:"assets/app_images/drop.png",isSliderEnable: false,brighnessLevel: 0),
        RoomCategories(title: 'Lamp Light 2', image_:"assets/app_images/lamp.png",isSliderEnable: false,brighnessLevel: 0),
        RoomCategories(title: 'Brightness 1', image_:"assets/app_images/brightness.png",isSliderEnable: true,brighnessLevel:brightness10),
        RoomCategories(title: 'Light Bulb 1', image_: "assets/app_images/drop.png",isSliderEnable: false,brighnessLevel: 0),
        RoomCategories(title: 'Brightness 2', image_:"assets/app_images/lamp.png",isSliderEnable: true,brighnessLevel: brightness20),
        RoomCategories(title: 'Brightness 3', image_:"assets/app_images/oval.png",isSliderEnable: true,brighnessLevel: brightness30),

      ];

      setState((){});
    }
  }
}

class RoomCategories {
  RoomCategories( {required this.title, required this.image_,
    required this.isSliderEnable, this.brighnessLevel});
  final String title;
  final String image_;
  final bool isSliderEnable;
  dynamic brighnessLevel;
}



