import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:la8iny/posts/bloc/posts_bloc.dart';
import 'package:la8iny/posts/models/post.dart';

part 'posts_event.dart';
part 'posts_state.dart';

const throttleDuration =Duration(milliseconds: 100);
EventTransformer<E> throttleDroppable<E>(Duration duration){
  return (events, mapper) {
    return droppable<e>().call(events.thro);
  };
  }

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final HttpClient httpClient;
  PostsBloc({required this.httpClient}) : super(PostsState()) {
    on<PostFectched>(_onPostFeched);
  }

  Future<void> _onPostFeched (PostFectched event ,Emitter <PostsState>  emitter) async{
      if (state.hasReachMax)return;
      try{
        final posts= await _fetchPosts(startIndex: state.posts.length);
        if (posts.isEmpty){
          return emit(state.copyWith(hasReachMax: true));
        }
        emit(
          state.copyWith(
            status: PostStatus.success,
            posts: [...state.posts,...posts]
          )
        );
      }
      catch(_){
        emit(state.copyWith(status: PostStatus.failure));
      }
  }
}
