String pngIconsName(String? image) {
  return 'assets/icons/$image.png';
}
String pngImageName(String? image) {
  return 'assets/images/$image.jpg';
}

class AppIcons {
  static String get icon => pngIconsName('img');
}
class AppImages {
  static String get cloudImage => pngImageName('cloud');
}