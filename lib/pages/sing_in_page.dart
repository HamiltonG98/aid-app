import 'package:aid_app/classes/authentication_service.dart';
import 'package:aid_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingInPage extends ConsumerWidget {
  const SingInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
        body: Stack(
      children: [
        _buildForm(emailController, passwordController, context),
      ],
    ));
    ;
  }

  Widget _buildForm(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Hero(
              child: Image.asset(
                "assets/img/logo2.png",
                width: 150.0,
              ),
              tag: "logo",
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "¡Hola por ahí!",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "¡Bienvenido!",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 5),
                labelText: "Email",
                icon: Icon(Icons.person),
                border: UnderlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 5),
                icon: Icon(Icons.lock),
                labelText: "Contraseña",
                border: UnderlineInputBorder()),
          ),
          SizedBox(
            height: 40.0,
          ),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            height: 50.0,
            child: RaisedButton(
              color: Constants.blue,
              textColor: Colors.white,
              onPressed: () {
                context.read<AuthenticationService>(authProvider).signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim());
              },
              child: Text(
                "Iniciar Sesión",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
                text: "¿Olvidaste tu contraseña? "),
            TextSpan(
                style: TextStyle(
                    fontSize: 15,
                    color: Constants.orange,
                    fontWeight: FontWeight.bold),
                text: "Recuperar",
                ),
          ])),
        ],
      ),
    );
  }
}
