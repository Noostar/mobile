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
}
