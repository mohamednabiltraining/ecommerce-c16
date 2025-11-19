enum  SortBy{
  PriceDesc("-price"),
  PriceAsc("price"),
  MostSelling("-sold"),
  Newest("createdAt");

  final String value;
  const SortBy(this.value);
}