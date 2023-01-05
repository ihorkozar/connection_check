import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../connection_bloc/connection_bloc.dart';


class NetworkCheckBanner {
  late StreamSubscription listen;

  StreamSubscription initBanner(
      BuildContext context, {
        IconData iconData = Icons.error,
      }) {
    listen = BlocProvider.of<ConnectionBloc>(context).stream.listen((state) {
      state.whenOrNull(
        onChanged: (status) {
          _onInternetStatusChanged(context, status, iconData);
        },
      );
    });
    return listen;
  }

  void _onInternetStatusChanged(
      BuildContext context,
      InternetConnectionStatus status,
      IconData iconData,
      ) {
    if (status == InternetConnectionStatus.connected) {
      ScaffoldMessenger.of(context).clearMaterialBanners();
    } else {
      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
        backgroundColor: Colors.red,
        content: const Text(
          'No Internet',
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(
          iconData,
          color: Colors.white,
        ),
        overflowAlignment: OverflowBarAlignment.start,
        actions: const [
          SizedBox(),
        ],
      ));
    }
  }

  void disposeBanner() async {
    await listen.cancel();
  }
}
