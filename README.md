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
By default the installation will place the plugin binary into your `PATH`. You will need to move them to your `~/.config/kn/plugins` directory unless you are using [`lookup-plugins`](https://github.com/knative/client/blob/main/docs/README.md#options) with `kn`.
