import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// MAIN MENU

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crop Assist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Crop Assist'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/mainmenu_background.jpg"), fit: BoxFit.cover)),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 200.0,
                height: 50.0,
                child: new RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: new Text(
                    "Identify Crop",
                    style: new TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    _optionsDialogBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


    Future<void> _optionsDialogBox() {
      return showDialog(context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: new Text('Take a picture'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CameraRoute()),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    GestureDetector(
                      child: new Text('Select from gallery'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GalleryRoute()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          });
    }

}

/// CLICK PICTURE

class CameraRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _CameraRouteState();
}

class _CameraRouteState extends State<CameraRoute> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title:  'Image Picker',
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Image Picker'),
        ),
        body: new Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/mainmenu_background.jpg"), fit: BoxFit.cover)),
          child: Center(
            child: _image == null? new Text('No image selected',
              style: new TextStyle(
                fontSize: 20.0,
              ),
            ): Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.file(_image, height: 400.0, width: 300.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: new Text(
                      "Identify Disease",
                      style: new TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                    },
                  ),
                ),
              ),
            ],
        ),
          ),
        ),

        floatingActionButton: new FloatingActionButton(onPressed: getImage, tooltip: 'Pick Image', child: new Icon(Icons.photo_camera),),
      ),
    );
  }
}


/// SELECT PICTURE FROM GALLERY

class GalleryRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _GalleryRouteState();
}

class _GalleryRouteState extends State<GalleryRoute> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title:  'Image Picker',
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Image Picker'),
        ),
        body: new Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/mainmenu_background.jpg"), fit: BoxFit.cover)),
          child: Center(
            child: _image == null? new Text('No image selected',
              style: new TextStyle(
              fontSize: 20.0,
            ),
            ): Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.file(_image, height: 400.0, width: 300.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    height: 50.0,
                    child: new RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: new Text(
                        "Identify Disease",
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        floatingActionButton: new FloatingActionButton(onPressed: getImage, tooltip: 'Pick Image', child: new Icon(Icons.photo),),
      ),
    );
  }
}