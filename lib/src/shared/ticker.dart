class Ticker {
  const Ticker();

  Stream<int> tick({required int segundos}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => segundos - x - 1)
        .take(segundos);
  }
}
