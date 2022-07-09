import 'package:flutter/material.dart';

class BottomInformationParent extends StatelessWidget {
  const BottomInformationParent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: [
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
                fontWeight: FontWeight.bold),
                          ),
                          Text(
            'Yellow Nissan',
            style: TextStyle(
              color: Colors.grey,
            ),
                          ),
             Text(
            'KBY 624L',
            style: TextStyle(
              color: Colors.grey,
            ),
                          ),
             Text(
            '6 children on board',
            style: TextStyle(
              color: Colors.grey,
            ),
                          )
                        ],
                    ),
          ),
        ],
      ),
    );
  }
}
