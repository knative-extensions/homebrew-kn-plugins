## Homebrew Tap for Knative client plugins

This repository contains the [Hombrew Tap](https://docs.brew.sh/Taps) for Knative clients plugins.

To enable this Tap globally, use

```
brew tap knative-sandbox/kn-plugins
```

The supported client plugins are:

* [kn-plugin-admin](https://github.com/knative-sandbox/kn-plugin-admin) - The Admin plugin
* [kn-plugin-source-kafka](https://github.com/knative-sandbox/kn-plugin-source-kafka) - The source Kafka plugin


Install them with `brew install` like in

```
brew install admin
```

Alternatively you can also install each plugin directly (without adding a tap globally) with

```
brew install knative-sandbox/kn-plugins/admin
```
