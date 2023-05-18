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
  String id;
  String name;
  String capital;
  Price price;
  Temperature temperature;
  List<Language> languages;

  Country(this.id, this.name, this.capital, this.price, this.temperature, this.languages);
}

class Language {
  String name;

  Language(this.name);
}