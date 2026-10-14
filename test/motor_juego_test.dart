import 'package:flutter_test/flutter_test.dart';
import 'package:loteria_dolorena/logica/baraja.dart';
import 'package:loteria_dolorena/logica/tabla.dart';
import 'package:loteria_dolorena/logica/motor_juego.dart';

void main() {
  test('el motor detecta Lotería al completar una fila', () {
    final cartas = Baraja.crearBarajaCompleta().cartasRestantes;
    final baraja = Baraja.desdeCartas(cartas);
    final tabla = Tabla.desdeFilas([
      cartas.sublist(0, 4),
      cartas.sublist(4, 8),
      cartas.sublist(8, 12),
      cartas.sublist(12, 16),
    ]);

    final motor = MotorJuego(baraja: baraja, tabla: tabla);

    for (var i = 0; i < 4; i++) {
      motor.cantarYMarcar();
    }
    expect(motor.haGanado, true);
  });

  test('el motor NO reporta Lotería si aún no se completa ningún patrón', () {
    final cartas = Baraja.crearBarajaCompleta().cartasRestantes;
    final baraja = Baraja.desdeCartas(cartas);
    final tabla = Tabla.desdeFilas([
      cartas.sublist(0, 4),
      cartas.sublist(4, 8),
      cartas.sublist(8, 12),
      cartas.sublist(12, 16),
    ]);

    final motor = MotorJuego(baraja: baraja, tabla: tabla);
    motor.cantarYMarcar();
    motor.cantarYMarcar();
    expect(motor.haGanado, false);
  });
}