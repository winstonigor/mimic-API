import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
import 'package:mimic_app/config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                padding: const EdgeInsets.only(right: 25),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Config_Page()),
                  );
                },
                icon: Icon(Icons.settings_rounded),
                color: Colors.black)
          ],
          centerTitle: true,
          title: Text('Mimic', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.yellow[700],
          elevation: 10,
        ),
        backgroundColor: Colors.white,
        body: _body());
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _primeiroColumn(),
          _meio(),
          _button(),
        ],
      ),
    );
  }

//! primeiro
  Column _primeiroColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 1,
                right: 50,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "Grupo1",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Meninos",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                "assets/images/vs.png",
                width: 100,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 1),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "Grupo1",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Meninas",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

//! meio
  Padding _meio() {
    return Padding(
      padding: const EdgeInsets.only(top: 80, bottom: 80),
      child: Column(children: [
        Card(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30, bottom: 60),
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Dificuldade:(difilcudade)",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 9.0),
                  child: FluidSlider(
                    value: 1,
                    min: 1,
                    max: 3,
                    sliderColor: Colors.yellow[700],
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          elevation: 2,
        ),
      ]),
    );
  }

//!Botão final
  _button() {
    return Center(
      child: Column(
        children: [
          ElevatedButton.icon(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ),
            label: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Iniciar Jogo",
                style: TextStyle(color: Colors.black),
              ),
            ),
            onPressed: () {
              print("Clicou no botão");
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
