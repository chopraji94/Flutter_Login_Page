import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyLoginApp(),
      theme: new ThemeData(
        primarySwatch: Colors.amber,
        brightness: Brightness.light,
        accentColor: Colors.amber
      ),
    );
  }
}

class MyLoginApp extends StatefulWidget {
  @override
  _MyLoginAppState createState() => _MyLoginAppState();
}

class _MyLoginAppState extends State<MyLoginApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  Widget LoginWidget() {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Image(
          image: AssetImage("assets/Background.jpg"),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlutterLogo(
              size: _iconAnimation.value * 100,
            ),
            new Form(
              child: Theme(
                data: new ThemeData(
                    primarySwatch: Colors.teal, brightness: Brightness.dark),
                child: new Container(
                  padding: const EdgeInsets.all(40.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new TextFormField(
                        decoration:
                            new InputDecoration(labelText: "Enter Email"),
                        keyboardType: TextInputType.text,
                      ),
                      new TextFormField(
                        decoration:
                            new InputDecoration(labelText: "Enter password"),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      new Padding(padding: EdgeInsets.only(top:10.0)),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () => {}, 
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                          ),
                          new Padding(padding: EdgeInsets.all(8.0)),
                          ElevatedButton(
                            onPressed: () => {}, 
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: LoginWidget(),
    );
  }
}
