library examples.src.hello_world.index_dart;

import './index_common.dart' as app;
import 'package:angular2/src/reflection/reflection.dart' show reflector;
import 'package:angular2/src/reflection/reflection_capabilities.dart'
    show ReflectionCapabilities;

main() {
  reflector.reflectionCapabilities = new ReflectionCapabilities();
  app.main();
}
