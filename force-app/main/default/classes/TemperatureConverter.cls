Public class TemperatureConverter {

Public static Decimal FahrenheitToCelsius (Decimal fh){
Decimal cs = (fh - 32) * 5/9;
return cs.setScale(2);
}
}