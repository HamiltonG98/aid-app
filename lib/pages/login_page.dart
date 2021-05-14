import 'package:flutter/material.dart';
import 'package:aid_app/constants/constants.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            columnUp(context),
            SizedBox(
              height: 40,
            ),
            buildFields(),
          ],
        ),
      )),
    );
  }

  Widget columnUp(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          child: Image.asset(
            'assets/img/Taza.png',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text('Ahora puedes',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
        Text(
          'Iniciar Sesión',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue[900])),
            border: UnderlineInputBorder(),
            suffixIcon: Icon(Icons.person, color: Colors.blue[900]),
            labelText: 'Nombre de usuario',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue[900])),
            border: UnderlineInputBorder(),
            suffixIcon: Icon(
              Icons.lock,
              color: Colors.blue[900],
            ),
            labelText: 'Contraseña',
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 40,
        ),
        ButtonTheme(
          height: 55,
          minWidth: 300,
          child: FlatButton(
            textColor: Colors.white,
            color: Constants.blue,
            onPressed: () {},
            child: Text(
              'Iniciar sesión',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),
        FlatButton(
          child: Text('¿Olvidaste tu contraseña?'),
          onPressed: () {},
        )
      ],
    );
  }
}
