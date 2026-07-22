import 'dart:async';

import 'package:ilkersevim_async_lifecycle/ilkersevim_async_lifecycle.dart';

Future<void> main() async {
  final CompleterHelper<String> helper = CompleterHelper<String>();
  final Completer<String> completer = helper.start();
  helper.complete('ok');
  print(await completer.future);

  final StreamController<int> controller = StreamController<int>();
  StreamControllerSafeEmit.safeAdd(controller, 1);
  await controller.close();
  StreamControllerSafeEmit.safeAdd(controller, 2); // no-op after close
}
