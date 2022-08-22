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
$ ab -c2 -n2000 http://127.0.0.1:3000/cached/users/1/recipes\?current_user_id\=5

# Then...

$ ab -c2 -n2000 http://127.0.0.1:3000/memoized/users/1/recipes\?current_user_id\=5
```

## Results

### Results with query-cache

```
Concurrency Level:      2
Time taken for tests:   19.733 seconds
Complete requests:      2000
Failed requests:        0
Total transferred:      136566298 bytes
HTML transferred:       134538000 bytes
Requests per second:    101.36 [#/sec] (mean)
Time per request:       19.733 [ms] (mean)
Time per request:       9.866 [ms] (mean, across all concurrent requests)
Transfer rate:          6758.66 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       0
Processing:     9   20   5.3     19      74
Waiting:        9   18   5.1     18      74
Total:          9   20   5.3     19      74

Percentage of the requests served within a certain time (ms)
  50%     19
  66%     19
  75%     20
  80%     21
  90%     25
  95%     27
  98%     36
  99%     45
 100%     74 (longest request)
```

### Results with no query-cache (memoized)

```
Concurrency Level:      2
Time taken for tests:   7.850 seconds
Complete requests:      2000
Failed requests:        0
Total transferred:      136566652 bytes
HTML transferred:       134538000 bytes
Requests per second:    254.79 [#/sec] (mean)
Time per request:       7.850 [ms] (mean)
Time per request:       3.925 [ms] (mean, across all concurrent requests)
Transfer rate:          16990.05 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       0
Processing:     4    8   2.1      7      32
Waiting:        4    7   2.1      7      32
Total:          4    8   2.1      7      32

Percentage of the requests served within a certain time (ms)
  50%      7
  66%      8
  75%      8
  80%      8
  90%      9
  95%     10
  98%     11
  99%     16
 100%     32 (longest request)
```

## Conclusion

This simple application demonstrates that relying on ActiveRecord's query cache to return records is not as fast as storing the records in memory (via a variable or constant). Developers should be mindful of which strategy they are using when interacting with ActiveRecord objects.
