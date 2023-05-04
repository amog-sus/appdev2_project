enum Price {
  low,
  medium,
  high
}

enum Temperature {
  cold,
  comfortable,
  warm
}

class Country {
  String name;
  String capital;
  String imageUrl;
  Price price;
  Temperature temperature;
  List<Language> languages;

  Country(this.name, this.capital, this.imageUrl, this.price, this.temperature, this.languages);
}

class Language {
  String name;

  Language(this.name);
}