# uuidx

A tiny (<1KB), fast, and cryptographically secure UUID (v4) generator for Crystal.

> This is the Crystal version of [@lukeed/uuid](https://github.com/lukeed/uuid)

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     uuix:
       github: krthr/uuix
   ```

2. Run `shards install`

## Usage

```crystal
require "uuix"

puts UUIX.random # bc524cd7-5ec3-48c4-9bcc-e9013c69dd6e
```

## Benchmarks

```bash
Crystal 0.33.0 [612825a53] (2020-02-14)

LLVM: 8.0.0
Default target: x86_64-unknown-linux-gnu
        UUIX: 920.14k (  1.09µs) (± 9.68%)  880B/op        fastest
Crystal UUID: 647.32k (  1.54µs) (± 7.53%)  0.0B/op   1.42× slower
```

## Performance

> Taken from https://github.com/lukeed/uuid

The reason why this UUID.V4 implementation is so much faster is two-fold:

1. It composes an output with hexadecimal pairs (from a cached dictionary) instead of single characters.
2. It allocates a larger Buffer/ArrayBuffer up front (expensive) and slices off chunks as needed (cheap).

The internal ArrayBuffer is 4096 bytes, which supplies **256** `random` invocations.

A larger buffer would result in higher performance over time, but I found this to be a good balance of performance and memory space.

## Contributing

1. Fork it (<https://github.com/krthr/uuix/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [krthr](https://github.com/krthr) - creator and maintainer
