part of 'posts_bloc.dart';

enum PostStatus { initial, success, failure }

final class PostsState extends Equatable{
  final PostStatus status;
  final List<Post> posts;
  final bool hasReachMax;

  const PostsState({
    this.status=PostStatus.initial,
    this.posts=const<Post>[],
    this.hasReachMax=false    
  }) ;


  PostsState copyWith({
    PostStatus? status,
    List<Post>?  posts,
    bool ? hasReachMax
  }){
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachMax: hasReachMax?? this.hasReachMax
    );
  }
  @override
  String toString(){
    return '''PostState { status: $status, hasReachedMax: $hasReachMax, posts: ${posts.length} }''';
  }


  @override
  List<Object?> get props => [status ,posts,hasReachMax];} 
