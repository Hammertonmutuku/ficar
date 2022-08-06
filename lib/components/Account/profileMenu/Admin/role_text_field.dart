import 'package:ficar/Constants/routes.dart';
import 'package:flutter/material.dart';

 

class RoleField extends StatefulWidget {
  const RoleField({ Key? key }) : super(key: key);

  @override
  State<RoleField> createState() => _RoleFieldState();
}

class _RoleFieldState extends State<RoleField> {
  var value;
 
  final roles = ['Admin', 'Parent', 'Driver'];
  @override
  Widget build(BuildContext context) {
   return Container(
                height: 46,
                margin: EdgeInsets.all(1.5),
                padding: EdgeInsets.only(left: 44),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.white, width: 3),
                  color: Colors.white,
                ),
                //  color: Colors.white,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text('User Type'),
                    isExpanded: true,
                    value: value,
                    iconSize: 34,
                    iconEnabledColor: kPrimaryColor,
                    items: roles.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() => this.value = value),
                  ),
                ),
              );
  }
}


  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          
        ),
      );