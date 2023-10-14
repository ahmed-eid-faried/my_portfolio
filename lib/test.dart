sum(List<double> listnum) {
  double sum = 0.0;
  for (var element in listnum) {
    sum += element;
  }
  return sum;
}

product(List<double> listnum) {
  double product = 1;
  for (var element in listnum) {
    product *= element;
  }
  return product;
}
