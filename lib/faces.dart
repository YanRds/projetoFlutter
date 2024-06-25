import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class Faces extends StatefulWidget {
  Faces({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FacesState createState() => _FacesState();
}

class _FacesState extends State<Faces> {
  Widget insideFace;
  bool _opacity = true;
  String joke = "";
  double jokePercent = 1.0;
  int jokeStep = 0;
  Widget animatedFaces;

  Future getJokes() async {
    var client = http.Client();
    var url = "https://geek-jokes.sameerkumar.website/" "api";

    // Await the http get response, then decode the json-formatted response.
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jokeDecod = convert.jsonDecode(response.body);
        String textHolder = jokeDecod.toString();
        setState(() {
          joke = textHolder;
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } finally {}
  }

  //Smilling face
  Widget smillingFace() {
    return GestureDetector(
        onTap: () {
          setState(() {
            jokeStep = 0;
            insideFace = middleFace();
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height,
          color: Colors.greenAccent[400],
          child: Center(
            child: Container(
              width: 300,
              child: Image(
                image: AssetImage("super_feliz.png"),
              ),
            ),
          ),
        ));
  }

  //Sad Face
  Widget sadFace() {
    return GestureDetector(
      onTap: () {
        setState(() {
          animatedFaces = animatedSad();
        });
        popUp();
        getJokes();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: Center(
          child: Container(
            width: 300,
            child: Image(
              image: AssetImage("triste1.png"),
            ),
          ),
        ),
      ),
    );
  }

  //Poker face
  Widget middleFace() {
    return GestureDetector(
      onTap: () {
        setState(() {
          insideFace = sadFace();
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height,
        color: Colors.red,
        child: Center(
          child: Container(
            width: 300,
            child: Image(
              image: AssetImage("poker_face.png"),
            ),
          ),
        ),
      ),
    );
  }

  Widget animatedSad() {
    return Container(
      width: 100,
      height: 100,
      child: Image(image: AssetImage("triste1.png")),
    );
  }

  Widget animatedMeh() {
    return Container(
      width: 100,
      height: 100,
      child: Image(image: AssetImage("meh.png")),
    );
  }

  Widget animatedPoker() {
    return Container(
      width: 100,
      height: 100,
      child: Image(image: AssetImage("poker_face.png")),
    );
  }

  Widget animatedEngra() {
    return Container(
      width: 100,
      height: 100,
      child: Image(image: AssetImage("engra.png")),
    );
  }

  Widget animatedFeliz() {
    return Container(
      width: 100,
      height: 100,
      child: Image(image: AssetImage("feliz.png")),
    );
  }

  Widget animatedSuperFeliz() {
    return Container(
      width: 100,
      height: 100,
      child: Image(image: AssetImage("super_feliz.png")),
    );
  }

  void popUp() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // retorna um objeto do tipo Dialog
          return StatefulBuilder(builder: (cx, setState) {
            return AlertDialog(
              content: new Container(
                  height: 450,
                  width: 450,
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Container(
                            height: 100,
                            child: Center(
                                child: AnimatedOpacity(
                                    opacity: _opacity ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 600),
                                    child: animatedFaces))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 200,
                            child: Center(
                                child: AnimatedOpacity(
                                    opacity: _opacity ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 800),
                                    child: Text(joke,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.shareTechMono(
                                            fontSize: 22))))),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                            height: 50,
                            child: Center(
                                child: GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        jokeStep++;
                                        if (jokeStep == 1) {
                                          _opacity = false;
                                          Future.delayed(
                                              const Duration(milliseconds: 400),
                                              () {
                                            setState(() {
                                              getJokes();
                                              animatedFaces = animatedMeh();
                                              _opacity = true;
                                            });
                                          });
                                        } else if (jokeStep == 2) {
                                          _opacity = false;
                                          Future.delayed(
                                              const Duration(milliseconds: 400),
                                              () {
                                            setState(() {
                                              getJokes();
                                              animatedFaces = animatedPoker();
                                              _opacity = true;
                                            });
                                          });
                                        } else if (jokeStep == 3) {
                                          _opacity = false;
                                          Future.delayed(
                                              const Duration(milliseconds: 400),
                                              () {
                                            setState(() {
                                              getJokes();
                                              animatedFaces = animatedEngra();
                                              _opacity = true;
                                            });
                                          });
                                        } else if (jokeStep == 4) {
                                          _opacity = false;
                                          Future.delayed(
                                              const Duration(milliseconds: 400),
                                              () {
                                            setState(() {
                                              getJokes();
                                              animatedFaces = animatedFeliz();
                                              _opacity = true;
                                            });
                                          });
                                        } else if (jokeStep == 5) {
                                          _opacity = false;
                                          Future.delayed(
                                              const Duration(milliseconds: 400),
                                              () {
                                            setState(() {
                                              getJokes();
                                              animatedFaces =
                                                  animatedSuperFeliz();
                                              _opacity = true;
                                              insideFace = smillingFace();
                                            });
                                          });
                                        } else if (jokeStep == 6) {
                                          setState(() {
                                            Navigator.pop(cx);
                                          });
                                        }
                                      });
                                    },
                                    child: Container(
                                        width: 800,
                                        height: 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: Color.fromARGB(
                                                          16, 0, 0, 0)
                                                      .withAlpha(100),
                                                  offset: Offset(2, 2),
                                                  blurRadius: 1,
                                                  spreadRadius: 0.1)
                                            ],
                                            color: Colors.greenAccent[400]),
                                        child: Text(
                                          "Laugh",
                                          style: GoogleFonts.ubuntuMono(
                                              fontSize: 20,
                                              color: Colors.white),
                                        )))))
                      ]))),
            );
          });
        });
  }

  Widget insideFaces() {
    return Container(
      child: insideFace,
    );
  }

  @override
  void initState() {
    super.initState();
    getJokes();
    animatedFaces = animatedSad();
  }

  @override
  Widget build(BuildContext context) {
    if (insideFace == null) {
      setState(() {
        insideFace = middleFace();
      });
    }
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[insideFaces()],
        ),
      ),
    ));
  }
}
