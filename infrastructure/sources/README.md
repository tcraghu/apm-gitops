# HelmRepository Sources
It is a best practice to have this common folder to define all the Flux custom resources of kind `HelmRepository` in one place for the containing `Kustomization` source e.g., "infrastructure".

Add a YAML file for each source that need to be monitored for changes. For public sources, it is recommended to have longer `interval` e.g., 30m, or 60m.

