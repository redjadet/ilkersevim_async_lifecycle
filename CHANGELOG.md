# Changelog

## 0.1.4

- `CompleterHelper.reset` now completes pending waiters with `StateError`
  (or a caller-supplied error) so abandoned futures cannot hang forever.


## 0.1.3

- Explain how lifecycle helpers prevent double completion and stream emissions
  after teardown.
- Link general resource cleanup to `ilkersevim_disposables`.
- Rewrite package metadata around those use cases.

## 0.1.2

- Prove GitHub Actions OIDC publish path after Pub.dev Admin enablement.

## 0.1.1

- Patch release after OIDC first attempt; published manually while Pub.dev
  Admin GitHub Actions publishing was still disabled for this package.

## 0.1.0

- Initial release: `CompleterHelper`, `StreamControllerSafeEmit`, and
  `StreamControllerLifecycle`.
