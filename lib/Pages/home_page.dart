import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../default_widget.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://media.discordapp.net/attachments/268907328961511435/1040771820757995560/MenuIlustracionTerminada.png?width=1202&height=676',
      'https://media.discordapp.net/attachments/268907328961511435/1040771872024956989/image4.jpg?width=1202&height=676',
      'https://media.discordapp.net/attachments/268907328961511435/1040771843675660328/image2.jpg?width=1202&height=676',
      'https://media.discordapp.net/attachments/268907328961511435/1040771974718296064/Gameplay3.jpg?width=1202&height=676',
      'https://media.discordapp.net/attachments/268907328961511435/1040771853385470023/image3.jpg?width=1202&height=676',
      'https://media.discordapp.net/attachments/268907328961511435/1040772742498238524/Gameplay2.jpg?width=1202&height=676'
    ];

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    void htmlOpenLink() {
      String url = 'https://globalgamejam.org/2021/games/wheres-my-mind-7';
      html.window.open(url, '_blank');
    }

    void htmlDownloadLink() {
      String url =
          'https://drive.google.com/file/d/1dV80AruOKws0somJ5KZ_ByEHp4K_z5Lz/view?usp=share_link';
      html.window.open(url, '_blank');
    }

    ScrollController _controller = ScrollController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          //AppBar
          SliverAppBar(
            toolbarHeight: 100,
            backgroundColor: primaryColor,
            centerTitle: true,
            title: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: "WHERE'S MY MIND?\n",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: 'Disponible en PC!',
                        style: TextStyle(fontSize: 22)),
                  ],
                )),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  htmlDownloadLink();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 4.3,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Image.network(
                          'https://media.discordapp.net/attachments/268907328961511435/1040797767766908968/menu3.png',
                          height: 20,
                        ),
                      ),
                      const Flexible(
                        child: Text(
                          'Descargar',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),

          //Carrusel
          sliverList(
            child: Container(
                margin: const EdgeInsets.only(top: 25, bottom: 25),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 570,
                    viewportFraction: .9,
                    enableInfiniteScroll: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    initialPage: 6,
                    autoPlay: true,
                  ),
                  items: imageSliders,
                )),
          ),
          //Info
          sliverList(
              child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: secondaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 567,
                  height: 402,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://media.discordapp.net/attachments/268907328961511435/1040804189028225045/image5.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Sobre el juego',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '\nJulián, un joven universitario que día a día intenta sacar adelante su carrera universitaria, está teniendo mucho estrés estudiando su semestre virtual. Se está perdiendo en su mente, sin concentración y sin ninguna motivación para continuar. Quiere convertirse en un mejor estudiante pero conseguirlo no será una tarea fácil, tendrá que sortear todos los obstáculos para alcanzar su meta. Ayuda a Julian a encontrar su motivación para continuar su semestre virtual. Corre por un laberinto evitando las distracciones y recupera la motivación.',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          )),
          //GGJ Barra
          sliverList(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              margin: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: primaryColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: Offset(0, 10),
                  ),
                ],
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://media.discordapp.net/attachments/268907328961511435/1040775522688450671/distraccionIdle14.png?width=1202&height=676'),
                  alignment: Alignment.centerRight,
                ),
              ),
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Desarrollado para la Global Game Jam 2020 (GGJ 2020)',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 3,
                          offset: const Offset(
                            0,
                            10,
                          ),
                        ),
                      ],
                    ),
                    child: InkWell(
                      child: const Text(
                        'Sitio Web',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () => htmlOpenLink(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Equipo
          sliverList(
              child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: secondaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 567,
                  height: 402,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://media.discordapp.net/attachments/268907328961511435/1040804206338134016/image6.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Equipo',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '\nYefri Avella\nMariana Cano\nJordan Bolivar\nValentina Gil\nAndrés Álvarez\n\nEstudiantes de Ingeniería en Diseño de Entretenimiento Digital de la Universidad Pontificia Bolivariana.',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          )),
          /*],
          ),*/
        ],
      ),
    );
  }
}
