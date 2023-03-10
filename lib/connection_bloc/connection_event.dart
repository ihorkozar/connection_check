part of 'connection_bloc.dart';

@freezed
class ConnectionEvent with _$ConnectionEvent {
  const factory ConnectionEvent.started() = _Started;
  const factory ConnectionEvent.onConnectionChanged(
    InternetConnectionStatus status,
  ) = _OnConnectionChanged;
}
