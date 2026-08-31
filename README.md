# ilkersevim_async_lifecycle

Completer helpers and safe `StreamController` lifecycle utilities for Dart
async code. Dependency-free beyond the Dart SDK (`dart:async`).

## Why use this package?

- Centralize completer start, completion, error, and reset state instead of
  repeating nullable-completer checks.
- Avoid emitting into null or closed stream controllers during async teardown.
- Give services one small lifecycle mixin for controller creation and disposal.

License: [Apache-2.0](LICENSE). Issues:
[github.com/redjadet/ilkersevim_async_lifecycle/issues](https://github.com/redjadet/ilkersevim_async_lifecycle/issues).

## Installation

```yaml
dependencies:
  ilkersevim_async_lifecycle: ^0.1.3
```

Requires Dart `>=3.13.0`.

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

General resource groups such as `DisposableBag`, `SubscriptionManager`, and
`TimerHandleManager` belong to
[`ilkersevim_disposables`](https://pub.dev/packages/ilkersevim_disposables).

## API stability

Public type names and method signatures are a semantic-versioned contract.
Breaking changes require a major version bump.

## Publishing

Releases are tagged `vX.Y.Z` matching `pubspec.yaml`. Automated publishing uses
GitHub Actions OIDC with the protected `pub.dev` Environment (reviewer:
`redjadet`).
