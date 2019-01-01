import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class RemoteImage {
  final String imageName;

  RemoteImage(this.imageName);

  Image toImage({int width, int height, Color color}) {
    return Image.network(base_url + this.imageName,
        width: width?.toDouble(), height: height?.toDouble(), color: color);    
  }

  static const base_url =
      'https://raw.githubusercontent.com/RelieveID/mobile-apps-assets/master/images/';
      
  static RemoteImage get boardingHome => RemoteImage('sketch-01.png');
  static RemoteImage get boardingLogin => RemoteImage('sketchh-02.png');
}

class LocalImage {
  final String imageName;

  LocalImage(this.imageName);

  SvgPicture toSvg({int width, int height, Color color}) {
    return SvgPicture.asset('images/' + imageName + '.svg',
        width: width?.toDouble(), height: height?.toDouble(), color: color);
  }

  static LocalImage get ic_call => LocalImage('ic_call');
  static LocalImage get ic_chat => LocalImage('ic_chat');
  static LocalImage get ic_discover => LocalImage('ic_discover');
  static LocalImage get ic_home => LocalImage('ic_home');
  static LocalImage get ic_profile => LocalImage('ic_profile');
}
