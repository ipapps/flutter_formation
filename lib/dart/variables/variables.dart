void variables() {
  var inferredType = 1;
  print(inferredType.runtimeType);

  dynamic dynamicType = 1;
  print(dynamicType.runtimeType);
  dynamicType = "hello";
  print(dynamicType.runtimeType);

  //inferredType = "hello" DOES NOT COMPILE

  int noPrimitiveType = 1;
  print(noPrimitiveType.isEven);

  const finalVariable = "hello";
  //finalVariable = "goodbye"; DOES NOT COMPILE

  final String finalVariableToCompute;
  if (false) {
    finalVariableToCompute = "hello";
  } else {
    finalVariableToCompute = "goodbye";
  }

  print(finalVariableToCompute); //The final variable 'finalVariableToCompute'
  // can't be read because it's potentially unassigned at this point.

  //const String constString; DOES NOT COMPILE, MUST BE INSTANTIATED
}