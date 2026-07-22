# ilkersevim_async_lifecycle

Completer helpers and safe `StreamController` lifecycle utilities for Dart
async code. Dependency-free beyond the Dart SDK (`dart:async`).

License: [Apache-2.0](LICENSE). Issues:
[github.com/redjadet/ilkersevim_async_lifecycle/issues](https://github.com/redjadet/ilkersevim_async_lifecycle/issues).

## Installation

```yaml
dependencies:
  ilkersevim_async_lifecycle: ^0.1.0
```

Requires Dart `>=3.12.0`.

## CompleterHelper

```dart
import 'package:ilkersevim_async_lifecycle/ilkersevim_async_lifecycle.dart';

final helper = CompleterHelper<void>();
final completer = helper.start();
helper.complete();
```

## StreamControllerSafeEmit / StreamControllerLifecycle

```dart
StreamControllerSafeEmit.safeAdd(controller, value);

class MyService with StreamControllerLifecycle<String> {
  MyService() {
    // ignore: discarded_futures
    createController();
  }

  void push(String value) => safeEmit(value);

  Future<void> dispose() => disposeController();
}
```

## Out of scope

`DisposableBag`, `SubscriptionManager`, and `TimerHandleManager` are not part
of this package (they depend on workspace-coupled timer types).

## API stability

Public type names and method signatures are a semantic-versioned contract.
Breaking changes require a major version bump.

## Publishing

Releases are tagged `vX.Y.Z` matching `pubspec.yaml`. Automated publishing uses
GitHub Actions OIDC with the protected `pub.dev` Environment (reviewer:
`redjadet`).
