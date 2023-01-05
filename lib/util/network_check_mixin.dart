import 'package:flutter/material.dart';

import '../widgets/network_banner.dart';

mixin NetworkCheckMixin<T extends StatefulWidget> on State<T> {
  var networkMaterialBanner = NetworkCheckBanner();

  @override
  void initState() {
    super.initState();
    networkMaterialBanner.initBanner(context);
  }

  @override
  void dispose() {
    networkMaterialBanner.disposeBanner();
    super.dispose();
  }
}
