# Server Performance Report

## Concurrency: 10
- Time (seconds) median: 0.136
- Requests per second (RPS) median: 14728.63
- p50 latency (ms) median: 1
- p95 latency (ms) median: 1
- p99 latency (ms) median: 1
- Failed requests median: 0
- Non-2xx responses median: 0

## Concurrency: 25
- Time (seconds) median: 0.145
- Requests per second (RPS) median: 13838.24
- p50 latency (ms) median: 2
- p95 latency (ms) median: 2
- p99 latency (ms) median: 3
- Failed requests median: 0
- Non-2xx responses median: 0

## Concurrency: 50
- Time (seconds) median: 0.115
- Requests per second (RPS) median: 17436.49
- p50 latency (ms) median: 3
- p95 latency (ms) median: 4
- p99 latency (ms) median: 6
- Failed requests median: 0
- Non-2xx responses median: 0

## Concurrency: 100
- Time (seconds) median: 0.122
- Requests per second (RPS) median: 16388.74
- p50 latency (ms) median: 5
- p95 latency (ms) median: 10
- p99 latency (ms) median: 15
- Failed requests median: 0
- Non-2xx responses median: 0

## Concurrency: 200
- Time (seconds) median: 0.148
- Requests per second (RPS) median: 13495.73
- p50 latency (ms) median: 11
- p95 latency (ms) median: 30
- p99 latency (ms) median: 32
- Failed requests median: 0
- Non-2xx responses median: 0

## Concurrency: 400
- Time (seconds) median: 0.189
- Requests per second (RPS) median: 10583.47
- p50 latency (ms) median: 23
- p95 latency (ms) median: 68
- p99 latency (ms) median: 78
- Failed requests median: 0
- Non-2xx responses median: 0

## Environment

- Nginx version: nginx version: nginx/1.26.3
- Apache Bench version: This is ApacheBench, Version 2.3 <$Revision$>
- CPU cores: 2

### Memory

```
               total        used        free      shared  buff/cache   available
Mem:           7.5Gi       1.2Gi       5.4Gi       1.5Mi       1.2Gi       6.3Gi
Swap:          7.7Gi          0B       7.7Gi
```

### Connection

- Load generator (Apache Bench) and server (Nginx) run on the same Linux host.
- Host IP: 192.168.1.20
- Requests are sent to http://localhost/ over the loopback interface.
