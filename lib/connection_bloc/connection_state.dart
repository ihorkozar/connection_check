part of 'connection_bloc.dart';

@freezed
class ConnectionState with _$ConnectionState {
  const factory ConnectionState.initial() = _Initial;

  const factory ConnectionState.onChanged(
    InternetConnectionStatus status,
  ) = _OnConnectionStatusChanged;
}
