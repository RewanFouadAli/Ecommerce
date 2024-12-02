import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signup_cubit/signup_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(InitialState());

  Future<void> signUp({
    required String phone,
    required String username,
    required String confirmpassword,
    required String password,
    required String email,
  }) async {
    emit(LoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user?.uid)
          .set({
        'email': email,
        'phone': phone,
        'confirmpassword': confirmpassword,
        'username': username,
        'createdAt': FieldValue.serverTimestamp(),
      });

      emit(SuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(ErrorState('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(ErrorState('The account already exists for that email.'));
      } else {
        emit(ErrorState('An error occurred: ${e.message}'));
      }
    } catch (e) {
      emit(ErrorState('Network error. Please try again later.'));
    }
  }

  Future<Map<String, dynamic>> getLastUserData() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get();

      if (data.docs.isNotEmpty) {
        return data.docs.first.data();
      } else {
        throw Exception('No data available');
      }
    } catch (e) {
      rethrow;
    }
  }
}
