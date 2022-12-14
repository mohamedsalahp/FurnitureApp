import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int photoIndex = 0;
  List<String> photos = [
    'assets/images/ottoman.jpg',
    'assets/images/otto2.jpeg',
    'assets/images/otto3.jpg',
    'assets/images/otto4.jpg'
  ];

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(photos[photoIndex]),
                            fit: BoxFit.cover)),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 275.0,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                    ),
                    onTap: _nextImage,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 275.0,
                      width: MediaQuery.of(context).size.width / 2,
                      color: Colors.transparent,
                    ),
                    onTap: _previousImage,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.arrow_back),
                            color: Colors.black,
                            onPressed: () {}),
                        Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 240.0,
                    left: MediaQuery.of(context).size.width / 2 - 30.0,
                    child: Row(
                      children: <Widget>[
                        SelectedPhoto(
                          number0fDots: photos.length,
                          photoIndex: photoIndex,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Alcide Number : 2323X',
                  style: TextStyle(
                      fontFamily: 'Lato', fontSize: 15.0, color: Colors.grey),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Finn Navian-Sofa',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: (MediaQuery.of(context).size.width / 4 +
                              MediaQuery.of(context).size.width / 2) -
                          10.0,
                      child: Text(
                        'Scandinavian small size double sofa / imported full leather /Dale Italia oil wax leather black',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.grey.withOpacity(0.8),
                          fontSize: 15.0
                        ),
                      ),
                    ),
                    SizedBox(width: 40.0),
                    Text('\$ 248',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('COLOUR',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.black
                  ),
                ),
              ),

              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(getColorHexFromStr('#5A5551'))
                      ),
                    ),

                    SizedBox(width: 30.0),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(getColorHexFromStr('#C3BCB5'))
                      ),
                    ),

                    SizedBox(width: 30.0),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Color(getColorHexFromStr('#EFEFEF'))
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('MATERIAL',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Lato'
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 50.0,
                      child: Icon(
                        Icons.time_to_leave,
                        color: Colors.grey,
                        size: 30.0
                      ),
                    ),
                    Text('x30%',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      child: Icon(
                          Icons.timer,
                          color: Colors.grey,
                          size: 30.0
                      ),
                    ),
                    Text('x60%',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      child: Icon(
                          Icons.monetization_on,
                          color: Colors.grey,
                          size: 30.0
                      ),
                    ),
                    Text('x10%',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 7.0,
        color: Colors.white,
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 10.0),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.white,
                  child: Icon(
                    Icons.shop,
                    color: Colors.grey,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.white,
                  child: Icon(
                    Icons.account_box,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                color: Color(getColorHexFromStr('#FEDD59')),
                width: MediaQuery.of(context).size.width - 130.0,
                child: Center(
                  child: Text('Add to Cart',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final int number0fDots;
  final int photoIndex;

  SelectedPhoto({this.number0fDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(4.0)),
        ),
      ),
    );
  }

  Widget _activePhoto() {
    return new Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < number0fDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
