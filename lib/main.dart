import 'package:appdev_project/country.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import './user.dart';
import './passport.dart';
import './dbhelper.dart';

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
              style: TextButton.styleFrom(backgroundColor: Color(0xFF4F6A84))
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Color(0xFF4F6A84),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4F6A84)
                  ),
                  child: Text(
                    "Continue Your Adventure!",
                    style: TextStyle(color: Colors.white60),
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
                      backgroundColor: Color(0xFF4F6A84)
                  ),
                  child: Text(
                    "Start Your Adventure!",
                    style: TextStyle(color: Colors.white60),
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
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                  ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                  ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              TextButton(
                  onPressed: () {
                    if (usernameController.text == "norway_lover31" && passwordController.text == "123") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfilePage()),
                      );
                    } else
                      return;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4F6A84),
                  ),
                  child: Text("Login"),
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
  TextEditingController bankController = TextEditingController();
  TextEditingController accNumController = TextEditingController();

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
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                  ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                  ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              TextField(
                  controller: fNameController,
                  decoration: InputDecoration(
                    hintText: "Enter First Name",
                  ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextField(
                  controller: lNameController,
                  decoration: InputDecoration(
                    hintText: "Enter Last Name",
                  ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              TextField(
                  controller: bankController,
                  decoration: InputDecoration(
                    hintText: "Your Bank",
                  ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextField(
                  controller: accNumController,
                  decoration: InputDecoration(
                    hintText: "Account Number",
                  ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4F6A84),
                  ),
                  child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _insert(username, password, first_name, last_name, bank_name, account_num) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnUsername: username,
      DatabaseHelper.columnPassword: password,
      DatabaseHelper.columnFirstName: first_name,
      DatabaseHelper.columnLastName: last_name,
      DatabaseHelper.columnBankName: bank_name,
      DatabaseHelper.columnAccountNum: account_num
    };
    User user = User.fromMap(row);
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
                    Text('Your Bank: Scotia Bank', style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text('Account Number: **** **** **** 1820', style: TextStyle(color: Colors.white, fontSize: 18)),
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
                      onPressed: () {},
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
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
  Country c = Country("Norway", "Oslo", "https://media.discordapp.net/attachments/1096092608415137792/1103513431174299728/image_1.png?width=333&height=592", Price.high, Temperature.cold, List.of([Language("Norwegian"), Language("English")]));
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
              Container(
                margin: EdgeInsets.all(5.0),
                height: 175,
                child: Image(
                    image: AssetImage('assets/images/oslo1.png')
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
                      '${c.capital}, ${c.name}',
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
                            MaterialPageRoute(builder: (context) => LocationInfoPage()),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
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
  const LocationInfoPage({Key? key}) : super(key: key);

  @override
  State<LocationInfoPage> createState() => _LocationInfoPageState();
}

class _LocationInfoPageState extends State<LocationInfoPage> {
  Country c = Country("Norway", "Oslo", "https://media.discordapp.net/attachments/1096092608415137792/1103513431174299728/image_1.png?width=333&height=592", Price.high, Temperature.cold, List.of([Language("Norwegian"), Language("English")]));

  @override
  Widget build(BuildContext context) {
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
                      '${c.capital} is the capital of ${c.name}',
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
                      'Price: ${"\$" * (c.price.index + 1)}',
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
                      c.languages.map((e) => e.name).toList().join(", "),
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
                      '${c.capital} is usually ${c.temperature.name}',
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
                    height: 150,
                    child: Image(
                        image: AssetImage('assets/images/oslo2.png')
                    ),
                  ),
                  Container(
                    height: 150,
                    child: Image(
                        image: AssetImage('assets/images/oslo3.png')
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
