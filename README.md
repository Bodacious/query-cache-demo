# README

This simple Rails application demonstrates the impact that ActiveRecord's query cache has on web application performance.

## Setting up the app

After you have downloaded the app, run the following commands:

```
$ bin/setup
```

## Start the application

The application can be started at localhost:3000 by running the following:

```
$ rails server
```

## Understanding this app

This simple application shows a list of recipes that belong to a user.

The application will automatically sign you in as a random user (to force the calling of a few DB requests). You may manually control which user you are signed in as, by providing a `current_user_id` query param.

There are two main pages that are relevant to this demonstration. The _cached_ page and the _memoized_ page. The cached page follows a conventional Ruby on Rails pattern, where records are loaded once from the database, and then subsequent DB queries are loaded from the ActiveRecord query cache. The _memoized_ page avoids using ActiveRecord's query cache, and instead caches records in memory using a so-called _memo-ized_ pattern.

## Running the benchmarks

You can compare the performance of each approach by running a benchmark against the code:

```
$ ab -c2 -n2000 ab -c2 -n2000 http://localhost:3000/cached/users/1/recipes\?current_user_id\=5

# Then...

$ ab -c2 -n2000 ab -c2 -n2000 http://localhost:3000/memoized/users/1/recipes\?current_user_id\=5
```

## Results

### Results with query-cache

```
Concurrency Level:      2
Time taken for tests:   32.748 seconds
Complete requests:      2000
Failed requests:        0
Total transferred:      70863171 bytes
HTML transferred:       68034000 bytes
Requests per second:    61.07 [#/sec] (mean)
Time per request:       32.748 [ms] (mean)
Time per request:       16.374 [ms] (mean, across all concurrent requests)
Transfer rate:          2113.19 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       0
Processing:    20   33   6.1     31      78
Waiting:       20   32   6.1     31      77
Total:         20   33   6.1     32      78

Percentage of the requests served within a certain time (ms)
  50%     32
  66%     33
  75%     33
  80%     34
  90%     36
  95%     40
  98%     57
  99%     67
 100%     78 (longest request)
```

### Results with no query-cache (memoized)

```
Concurrency Level:      2
Time taken for tests:   22.147 seconds
Complete requests:      2000
Failed requests:        0
Total transferred:      70854011 bytes
HTML transferred:       68034000 bytes
Requests per second:    90.31 [#/sec] (mean)
Time per request:       22.147 [ms] (mean)
Time per request:       11.073 [ms] (mean, across all concurrent requests)
Transfer rate:          3124.29 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       1
Processing:    12   22   3.6     22      71
Waiting:       12   22   3.6     21      71
Total:         13   22   3.6     22      71

Percentage of the requests served within a certain time (ms)
  50%     22
  66%     22
  75%     23
  80%     23
  90%     24
  95%     25
  98%     29
  99%     42
 100%     71 (longest request)
```

## Conclusion

This simple application demonstrates that relying on ActiveRecord's query cache to return records is not as fast as storing the records in memory (via a variable or constant). Developers should be mindful of which strategy they are using when interacting with ActiveRecord objects.
