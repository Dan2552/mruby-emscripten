# mruby-emscripten

[Emscripten](https://emscripten.org) allows you to use mruby in a browser. This gem allows you to communicate with Javascript code.

# Installation

Put the following into your `Mundlefile`([?](https://github.com/Dan2552/mundler)):

```ruby
platform :wasm

gem "mruby-emscripten", github: "Dan2552/mruby-emscripten"
```

# Usage

See `example` directory; run `example/start.sh` to build and run the example.
