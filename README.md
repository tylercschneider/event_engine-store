# EventEngine::Store

The permanent, queryable event record for [EventEngine](https://github.com/tylercschneider/event_engine).

Where `event_engine-delivery`'s outbox is a transient *delivery buffer* (pruned
once published), `event_engine-store` is the **durable source of truth**: an
immutable, append-only event table the host owns. It registers a handler with
EventEngine that records **every dispatched event**, and provides **event-sourcing
replay** — rebuilding state by reading the log back in order.

It does not aggregate. Turning the stored events into rollups and metrics is the
job of the `metrics` gem, which builds on this record.

## Installation

```ruby
gem "event_engine"
gem "event_engine-store"
```

```bash
$ bundle
```

## Status

Early development — building the append-only record and the recording handler.

## License

Available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
