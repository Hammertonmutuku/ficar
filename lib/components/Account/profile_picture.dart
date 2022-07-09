import 'package:ficar/Constants/routes.dart';
import 'package:ficar/components/Login/size_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Expanded(
      child: Column(
        children: [
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 1.5),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: kSpacingUnit.w * 6,
                  backgroundImage: const AssetImage('assets/images/avatar.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      LineAwesomeIcons.pen,
                      color: Colors.white,
                      size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
        const  Text('Hammerton Mutuku', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
          SizedBox(height: kSpacingUnit.w * 1),
        const Text('hammertonmutuku@gmail.com', style: TextStyle(fontSize: 12, color: kTextClor),)
        ],
      ),
    );
  }
}
