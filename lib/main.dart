import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  )
);

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if(password.length >= 8)
        _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if(numericRegex.hasMatch(password))
        _hasPasswordOneNumber = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Create Your Account", style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Set a password", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Please create a secure password including the following criteria below.", 
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.grey.shade600),),
            SizedBox(height: 30,),
            TextField(
              onChanged: (password) => onPasswordChanged(password),
              obscureText: !_isVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: _isVisible ? Icon(Icons.visibility, color: Colors.black,) : 
                    Icon(Icons.visibility_off, color: Colors.grey,),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)
                ),
                hintText: "Password",
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: _isPasswordEightCharacters ?  Colors.green : Colors.transparent,
                    border: _isPasswordEightCharacters ? Border.all(color: Colors.transparent) :
                      Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                ),
                SizedBox(width: 10,),
                Text("Contains at least 8 characters")
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: _hasPasswordOneNumber ?  Colors.green : Colors.transparent,
                    border: _hasPasswordOneNumber ? Border.all(color: Colors.transparent) :
                      Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                ),
                SizedBox(width: 10,),
                Text("Contains at least 1 number")
              ],
            ),
            SizedBox(height: 50,),
            MaterialButton(
              height: 40,
              minWidth: double.infinity,
              onPressed: () {},
              color: Colors.black,
              child: Text("CREATE ACCOUNT", style: TextStyle(color: Colors.white),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
            )
          ],
        ),
      ),
    );
  }
}
