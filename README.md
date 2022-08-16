# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Results

```
This is ApacheBench, Version 2.3 <$Revision: 1879490 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking localhost (be patient)
Completed 200 requests
Completed 400 requests
Completed 600 requests
Completed 800 requests
Completed 1000 requests
Completed 1200 requests
Completed 1400 requests
Completed 1600 requests
Completed 1800 requests
Completed 2000 requests
Finished 2000 requests


Server Software:
Server Hostname:        localhost
Server Port:            3000

Document Path:          /cached/users/1/recipes?current_user_id=5
Document Length:        34366 bytes

Concurrency Level:      2
Time taken for tests:   32.581 seconds
Complete requests:      2000
Failed requests:        0
Total transferred:      71559785 bytes
HTML transferred:       68732000 bytes
Requests per second:    61.39 [#/sec] (mean)
Time per request:       32.581 [ms] (mean)
Time per request:       16.290 [ms] (mean, across all concurrent requests)
Transfer rate:          2144.90 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       0
Processing:    15   32   5.7     32     114
Waiting:       15   32   5.7     31     114
Total:         15   33   5.7     32     114

Percentage of the requests served within a certain time (ms)
  50%     32
  66%     32
  75%     33
  80%     34
  90%     36
  95%     37
  98%     51
  99%     59
 100%    114 (longest request)
query-cache-demo(main):ab -c2 -n2000 http://localhost:3000/memoized/users/1/recipes\?current_user_id\=5
This is ApacheBench, Version 2.3 <$Revision: 1879490 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking localhost (be patient)
Completed 200 requests
Completed 400 requests
Completed 600 requests
Completed 800 requests
Completed 1000 requests
Completed 1200 requests
Completed 1400 requests
Completed 1600 requests
Completed 1800 requests
Completed 2000 requests
Finished 2000 requests


Server Software:
Server Hostname:        localhost
Server Port:            3000

Document Path:          /memoized/users/1/recipes?current_user_id=5
Document Length:        34366 bytes

Concurrency Level:      2
Time taken for tests:   22.397 seconds
Complete requests:      2000
Failed requests:        0
Total transferred:      71551714 bytes
HTML transferred:       68732000 bytes
Requests per second:    89.30 [#/sec] (mean)
Time per request:       22.397 [ms] (mean)
Time per request:       11.198 [ms] (mean, across all concurrent requests)
Transfer rate:          3119.87 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       0
Processing:    12   22   3.6     22      65
Waiting:       12   22   3.6     22      64
Total:         12   22   3.6     22      65

Percentage of the requests served within a certain time (ms)
  50%     22
  66%     23
  75%     23
  80%     24
  90%     25
  95%     26
  98%     28
  99%     42
 100%     65 (longest request)
```