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

MVP working: the append-only `StoredEvent` record, a `Recorder` handler that
records every dispatched event, `Replay` (reconstruct events from the log in
append order), and **projections** — register a read model with
`EventEngine::Store.register_projection`; it's applied each event live, and can be
rebuilt from scratch with `EventEngine::Store.rebuild(projection)`.

## License

Available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
