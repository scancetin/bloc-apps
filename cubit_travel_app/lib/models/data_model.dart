class DataModel {
  String name;
  String image;
  String description;
  String location;
  int price;
  int stars;

  DataModel({
    required this.name,
    required this.image,
    required this.description,
    required this.location,
    required this.price,
    required this.stars,
  });

  static List<DataModel> mockDataList = [
    DataModel(
      name: "Example",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Mt._Kilimanjaro_12.2006.JPG/1920px-Mt._Kilimanjaro_12.2006.JPG",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing Doneget dignissim leo ultricies.",
      location: "California",
      price: 350,
      stars: 4,
    )
  ];
}
