class CourseDetailsState {
  final String name;
  final double rating;
  final double price;
  final bool isBought;
  final String description;

  CourseDetailsState({
    this.name,
    this.rating,
    this.price,
    this.isBought,
    this.description,
  });

  CourseDetailsState.initial()
      : this(
          name: '',
          rating: 0,
          price: 0,
          isBought: false,
          description: '',
        );

  CourseDetailsState copyWith({
    String name,
    double rating,
    double price,
    bool isBought,
    String description,
  }) =>
      CourseDetailsState(
        name: name ?? this.name,
        rating: rating ?? this.rating,
        price: price ?? this.price,
        isBought: isBought ?? this.isBought,
        description: description ?? this.description,
      );
}
