import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
main()  {

  runApp(
    MaterialApp(

      home: MyApp(

      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}
//splashscreen
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new BottomNavBar(),
      title: new Text('Opening App',
        style: new TextStyle(
          //fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),),
      image: Image.asset('images/352-3521130_agriculture-icon-png.webp',
        height: 170.0,
        width: 170.0,
        alignment: Alignment.center,
      ),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}
//aftersplash


//navigationbar
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white,),
          Icon(Icons.camera_alt, size: 30,color: Colors.white,),
          Icon(Icons.info_outline, size: 30,color: Colors.white,),
        ],
        color: Colors.lightGreen,
        buttonBackgroundColor: Colors.lightGreen,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
      body: PageView(

          controller: _pageController,
          children: <Widget>[
            Homepage(),
            CameraPage(),
            InfoPage(),
          ],
          onPageChanged: (int index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          }
      ),
    );
  }
}
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white70,
      appBar:AppBar(title: Center(child: Text(
        'CROP-EX',
        style: GoogleFonts.lato(
          textStyle: TextStyle(color: Colors.lightGreen, letterSpacing: .5,fontSize: 25.0,fontWeight: FontWeight.bold),
        ),
      ),
      ),backgroundColor: Colors.white,),
      body: Center(
        child: Container(

          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[

                Container(
                  height: 150.0,
                  //color: Colors.white,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(Colors.red,
                            BlendMode.modulate),
                        image: AssetImage('images/bg1.webp'), fit: BoxFit.cover,
                      ),
                      //borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  //margin: EdgeInsets.all(15.0),


                  child:Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('DETECT AND CURE',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,width: 10.0,),
                        Text('Detect crop diseases using' 'Cropex, which offers diagnosis and treatment '
                            'for pests,' 'disease and nutrient deficiency.'
                          ,textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white,fontSize: 15.0,),),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150.0,
                  //color: Colors.white,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(Colors.green,
                            BlendMode.modulate),
                        image: AssetImage('images/bg5.webp'), fit: BoxFit.cover,
                      ),
                      //borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  //margin: EdgeInsets.all(15.0),


                  child:Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('EASY TO USE',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,width: 10.0,),
                        Text('You can detect diseases and get solutions with just one tap. Just click'
                            ' a picture to get started.'
                          ,textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white,fontSize: 15.0,),),
                      ],
                    ),
                  ),
                ),

                Container(
                  height: 150.0,
                  //color: Colors.white,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(Colors.yellow,
                            BlendMode.modulate),
                        image: AssetImage('images/bg4.webp'), fit: BoxFit.cover,
                      ),
                     // borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  //margin: EdgeInsets.all(15.0),


                  child:Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('MACHINE LEARNING',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,width: 10.0,),
                        Text('The app uses Machine Learning to detect crop diseases.'
                          ,textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white,fontSize: 15.0,),),
                      ],
                    ),
                  ),
                ),


                Container(
                  //color: Colors.white,
                  height: 150.0,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.blue,
                            BlendMode.modulate),
                        image: AssetImage('images/bg6.webp'), fit: BoxFit.cover,
                    ),
                      //borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                     //margin: EdgeInsets.all(15.0),


                  child:Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('QUOTE OF THE DAY',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,width: 10.0,),
                        Text('Agriculture was the first occupation of man, and as it embraces the whole earth, it is the foundation of all other industries.'
                          ,textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white,fontSize: 15.0,),),
                      ],
                    ),
                  ),
                ),







              ],
            ),
          ),
        ),
      ),

    );
  }
}





class InfoPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Center(child: Text(
        'ABOUT US',
        style: GoogleFonts.lato(
          textStyle: TextStyle(color: Colors.lightGreen, letterSpacing: .5,fontSize: 25.0,fontWeight: FontWeight.bold),
        ),
      ),
      ),backgroundColor: Colors.white,),
      body: Column(
        children: [
         /* Container(
              child:Text(
                'Our Team',

                style: GoogleFonts.roboto(
                  textStyle: TextStyle(color: Colors.lightGreen, letterSpacing: .5,fontSize: 25.0),
                ),
                textAlign: TextAlign.right,
              ),
          ),*/
          Container(

          child: SingleChildScrollView(child:Column(
            children: <Widget>[
              //SizedBox(height: 20,),
              Card(
                color: Colors.lightGreen,
                //elevation: 10,

                //margin: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child:Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        //child:Text('Name'),
                        margin: EdgeInsets.all(5),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape:BoxShape.circle,
                          color: Colors.green,
                          image: DecorationImage(

                            image: AssetImage('images/piyush.webp'), fit: BoxFit.cover,
                          ),

                          //borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        child:Column(
                          children: <Widget>[
                            Text(
                              'Piyush Chechi',

                              style: GoogleFonts.alata(
                                textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 25.0),
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(height: 5,),
                            Text(
                              'chechipiyush@gmail.com',

                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 15.0),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              '+91-870-818-5501',

                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 15.0),
                              ),
                            ),
                            //SizedBox(height: 10,),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),

              Card(
                color: Colors.lightGreen,
                //elevation: 10,

                //margin: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child:Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: <Widget>[
                      Container(
                        //child:Text('Name'),
                        margin: EdgeInsets.all(5),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape:BoxShape.circle,
                          color: Colors.green,
                          image: DecorationImage(

                            image: AssetImage('images/jagdeep.webp'), fit: BoxFit.cover,
                          ),

                          //borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        child:Column(
                          children: <Widget>[
                            Text(
                              'Jagdeep Kumar',

                              style: GoogleFonts.alata(
                                textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 25.0),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              'jagdeep2620@gmail.com',

                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 15.0),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              '+91-797-359-4553',

                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 15.0),
                              ),
                            ),
                            //SizedBox(height: 10,),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),

              Card(
                color: Colors.lightGreen,
                //elevation: 10,

                //margin: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child:Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: <Widget>[
                      Container(
                        //child:Text('Name'),
                        margin: EdgeInsets.all(5),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape:BoxShape.circle,
                          color: Colors.green,
                          image: DecorationImage(

                            image: AssetImage('images/anmol.webp'), fit: BoxFit.cover,
                          ),

                          //borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        child:Column(
                          children: <Widget>[
                            Text(
                              'Anmol Kumar',

                              style: GoogleFonts.alata(
                                textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 25.0),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              'anmolpunia9@gmail.com',

                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 15.0),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              '+91-798-849-8936',

                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 15.0),
                              ),
                            ),
                            //SizedBox(height: 10,),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),

            ],
          ),
          ),
        ),
    ]
      ),
    );
  }
}

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  File imageURI;
  List result;
  String path;
  String label;
  String conf;


  Future getImageFromCamera() async {

    //var image = await ImagePicker.pickImage(source: ImageSource.camera);
    final File image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      imageURI = image;
      path = image.path;
    });
  }

  Future getImageFromGallery() async {
    final File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageURI = image;
      path = image.path;
    });
  }

  Future classifyImage() async {

    await Tflite.loadModel(model: "assets/model_unquant.tflite",labels: "assets/labels.txt");
    var output = await Tflite.runModelOnImage(path: path);

    setState(() {
      result = output;
      label=result[0]["label"].toString();
      label=label.substring(2);
      conf=(result[0]["confidence"] * 100).toStringAsFixed(0);
    });


  }
  _launchURL(int i) async {
   String url;
    switch(i){
      case 1: url='https://www.planetnatural.com/pest-problem-solver/plant-disease/late-blight/'; break;
      case 2: url='https://www.planetnatural.com/pest-problem-solver/plant-disease/bacterial-leaf-spot/'; break;
      case 3: url='https://www.farmprogress.com/controlling-tomato-yellow-leaf-curl-virus'; break;
    }
    if (await canLaunch(url)) {
      await launch(url,forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _showDialog() async {
   await classifyImage();

    return showDialog<void>(
      context: this.context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(

          title: Text('Result',style: TextStyle(color: Colors.lightGreen),textAlign: TextAlign.center,),
          content: SingleChildScrollView(

            child:DataTable(
              columns: [
                DataColumn(label: Text('Disease',style:TextStyle(color: Colors.lightGreen),textAlign: TextAlign.left,)),
                DataColumn(label: Text('Confidence',style:TextStyle(color: Colors.lightGreen))),
              ],
              rows: [
                DataRow(
                    cells: [
                      DataCell(Text("$label",style:TextStyle(fontSize: 12.0))),
                      DataCell(Text("$conf %",style:TextStyle(fontSize: 10.0))),
                    ]
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('More Details'),
              onPressed: () {
                if(label==null){
                  Navigator.of(context).pop();
                }
                else if(label=="Late Blight"){
                  _launchURL(1);
                }
                else if(label=="Bacterial Spot"){
                  _launchURL(2);
                }
                else if(label=="Yellow leaf curl virus"){
                  _launchURL(3);
                }
                else if(label=="Healthy Leaf") {
                  Navigator.of(context).pop();
                }
              },
            ),
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )


          ],
        );
      },
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title: Center(child: Text(
          'CROP-EX',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.lightGreen, letterSpacing: .5,fontSize: 25.0,fontWeight: FontWeight.bold),
          ),
        ),
        ),backgroundColor: Colors.white,),
        body: Center(
          child: SingleChildScrollView(
            child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  imageURI == null
                      ? Center(child: Text('Please select an image!'))
                      : Center(child: Image.file(imageURI, width: 300, height: 300, fit: BoxFit.cover)),

                  Center(
                    child: Container(
                      width: 150.0,
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green)
                          ),
                          onPressed: () => getImageFromCamera(),
                          child: Text('Open Camera'),
                          textColor: Colors.green,
                          color: Colors.white,
                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        )
                    ),
                  ),

                  Center(
                    child: Container(
                        width: 150.0,
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green)
                          ),
                          onPressed: () => getImageFromGallery(),
                          child: Text('Open Gallery'),
                          textColor: Colors.green,
                          color: Colors.white,
                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        )
                    ),
                  ),
                  imageURI == null
                      ? Text('Detect crop disease in a single tap.')
                      : Center(
    child: Container(
    width: 150.0,
    margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
    child: RaisedButton(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),
    side: BorderSide(color: Colors.green)
    ),
    onPressed: () =>
    _showDialog(),
    child: Text('Detect Disease'),
    textColor: Colors.green,
    color: Colors.white,
    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
    )
    ),
    ),
               //   result==null ? Text('NULL'):Text('$label')



                ]
            ),

          ),
        )
    );
  }
}





