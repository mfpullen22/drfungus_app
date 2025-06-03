import 'package:azlistview/azlistview.dart';

class Trial with ISuspensionBean {
  Trial(
      {required this.name,
      required this.organization,
      required this.principal,
      required this.description,
      required this.url,
      required this.email})
      : tag = name[0].toUpperCase();

  final String name;
  String tag;
  final String organization;
  final String principal;
  final String description;
  final String url;
  final String email;

  @override
  String getSuspensionTag() => tag;
}
