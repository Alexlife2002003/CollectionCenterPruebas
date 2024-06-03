#!/bin/bash

# Run integration tests in the specified order and generate coverage report
flutter test integration_test/01_hu0_0_login_registro_test.dart \
  integration_test/02_hu0_1_login_registro_test.dart \
  integration_test/03_hu1_crear_categoria_test.dart \
  integration_test/04_hu3_agregar_articulo_test.dart \
  integration_test/05_hu4_eliminar_articulo_test.dart \
  integration_test/06_hu6_agregar_descripcion_articulo_test.dart \
  integration_test/07_hu7_modificar_descripcion_articulo_test.dart \
  integration_test/08_hu9_modificar_imagen_test.dart \
  integration_test/09_hu10_agregar_descripcion_categoria_test.dart \
  integration_test/10_hu12_eliminar_descripcion_categoria_test.dart \
  integration_test/11_hu13_modificar_nombre_categoria_test.dart \
  --coverage

# Check if coverage report is generated
if [ ! -f coverage/lcov.info ]; then
  echo "No coverage report found. Make sure your tests are running correctly."
  exit 1
fi

# Generate HTML report from lcov
genhtml coverage/lcov.info -o coverage/html

# Check minimum coverage threshold
COVERAGE=$(lcov --summary coverage/lcov.info | grep lines | grep -o '[0-9]\+%' | tr -d '%')

MIN_COVERAGE=95
if [ "$COVERAGE" -lt $MIN_COVERAGE ]; then
  echo "Code coverage is too low: $COVERAGE%"
  exit 1
else
  echo "Code coverage: $COVERAGE%"
fi

# Optionally open the coverage report in a browser
if command -v xdg-open &> /dev/null
then
  xdg-open coverage/html/index.html
elif command -v open &> /dev/null
then
  open coverage/html/index.html
fi
