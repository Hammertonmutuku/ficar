import 'package:ficar/Constants/routes.dart';
import 'package:ficar/components/Account/profile_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = CupertinoIcons.moon_stars;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: kSpacingUnit.w * 10,
          ),
         IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          const ProfilePicture(),
           IconButton(onPressed: () {}, icon: Icon(icon)),
          SizedBox(
            height: kSpacingUnit.w *3,
          ),
        ],
      ),
    );
  }
}