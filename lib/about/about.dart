import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ContainedTabBarView(
                  tabs: const [
                    Center(
                      child: Text(
                        'Santa Claus',
                        style: TextStyle(
                          fontFamily: 'PatrickHand',
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Apalpador',
                        style: TextStyle(
                          fontFamily: 'PatrickHand',
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Reyes Magos',
                        style: TextStyle(
                          fontFamily: 'PatrickHand',
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                  tabBarProperties:
                      const TabBarProperties(indicatorColor: Colors.white),
                  views: [
                    SingleChildScrollView(
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'In the United States, Santa Claus is often '
                            'depicted as flying from his home to home on '
                            'Christmas Eve to deliver toys to children. He '
                            'flies on his magic sleigh led by his reindeer: '
                            'Dasher, Dancer, Prancer, Vixen, Comet, Cupid, '
                            'Donner, Blitzen, and the most famous reindeer of '
                            'all, Rudolph. \n\nSanta enters each home through '
                            'the chimney, which is why empty Christmas '
                            'stockings are hung by the Chimney with care, in '
                            'hopes that St. Nicholas soon would be there. '
                            'Stockings can be filled with candy canes and other'
                            ' treats or small toys. \n\nSanta Claus and his '
                            'wife, Mrs. Claus, call the North Pole home, and '
                            'children write letters to Santa and track Santa’s '
                            'progress around the world on Christmas Eve. \n\n'
                            'Children often leave cookies and milk for Santa '
                            'and carrots for his reindeer on Christmas Eve. '
                            'Santa Claus keeps a “naughty list” and a “nice '
                            'list” to determine who deserves gifts on Christmas'
                            ' morning.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'O Apalpador é un home moi grande que vive nas '
                            'montañas de Lugo, ocupado durante todo o ano en '
                            'facer carbón. Come froitos silvestre e porcos '
                            'bravos que caza no monte. Viste un traxe vello e '
                            'cheo de remendos, e unha boina. Fuma en pipa e ten'
                            ' barba. \n\nO Apalpador, todos os 24 de decembro '
                            'baixa das montañas para visitar aos nenos e nenas '
                            'galegas. \n\nCando están durmidos tócalles a '
                            'barriga para ver se están fartos ou teñen fame. Se'
                            ' están fartos di: “así, así esteas todo o ano”- e '
                            'déixalles unha presa de castañas. Se teñen fame '
                            'non di nada, pero déixalle castañas igual.\n\n'
                            'Tamén pode deixar algún agasallo máis agochado en '
                            'calquera lugar da casa e que os nenos e nenas '
                            'temos que buscar ao erguernos. Estes agasallos '
                            'soen ser manualidades que o Apalpador elabora coas'
                            ' súas mans ao longo do ano coa madeira dos montes '
                            'do Caurel.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'La historia cuenta que tres reyes magos fueron '
                            'guiados por la estrella de Belén hasta el lugar '
                            'que contiene el mismo nombre. Esta estrella '
                            'señalaría el nacimiento del niño Jesús, y los '
                            'reyes magos le llevaron regalos, los cuales eran '
                            'oro, mirra e incienso. \n\nEl oro representa la '
                            'naturaleza real del niño Jesús, el incienso '
                            'representa su naturaleza divina, el incienso es '
                            'una forma de alabar a Dios. Y la mirra es un '
                            'compuesto que en esa época se utilizaba para '
                            'embalsamar a los muertos, era una representación '
                            'de la muerte futura del niño Jesús. \n\nEs '
                            'tradición que el 6 de enero lleguen los Reyes '
                            'Magos para dejarles a los niños del mundo sus '
                            'regalos. En algunos países se estila que los niños'
                            ' dejen los zapatos cerca del árbol para que allí '
                            'los reyes depositen sus regalos. También se '
                            'acostumbra dejarle pasto y agua, dulces y hasta '
                            'pasteles dependiendo del país.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 64,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFb11e31),
                          ),
                          child: const Text(
                            'Back',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
