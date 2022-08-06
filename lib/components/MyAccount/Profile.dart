import 'package:ficar/Constants/routes.dart';
import 'package:ficar/components/Account/profile_picture.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //  final icon = CupertinoIcons.moon_stars;
  @override
  Widget build(BuildContext context) {
     return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SizedBox(
          //   height: kSpacingUnit.w * 3,
          // ),
          //IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
           const ProfilePicture(),
          //  IconButton(onPressed: () {}, icon: Icon(icon)),
          // SizedBox(
          //   height: kSpacingUnit.w *3,
          // ),
        ],
      ),
    );
  }
}