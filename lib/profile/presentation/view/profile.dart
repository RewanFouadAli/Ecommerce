import 'dart:typed_data';

import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signup_cubit/signup_cubit.dart';
import 'package:ecommerce_app/profile/presentation/view/widgets/info.dart';
import 'package:ecommerce_app/profile/presentation/viewmodel/cubit/Image_State.dart';
import 'package:ecommerce_app/profile/presentation/viewmodel/cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ImageCubit, ImageState>(
          builder: (context, state) {
            debugPrint("Current state: $state");

            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SuccessState) {
              return buildProfileImage(state.image, context);
            } else if (state is ErrorState) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            return buildProfileImage(null, context);
          },
        ),
        FutureBuilder<Map<String, dynamic>>(
          future: context.read<SignUpCubit>().getLastUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('No data available.'));
            }

            final user = snapshot.data!;
            return Expanded(
              child: Info(users: [user]),
            );
          },
        ),
      ],
    );
  }

  Widget buildProfileImage(Uint8List? image, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: CircleAvatar(
                radius: 64,
                backgroundImage: image != null
                    ? MemoryImage(image)
                    : NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNKfj6RsyRZqO4nnWkPFrYMmgrzDmyG31pFQ&s",
                      ) as ImageProvider,
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  context.read<ImageCubit>().pickImage(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.add_a_photo,
                  size: 27,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
