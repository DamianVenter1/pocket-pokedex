import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pocket_pokedex/architecture/authentication/entities/authentication.dart';
import 'package:pocket_pokedex/core/services/storage/storage_service.dart';
import 'package:rxdart/subjects.dart';

class AuthenticationService {
  final StorageService _storageService;
  final FirebaseAuth _firebaseAuth;
  late final BehaviorSubject<Authentication> _controller;

  AuthenticationService(
    this._storageService, {
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance {
    _controller = BehaviorSubject.seeded(Authentication.determining());
    _init();
  }

  Future<void> _init() async {
    _firebaseAuth.authStateChanges().listen((user) async {
      final auth = Authentication.fromFirebaseUser(user);
      if (auth.isAuthenticated) {
        await _storageService.setAuthentication(auth);
      } else {
        await _storageService.removeAuthentication();
      }
      _controller.add(auth);
    });
  }

  Stream<Authentication> get stream => _controller.stream;

  Authentication get currentAuthentication => _controller.value;

  Future<Either<Exception, void>> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, void>> signUp(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    await _storageService.removeAuthentication();
    _controller.add(Authentication.unauthenticated());
  }
}
