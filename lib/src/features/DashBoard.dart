// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'Home.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({Key? key}) : super(key: key);

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: 30,
            margin: EdgeInsets.only(top: 15, bottom: 40, left: 15, right: 15),
            alignment: Alignment.bottomCenter,
            child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 25,
                        offset: Offset(0, 20), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10), // Creates border
                    color: Colors.white),
                labelPadding: EdgeInsets.only(left: 5, right: 5),
                labelColor: Colors.blue[700],
                unselectedLabelColor: Colors.blueGrey[800],
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.home,
                            color: _tabController.index == 0
                                ? Colors.blue[700]
                                : Colors.blueGrey[800],
                            size: 20,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Comfortaa',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.medical_services_outlined,
                            color: _tabController.index == 1
                                ? Colors.blue[700]
                                : Colors.blueGrey[800],
                            size: 20,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Suggested',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Comfortaa',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.insert_chart_outlined_sharp,
                            color: _tabController.index == 2
                                ? Colors.blue[700]
                                : Colors.blueGrey[800],
                            size: 20,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Risks',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Comfortaa',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: TabBarView(
            controller: _tabController,
            children: [
              Home(),
              Home(),
              Home(),
            ],
          ),
        )),
      ],
    );
  }
}
