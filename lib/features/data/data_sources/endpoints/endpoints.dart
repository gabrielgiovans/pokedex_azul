class PokedexEndpoints {
  static String pokemon(String index) =>
      "https://pokeapi.co/api/v2/pokemon/$index/";
  static String firstGeneration() =>
      "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0";
}
