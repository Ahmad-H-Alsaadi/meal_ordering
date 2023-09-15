class Category {
  final int id;
  final String categoryName, categoryImage, categoryDescription;

  Category({
    required this.id,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryDescription,
  });
}

// List<Category> categories = [
//   Category(
//       id: 1,
//       categoryName: "Beef",
//       categoryImage: "https://www.themealdb.com/images/category/beef.png",
//       categoryDescription:
//           "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]",
//       price: 75),
//   Category(
//       id: 2,
//       categoryName: "Chicken",
//       categoryImage: "https://www.themealdb.com/images/category/chicken.png",
//       categoryDescription:
//           "Chicken is a type of domesticated fowl, a subspecies of the red junglefowl. It is one of the most common and widespread domestic animals, with a total population of more than 19 billion as of 2011.[1] Humans commonly keep chickens as a source of food (consuming both their meat and eggs) and, more rarely, as pets.",
//       price: 60),
//   Category(
//       id: 3,
//       categoryName: "Dessert",
//       categoryImage: "https://www.themealdb.com/images/category/dessert.png",
//       categoryDescription:
//           "Dessert is a course that concludes a meal. The course usually consists of sweet foods, such as confections dishes or fruit, and possibly a beverage such as dessert wine or liqueur, however in the United States it may include coffee, cheeses, nuts, or other savory items regarded as a separate course elsewhere. ",
//       price: 45),
//   Category(
//       id: 4,
//       categoryName: "Lamb",
//       categoryImage: "https://www.themealdb.com/images/category/lamb.png",
//       categoryDescription:
//           "Lamb, hogget, and mutton are the meat of domestic sheep (species Ovis aries) at different ages.\r\n\r\nA sheep in its first year is called a lamb, and its meat is also called lamb. The meat of a juvenile sheep older than one year is hogget; outside the USA this is also a term for the living animal. ",
//       price: 55),
//   Category(
//       id: 5,
//       categoryName: "Miscellaneous",
//       categoryImage:
//           "https://www.themealdb.com/images/category/miscellaneous.png",
//       categoryDescription: "General foods that don't fit into another category",
//       price: 43),
//   Category(
//       id: 6,
//       categoryName: "Pasta",
//       categoryImage: "https://www.themealdb.com/images/category/pasta.png",
//       categoryDescription:
//           "Pasta is a staple food of traditional Italian cuisine, with the first reference dating to 1154 in Sicily.\nAlso commonly used to refer to the variety of pasta dishes, pasta is typically a noodle made from an unleavened dough of a durum wheat flour mixed with water or eggs and formed into sheets or various shapes, then cooked by boiling or baking.",
//       price: 65),
//   Category(
//       id: 7,
//       categoryName: "Pork",
//       categoryImage: "https://www.themealdb.com/images/category/pork.png",
//       categoryDescription:
//           "Pork is the culinary name for meat from a domestic pig (Sus scrofa domesticus). It is the most commonly consumed meat worldwide,[1] with evidence of pig husbandry dating back to 5000 BC. Pork is eaten both freshly cooked and preserved. Curing extends the shelf life of the pork products. Ham, smoked pork, gammon, bacon and sausage are examples of preserved pork. ",
//       price: 1),
//   Category(
//       id: 8,
//       categoryName: "Seafood",
//       categoryImage: "https://www.themealdb.com/images/category/seafood.png",
//       categoryDescription:
//           'Seafood is any form of sea life regarded as food by humans. Seafood prominently includes fish and shellfish. Shellfish include various species of molluscs, crustaceans, and echinoderms. Historically, sea mammals such as whales and dolphins have been consumed as food, though that happens to a lesser extent in modern times. ',
//       price: 85),
//   Category(
//       id: 9,
//       categoryName: "Side",
//       categoryImage: "https://www.themealdb.com/images/category/side.png",
//       categoryDescription:
//           "A side dish, sometimes referred to as a side order, side item, or simply a side, is a food item that accompanies the entrée or main course at a meal. Side dishes such as salad, potatoes and bread are commonly used with main courses throughout many countries of the western world.",
//       price: 15),
//   Category(
//       id: 10,
//       categoryName: "Starter",
//       categoryImage: "https://www.themealdb.com/images/category/starter.png",
//       categoryDescription:
//           "An entrée in modern French table service and that of much of the English-speaking world (apart from the United States and parts of Canada) is a dish served before the main course of a meal; it may be the first dish served, or it may follow a soup or other small dish or dishes. ",
//       price: 15),
//   Category(
//       id: 11,
//       categoryName: "Vegan",
//       categoryImage: "https://www.themealdb.com/images/category/vegan.png",
//       categoryDescription:
//           "Veganism is both the practice of abstaining from the use of animal products, particularly in diet, and an associated philosophy that rejects the commodity status of animals.[b] A follower of either the diet or the philosophy is known as a vegan (pronounced /ˈviːɡən/ VEE-gən).",
//       price: 45),
//   Category(
//       id: 12,
//       categoryName: "Vegetarian",
//       categoryImage: "https://www.themealdb.com/images/category/vegetarian.png",
//       categoryDescription:
//           "Vegetarianism is the practice of abstaining from the consumption of meat (red meat, poultry, seafood, and the flesh of any other animal), and may also include abstention from by-products of animal slaughter.\r\n\r\nVegetarianism may be adopted for various reasons.",
//       price: 40),
//   Category(
//       id: 13,
//       categoryName: "Breakfast",
//       categoryImage: "https://pngimg.com/d/breakfast_PNG4.png",
//       categoryDescription:
//           'Breakfast is the first meal of a day. The word in English refers to breaking the fasting period of the previous night. There is a strong likelihood for one or more "typical", or "traditional", breakfast menus to exist in most places, but their composition varies widely from place to place.',
//       price: 35),
//   Category(
//       id: 14,
//       categoryName: "Goat",
//       categoryImage:
//           "https://static.vecteezy.com/system/resources/previews/026/912/535/original/grilled-steak-clipart-generative-ai-png.png",
//       categoryDescription:
//           "The domestic goat or simply goat (Capra aegagrus hircus) is a subspecies of C. aegagrus domesticated from the wild goat of Southwest Asia and Eastern Europe. The goat is a member of the animal family Bovidae and the subfamily Caprinae, meaning it is closely related to the sheep. ",
//       price: 80)
// ];
