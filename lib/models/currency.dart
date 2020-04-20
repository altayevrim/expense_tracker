class Currency {
  final String currency;
  final bool positionLeft;

  Currency(this.currency, this.positionLeft);

  String left() {
    return positionLeft ? currency : '';
  }

  String right() {
    return positionLeft ? '' : currency;
  }
}
