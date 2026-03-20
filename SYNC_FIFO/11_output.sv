------------------------------------------------------------------
---starting the test for SYNC FIFO with selfchecking scoreboard---
------------------------------------------------------------------
=====running the test: reset=====
==scoreboard==[reset] |empty condition success|expected = 1 : actual = 1
==scoreboard==[reset] |empty condition success|expected = 1 : actual = 1
=====running the test: write=====
==scoreboard==[write] |empty condition success|expected = 1 : actual = 1
==scoreboard==[write] |empty condition success|expected = 1 : actual = 1
==scoreboard==[write] |almost_empty condition success|expected = 1 : actual = 1
=====running the test: read=====
==scoreboard==[read] |empty condition success|expected = 1 : actual = 1
==scoreboard==[read] |empty condition success|expected = 1 : actual = 1
==scoreboard==[read] |almost_empty condition success|expected = 1 : actual = 1
==scoreboard==[read] |rdata matched successfully |expected = bc : actual = bc
==scoreboard==[read] |rdata matched successfully |expected = d : actual = d
==scoreboard==[read] |rdata matched successfully |expected = 36 : actual = 36
==scoreboard==[read] |almost_empty condition success|expected = 1 : actual = 1
==scoreboard==[read] |rdata matched successfully |expected = ce : actual = ce
==scoreboard==[read] |empty condition success|expected = 1 : actual = 1
==scoreboard==[read] |empty condition success|expected = 1 : actual = 1
==scoreboard==[read] |empty condition success|expected = 1 : actual = 1
==scoreboard==[read] |empty condition success|expected = 1 : actual = 1
=====running the test: full=====
==scoreboard==[full] |empty condition success|expected = 1 : actual = 1
==scoreboard==[full] |empty condition success|expected = 1 : actual = 1
==scoreboard==[full] |almost_empty condition success|expected = 1 : actual = 1
==scoreboard==[full] |almost_full condition success|expected = 1 : actual = 1
==scoreboard==[full] |full condition success|expected = 1 : actual = 1
==scoreboard==[full] |full condition success|expected = 1 : actual = 1
==scoreboard==[full] |full condition success|expected = 1 : actual = 1
=====running the test: empty=====
==scoreboard==[empty] |empty condition success|expected = 1 : actual = 1
==scoreboard==[empty] |empty condition success|expected = 1 : actual = 1
==scoreboard==[empty] |almost_empty condition success|expected = 1 : actual = 1
==scoreboard==[empty] |rdata matched successfully |expected = f5 : actual = f5
==scoreboard==[empty] |rdata matched successfully |expected = be : actual = be
==scoreboard==[empty] |rdata matched successfully |expected = 17 : actual = 17
==scoreboard==[empty] |rdata matched successfully |expected = 12 : actual = 12
==scoreboard==[empty] |rdata matched successfully |expected = fb : actual = fb
==scoreboard==[empty] |rdata matched successfully |expected = c7 : actual = c7
==scoreboard==[empty] |rdata matched successfully |expected = 4 : actual = 4
==scoreboard==[empty] |rdata matched successfully |expected = c1 : actual = c1
==scoreboard==[empty] |almost_empty condition success|expected = 1 : actual = 1
==scoreboard==[empty] |rdata matched successfully |expected = 61 : actual = 61
==scoreboard==[empty] |empty condition success|expected = 1 : actual = 1
==scoreboard==[empty] |empty condition success|expected = 1 : actual = 1
==scoreboard==[empty] |empty condition success|expected = 1 : actual = 1
==scoreboard==[empty] |empty condition success|expected = 1 : actual = 1
=====running the test: overflow=====
==scoreboard==[overflow] |empty condition success|expected = 1 : actual = 1
==scoreboard==[overflow] |empty condition success|expected = 1 : actual = 1
==scoreboard==[overflow] |almost_empty condition success|expected = 1 : actual = 1
==scoreboard==[overflow] |almost_full condition success|expected = 1 : actual = 1
==scoreboard==[overflow] |full condition success|expected = 1 : actual = 1
==scoreboard==[overflow] | the overflow is avoided |
==scoreboard==[overflow] |full condition success|expected = 1 : actual = 1
==scoreboard==[overflow] | the overflow is avoided |
==scoreboard==[overflow] |full condition success|expected = 1 : actual = 1
==scoreboard==[overflow] | the overflow is avoided |
==scoreboard==[overflow] |full condition success|expected = 1 : actual = 1
==scoreboard==[overflow] | the overflow is avoided |
==scoreboard==[overflow] |full condition success|expected = 1 : actual = 1
==scoreboard==[overflow] | the overflow is avoided |
==scoreboard==[overflow] |full condition success|expected = 1 : actual = 1
==scoreboard==[overflow] | the overflow is avoided |
==scoreboard==[overflow] |full condition success|expected = 1 : actual = 1
==scoreboard==[overflow] | the overflow is avoided |
==scoreboard==[overflow] |full condition success|expected = 1 : actual = 1
==scoreboard==[overflow] | the overflow is avoided |
=====running the test: underflow=====
==scoreboard==[underflow] |empty condition success|expected = 1 : actual = 1
==scoreboard==[underflow] |empty condition success|expected = 1 : actual = 1
==scoreboard==[underflow] |almost_empty condition success|expected = 1 : actual = 1
=====running the test: rw_almost_full=====
==scoreboard==[rw_almost_full] |empty condition success|expected = 1 : actual = 1
==scoreboard==[rw_almost_full] |empty condition success|expected = 1 : actual = 1
==scoreboard==[rw_almost_full] |almost_empty condition success|expected = 1 : actual = 1
==scoreboard==[rw_almost_full] |almost_full condition success|expected = 1 : actual = 1
==scoreboard==[rw_almost_full] |rdata matched successfully |expected = 5e : actual = 5e
==scoreboard==[rw_almost_full] |rdata matched successfully |expected = 56 : actual = 56
==scoreboard==[rw_almost_full] |rdata matched successfully |expected = 9c : actual = 9c
==scoreboard==[rw_almost_full] |rdata matched successfully |expected = 0 : actual = 0
==scoreboard==[rw_almost_full] |rdata matched successfully |expected = 8b : actual = 8b
==scoreboard==[rw_almost_full] |rdata matched successfully |expected = d9 : actual = d9
==scoreboard==[rw_almost_full] |rdata matched successfully |expected = 9c : actual = 9c
==scoreboard==[rw_almost_full] |rdata matched successfully |expected = e9 : actual = e9
------------------------------------------------------------------
-------------all the tests are completed successfully-------------
------------------------------------------------------------------
$finish called from file "testbench.sv", line 89.
$finish at simulation time                 1480
           V C S   S i m u l a t i o n   R e p o r t 
Time: 1480 ns
CPU Time:      0.520 seconds;       Data structure size:   0.0Mb
Fri Mar 20 14:01:18 2026
Finding VCD file...
./fifo.vcd
[2026-03-20 18:01:18 UTC] Opening EPWave...
Done
