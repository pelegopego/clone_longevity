// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(95.0),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  // ignore: library_private_types_in_public_api
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10), // Creates border
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 5, right: 5),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Column(children: [
                  Row(children: [
                    const CircleAvatar(
                      minRadius: 25,
                      foregroundImage: NetworkImage(
                          'https://thumbs.dreamstime.com/z/beautiful-woman-face-close-up-studio-white-beauty-spa-model-f-female-clean-fresh-perfect-skin-closeup-youth-care-concept-73395757.jpg'),
                      foregroundColor: Colors.white,
                    ),
                    const Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                            left: 30,
                          ),
                          child: Text(
                            'Jane Cooper',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Comfortaa',
                                fontSize: 16),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(children: [
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.supervised_user_circle,
                              color: Colors.blue[400],
                              size: 15,
                            )),
                        Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Text(
                              '3.5k',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Comfortaa',
                                color: Colors.blue[400],
                              ),
                            )),
                      ]),
                    ),
                  ]),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: 4,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
