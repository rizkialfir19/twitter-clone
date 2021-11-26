import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/core/core.dart';

class TweetCubit extends Cubit<BaseState> {
  final BaseFirebaseClient firebaseClient;

  TweetCubit({
    required this.firebaseClient,
  }) : super(InitializedState());

  Future<void> getData() async {
    debugPrint("----> Enter getData");
    emit(LoadingState());

    try {
      CollectionReference notesItemCollection =
          firebaseClient.initializeFirestore()!.collection('tweets');

      dynamic tempData = notesItemCollection.snapshots();

      Stream<QuerySnapshot> test = notesItemCollection.snapshots();

      debugPrint("---> data: $notesItemCollection");
      debugPrint("---> data: ${notesItemCollection.firestore}");
      debugPrint("---> data: $test");
      debugPrint("---> data: $tempData");
    } catch (e, s) {
      debugPrint("----> e: $e");
      debugPrint("----> s: $s");
      emit(ErrorState(error: 'Get Data Exception'));
    }
  }
}
