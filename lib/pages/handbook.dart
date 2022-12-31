import 'package:flutter/material.dart';
import 'package:ttrail_laptopo/globals.dart' as globals;
import 'package:ttrail_laptopo/handbook_items/handbook_pages.dart' as hb;

class Handbook extends StatefulWidget {
  Handbook({Key? key}) : super(key: key);

  @override
  State<Handbook> createState() => _HandbookState();
}

List<Widget> pageWidgets = [];
List selectedItems = [];
List<ListTile> listTileList = [];

class _HandbookState extends State<Handbook> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.logoOrange,
        title: Text('TT Rail', style: globals.header1),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ...listTileList
          ],
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                color: globals.appOffWhite, height: globals.buttonHeight * 1.1),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    children: [...pageWidgets],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

buildTiles(context) {
  if (listTileList.length == 0) {
    listTileList.add(
      ListTile(
        title: Text(
          'Full Handbook',
          style: globals.header3,
        ),
        subtitle: Text(
          'All Subsections',
          style: globals.bodyText1,
        ),
        onTap: () {
          Navigator.pop(context);
          pageWidgets.clear();
          getPageText();
          Navigator.pushReplacementNamed(context, '/handbook');
        },
      ),
    );
    hb.trackRegulationsSubparts.forEach((key, value) {
      listTileList.add(
        ListTile(
          title: Text(
            key,
            style: globals.header3,
          ),
          subtitle: Text(
            value[0] + " - " + value[1],
            style: globals.bodyText1,
          ),
          onTap: () {
            Navigator.pop(context);
            getSectionText(hb.trackRegulationSubpartsLists[key]);
            Navigator.popAndPushNamed(context, '/handbook');
          },
        ),
      );
    });
  }
}

getPageText() {
  var tableValue;
  if (pageWidgets.length == 0) {
    hb.trackRegulationsContents.forEach((key, value) {
      tableValue = false;
      hb.trackRegulationTables.forEach((element) {
        //Looking For Tables
        if (key == element) {
          tableValue = true;
          List<Widget> tableCells = [];
          List<Widget> rowWidgets = [];
          List tempList2 = [];
          var tempList = value.split('\n');
          var rows = tempList.length;
          var columns = 0;

          tempList.forEach((set) {
            columns = '!'.allMatches(set).length + 1;
            List splitSet = [];
            splitSet.add(set.toString().split(' ! '));
            tempList2.add(splitSet);
          });

          List<String> tempList3 = [];
          tempList2.forEach((element) {
            element.forEach((subelement) {
              subelement.forEach((subsubelement) {
                tempList3.add(subsubelement);
              });
            });
          });

          tempList3.forEach((text) {
            tableCells.add(
              Container(
                height: globals.buttonHeight * 0.53,
                width: (globals.buttonHeight * 5.128) / columns,
                decoration: BoxDecoration(
                    border: Border.all(color: globals.appDarkGrey)),
                child: Text(
                  text,
                  style: globals.bodyText1,
                ),
              ),
            );
          });

          var counter = 0;
          while (counter < rows) {
            List<Widget> tempRowWidgetList = [];
            tempRowWidgetList.addAll(tableCells.getRange(0, columns));
            rowWidgets.add(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [...tempRowWidgetList],
              ),
            );
            tableCells.removeRange(0, columns);
            counter++;
          }
          pageWidgets.add(Text(
            hb.trackRegulationTableTitles[key],
            style: globals.header4,
          ));
          pageWidgets.add(Text(key));
          pageWidgets.add(SizedBox(
            height: globals.buttonHeight * 0.1,
          ));
          pageWidgets.add(
            Container(
              child: Column(
                children: [...rowWidgets],
              ),
            ),
          );
          pageWidgets.add(
            SizedBox(
              height: globals.buttonHeight * 0.2,
            ),
          );
        }
      });
      if (tableValue == false) {
        if (key.contains('Figure')) {
          pageWidgets.add(Image.asset(
            'assets/' + value,
            width: globals.buttonWidth * 8,
          ));
          pageWidgets.add(
            SizedBox(
              height: globals.buttonHeight * 0.2,
            ),
          );
        } else {
          var title = '';
          try {
            title = hb.trackRegulationSubtitles[key];
            // ignore: empty_catches
          } catch (e) {}
          if (title.length > 0) {
            pageWidgets.add(Text(
              title,
              style: globals.header5,
            ));
            pageWidgets.add(
              SizedBox(
                height: globals.buttonHeight * 0.2,
              ),
            );
          }
          (pageWidgets.add(
            Text(key + ' - ' + value),
          ));
          pageWidgets.add(
            SizedBox(
              height: globals.buttonHeight * 0.2,
            ),
          );
        }
      }
    });
  } else {
    pageWidgets.add(Text(''));
  }
}

