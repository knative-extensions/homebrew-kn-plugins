## Homebrew Tap for Knative client plugins
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fknative-extensions%2Fhomebrew-kn-plugins.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fknative-extensions%2Fhomebrew-kn-plugins?ref=badge_shield)


This repository contains the [Hombrew Tap](https://docs.brew.sh/Taps) for Knative clients plugins.

To enable this Tap globally, use

```
brew tap knative-sandbox/kn-plugins
```

The supported client plugins are:

* [kn-plugin-admin](https://github.com/knative-sandbox/kn-plugin-admin) - The Admin plugin
* [kn-plugin-func](https://github.com/knative-sandbox/kn-plugin-func) - The Functions plugin
* [kn-plugin-quickstart](https://github.com/knative-sandbox/kn-plugin-quickstart) - The Quickstart plugin
* [kn-plugin-source-kafka](https://github.com/knative-sandbox/kn-plugin-source-kafka) - The source Kafka plugin
* [kn-plugin-source-kamelet](https://github.com/knative-sandbox/kn-plugin-source-kamelet) - The source Kamelet plugin
* [kn-plugin-event](https://github.com/knative-sandbox/kn-plugin-event) - Sending events to Knative sinks


Install them with `brew install` like in

```
brew install admin
```

Alternatively you can also install each plugin directly (without adding a tap globally) with

```
brew install knative-sandbox/kn-plugins/admin
```

## Updating Plugin Versions

To update plugins that are part of the [release train](https://github.com/knative/release/blob/main/INSTRUCTIONS.md#homebrew-kn-plugins), update the `PREVIOUS_RELEASE` / `CURRENT_RELEASE` variables in the `./hack/update-versions.sh` script, then run the script locally and push a PR with the changes. 

For plugins not on the release train, updates will need to be done manually, as for example in [this PR](https://github.com/knative-sandbox/homebrew-kn-plugins/pull/92). 


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fknative-extensions%2Fhomebrew-kn-plugins.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fknative-extensions%2Fhomebrew-kn-plugins?ref=badge_large)