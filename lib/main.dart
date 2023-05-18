import 'package:appdev_project/country.dart';
import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import './user.dart';
import './passport.dart';
import './dbhelper.dart';
import 'country.dart';

void main() => runApp(ExploreEurope());

class ExploreEurope extends StatelessWidget {
  const ExploreEurope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Europe',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(backgroundColor: Colors.blueGrey)
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.blueGrey,
            filled: true,
          ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Welcome to Explore Europe!"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: Image.network(
                        "https://media.discordapp.net/attachments/1096092608415137792/1103513431174299728/image_1.png")
                    .image)),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(8),
                width: 330,
                height: 80,
                color: Colors.blueGrey,
                child: Text(
                  'Keep track of your adventure through the European continent, all while preparing for your next ones!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey
                  ),
                  child: Text(
                    "Continue Your Adventure and Login",
                    style: TextStyle(color: Colors.white),
                  ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey
                  ),
                  child: Text(
                    "Start Your Adventure and Register",
                    style: TextStyle(color: Colors.white),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Log in"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.network(
                      "https://media.discordapp.net/attachments/1096092608415137792/1103513431174299728/image_1.png")
                  .image),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: usernameController,
                decoration: InputDecoration(
                  labelStyle: new TextStyle(color: Colors.white),
                  labelText: 'Enter Username',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelStyle: new TextStyle(color: Colors.white),
                  labelText: 'Enter Password',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              TextButton(
                  onPressed: () {
                    if (usernameController.text == "s" && passwordController.text == "123") {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) => ProfilePage()));
                      });
                    } else
                      return;
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey
                  ),
                child: Text("Login", style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final dbHelper = DatabaseHelper.instance;

  List<User> users = [];

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: Image.network(
                        "https://media.discordapp.net/attachments/1096092608415137792/1103513431174299728/image_1.png")
                    .image)),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              TextField(
                  style: TextStyle(color: Colors.white),
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelStyle: new TextStyle(color: Colors.white),
                    labelText: 'Enter Username',
                  ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  labelStyle: new TextStyle(color: Colors.white),
                  labelText: 'Enter Password',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: fNameController,
                decoration: InputDecoration(
                  labelStyle: new TextStyle(color: Colors.white),
                  labelText: 'Enter First Name',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: lNameController,
                decoration: InputDecoration(
                  labelStyle: new TextStyle(color: Colors.white),
                  labelText: 'Enter Last Name',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextButton(
                  onPressed: () {
                    String username = usernameController.text;
                    String password = passwordController.text;
                    String first_name = fNameController.text;
                    String last_name = lNameController.text;
                    insert(username, password, first_name, last_name);

                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );*/
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                  ),
                  child: Text("Register", style: TextStyle(color: Colors.white),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void insert(username, password, first_name, last_name) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnUsername: username,
      DatabaseHelper.columnPassword: password,
      DatabaseHelper.columnFirstName: first_name,
      DatabaseHelper.columnLastName: last_name
    };
    User user = User.firstFromMap(row);
    final id = await dbHelper.insert(user);
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: const Color(0xFF887CA3)
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/yelan.png'),
                    radius: 80,
                  ),
                  Expanded(child:
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 25.0),
                          child: Center(
                            child: Text(
                              'Sonia',
                              style: TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0),
                          child: Center(
                            child: Text(
                              'norway_lover31',
                              style: TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('You visited 3 countries since joining.', style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text('Your favorite country is currently Norway.', style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text('Your next destination will be Spain!', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditProfilePage()),
                        );
                      },
                      child: Text('Edit Information'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Sonia Vetra'),
                accountEmail: Text('norway_lover31'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/yelan.png'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person), title: Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.map), title: Text('Map of Europe'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapOfEurope()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.hiking), title: Text('Past Adventures'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ListTile(
                    leading: Icon(Icons.logout), title: Text('Logout'),
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) => LoginPage()));
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Profile',
      theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: const Color(0xFF887CA3)
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/yelan.png'),
                radius: 50,
              ),
              Container(
                margin: EdgeInsets.all(20),
                color: Colors.blueGrey,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: new InputDecoration(
                    border: const OutlineInputBorder(),
                    labelStyle: new TextStyle(color: Colors.white),
                    labelText: 'Enter your new username',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                color: Colors.blueGrey,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: new InputDecoration(
                    border: const OutlineInputBorder(),
                    labelStyle: new TextStyle(color: Colors.white),
                    labelText: 'Enter your new favorite country',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                color: Colors.blueGrey,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: new InputDecoration(
                    border: const OutlineInputBorder(),
                    labelStyle: new TextStyle(color: Colors.white),
                    labelText: 'Enter your next destination',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditProfilePage()),
                          );
                        },
                        child: Text('Confirm Changes'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MapOfEurope extends StatefulWidget {
  const MapOfEurope({Key? key}) : super(key: key);

  @override
  State<MapOfEurope> createState() => _MapOfEuropeState();
}

class _MapOfEuropeState extends State<MapOfEurope> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: const Color(0xFF887CA3)
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Map of Europe'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15.0),
                color: Colors.white70,
                child: Image(
                    image: AssetImage('assets/images/map.png')
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapOfEuropeNorway()),
                    );
                  },
                  child: Text(
                    'Choose a location to begin your next adventure!',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Sonia Vetra'),
                accountEmail: Text('norway_lover31'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/yelan.png'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person), title: Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.map), title: Text('Map of Europe'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapOfEurope()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.hiking), title: Text('Past Adventures'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ListTile(
                    leading: Icon(Icons.logout), title: Text('Logout'),
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) => LoginPage()));
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MapOfEuropeNorway extends StatefulWidget {
  const MapOfEuropeNorway({Key? key}) : super(key: key);

  @override
  State<MapOfEuropeNorway> createState() => _MapOfEuropeNorwayState();
}

class _MapOfEuropeNorwayState extends State<MapOfEuropeNorway> {
  final viewTransformationController = TransformationController();

  @override
  void initState() {
    final zoomFactor = 3.0;
    final xTranslate = 450.0;
    final yTranslate = 0.0;
    viewTransformationController.value.setEntry(0, 0, zoomFactor);
    viewTransformationController.value.setEntry(1, 1, zoomFactor);
    viewTransformationController.value.setEntry(2, 2, zoomFactor);
    viewTransformationController.value.setEntry(0, 3, -xTranslate);
    viewTransformationController.value.setEntry(1, 3, -yTranslate);
    super.initState();
  }

  List<Country> countries = [
    Country("be", "Belgium", "Brussels", Price.medium, Temperature.comfortable, List.of([Language("French"), Language("Dutch"), Language("English")])),
    Country("se", "Sweden", "Stockholm", Price.high, Temperature.comfortable, List.of([Language("Swedish"), Language("English")])),
    Country("no", "Norway", "Oslo", Price.high, Temperature.comfortable, List.of([Language("Norwegian"), Language("English")])),
    Country("fr", "France", "Paris", Price.medium, Temperature.comfortable, List.of([Language("French"), Language("English")])),
    Country("lv", "Latvia", "Riga", Price.low, Temperature.comfortable, List.of([Language("Latvian"), Language("Russian"), Language("English")])),
    Country("fi", "Finland", "Helsinki", Price.medium, Temperature.comfortable, List.of([Language("Finnish")])),
    Country("nl", "Netherlands", "Amsterdam", Price.high, Temperature.comfortable, List.of([Language("Dutch")])),
    Country("ch", "Switzerland", "Bern", Price.high, Temperature.comfortable, List.of([Language("German"), Language("French")])),
    Country("hr", "Croatia", "Zagreb", Price.medium, Temperature.comfortable, List.of([Language("Croatian")])),
    Country("at", "Austria", "Vienna", Price.low, Temperature.comfortable, List.of([Language("German")])),
  ];
  String currentId = "se";

  @override
  Widget build(BuildContext context) {
    Country country = countries.firstWhere((element) => element.id == currentId, orElse: () => countries.where((element) => element.id == "no").first);
    return MaterialApp(
      title: 'Profile',
      theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: const Color(0xFF887CA3)
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Map of Europe'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15.0),
                color: Colors.white70,
                child: InteractiveViewer(
                  transformationController: viewTransformationController,
                  scaleEnabled: true,
                  maxScale: 75,
                  minScale: 5,
                  child: SimpleMap(instructions: SMapWorld.instructions,
                    colors: SMapWorldColors(
                      bE: Colors.green,
                      // bG: Colors.green,
                      // cZ: Colors.green,
                      // dK: Colors.green,
                      // dE: Colors.green,
                      // eE: Colors.green,
                      // iE: Colors.green,
                      // gR: Colors.green,
                      // eS: Colors.green,
                      fR: Colors.green,
                      hR: Colors.green,
                      // iT: Colors.green,
                      // cY: Colors.green,
                      lV: Colors.green,
                      // lT: Colors.green,
                      // lU: Colors.green,
                      // hU: Colors.green,
                      // mT: Colors.green,
                      nL: Colors.green,
                      aT: Colors.green,
                      // pL: Colors.green,
                      // pT: Colors.green,
                      // rO: Colors.green,
                      // sI: Colors.green,
                      // sK: Colors.green,
                      fI: Colors.green,
                      sE: Colors.green,
                      // iS: Colors.green,
                      // lI: Colors.green,
                      nO: Colors.green,
                      cH: Colors.green,
                    ).toMap(),
                  callback: (id, name, tapdetails) {
                    setState(() {
                      currentId = id;
                    });
                  },),
                )
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                width: 500,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/images/${country.capital.toLowerCase()}1.png'),
                  ),
                ),
              ),
              Container(
                width: 330,
                height: 40,
                color: Colors.blueGrey,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 26.0,
                    ),
                    Text(
                      '${country.capital}, ${country.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 5, top: 5, bottom: 5),
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LocationInfoPage(id: currentId,)),
                          );
                        },
                        child: Text(
                          'Location Information',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 5, top: 5, bottom: 5),
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapOfEuropeNorway()),
                          );
                        },
                        child: Text(
                          'Book A Stay',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Sonia Vetra'),
                accountEmail: Text('norway_lover31'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/yelan.png'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person), title: Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.map), title: Text('Map of Europe'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapOfEurope()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.hiking), title: Text('Past Adventures'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ListTile(
                    leading: Icon(Icons.logout), title: Text('Logout'),
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) => LoginPage()));
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationInfoPage extends StatefulWidget {
  const LocationInfoPage({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<LocationInfoPage> createState() => _LocationInfoPageState();
}

class _LocationInfoPageState extends State<LocationInfoPage> {
  List<Country> countries = [
    Country("be", "Belgium", "Brussels", Price.medium, Temperature.comfortable, List.of([Language("French"), Language("Dutch"), Language("English")])),
    Country("se", "Sweden", "Stockholm", Price.high, Temperature.comfortable, List.of([Language("Swedish"), Language("English")])),
    Country("no", "Norway", "Oslo", Price.high, Temperature.comfortable, List.of([Language("Norwegian"), Language("English")])),
    Country("fr", "France", "Paris", Price.medium, Temperature.comfortable, List.of([Language("French"), Language("English")])),
    Country("lv", "Latvia", "Riga", Price.low, Temperature.comfortable, List.of([Language("Latvian"), Language("Russian"), Language("English")])),
    Country("fi", "Finland", "Helsinki", Price.medium, Temperature.comfortable, List.of([Language("Finnish")])),
    Country("nl", "Netherlands", "Amsterdam", Price.high, Temperature.comfortable, List.of([Language("Dutch")])),
    Country("ch", "Switzerland", "Bern", Price.high, Temperature.comfortable, List.of([Language("German"), Language("French")])),
    Country("hr", "Croatia", "Zagreb", Price.medium, Temperature.comfortable, List.of([Language("Croatian")])),
    Country("at", "Austria", "Vienna", Price.low, Temperature.comfortable, List.of([Language("German")])),
  ];

  @override
  Widget build(BuildContext context) {
    Country country = countries.firstWhere((element) => element.id == widget.id);
    return MaterialApp(
      title: 'Location Information',
      theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: const Color(0xFF887CA3)
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Location Information'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  color: Colors.blueGrey,
                ),
                width: 330,
                height: 50,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 28.0,
                      ),
                    ),
                    Text(
                      'Capital: ${country.capital}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.blueGrey,
                ),
                width: 330,
                height: 50,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Icon(
                        Icons.access_time_rounded,
                        color: Colors.white,
                        size: 28.0,
                      ),
                    ),
                    Text(
                      'GMT +2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.blueGrey,
                ),
                width: 330,
                height: 50,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Icon(
                        Icons.euro,
                        color: Colors.white,
                        size: 28.0,
                      ),
                    ),
                    Text(
                      'Price: ${"\$" * (country.price.index + 1)}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.blueGrey,
                ),
                width: 330,
                height: 50,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Icon(
                        Icons.language,
                        color: Colors.white,
                        size: 28.0,
                      ),
                    ),
                    Text(
                      country.languages.map((e) => e.name).toList().join(", "),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.blueGrey,
                ),
                width: 330,
                height: 50,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Icon(
                        Icons.cloud,
                        color: Colors.white,
                        size: 28.0,
                      ),
                    ),
                    Text(
                      'Temperature is ${country.temperature.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/images/${country.capital.toLowerCase()}2.png'),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/images/${country.capital.toLowerCase()}3.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapOfEuropeNorway()),
                          );
                        },
                        child: Text('Back'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
