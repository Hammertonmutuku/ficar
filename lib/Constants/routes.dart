import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//routes
const loginRoute =  '/login/';
const registerRoute =  '/register/';
const mainRoute = '/main/';
const homeRoute =  '/home/';
const verifyEmailRoute =  '/verify-email/';
const myAccountRoute =  '/my-account/';
const adminRoute = '/admin/';
const profileRoute = '/profile/';

const String google_api_key = 'AIzaSyBGxyKv4HnLcXg91hQtDYjoB942OmgX058';

//color schemes
const kPrimaryColor = Color(0xFF0C9869);
const kTextClor = Color(0xff3c4046);
const kBackgroundColor = Color(0xFFF9F8FD);
const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);

//padding
const double kDefaultPadding = 20.0;
const kSpacingUnit = 10;

//Title 
final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 2),
  fontWeight: FontWeight.w600,
);

//caption
final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

//Button
final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);

//Dark Theme
final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: kLightSecondaryColor,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kLightSecondaryColor,
        displayColor: kLightSecondaryColor,
      ),
);

//Light Theme
final kLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
        color: kDarkSecondaryColor,
      ),
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kDarkSecondaryColor,
        displayColor: kDarkSecondaryColor,
      ),
);