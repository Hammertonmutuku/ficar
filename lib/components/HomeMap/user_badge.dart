import 'package:ficar/Constants/routes.dart';
import 'package:flutter/material.dart';

class MapUserBadge extends StatelessWidget {
  const MapUserBadge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top:10, bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset.zero
          )
        ]
      ),
      child: Row(children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                  image: AssetImage('assets/images/avatar.png'),
                  fit: BoxFit.cover)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hammerton Mutuku',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                'My Location',
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        IconButton(onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
                                myAccountRoute, (route) => false);
        }, icon: Icon(Icons.menu,size: 40, color: kPrimaryColor,)),
      ]),
    );
  }
}
