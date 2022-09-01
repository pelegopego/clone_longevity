import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(100.0),
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
        color: Colors.green[300],
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 5, right: 5),
          child: Column(
            children: [
              Container(
                color: Colors.red,
                padding: EdgeInsets.all(5),
                child: Column(children: [
                  Row(children: [
                    const CircleAvatar(
                      minRadius: 25,
                      foregroundImage: NetworkImage(
                          'https://thumbs.dreamstime.com/z/beautiful-woman-face-close-up-studio-white-beauty-spa-model-f-female-clean-fresh-perfect-skin-closeup-youth-care-concept-73395757.jpg'),
                      foregroundColor: Colors.white,
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Jenny Doe',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(children: [
                        Icon(
                          Icons.supervised_user_circle,
                          color: Colors.blue[600],
                          size: 16,
                        ),
                        Text(
                          '3.5k',
                          style: TextStyle(
                            color: Colors.blue[600],
                          ),
                        )
                      ]),
                    ),
                  ]),
                  Container(
                    height: 4,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
