import 'package:flutter/material.dart';

class Paginalogin extends StatefulWidget {
  @override
  _PaginaloginState createState() => _PaginaloginState();
}

class Login {
  String loginEmail = '';
  String loginSenha = '';
}

class _PaginaloginState extends State<Paginalogin> {
  var emailLogin;
  var senhaLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 60, left: 40, right: 40),
            color: Color(0xfffff),
            child: ListView(
              children: <Widget>[
                SizedBox(
                    width: 128,
                    height: 128,
                    child: Center(
                      child: Image.asset("assets/images/fotoLogin.jpg"),
                    )),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "E-mail",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  onChanged: (value) {
                    emailLogin = value.toString();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Senha",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  onChanged: (value) {
                    senhaLogin = value.toString();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(children: [
                    ElevatedButton(
                        child: SizedBox(
                            width: 150,
                            height: 30,
                            child: Center(child: Text('Login'))),
                        onPressed: () {
                          setState(() {
                            if (emailLogin == null || senhaLogin == null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Insira seus dados!'),
                                duration: Duration(seconds: 3),
                              ));
                            } else {
                                if (emailLogin == 'admin@email.com' &&
                                    senhaLogin == 'admin123') {
                                  Navigator.pushNamed(context, '/lista');
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text('Acesso Negado! Por favor verifique novamente o e-mail e a senha.'),
                                    duration: Duration(seconds: 4),
                                  ));
                                }
                              }
                            }
                          );
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            child: SizedBox(
                                width: 150,
                                height: 30,
                                child:
                                    Center(child: Text('Cadastrar'))),
                            onPressed: () {
                              Navigator.pushNamed(context, '/cadastro');
                            },
                          ),
                        ])
                  ]),
                )
              ],
            )));
  }
}
