import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../default_widget.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 100,
            backgroundColor: primaryColor,
            centerTitle: true,
            title: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: [
                  TextSpan(
                      text: "WHERE'S MY MIND?\n",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'Disponible en PC!',
                      style: TextStyle(fontSize: 22)),
                ],
                )),
          ),
          
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
                  image: NetworkImage('https://media.discordapp.net/attachments/268907328961511435/1040775522688450671/distraccionIdle14.png?width=1202&height=676'),
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
                    child: const Text(
                      'Sitio Web',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
