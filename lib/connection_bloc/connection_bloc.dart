import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'connection_bloc.freezed.dart';

part 'connection_event.dart';
part 'connection_state.dart';

@injectable
class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final InternetConnectionCheckerPlus internetConnectionChecker;

  ConnectionBloc({required this.internetConnectionChecker})
      : super(const _Initial()) {
    on<_OnConnectionChanged>(_onConnectionChanged);
    internetConnectionChecker.onStatusChange.listen((status) {
      add(ConnectionEvent.onConnectionChanged(status));
    });
  }

  FutureOr<void> _onConnectionChanged(
    _OnConnectionChanged event,
    Emitter<ConnectionState> emit,
  ) {
    emit(ConnectionState.onChanged(event.status));
  }
}
