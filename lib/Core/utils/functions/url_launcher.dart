import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher(String stringUrl) async {
  final Uri url = Uri.parse(stringUrl);

  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
