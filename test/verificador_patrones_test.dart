import 'package:flutter_test/flutter_test.dart';
import 'package:loteria_dolorena/logica/verificador_patrones.dart';

void main() {
  test('detecta una línea horizontal completa', () {
    final marcadas = [
      [true, true, true, true],
      [false, false, false, false],
      [false, false, false, false],
      [false, false, false, false],
    ];
    expect(VerificadorPatrones.hayLinea(marcadas), true);
  });

  test('no detecta línea si ninguna fila está completa', () {
    final marcadas = [
      [true, true, true, false],
      [false, false, false, false],
      [false, false, false, false],
      [false, false, false, false],
    ];
    expect(VerificadorPatrones.hayLinea(marcadas), false);
  });

  test('detecta una columna vertical completa', () {
  final marcadas = [
    [true, false, false, false],
    [true, false, false, false],
    [true, false, false, false],
    [true, false, false, false],
  ];
  expect(VerificadorPatrones.hayColumna(marcadas), true);
});

test('no detecta columna si ninguna está completa', () {
  final marcadas = [
    [true, false, false, false],
    [true, false, false, false],
    [false, false, false, false],
    [true, false, false, false],
  ];
  expect(VerificadorPatrones.hayColumna(marcadas), false);
});

  test('detecta la diagonal principal completa', () {
  final marcadas = [
    [true, false, false, false],
    [false, true, false, false],
    [false, false, true, false],
    [false, false, false, true],
  ];
  expect(VerificadorPatrones.hayDiagonal(marcadas), true);
});

test('detecta la diagonal secundaria completa', () {
  final marcadas = [
    [false, false, false, true],
    [false, false, true, false],
    [false, true, false, false],
    [true, false, false, false],
  ];
  expect(VerificadorPatrones.hayDiagonal(marcadas), true);
});

  test('detecta tabla llena cuando todas las celdas estan marcadas', () {
  final marcadas = List.generate(4, (_) => List.generate(4, (_) => true));
  expect(VerificadorPatrones.hayTablaLlena(marcadas), true);
});

test('no detecta tabla llena si falta al menos una celda', () {
  final marcadas = List.generate(4, (_) => List.generate(4, (_) => true));
  marcadas[3][3] = false;
  expect(VerificadorPatrones.hayTablaLlena(marcadas), false);
});   
}