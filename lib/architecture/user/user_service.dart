import 'package:pocket_pokedex/architecture/authentication/authentication_service.dart';
import 'package:pocket_pokedex/architecture/user/entities/user.dart';
import 'package:pocket_pokedex/core/services/storage/storage_service.dart';
import 'package:rxdart/subjects.dart';

class UserService {
  final StorageService _storageService;
  final AuthenticationService _authenticationService;
  late final BehaviorSubject<User?> _controller;

  UserService(
    this._storageService,
    this._authenticationService,
  ) {
    _controller = BehaviorSubject.seeded(null);
    _authenticationService.stream.distinct().listen((auth) async {
      if (auth.isUnauthenticated) {
        await _storageService.removeUser();
        _controller.add(null);
      } else if (auth.isAuthenticated) {
        populateUser();
      }
    });
  }

  Stream<User?> get stream => _controller.stream;

  User? get currentUser => _controller.value;

  Future<void> populateUser() async {
    final user = await _storageService.getUser();
    if (user == null) {
      await getUser();
    } else {
      _controller.add(user);
    }
  }

  Future<void> getUser() async {
    await Future.delayed(const Duration(seconds: 2));
    final user = User(id: "0", name: "John doe");
    await _storageService.setUser(user);
    _controller.add(user);
  }
}
