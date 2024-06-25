import 'package:flutter/material.dart';
import 'package:projetoFlutter/faces.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Funny'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Controllers para validação dos campos
  TextEditingController mailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  //Key para a confirmação do formulario
  final formState = GlobalKey<FormState>();

  //Form padrão utilizado na página de login
  Widget generalForm(
      TextEditingController choosecontroller,
      TextInputType keyboardtype,
      String hint,
      String type,
      int mLength,
      bool oddOrEven,
      bool obText) {
    return Stack(children: [
      Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(1, 0, 0, 0).withAlpha(100),
                    offset: Offset(2, 2),
                    blurRadius: 10,
                    spreadRadius: 1)
              ],
              color: Colors.white)),
      TextFormField(
          obscureText: obText,
          keyboardType: keyboardtype,
          controller: choosecontroller,
          maxLength: mLength,
          decoration: InputDecoration(
            filled: true,
            fillColor:
                oddOrEven ? Colors.white : Color.fromARGB(255, 41, 40, 40),
            counterText: "",
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 15.0,
                color:
                    oddOrEven ? Color.fromARGB(255, 41, 40, 40) : Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.blue)),
            contentPadding:
                EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
          ),
          validator: (value) {
            return dataVerification(type, value);
          })
    ]);
  }

  //Função para verificação de informações inseridas no widget
  dataVerification(type, value) {
    String validatorText = "";

    switch (type) {
      case "mail":
        {
          if (value.length >= 10 &&
              RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
            validatorText = null;
          } else {
            validatorText = "Esse não é um e-mail valido";
          }
        }
        break;

      case "pass":
        {
          if (value.length >= 8) {
            validatorText = null;
          } else {
            validatorText = "Sua senha deve conter mais de 8 caracteres";
          }
        }
        break;
    }
    return validatorText;
  }

  Widget _inputs() {
    return Form(
        key: formState,
        child: Column(
          children: <Widget>[
            generalForm(mailController, TextInputType.emailAddress,
                "Seu e-mail", "mail", 20, true, false),
            SizedBox(
              height: 20,
            ),
            generalForm(passController, TextInputType.text, "Sua Senha", "pass",
                20, true, true),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  //Botão para Login
  Widget _loginButton() {
    return GestureDetector(
        onTap: () {
          if (formState.currentState.validate()) {
            /* print("liberado"); */
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Faces()));
          } //Descomentar antes de buildar
        },
        child: Container(
            width: 800,
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color.fromARGB(16, 0, 0, 0).withAlpha(100),
                      offset: Offset(2, 2),
                      blurRadius: 1,
                      spreadRadius: 0.1)
                ],
                color: Colors.greenAccent[400]),
            child: Text(
              "Faça seu Login",
              style: GoogleFonts.ubuntuMono(fontSize: 18, color: Colors.white),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("papel_de_parede_carinhas.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
          child: Container(
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(1, 0, 0, 0).withAlpha(100),
                        offset: Offset(2, 2),
                        blurRadius: 10,
                        spreadRadius: 1)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(0))),
              width: 350,
              height: 500,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                          text: 'FUN',
                          style: GoogleFonts.pressStart2p(
                              fontSize: 38, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: ".ME",
                              style: GoogleFonts.pressStart2p(
                                  fontSize: 38, color: Colors.greenAccent[400]),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    _inputs(),
                    _loginButton()
                  ],
                ),
              ))),
    ));
  }
}
