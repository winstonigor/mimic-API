import 'dart:ui';

import 'package:flutter/material.dart';

class Config_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mimic', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow[700],
        elevation: 10,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.only(
        top: 30,
        left: 30,
        right: 30,
      ),
      child: Column(
        children: [
          Text(
            "Tempo Para cada palavra (Seg)",
            style: TextStyle(fontSize: 18),
          ),
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.av_timer_rounded), labelText: 'Tempo'),
          ),
          Padding(padding: EdgeInsets.all(15)),
          Text(
            "Rodadas",
            style: TextStyle(fontSize: 18),
          ),
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.loop_rounded), labelText: 'Nº'),
          ),
          Card(
            child: Row(
              children: [
                Text("Palavras"),
                Padding(padding: EdgeInsets.only(left: 180)),
                ElevatedButton(
                  onPressed: () {
                    print("Clicou no botão");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Atualizar',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            elevation: 10,
          )
        ],
      ),
    );
  }
}
