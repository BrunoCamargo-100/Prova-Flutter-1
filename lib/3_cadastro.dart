import 'package:flutter/material.dart';

class PaginaCadastro extends StatefulWidget {
  @override
  _CadastroUsuarios createState() => _CadastroUsuarios();
}

class Cadastrar {
  final String email;
  final String senha;

  Cadastrar(this.email, this.senha);
}

class _CadastroUsuarios extends State<PaginaCadastro> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var txtNome = TextEditingController();
  var txtEmail, txtSenha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 60, left: 40, right: 40),
            color: Color(0xFFFFF),
            child: ListView(children: <Widget>[
              TextFormField(
                controller: txtNome,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Nome",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
                onChanged: (value) {
                  txtNome = value.toString() as TextEditingController;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "E-mail",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
                onChanged: (value) {
                  txtEmail = value.toString();
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
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
                onChanged: (value) {
                  txtSenha = value.toString();
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  child: SizedBox(
                      width: 150,
                      height: 30,
                      child: Center(child: Text('Efetuar Cadastro'))),
                  onPressed: () {
                    setState(() {
                      if (txtNome == null ||
                          txtEmail == null ||
                          txtSenha == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Dados inválidos!'),
                          duration: Duration(seconds: 2),
                        ));
                      } else {
                        Navigator.pushNamed(context, '/login');

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Cadastro efetuado com sucesso!'),
                          duration: Duration(seconds: 3),
                        ));
                      }
                    });
                  })
            ])));
  }
}
