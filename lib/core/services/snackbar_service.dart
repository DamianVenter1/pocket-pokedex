import 'package:rxdart/subjects.dart';

class SnackbarService {
  final BehaviorSubject<List<SnackbarMessage>> _messageStream =
      BehaviorSubject.seeded(const []);

  List<SnackbarMessage> get _messages => _messageStream.value;

  Stream<List<SnackbarMessage>> get stream => _messageStream.stream;

  void show(SnackbarMessage message) {
    final List<SnackbarMessage> newMessages = List.from(_messages)
      ..add(message);
    _messageStream.add(newMessages);
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
    ).then((_) {
      hide(message);
    });
  }

  void hide(SnackbarMessage message) {
    if (_messages.contains(message)) {
      final List<SnackbarMessage> newMessages = List.from(_messages)
        ..remove(message);
      _messageStream.add(newMessages);
    }
  }
}

class SnackbarMessage {
  final String message;

  const SnackbarMessage({
    required this.message,
  });
}
