class CourseListState {
  final List<String> courseItems;
  final bool isLoading;
  final bool hasMore;

  CourseListState({
    this.courseItems,
    this.isLoading,
    this.hasMore,
  });

  CourseListState.initial()
      : this(
          courseItems: [],
          isLoading: false,
          hasMore: true,
        );
  CourseListState copyWith({
    List<String> courseItems,
    bool isLoading,
    bool hasMore,
  }) =>
      CourseListState(
        courseItems: courseItems ?? this.courseItems,
        isLoading: isLoading ?? this.isLoading,
        hasMore: hasMore ?? this.hasMore,
      );
}
