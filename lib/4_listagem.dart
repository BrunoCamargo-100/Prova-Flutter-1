import 'package:flutter/material.dart';

//
// PÁGINA DE LISTAGEM DOS MEDICAMENTOS
//
class PaginaLista extends StatefulWidget {
  @override
  _ListPaginaListaState createState() => _ListPaginaListaState();
}

class _ListPaginaListaState extends State<PaginaLista> {
  var toDoList = [];
  var txtToDoList = TextEditingController();
  var litems;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(30),
                child: Center(
                    child: Text("Olá Usuario, insira sua lista de tarefas...",
                        style:
                            TextStyle(fontSize: 20, color: Colors.black)))),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: txtToDoList,
                    style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Adicione sua tarefa !',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      if (txtToDoList.text.isNotEmpty) {
                        toDoList.add(txtToDoList.text);
                        txtToDoList.clear();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Tarefa adicionada com sucesso!'),
                          duration: Duration(seconds: 3),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Adicione uma tarefa'),
                          duration: Duration(seconds: 3),
                        ));
                      }
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                //Aparência do item da lista
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      toDoList[index],
                      style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          toDoList.removeAt(index);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Tarefa Removida com sucesso!'),
                            duration: Duration(seconds: 3),
                          ));
                        });
                      },
                    ),
                  );
                },

                //Aparência do divisor
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.blue[900],
                    thickness: 1,
                  );
                },
                itemCount: toDoList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
