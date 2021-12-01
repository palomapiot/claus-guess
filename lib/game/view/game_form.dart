
import 'package:claus_guess/views/word_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GameForm extends StatelessWidget {
  const GameForm({Key? key}) : super(key: key);

  Widget createButton(int index) {
    const alphabet = 'abcdefghijklmnopqrstuvwxyz';
    final buttonStatus = List<bool>.generate(26, (index) {
      return true;
    });
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 6),
      child: Center(
        child: WordButton(
          buttonTitle: alphabet[index].toUpperCase(),
          onPress: buttonStatus[index] ? () => wordPress(index) : null,
        ),
      ),
    );
  }


  void wordPress(int index) {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 8, 6, 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(top: 0.5),
                                  child: IconButton(
                                    tooltip: 'Lives',
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    iconSize: 39,
                                    icon: const Icon(MdiIcons.heart),
                                    onPressed: () {},
                                  ),
                                ),
                                Container(
                                  padding:
                                  const EdgeInsets.fromLTRB(8.7, 7.9, 0, 0.8),
                                  alignment: Alignment.center,
                                  child: const SizedBox(
                                    height: 38,
                                    width: 38,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child: Text(
                                          '6', // TODO: read value from bloc state
                                          style: TextStyle(
                                            color: Color(0xFFb11e31),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'PatrickHand',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: FittedBox(
                        child: Image.asset(
                          'img/0.png', // TODO: read value from bloc state -> 0 is 0 error, 1 is 1 error... (img/$clausState.png)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      alignment: Alignment.center,
                      child: const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'C__IS___S', // TODO: read value from bloc state -> progress word
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 40,
                            letterSpacing: 7,
                            color: Colors.white,
                            fontFamily: 'PatrickHand',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 2, 8, 10),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                //columnWidths: {1: FlexColumnWidth(10)},
                children: [
                  TableRow(children: [
                    TableCell(
                      child: createButton(0),
                    ),
                    TableCell(
                      child: createButton(1),
                    ),
                    TableCell(
                      child: createButton(2),
                    ),
                    TableCell(
                      child: createButton(3),
                    ),
                    TableCell(
                      child: createButton(4),
                    ),
                    TableCell(
                      child: createButton(5),
                    ),
                    TableCell(
                      child: createButton(6),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: createButton(7),
                    ),
                    TableCell(
                      child: createButton(8),
                    ),
                    TableCell(
                      child: createButton(9),
                    ),
                    TableCell(
                      child: createButton(10),
                    ),
                    TableCell(
                      child: createButton(11),
                    ),
                    TableCell(
                      child: createButton(12),
                    ),
                    TableCell(
                      child: createButton(13),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: createButton(14),
                    ),
                    TableCell(
                      child: createButton(15),
                    ),
                    TableCell(
                      child: createButton(16),
                    ),
                    TableCell(
                      child: createButton(17),
                    ),
                    TableCell(
                      child: createButton(18),
                    ),
                    TableCell(
                      child: createButton(19),
                    ),
                    TableCell(
                      child: createButton(20),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: createButton(21),
                    ),
                    TableCell(
                      child: createButton(22),
                    ),
                    TableCell(
                      child: createButton(23),
                    ),
                    TableCell(
                      child: createButton(24),
                    ),
                    TableCell(
                      child: createButton(25),
                    ),
                    const TableCell(
                      child: Text(''),
                    ),
                    const TableCell(
                      child: Text(''),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
