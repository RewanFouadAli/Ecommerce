import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signin_cubit/signin_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(InitialState());

  Future<void> signIn({
    required String password,
    required String email,
  }) async {
    emit(LoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ErrorState('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ErrorState('Wrong password provided for that user.');
      }
    }
  }
}
