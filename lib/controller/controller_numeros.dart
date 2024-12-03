class ControllerNumeros {
  List<int> mostrarNumeros(int num1, int num2){
    List<int> intermedios = [];
    if( num1 > num2 ){
      for(int i = num1; i >= num2; --i){
        intermedios.add(i);
      }
    } else if( num2 > num1 ){
      for(int i = num1; i <= num2; ++i){
        intermedios.add(i);
      }
    } else {
      return [];
    }
    return intermedios;
  }
}