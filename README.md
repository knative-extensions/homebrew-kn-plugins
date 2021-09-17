## Homebrew Tap for Knative client plugins

This repository contains the [Hombrew Tap](https://docs.brew.sh/Taps) for Knative clients plugins.

To enable this Tap globally, use

```
brew tap knative-sandbox/kn-plugins
```

The supported client plugins are:

* [kn-plugin-admin](https://github.com/knative-sandbox/kn-plugin-admin) - Plugin helping to configure Knative
* [kn-plugin-func](https://github.com/knative-sandbox/kn-plugin-func) - Plugin for developing and deploying functions with Knative
* [kn-plugin-quickstart](https://github.com/knative-sandbox/kn-plugin-quickstart) - Plugin to easily bootstrap a local Knative installation
* [kn-plugin-source-kafka](https://github.com/knative-sandbox/kn-plugin-source-kafka) - Plugin to manage Kafka sources
* [kn-plugin-source-kamelet](https://github.com/knative-sandbox/kn-plugin-source-kamelet) - Plugin to manage [Kamelets](https://camel.apache.org/camel-k/latest/kamelets/kamelets.html)



Install them with `brew install` like in

```
brew install admin
```

Alternatively you can also install each plugin directly (without adding a tap globally) with

```
brew install knative-sandbox/kn-plugins/admin
```
