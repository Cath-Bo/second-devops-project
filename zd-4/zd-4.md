## Zmiana 1 — worker_connections i worker_rlimit_nofile

**Co zmieniono:**
- worker_connections: 768 → 2048
- worker_rlimit_nofile: dodano wartość 4096

**Dlaczego:**
Aby zwiększyć limit jednoczesnych połączeń oraz liczbę otwartych deskryptorów plików.

**Metryki przed zmianą:**

| Metryka | Wyniki |
|---|---|
| Requests per second | 4458.12 / 4456.17 / 4382.79 |
| Average latency (ms) | 11.216 / 11.220 / 11.408 |
| P95 latency (ms) | 14 / 14 / 14 |
| Failed requests | 0 / 0 / 0 |

**Metryki po zmianie:**

| Metryka | Wyniki |
|---|---|
| Requests per second | 4649.80 / 4518.73 / 4674.45 |
| Average latency (ms) | 10.753 / 11.065 / 10.696 |
| P95 latency (ms) | 13 / 14 / 13 |
| Failed requests | 0 / 0 / 0 |

**Wniosek:**
Wyniki wskazują na poprawę wydajności, ale krótkie pomiary nie pozwalają jednoznacznie potwierdzić, że zmiana była jej przyczyną.

## Zmiana 2 — keepalive dla upstream

**Co zmieniono:**

Dodano `keepalive 32` w bloku `upstream backend`.

**Dlaczego:**

Aby ponownie wykorzystywać istniejące połączenia TCP z serwerem backend zamiast tworzyć nowe połączenie dla każdego żądania.

**Metryki przed zmianą (bez keepalive):**

| Metryka | Wyniki |
|---|---|
| Requests per second | 373.18 / 228.76 / 366.57 |
| Average latency (ms) | 133.983 / 218.565 / 136.400 |
| P95 latency (ms) | 12 / 11 / 12 |
| Failed requests | 0 / 0 / 0 |

**Metryki po zmianie (keepalive 32):**

| Metryka | Wyniki |
|---|---|
| Requests per second | 484.14 / 1180.53 / 848.44 |
| Average latency (ms) | 103.276 / 42.354 / 58.931 |
| P95 latency (ms) | 55 / 55 / 52 |
| Failed requests | 0 / 0 / 0 |

**Wniosek:**

Zmiana nie przyniosła jednoznacznej poprawy. Wzrosła liczba żądań obsługiwanych na sekundę, a średni czas odpowiedzi spadł. Jednocześnie P95 latency wzrosło, a wyniki pomiarów były niestabilne. Dodatkowe pomiary wykazały również sporadyczne, bardzo długie opóźnienia pojedynczych żądań.

## Zmiana 3 — kompresja Gzip i cache statycznych plików

**Co zmieniono:**
- Włączono kompresję Gzip (`gzip on;`).
- Włączono cache statycznych plików (`expires 7d;`).

**Dlaczego:**
Aby zmniejszyć rozmiar przesyłanych danych dzięki kompresji oraz ograniczyć częstotliwość pobierania statycznych plików przez przeglądarkę.

**Metryki przed zmianą:**

| Metryka | Wyniki |
|---|---|
| Requests per second | 4567.96 / 4552.43 / 4379.55 |
| Average latency (ms) | 10.946 / 10.983 / 11.417 |
| P95 latency (ms) | 13 / 13 / 14 |
| Failed requests | 0 / 0 / 0 |

**Metryki po zmianie:**

| Metryka | Wyniki |
|---|---|
| Requests per second | 4573.21 / 4556.18 / 4411.78 |
| Average latency (ms) | 10.933 / 10.974 / 11.333 |
| P95 latency (ms) | 14 / 14 / 14 |
| Failed requests | 0 / 0 / 0 |

**Wniosek:**
Zmiana nie przyniosła zauważalnej poprawy wydajności. Średnia liczba obsługiwanych żądań na sekundę wzrosła jedynie o około 0,31%, a średnie opóźnienie zmniejszyło się o około 0,32%. P95 latency nieznacznie wzrosło. Wyniki wskazują, że zmiana nie przyniosła istotnej poprawy.
