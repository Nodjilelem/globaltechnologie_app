Widget wrapWithBanner({required Widget child, required String? label}) {
  if (label == null) return child;

  Color bannerColor;
  switch (label) {
    case 'Promo':
      bannerColor = Colors.green;
      break;
    case 'Nouveau':
      bannerColor = Colors.blueAccent;
      break;
    case 'Beta':
      bannerColor = Colors.orange;
      break;
    default:
      bannerColor = Colors.grey;
  }

  return Banner(
    message: label,
    location: BannerLocation.topEnd,
    color: bannerColor,
    child: child,
  );
}
