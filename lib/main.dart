import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _username = "user";
  String _password =
      "password"; // Ini adalah password awal, Anda dapat menggantinya nanti.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.android, // Ganti dengan ikon sesuai keinginan Anda
              size: 100.0,
            ),
            SizedBox(height: 16.0),
            Text(
              "Nama Aplikasi",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Username",
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text == _username &&
                    _passwordController.text == _password) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                } else {
                  // Handle login error (contoh sederhana, Anda dapat menambahkan logika error sesuai kebutuhan)
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Login Gagal"),
                        content: Text("Username atau Password salah."),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Home"),
      ),
      body: Center(
        child: Text("Selamat datang di Halaman Home!"),
      ),
    );
  }
}
