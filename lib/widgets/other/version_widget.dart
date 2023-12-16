import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../common/commons.dart';
import '../../config/app_env.dart';
import '../../res/res.dart';
import '../widgets.dart';

class VersionAppWidget extends StatelessWidget {
  const VersionAppWidget({Key? key}) : super(key: key);

  Future<String> _getVersionApp() async {
    PackageInfo package = await PackageInfo.fromPlatform();

    return '${package.version} ${AppEnv().environment != Constants.prodEnvironment ? AppEnv().environment : ''}';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getVersionApp(),
      builder: (cxt, snapshot) {
        return Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                20.verticalSpace,
                TextView(
                  '${Strings.version} ${snapshot.data}',
                  textAlign: TextAlign.center,
                ),
                const TextView(Strings.developer, bottom: 3),
              ],
            ),
          ),
        );
      },
    );
  }
}