getSectionText(List sectionsList) {
  var tableValue;
  pageWidgets.clear();
  if (pageWidgets.length == 0) {
    hb.trackRegulationsContents.forEach((key, value) {
      sectionsList.forEach((item) {
        if (key == item) {
          tableValue = false;
          hb.trackRegulationTables.forEach((element) {
            //Looking For Tables
            if (key == element) {
              tableValue = true;
              List<Widget> tableCells = [];
              List<Widget> rowWidgets = [];
              List tempList2 = [];
              var tempList = value.split('\n');
              var rows = tempList.length;
              var columns = 0;

              tempList.forEach((set) {
                columns = '!'.allMatches(set).length + 1;
                List splitSet = [];
                splitSet.add(set.toString().split(' ! '));
                tempList2.add(splitSet);
              });

              List<String> tempList3 = [];
              tempList2.forEach((element) {
                element.forEach((subelement) {
                  subelement.forEach((subsubelement) {
                    tempList3.add(subsubelement);
                  });
                });
              });

              tempList3.forEach((text) {
                tableCells.add(
                  Container(
                    height: globals.buttonHeight * 0.53,
                    width: (globals.buttonHeight * 5.128) / columns,
                    decoration: BoxDecoration(
                        border: Border.all(color: globals.appDarkGrey)),
                    child: Text(
                      text,
                      style: globals.bodyText1,
                    ),
                  ),
                );
              });

              var counter = 0;
              while (counter < rows) {
                List<Widget> tempRowWidgetList = [];
                tempRowWidgetList.addAll(tableCells.getRange(0, columns));
                rowWidgets.add(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [...tempRowWidgetList],
                  ),
                );
                tableCells.removeRange(0, columns);
                counter++;
              }
              pageWidgets.add(Text(
                hb.trackRegulationTableTitles[key],
                style: globals.header4,
              ));
              pageWidgets.add(Text(key));
              pageWidgets.add(SizedBox(
                height: globals.buttonHeight * 0.1,
              ));
              pageWidgets.add(
                Container(
                  child: Column(
                    children: [...rowWidgets],
                  ),
                ),
              );
              pageWidgets.add(
                SizedBox(
                  height: globals.buttonHeight * 0.2,
                ),
              );
            }
          });
          if (tableValue == false) {
            if (key.contains('Figure')) {
              pageWidgets.add(Image.asset(
                'assets/' + value,
                width: globals.buttonWidth * 8,
              ));
              pageWidgets.add(
                SizedBox(
                  height: globals.buttonHeight * 0.2,
                ),
              );
            } else {
              var title = '';
              try {
                title = hb.trackRegulationSubtitles[key];
                // ignore: empty_catches
              } catch (e) {}
              if (title.length > 0) {
                pageWidgets.add(Text(
                  title,
                  style: globals.header5,
                ));
                pageWidgets.add(
                  SizedBox(
                    height: globals.buttonHeight * 0.2,
                  ),
                );
              }
              (pageWidgets.add(
                Text(key + ' - ' + value),
              ));
              pageWidgets.add(
                SizedBox(
                  height: globals.buttonHeight * 0.2,
                ),
              );
            }
          }
        }
      });
    });
  } else {
    pageWidgets.add(Text(''));
  }
}
