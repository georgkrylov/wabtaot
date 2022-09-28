
hello_world.wasm:	file format wasm 0x1

Code Disassembly:

00020e func[4]:
 00020f: 41 b0 1c                   | i32.const 3632
 000212: 0b                         | end
000214 func[5]:
 000215: 0b                         | end
000217 func[6] <main>:
 000218: 09 7f                      | local[0..8] type=i32
 00021a: 23 00                      | global.get 0
 00021c: 21 02                      | local.set 2
 00021e: 41 10                      | i32.const 16
 000220: 21 03                      | local.set 3
 000222: 20 02                      | local.get 2
 000224: 20 03                      | local.get 3
 000226: 6b                         | i32.sub
 000227: 21 04                      | local.set 4
 000229: 20 04                      | local.get 4
 00022b: 24 00                      | global.set 0
 00022d: 41 00                      | i32.const 0
 00022f: 21 05                      | local.set 5
 000231: 20 04                      | local.get 4
 000233: 20 05                      | local.get 5
 000235: 36 02 0c                   | i32.store 2 12
 000238: 20 04                      | local.get 4
 00023a: 20 00                      | local.get 0
 00023c: 36 02 08                   | i32.store 2 8
 00023f: 20 04                      | local.get 4
 000241: 20 01                      | local.get 1
 000243: 36 02 04                   | i32.store 2 4
 000246: 41 80 08                   | i32.const 1024
 000249: 21 06                      | local.set 6
 00024b: 41 00                      | i32.const 0
 00024d: 21 07                      | local.set 7
 00024f: 20 06                      | local.get 6
 000251: 20 07                      | local.get 7
 000253: 10 08                      | call 8
 000255: 1a                         | drop
 000256: 41 00                      | i32.const 0
 000258: 21 08                      | local.set 8
 00025a: 41 10                      | i32.const 16
 00025c: 21 09                      | local.set 9
 00025e: 20 04                      | local.get 4
 000260: 20 09                      | local.get 9
 000262: 6a                         | i32.add
 000263: 21 0a                      | local.set 10
 000265: 20 0a                      | local.get 10
 000267: 24 00                      | global.set 0
 000269: 20 08                      | local.get 8
 00026b: 0f                         | return
 00026c: 0b                         | end
00026f func[7] <_start>:
 000270: 04 7f                      | local[0..3] type=i32
 000272: 23 00                      | global.get 0
 000274: 22 00                      | local.tee 0
 000276: 21 01                      | local.set 1
 000278: 02 40                      | block
 00027a: 02 40                      |   block
 00027c: 02 40                      |     block
 00027e: 02 40                      |       block
 000280: 02 40                      |         block
 000282: 41 01                      |           i32.const 1
 000284: 0d 00                      |           br_if 0
 000286: 41 02                      |           i32.const 2
 000288: 45                         |           i32.eqz
 000289: 0d 01                      |           br_if 1
 00028b: 10 05                      |           call 5
 00028d: 20 01                      |           local.get 1
 00028f: 24 00                      |           global.set 0
 000291: 0f                         |           return
 000292: 0b                         |         end
 000293: 41 c0 0f                   |         i32.const 1984
 000296: 41 c4 0f                   |         i32.const 1988
 000299: 10 00                      |         call 0 <wasi_unstable.args_sizes_get>
 00029b: 0d 01                      |         br_if 1
 00029d: 02 40                      |         block
 00029f: 02 40                      |           block
 0002a1: 41 00                      |             i32.const 0
 0002a3: 28 02 c0 0f                |             i32.load 2 1984
 0002a7: 22 02                      |             local.tee 2
 0002a9: 0d 00                      |             br_if 0
 0002ab: 0c 01                      |             br 1
 0002ad: 0b                         |           end
 0002ae: 20 00                      |           local.get 0
 0002b0: 20 02                      |           local.get 2
 0002b2: 41 02                      |           i32.const 2
 0002b4: 74                         |           i32.shl
 0002b5: 22 02                      |           local.tee 2
 0002b7: 41 13                      |           i32.const 19
 0002b9: 6a                         |           i32.add
 0002ba: 41 70                      |           i32.const 4294967280
 0002bc: 71                         |           i32.and
 0002bd: 6b                         |           i32.sub
 0002be: 22 00                      |           local.tee 0
 0002c0: 22 03                      |           local.tee 3
 0002c2: 24 00                      |           global.set 0
 0002c4: 20 03                      |           local.get 3
 0002c6: 41 00                      |           i32.const 0
 0002c8: 28 02 c4 0f                |           i32.load 2 1988
 0002cc: 41 0f                      |           i32.const 15
 0002ce: 6a                         |           i32.add
 0002cf: 41 70                      |           i32.const 4294967280
 0002d1: 71                         |           i32.and
 0002d2: 6b                         |           i32.sub
 0002d3: 22 03                      |           local.tee 3
 0002d5: 24 00                      |           global.set 0
 0002d7: 20 00                      |           local.get 0
 0002d9: 20 02                      |           local.get 2
 0002db: 6a                         |           i32.add
 0002dc: 41 00                      |           i32.const 0
 0002de: 36 02 00                   |           i32.store 2 0
 0002e1: 20 00                      |           local.get 0
 0002e3: 20 03                      |           local.get 3
 0002e5: 10 01                      |           call 1 <wasi_unstable.args_get>
 0002e7: 0d 03                      |           br_if 3
 0002e9: 0b                         |         end
 0002ea: 02 40                      |         block
 0002ec: 41 02                      |           i32.const 2
 0002ee: 45                         |           i32.eqz
 0002ef: 0d 00                      |           br_if 0
 0002f1: 10 05                      |           call 5
 0002f3: 0b                         |         end
 0002f4: 41 00                      |         i32.const 0
 0002f6: 28 02 c0 0f                |         i32.load 2 1984
 0002fa: 20 00                      |         local.get 0
 0002fc: 10 06                      |         call 6 <main>
 0002fe: 22 00                      |         local.tee 0
 000300: 0d 03                      |         br_if 3
 000302: 0b                         |       end
 000303: 20 01                      |       local.get 1
 000305: 24 00                      |       global.set 0
 000307: 0f                         |       return
 000308: 0b                         |     end
 000309: 41 c7 00                   |     i32.const 71
 00030c: 10 02                      |     call 2 <wasi_unstable.proc_exit>
 00030e: 00                         |     unreachable
 00030f: 0b                         |   end
 000310: 41 c7 00                   |   i32.const 71
 000313: 10 02                      |   call 2 <wasi_unstable.proc_exit>
 000315: 00                         |   unreachable
 000316: 0b                         | end
 000317: 20 00                      | local.get 0
 000319: 10 02                      | call 2 <wasi_unstable.proc_exit>
 00031b: 00                         | unreachable
 00031c: 0b                         | end
00031e func[8]:
 00031f: 01 7f                      | local[0] type=i32
 000321: 23 00                      | global.get 0
 000323: 41 10                      | i32.const 16
 000325: 6b                         | i32.sub
 000326: 22 02                      | local.tee 2
 000328: 24 00                      | global.set 0
 00032a: 20 02                      | local.get 2
 00032c: 20 01                      | local.get 1
 00032e: 36 02 0c                   | i32.store 2 12
 000331: 41 00                      | i32.const 0
 000333: 28 02 a8 0c                | i32.load 2 1576
 000337: 20 00                      | local.get 0
 000339: 20 01                      | local.get 1
 00033b: 10 14                      | call 20
 00033d: 21 01                      | local.set 1
 00033f: 20 02                      | local.get 2
 000341: 41 10                      | i32.const 16
 000343: 6a                         | i32.add
 000344: 24 00                      | global.set 0
 000346: 20 01                      | local.get 1
 000348: 0b                         | end
00034a func[9]:
 00034b: 41 01                      | i32.const 1
 00034d: 0b                         | end
00034f func[10]:
 000350: 0b                         | end
000353 func[11]:
 000354: 03 7f                      | local[0..2] type=i32
 000356: 23 00                      | global.get 0
 000358: 41 d0 01                   | i32.const 208
 00035b: 6b                         | i32.sub
 00035c: 22 05                      | local.tee 5
 00035e: 24 00                      | global.set 0
 000360: 20 05                      | local.get 5
 000362: 20 02                      | local.get 2
 000364: 36 02 cc 01                | i32.store 2 204
 000368: 41 00                      | i32.const 0
 00036a: 21 02                      | local.set 2
 00036c: 20 05                      | local.get 5
 00036e: 41 a0 01                   | i32.const 160
 000371: 6a                         | i32.add
 000372: 41 00                      | i32.const 0
 000374: 41 28                      | i32.const 40
 000376: 10 2c                      | call 44
 000378: 1a                         | drop
 000379: 20 05                      | local.get 5
 00037b: 20 05                      | local.get 5
 00037d: 28 02 cc 01                | i32.load 2 204
 000381: 36 02 c8 01                | i32.store 2 200
 000385: 02 40                      | block
 000387: 02 40                      |   block
 000389: 41 00                      |     i32.const 0
 00038b: 20 01                      |     local.get 1
 00038d: 20 05                      |     local.get 5
 00038f: 41 c8 01                   |     i32.const 200
 000392: 6a                         |     i32.add
 000393: 20 05                      |     local.get 5
 000395: 41 d0 00                   |     i32.const 80
 000398: 6a                         |     i32.add
 000399: 20 05                      |     local.get 5
 00039b: 41 a0 01                   |     i32.const 160
 00039e: 6a                         |     i32.add
 00039f: 20 03                      |     local.get 3
 0003a1: 20 04                      |     local.get 4
 0003a3: 10 0c                      |     call 12
 0003a5: 41 00                      |     i32.const 0
 0003a7: 4e                         |     i32.ge_s
 0003a8: 0d 00                      |     br_if 0
 0003aa: 41 7f                      |     i32.const 4294967295
 0003ac: 21 01                      |     local.set 1
 0003ae: 0c 01                      |     br 1
 0003b0: 0b                         |   end
 0003b1: 02 40                      |   block
 0003b3: 20 00                      |     local.get 0
 0003b5: 28 02 4c                   |     i32.load 2 76
 0003b8: 41 00                      |     i32.const 0
 0003ba: 48                         |     i32.lt_s
 0003bb: 0d 00                      |     br_if 0
 0003bd: 20 00                      |     local.get 0
 0003bf: 10 09                      |     call 9
 0003c1: 21 02                      |     local.set 2
 0003c3: 0b                         |   end
 0003c4: 20 00                      |   local.get 0
 0003c6: 28 02 00                   |   i32.load 2 0
 0003c9: 21 06                      |   local.set 6
 0003cb: 02 40                      |   block
 0003cd: 20 00                      |     local.get 0
 0003cf: 2c 00 4a                   |     i32.load8_s 0 74
 0003d2: 41 00                      |     i32.const 0
 0003d4: 4a                         |     i32.gt_s
 0003d5: 0d 00                      |     br_if 0
 0003d7: 20 00                      |     local.get 0
 0003d9: 20 06                      |     local.get 6
 0003db: 41 5f                      |     i32.const 4294967263
 0003dd: 71                         |     i32.and
 0003de: 36 02 00                   |     i32.store 2 0
 0003e1: 0b                         |   end
 0003e2: 20 06                      |   local.get 6
 0003e4: 41 20                      |   i32.const 32
 0003e6: 71                         |   i32.and
 0003e7: 21 06                      |   local.set 6
 0003e9: 02 40                      |   block
 0003eb: 02 40                      |     block
 0003ed: 20 00                      |       local.get 0
 0003ef: 28 02 30                   |       i32.load 2 48
 0003f2: 45                         |       i32.eqz
 0003f3: 0d 00                      |       br_if 0
 0003f5: 20 00                      |       local.get 0
 0003f7: 20 01                      |       local.get 1
 0003f9: 20 05                      |       local.get 5
 0003fb: 41 c8 01                   |       i32.const 200
 0003fe: 6a                         |       i32.add
 0003ff: 20 05                      |       local.get 5
 000401: 41 d0 00                   |       i32.const 80
 000404: 6a                         |       i32.add
 000405: 20 05                      |       local.get 5
 000407: 41 a0 01                   |       i32.const 160
 00040a: 6a                         |       i32.add
 00040b: 20 03                      |       local.get 3
 00040d: 20 04                      |       local.get 4
 00040f: 10 0c                      |       call 12
 000411: 21 01                      |       local.set 1
 000413: 0c 01                      |       br 1
 000415: 0b                         |     end
 000416: 20 00                      |     local.get 0
 000418: 41 d0 00                   |     i32.const 80
 00041b: 36 02 30                   |     i32.store 2 48
 00041e: 20 00                      |     local.get 0
 000420: 20 05                      |     local.get 5
 000422: 41 d0 00                   |     i32.const 80
 000425: 6a                         |     i32.add
 000426: 36 02 10                   |     i32.store 2 16
 000429: 20 00                      |     local.get 0
 00042b: 20 05                      |     local.get 5
 00042d: 36 02 1c                   |     i32.store 2 28
 000430: 20 00                      |     local.get 0
 000432: 20 05                      |     local.get 5
 000434: 36 02 14                   |     i32.store 2 20
 000437: 20 00                      |     local.get 0
 000439: 28 02 2c                   |     i32.load 2 44
 00043c: 21 07                      |     local.set 7
 00043e: 20 00                      |     local.get 0
 000440: 20 05                      |     local.get 5
 000442: 36 02 2c                   |     i32.store 2 44
 000445: 20 00                      |     local.get 0
 000447: 20 01                      |     local.get 1
 000449: 20 05                      |     local.get 5
 00044b: 41 c8 01                   |     i32.const 200
 00044e: 6a                         |     i32.add
 00044f: 20 05                      |     local.get 5
 000451: 41 d0 00                   |     i32.const 80
 000454: 6a                         |     i32.add
 000455: 20 05                      |     local.get 5
 000457: 41 a0 01                   |     i32.const 160
 00045a: 6a                         |     i32.add
 00045b: 20 03                      |     local.get 3
 00045d: 20 04                      |     local.get 4
 00045f: 10 0c                      |     call 12
 000461: 21 01                      |     local.set 1
 000463: 20 07                      |     local.get 7
 000465: 45                         |     i32.eqz
 000466: 0d 00                      |     br_if 0
 000468: 20 00                      |     local.get 0
 00046a: 41 00                      |     i32.const 0
 00046c: 41 00                      |     i32.const 0
 00046e: 20 00                      |     local.get 0
 000470: 28 02 24                   |     i32.load 2 36
 000473: 11 00 00                   |     call_indirect 0 0
 000476: 1a                         |     drop
 000477: 20 00                      |     local.get 0
 000479: 41 00                      |     i32.const 0
 00047b: 36 02 30                   |     i32.store 2 48
 00047e: 20 00                      |     local.get 0
 000480: 20 07                      |     local.get 7
 000482: 36 02 2c                   |     i32.store 2 44
 000485: 20 00                      |     local.get 0
 000487: 41 00                      |     i32.const 0
 000489: 36 02 1c                   |     i32.store 2 28
 00048c: 20 00                      |     local.get 0
 00048e: 41 00                      |     i32.const 0
 000490: 36 02 10                   |     i32.store 2 16
 000493: 20 00                      |     local.get 0
 000495: 28 02 14                   |     i32.load 2 20
 000498: 21 03                      |     local.set 3
 00049a: 20 00                      |     local.get 0
 00049c: 41 00                      |     i32.const 0
 00049e: 36 02 14                   |     i32.store 2 20
 0004a1: 20 01                      |     local.get 1
 0004a3: 41 7f                      |     i32.const 4294967295
 0004a5: 20 03                      |     local.get 3
 0004a7: 1b                         |     select
 0004a8: 21 01                      |     local.set 1
 0004aa: 0b                         |   end
 0004ab: 20 00                      |   local.get 0
 0004ad: 20 00                      |   local.get 0
 0004af: 28 02 00                   |   i32.load 2 0
 0004b2: 22 03                      |   local.tee 3
 0004b4: 20 06                      |   local.get 6
 0004b6: 72                         |   i32.or
 0004b7: 36 02 00                   |   i32.store 2 0
 0004ba: 41 7f                      |   i32.const 4294967295
 0004bc: 20 01                      |   local.get 1
 0004be: 20 03                      |   local.get 3
 0004c0: 41 20                      |   i32.const 32
 0004c2: 71                         |   i32.and
 0004c3: 1b                         |   select
 0004c4: 21 01                      |   local.set 1
 0004c6: 20 02                      |   local.get 2
 0004c8: 45                         |   i32.eqz
 0004c9: 0d 00                      |   br_if 0
 0004cb: 20 00                      |   local.get 0
 0004cd: 10 0a                      |   call 10
 0004cf: 0b                         | end
 0004d0: 20 05                      | local.get 5
 0004d2: 41 d0 01                   | i32.const 208
 0004d5: 6a                         | i32.add
 0004d6: 24 00                      | global.set 0
 0004d8: 20 01                      | local.get 1
 0004da: 0b                         | end
0004dd func[12]:
 0004de: 0f 7f                      | local[0..14] type=i32
 0004e0: 01 7e                      | local[15] type=i64
 0004e2: 23 00                      | global.get 0
 0004e4: 41 d0 00                   | i32.const 80
 0004e7: 6b                         | i32.sub
 0004e8: 22 07                      | local.tee 7
 0004ea: 24 00                      | global.set 0
 0004ec: 20 07                      | local.get 7
 0004ee: 20 01                      | local.get 1
 0004f0: 36 02 4c                   | i32.store 2 76
 0004f3: 20 07                      | local.get 7
 0004f5: 41 37                      | i32.const 55
 0004f7: 6a                         | i32.add
 0004f8: 21 08                      | local.set 8
 0004fa: 20 07                      | local.get 7
 0004fc: 41 38                      | i32.const 56
 0004fe: 6a                         | i32.add
 0004ff: 21 09                      | local.set 9
 000501: 41 00                      | i32.const 0
 000503: 21 0a                      | local.set 10
 000505: 41 00                      | i32.const 0
 000507: 21 0b                      | local.set 11
 000509: 41 00                      | i32.const 0
 00050b: 21 01                      | local.set 1
 00050d: 02 40                      | block
 00050f: 02 40                      |   block
 000511: 03 40                      |     loop
 000513: 02 40                      |       block
 000515: 20 0b                      |         local.get 11
 000517: 41 00                      |         i32.const 0
 000519: 48                         |         i32.lt_s
 00051a: 0d 00                      |         br_if 0
 00051c: 02 40                      |         block
 00051e: 20 01                      |           local.get 1
 000520: 41 ff ff ff ff 07          |           i32.const 2147483647
 000526: 20 0b                      |           local.get 11
 000528: 6b                         |           i32.sub
 000529: 4c                         |           i32.le_s
 00052a: 0d 00                      |           br_if 0
 00052c: 10 26                      |           call 38 <__errno_location>
 00052e: 41 3d                      |           i32.const 61
 000530: 36 02 00                   |           i32.store 2 0
 000533: 41 7f                      |           i32.const 4294967295
 000535: 21 0b                      |           local.set 11
 000537: 0c 01                      |           br 1
 000539: 0b                         |         end
 00053a: 20 01                      |         local.get 1
 00053c: 20 0b                      |         local.get 11
 00053e: 6a                         |         i32.add
 00053f: 21 0b                      |         local.set 11
 000541: 0b                         |       end
 000542: 20 07                      |       local.get 7
 000544: 28 02 4c                   |       i32.load 2 76
 000547: 22 0c                      |       local.tee 12
 000549: 21 01                      |       local.set 1
 00054b: 02 40                      |       block
 00054d: 02 40                      |         block
 00054f: 02 40                      |           block
 000551: 02 40                      |             block
 000553: 02 40                      |               block
 000555: 02 40                      |                 block
 000557: 02 40                      |                   block
 000559: 02 40                      |                     block
 00055b: 02 40                      |                       block
 00055d: 02 40                      |                         block
 00055f: 02 40                      |                           block
 000561: 02 40                      |                             block
 000563: 02 40                      |                               block
 000565: 02 40                      |                                 block
 000567: 20 0c                      |                                   local.get 12
 000569: 2d 00 00                   |                                   i32.load8_u 0 0
 00056c: 22 0d                      |                                   local.tee 13
 00056e: 45                         |                                   i32.eqz
 00056f: 0d 00                      |                                   br_if 0
 000571: 02 40                      |                                   block
 000573: 03 40                      |                                     loop
 000575: 02 40                      |                                       block
 000577: 02 40                      |                                         block
 000579: 02 40                      |                                           block
 00057b: 20 0d                      |                                             local.get 13
 00057d: 41 ff 01                   |                                             i32.const 255
 000580: 71                         |                                             i32.and
 000581: 22 0d                      |                                             local.tee 13
 000583: 0d 00                      |                                             br_if 0
 000585: 20 01                      |                                             local.get 1
 000587: 21 0d                      |                                             local.set 13
 000589: 0c 01                      |                                             br 1
 00058b: 0b                         |                                           end
 00058c: 20 0d                      |                                           local.get 13
 00058e: 41 25                      |                                           i32.const 37
 000590: 47                         |                                           i32.ne
 000591: 0d 01                      |                                           br_if 1
 000593: 20 01                      |                                           local.get 1
 000595: 21 0d                      |                                           local.set 13
 000597: 03 40                      |                                           loop
 000599: 20 01                      |                                             local.get 1
 00059b: 2d 00 01                   |                                             i32.load8_u 0 1
 00059e: 41 25                      |                                             i32.const 37
 0005a0: 47                         |                                             i32.ne
 0005a1: 0d 01                      |                                             br_if 1
 0005a3: 20 07                      |                                             local.get 7
 0005a5: 20 01                      |                                             local.get 1
 0005a7: 41 02                      |                                             i32.const 2
 0005a9: 6a                         |                                             i32.add
 0005aa: 22 0e                      |                                             local.tee 14
 0005ac: 36 02 4c                   |                                             i32.store 2 76
 0005af: 20 0d                      |                                             local.get 13
 0005b1: 41 01                      |                                             i32.const 1
 0005b3: 6a                         |                                             i32.add
 0005b4: 21 0d                      |                                             local.set 13
 0005b6: 20 01                      |                                             local.get 1
 0005b8: 2d 00 02                   |                                             i32.load8_u 0 2
 0005bb: 21 0f                      |                                             local.set 15
 0005bd: 20 0e                      |                                             local.get 14
 0005bf: 21 01                      |                                             local.set 1
 0005c1: 20 0f                      |                                             local.get 15
 0005c3: 41 25                      |                                             i32.const 37
 0005c5: 46                         |                                             i32.eq
 0005c6: 0d 00                      |                                             br_if 0
 0005c8: 0b                         |                                           end
 0005c9: 0b                         |                                         end
 0005ca: 20 0d                      |                                         local.get 13
 0005cc: 20 0c                      |                                         local.get 12
 0005ce: 6b                         |                                         i32.sub
 0005cf: 21 01                      |                                         local.set 1
 0005d1: 02 40                      |                                         block
 0005d3: 20 00                      |                                           local.get 0
 0005d5: 45                         |                                           i32.eqz
 0005d6: 0d 00                      |                                           br_if 0
 0005d8: 20 00                      |                                           local.get 0
 0005da: 20 0c                      |                                           local.get 12
 0005dc: 20 01                      |                                           local.get 1
 0005de: 10 0d                      |                                           call 13
 0005e0: 0b                         |                                         end
 0005e1: 20 01                      |                                         local.get 1
 0005e3: 0d 11                      |                                         br_if 17
 0005e5: 20 07                      |                                         local.get 7
 0005e7: 28 02 4c                   |                                         i32.load 2 76
 0005ea: 2c 00 01                   |                                         i32.load8_s 0 1
 0005ed: 10 21                      |                                         call 33
 0005ef: 21 0e                      |                                         local.set 14
 0005f1: 41 7f                      |                                         i32.const 4294967295
 0005f3: 21 10                      |                                         local.set 16
 0005f5: 41 01                      |                                         i32.const 1
 0005f7: 21 0d                      |                                         local.set 13
 0005f9: 20 07                      |                                         local.get 7
 0005fb: 28 02 4c                   |                                         i32.load 2 76
 0005fe: 21 01                      |                                         local.set 1
 000600: 02 40                      |                                         block
 000602: 20 0e                      |                                           local.get 14
 000604: 45                         |                                           i32.eqz
 000605: 0d 00                      |                                           br_if 0
 000607: 20 01                      |                                           local.get 1
 000609: 2d 00 02                   |                                           i32.load8_u 0 2
 00060c: 41 24                      |                                           i32.const 36
 00060e: 47                         |                                           i32.ne
 00060f: 0d 00                      |                                           br_if 0
 000611: 20 01                      |                                           local.get 1
 000613: 2c 00 01                   |                                           i32.load8_s 0 1
 000616: 41 50                      |                                           i32.const 4294967248
 000618: 6a                         |                                           i32.add
 000619: 21 10                      |                                           local.set 16
 00061b: 41 01                      |                                           i32.const 1
 00061d: 21 0a                      |                                           local.set 10
 00061f: 41 03                      |                                           i32.const 3
 000621: 21 0d                      |                                           local.set 13
 000623: 0b                         |                                         end
 000624: 20 07                      |                                         local.get 7
 000626: 20 01                      |                                         local.get 1
 000628: 20 0d                      |                                         local.get 13
 00062a: 6a                         |                                         i32.add
 00062b: 22 01                      |                                         local.tee 1
 00062d: 36 02 4c                   |                                         i32.store 2 76
 000630: 41 00                      |                                         i32.const 0
 000632: 21 0d                      |                                         local.set 13
 000634: 02 40                      |                                         block
 000636: 02 40                      |                                           block
 000638: 20 01                      |                                             local.get 1
 00063a: 2c 00 00                   |                                             i32.load8_s 0 0
 00063d: 22 11                      |                                             local.tee 17
 00063f: 41 60                      |                                             i32.const 4294967264
 000641: 6a                         |                                             i32.add
 000642: 22 0f                      |                                             local.tee 15
 000644: 41 1f                      |                                             i32.const 31
 000646: 4d                         |                                             i32.le_u
 000647: 0d 00                      |                                             br_if 0
 000649: 20 01                      |                                             local.get 1
 00064b: 21 0e                      |                                             local.set 14
 00064d: 0c 01                      |                                             br 1
 00064f: 0b                         |                                           end
 000650: 20 01                      |                                           local.get 1
 000652: 21 0e                      |                                           local.set 14
 000654: 41 01                      |                                           i32.const 1
 000656: 20 0f                      |                                           local.get 15
 000658: 74                         |                                           i32.shl
 000659: 22 0f                      |                                           local.tee 15
 00065b: 41 89 d1 04                |                                           i32.const 75913
 00065f: 71                         |                                           i32.and
 000660: 45                         |                                           i32.eqz
 000661: 0d 00                      |                                           br_if 0
 000663: 03 40                      |                                           loop
 000665: 20 07                      |                                             local.get 7
 000667: 20 01                      |                                             local.get 1
 000669: 41 01                      |                                             i32.const 1
 00066b: 6a                         |                                             i32.add
 00066c: 22 0e                      |                                             local.tee 14
 00066e: 36 02 4c                   |                                             i32.store 2 76
 000671: 20 0f                      |                                             local.get 15
 000673: 20 0d                      |                                             local.get 13
 000675: 72                         |                                             i32.or
 000676: 21 0d                      |                                             local.set 13
 000678: 20 01                      |                                             local.get 1
 00067a: 2c 00 01                   |                                             i32.load8_s 0 1
 00067d: 22 11                      |                                             local.tee 17
 00067f: 41 60                      |                                             i32.const 4294967264
 000681: 6a                         |                                             i32.add
 000682: 22 0f                      |                                             local.tee 15
 000684: 41 1f                      |                                             i32.const 31
 000686: 4b                         |                                             i32.gt_u
 000687: 0d 01                      |                                             br_if 1
 000689: 20 0e                      |                                             local.get 14
 00068b: 21 01                      |                                             local.set 1
 00068d: 41 01                      |                                             i32.const 1
 00068f: 20 0f                      |                                             local.get 15
 000691: 74                         |                                             i32.shl
 000692: 22 0f                      |                                             local.tee 15
 000694: 41 89 d1 04                |                                             i32.const 75913
 000698: 71                         |                                             i32.and
 000699: 0d 00                      |                                             br_if 0
 00069b: 0b                         |                                           end
 00069c: 0b                         |                                         end
 00069d: 02 40                      |                                         block
 00069f: 02 40                      |                                           block
 0006a1: 20 11                      |                                             local.get 17
 0006a3: 41 2a                      |                                             i32.const 42
 0006a5: 47                         |                                             i32.ne
 0006a6: 0d 00                      |                                             br_if 0
 0006a8: 02 40                      |                                             block
 0006aa: 02 40                      |                                               block
 0006ac: 20 0e                      |                                                 local.get 14
 0006ae: 2c 00 01                   |                                                 i32.load8_s 0 1
 0006b1: 10 21                      |                                                 call 33
 0006b3: 45                         |                                                 i32.eqz
 0006b4: 0d 00                      |                                                 br_if 0
 0006b6: 20 07                      |                                                 local.get 7
 0006b8: 28 02 4c                   |                                                 i32.load 2 76
 0006bb: 22 0e                      |                                                 local.tee 14
 0006bd: 2d 00 02                   |                                                 i32.load8_u 0 2
 0006c0: 41 24                      |                                                 i32.const 36
 0006c2: 47                         |                                                 i32.ne
 0006c3: 0d 00                      |                                                 br_if 0
 0006c5: 20 0e                      |                                                 local.get 14
 0006c7: 2c 00 01                   |                                                 i32.load8_s 0 1
 0006ca: 41 02                      |                                                 i32.const 2
 0006cc: 74                         |                                                 i32.shl
 0006cd: 20 04                      |                                                 local.get 4
 0006cf: 6a                         |                                                 i32.add
 0006d0: 41 c0 7e                   |                                                 i32.const 4294967104
 0006d3: 6a                         |                                                 i32.add
 0006d4: 41 0a                      |                                                 i32.const 10
 0006d6: 36 02 00                   |                                                 i32.store 2 0
 0006d9: 20 0e                      |                                                 local.get 14
 0006db: 41 03                      |                                                 i32.const 3
 0006dd: 6a                         |                                                 i32.add
 0006de: 21 01                      |                                                 local.set 1
 0006e0: 20 0e                      |                                                 local.get 14
 0006e2: 2c 00 01                   |                                                 i32.load8_s 0 1
 0006e5: 41 03                      |                                                 i32.const 3
 0006e7: 74                         |                                                 i32.shl
 0006e8: 20 03                      |                                                 local.get 3
 0006ea: 6a                         |                                                 i32.add
 0006eb: 41 80 7d                   |                                                 i32.const 4294966912
 0006ee: 6a                         |                                                 i32.add
 0006ef: 28 02 00                   |                                                 i32.load 2 0
 0006f2: 21 12                      |                                                 local.set 18
 0006f4: 41 01                      |                                                 i32.const 1
 0006f6: 21 0a                      |                                                 local.set 10
 0006f8: 0c 01                      |                                                 br 1
 0006fa: 0b                         |                                               end
 0006fb: 20 0a                      |                                               local.get 10
 0006fd: 0d 15                      |                                               br_if 21
 0006ff: 41 00                      |                                               i32.const 0
 000701: 21 0a                      |                                               local.set 10
 000703: 41 00                      |                                               i32.const 0
 000705: 21 12                      |                                               local.set 18
 000707: 02 40                      |                                               block
 000709: 20 00                      |                                                 local.get 0
 00070b: 45                         |                                                 i32.eqz
 00070c: 0d 00                      |                                                 br_if 0
 00070e: 20 02                      |                                                 local.get 2
 000710: 20 02                      |                                                 local.get 2
 000712: 28 02 00                   |                                                 i32.load 2 0
 000715: 22 01                      |                                                 local.tee 1
 000717: 41 04                      |                                                 i32.const 4
 000719: 6a                         |                                                 i32.add
 00071a: 36 02 00                   |                                                 i32.store 2 0
 00071d: 20 01                      |                                                 local.get 1
 00071f: 28 02 00                   |                                                 i32.load 2 0
 000722: 21 12                      |                                                 local.set 18
 000724: 0b                         |                                               end
 000725: 20 07                      |                                               local.get 7
 000727: 28 02 4c                   |                                               i32.load 2 76
 00072a: 41 01                      |                                               i32.const 1
 00072c: 6a                         |                                               i32.add
 00072d: 21 01                      |                                               local.set 1
 00072f: 0b                         |                                             end
 000730: 20 07                      |                                             local.get 7
 000732: 20 01                      |                                             local.get 1
 000734: 36 02 4c                   |                                             i32.store 2 76
 000737: 20 12                      |                                             local.get 18
 000739: 41 7f                      |                                             i32.const 4294967295
 00073b: 4a                         |                                             i32.gt_s
 00073c: 0d 01                      |                                             br_if 1
 00073e: 41 00                      |                                             i32.const 0
 000740: 20 12                      |                                             local.get 18
 000742: 6b                         |                                             i32.sub
 000743: 21 12                      |                                             local.set 18
 000745: 20 0d                      |                                             local.get 13
 000747: 41 80 c0 00                |                                             i32.const 8192
 00074b: 72                         |                                             i32.or
 00074c: 21 0d                      |                                             local.set 13
 00074e: 0c 01                      |                                             br 1
 000750: 0b                         |                                           end
 000751: 20 07                      |                                           local.get 7
 000753: 41 cc 00                   |                                           i32.const 76
 000756: 6a                         |                                           i32.add
 000757: 10 0e                      |                                           call 14
 000759: 22 12                      |                                           local.tee 18
 00075b: 41 00                      |                                           i32.const 0
 00075d: 48                         |                                           i32.lt_s
 00075e: 0d 13                      |                                           br_if 19
 000760: 20 07                      |                                           local.get 7
 000762: 28 02 4c                   |                                           i32.load 2 76
 000765: 21 01                      |                                           local.set 1
 000767: 0b                         |                                         end
 000768: 41 7f                      |                                         i32.const 4294967295
 00076a: 21 13                      |                                         local.set 19
 00076c: 02 40                      |                                         block
 00076e: 20 01                      |                                           local.get 1
 000770: 2d 00 00                   |                                           i32.load8_u 0 0
 000773: 41 2e                      |                                           i32.const 46
 000775: 47                         |                                           i32.ne
 000776: 0d 00                      |                                           br_if 0
 000778: 02 40                      |                                           block
 00077a: 20 01                      |                                             local.get 1
 00077c: 2d 00 01                   |                                             i32.load8_u 0 1
 00077f: 41 2a                      |                                             i32.const 42
 000781: 47                         |                                             i32.ne
 000782: 0d 00                      |                                             br_if 0
 000784: 02 40                      |                                             block
 000786: 20 01                      |                                               local.get 1
 000788: 2c 00 02                   |                                               i32.load8_s 0 2
 00078b: 10 21                      |                                               call 33
 00078d: 45                         |                                               i32.eqz
 00078e: 0d 00                      |                                               br_if 0
 000790: 20 07                      |                                               local.get 7
 000792: 28 02 4c                   |                                               i32.load 2 76
 000795: 22 01                      |                                               local.tee 1
 000797: 2d 00 03                   |                                               i32.load8_u 0 3
 00079a: 41 24                      |                                               i32.const 36
 00079c: 47                         |                                               i32.ne
 00079d: 0d 00                      |                                               br_if 0
 00079f: 20 01                      |                                               local.get 1
 0007a1: 2c 00 02                   |                                               i32.load8_s 0 2
 0007a4: 41 02                      |                                               i32.const 2
 0007a6: 74                         |                                               i32.shl
 0007a7: 20 04                      |                                               local.get 4
 0007a9: 6a                         |                                               i32.add
 0007aa: 41 c0 7e                   |                                               i32.const 4294967104
 0007ad: 6a                         |                                               i32.add
 0007ae: 41 0a                      |                                               i32.const 10
 0007b0: 36 02 00                   |                                               i32.store 2 0
 0007b3: 20 01                      |                                               local.get 1
 0007b5: 2c 00 02                   |                                               i32.load8_s 0 2
 0007b8: 41 03                      |                                               i32.const 3
 0007ba: 74                         |                                               i32.shl
 0007bb: 20 03                      |                                               local.get 3
 0007bd: 6a                         |                                               i32.add
 0007be: 41 80 7d                   |                                               i32.const 4294966912
 0007c1: 6a                         |                                               i32.add
 0007c2: 28 02 00                   |                                               i32.load 2 0
 0007c5: 21 13                      |                                               local.set 19
 0007c7: 20 07                      |                                               local.get 7
 0007c9: 20 01                      |                                               local.get 1
 0007cb: 41 04                      |                                               i32.const 4
 0007cd: 6a                         |                                               i32.add
 0007ce: 22 01                      |                                               local.tee 1
 0007d0: 36 02 4c                   |                                               i32.store 2 76
 0007d3: 0c 02                      |                                               br 2
 0007d5: 0b                         |                                             end
 0007d6: 20 0a                      |                                             local.get 10
 0007d8: 0d 14                      |                                             br_if 20
 0007da: 02 40                      |                                             block
 0007dc: 02 40                      |                                               block
 0007de: 20 00                      |                                                 local.get 0
 0007e0: 0d 00                      |                                                 br_if 0
 0007e2: 41 00                      |                                                 i32.const 0
 0007e4: 21 13                      |                                                 local.set 19
 0007e6: 0c 01                      |                                                 br 1
 0007e8: 0b                         |                                               end
 0007e9: 20 02                      |                                               local.get 2
 0007eb: 20 02                      |                                               local.get 2
 0007ed: 28 02 00                   |                                               i32.load 2 0
 0007f0: 22 01                      |                                               local.tee 1
 0007f2: 41 04                      |                                               i32.const 4
 0007f4: 6a                         |                                               i32.add
 0007f5: 36 02 00                   |                                               i32.store 2 0
 0007f8: 20 01                      |                                               local.get 1
 0007fa: 28 02 00                   |                                               i32.load 2 0
 0007fd: 21 13                      |                                               local.set 19
 0007ff: 0b                         |                                             end
 000800: 20 07                      |                                             local.get 7
 000802: 20 07                      |                                             local.get 7
 000804: 28 02 4c                   |                                             i32.load 2 76
 000807: 41 02                      |                                             i32.const 2
 000809: 6a                         |                                             i32.add
 00080a: 22 01                      |                                             local.tee 1
 00080c: 36 02 4c                   |                                             i32.store 2 76
 00080f: 0c 01                      |                                             br 1
 000811: 0b                         |                                           end
 000812: 20 07                      |                                           local.get 7
 000814: 20 01                      |                                           local.get 1
 000816: 41 01                      |                                           i32.const 1
 000818: 6a                         |                                           i32.add
 000819: 36 02 4c                   |                                           i32.store 2 76
 00081c: 20 07                      |                                           local.get 7
 00081e: 41 cc 00                   |                                           i32.const 76
 000821: 6a                         |                                           i32.add
 000822: 10 0e                      |                                           call 14
 000824: 21 13                      |                                           local.set 19
 000826: 20 07                      |                                           local.get 7
 000828: 28 02 4c                   |                                           i32.load 2 76
 00082b: 21 01                      |                                           local.set 1
 00082d: 0b                         |                                         end
 00082e: 41 00                      |                                         i32.const 0
 000830: 21 0e                      |                                         local.set 14
 000832: 03 40                      |                                         loop
 000834: 20 0e                      |                                           local.get 14
 000836: 21 0f                      |                                           local.set 15
 000838: 41 7f                      |                                           i32.const 4294967295
 00083a: 21 14                      |                                           local.set 20
 00083c: 20 01                      |                                           local.get 1
 00083e: 2c 00 00                   |                                           i32.load8_s 0 0
 000841: 41 bf 7f                   |                                           i32.const 4294967231
 000844: 6a                         |                                           i32.add
 000845: 41 39                      |                                           i32.const 57
 000847: 4b                         |                                           i32.gt_u
 000848: 0d 14                      |                                           br_if 20
 00084a: 20 07                      |                                           local.get 7
 00084c: 20 01                      |                                           local.get 1
 00084e: 41 01                      |                                           i32.const 1
 000850: 6a                         |                                           i32.add
 000851: 22 11                      |                                           local.tee 17
 000853: 36 02 4c                   |                                           i32.store 2 76
 000856: 20 01                      |                                           local.get 1
 000858: 2c 00 00                   |                                           i32.load8_s 0 0
 00085b: 21 0e                      |                                           local.set 14
 00085d: 20 11                      |                                           local.get 17
 00085f: 21 01                      |                                           local.set 1
 000861: 20 0e                      |                                           local.get 14
 000863: 20 0f                      |                                           local.get 15
 000865: 41 3a                      |                                           i32.const 58
 000867: 6c                         |                                           i32.mul
 000868: 6a                         |                                           i32.add
 000869: 41 df 07                   |                                           i32.const 991
 00086c: 6a                         |                                           i32.add
 00086d: 2d 00 00                   |                                           i32.load8_u 0 0
 000870: 22 0e                      |                                           local.tee 14
 000872: 41 7f                      |                                           i32.const 4294967295
 000874: 6a                         |                                           i32.add
 000875: 41 08                      |                                           i32.const 8
 000877: 49                         |                                           i32.lt_u
 000878: 0d 00                      |                                           br_if 0
 00087a: 0b                         |                                         end
 00087b: 20 0e                      |                                         local.get 14
 00087d: 45                         |                                         i32.eqz
 00087e: 0d 13                      |                                         br_if 19
 000880: 02 40                      |                                         block
 000882: 02 40                      |                                           block
 000884: 02 40                      |                                             block
 000886: 02 40                      |                                               block
 000888: 20 0e                      |                                                 local.get 14
 00088a: 41 13                      |                                                 i32.const 19
 00088c: 47                         |                                                 i32.ne
 00088d: 0d 00                      |                                                 br_if 0
 00088f: 41 7f                      |                                                 i32.const 4294967295
 000891: 21 14                      |                                                 local.set 20
 000893: 20 10                      |                                                 local.get 16
 000895: 41 7f                      |                                                 i32.const 4294967295
 000897: 4c                         |                                                 i32.le_s
 000898: 0d 01                      |                                                 br_if 1
 00089a: 0c 17                      |                                                 br 23
 00089c: 0b                         |                                               end
 00089d: 20 10                      |                                               local.get 16
 00089f: 41 00                      |                                               i32.const 0
 0008a1: 48                         |                                               i32.lt_s
 0008a2: 0d 01                      |                                               br_if 1
 0008a4: 20 04                      |                                               local.get 4
 0008a6: 20 10                      |                                               local.get 16
 0008a8: 41 02                      |                                               i32.const 2
 0008aa: 74                         |                                               i32.shl
 0008ab: 6a                         |                                               i32.add
 0008ac: 20 0e                      |                                               local.get 14
 0008ae: 36 02 00                   |                                               i32.store 2 0
 0008b1: 20 07                      |                                               local.get 7
 0008b3: 20 03                      |                                               local.get 3
 0008b5: 20 10                      |                                               local.get 16
 0008b7: 41 03                      |                                               i32.const 3
 0008b9: 74                         |                                               i32.shl
 0008ba: 6a                         |                                               i32.add
 0008bb: 29 03 00                   |                                               i64.load 3 0
 0008be: 37 03 40                   |                                               i64.store 3 64
 0008c1: 0b                         |                                             end
 0008c2: 41 00                      |                                             i32.const 0
 0008c4: 21 01                      |                                             local.set 1
 0008c6: 20 00                      |                                             local.get 0
 0008c8: 45                         |                                             i32.eqz
 0008c9: 0d 13                      |                                             br_if 19
 0008cb: 0c 01                      |                                             br 1
 0008cd: 0b                         |                                           end
 0008ce: 20 00                      |                                           local.get 0
 0008d0: 45                         |                                           i32.eqz
 0008d1: 0d 11                      |                                           br_if 17
 0008d3: 20 07                      |                                           local.get 7
 0008d5: 41 c0 00                   |                                           i32.const 64
 0008d8: 6a                         |                                           i32.add
 0008d9: 20 0e                      |                                           local.get 14
 0008db: 20 02                      |                                           local.get 2
 0008dd: 20 06                      |                                           local.get 6
 0008df: 10 0f                      |                                           call 15
 0008e1: 20 07                      |                                           local.get 7
 0008e3: 28 02 4c                   |                                           i32.load 2 76
 0008e6: 21 11                      |                                           local.set 17
 0008e8: 0b                         |                                         end
 0008e9: 20 0d                      |                                         local.get 13
 0008eb: 41 ff ff 7b                |                                         i32.const 4294901759
 0008ef: 71                         |                                         i32.and
 0008f0: 22 15                      |                                         local.tee 21
 0008f2: 20 0d                      |                                         local.get 13
 0008f4: 20 0d                      |                                         local.get 13
 0008f6: 41 80 c0 00                |                                         i32.const 8192
 0008fa: 71                         |                                         i32.and
 0008fb: 1b                         |                                         select
 0008fc: 21 0d                      |                                         local.set 13
 0008fe: 41 00                      |                                         i32.const 0
 000900: 21 14                      |                                         local.set 20
 000902: 41 8d 08                   |                                         i32.const 1037
 000905: 21 10                      |                                         local.set 16
 000907: 20 09                      |                                         local.get 9
 000909: 21 0e                      |                                         local.set 14
 00090b: 20 11                      |                                         local.get 17
 00090d: 41 7f                      |                                         i32.const 4294967295
 00090f: 6a                         |                                         i32.add
 000910: 2c 00 00                   |                                         i32.load8_s 0 0
 000913: 22 01                      |                                         local.tee 1
 000915: 41 5f                      |                                         i32.const 4294967263
 000917: 71                         |                                         i32.and
 000918: 20 01                      |                                         local.get 1
 00091a: 20 01                      |                                         local.get 1
 00091c: 41 0f                      |                                         i32.const 15
 00091e: 71                         |                                         i32.and
 00091f: 41 03                      |                                         i32.const 3
 000921: 46                         |                                         i32.eq
 000922: 1b                         |                                         select
 000923: 20 01                      |                                         local.get 1
 000925: 20 0f                      |                                         local.get 15
 000927: 1b                         |                                         select
 000928: 22 01                      |                                         local.tee 1
 00092a: 41 a8 7f                   |                                         i32.const 4294967208
 00092d: 6a                         |                                         i32.add
 00092e: 22 11                      |                                         local.tee 17
 000930: 41 20                      |                                         i32.const 32
 000932: 4d                         |                                         i32.le_u
 000933: 0d 02                      |                                         br_if 2
 000935: 02 40                      |                                         block
 000937: 02 40                      |                                           block
 000939: 02 40                      |                                             block
 00093b: 02 40                      |                                               block
 00093d: 02 40                      |                                                 block
 00093f: 20 01                      |                                                   local.get 1
 000941: 41 bf 7f                   |                                                   i32.const 4294967231
 000944: 6a                         |                                                   i32.add
 000945: 22 0f                      |                                                   local.tee 15
 000947: 41 06                      |                                                   i32.const 6
 000949: 4d                         |                                                   i32.le_u
 00094a: 0d 00                      |                                                   br_if 0
 00094c: 20 01                      |                                                   local.get 1
 00094e: 41 d3 00                   |                                                   i32.const 83
 000951: 47                         |                                                   i32.ne
 000952: 0d 14                      |                                                   br_if 20
 000954: 20 13                      |                                                   local.get 19
 000956: 45                         |                                                   i32.eqz
 000957: 0d 01                      |                                                   br_if 1
 000959: 20 07                      |                                                   local.get 7
 00095b: 28 02 40                   |                                                   i32.load 2 64
 00095e: 21 0e                      |                                                   local.set 14
 000960: 0c 03                      |                                                   br 3
 000962: 0b                         |                                                 end
 000963: 20 0f                      |                                                 local.get 15
 000965: 0e 07 08 13 01 13 08 08 08 |                                                 br_table
 00096e: 08                         | 
 00096f: 0b                         |                                               end
 000970: 41 00                      |                                               i32.const 0
 000972: 21 01                      |                                               local.set 1
 000974: 20 00                      |                                               local.get 0
 000976: 41 20                      |                                               i32.const 32
 000978: 20 12                      |                                               local.get 18
 00097a: 41 00                      |                                               i32.const 0
 00097c: 20 0d                      |                                               local.get 13
 00097e: 10 10                      |                                               call 16
 000980: 0c 02                      |                                               br 2
 000982: 0b                         |                                             end
 000983: 20 07                      |                                             local.get 7
 000985: 41 00                      |                                             i32.const 0
 000987: 36 02 0c                   |                                             i32.store 2 12
 00098a: 20 07                      |                                             local.get 7
 00098c: 20 07                      |                                             local.get 7
 00098e: 29 03 40                   |                                             i64.load 3 64
 000991: 3e 02 08                   |                                             i64.store32 2 8
 000994: 20 07                      |                                             local.get 7
 000996: 20 07                      |                                             local.get 7
 000998: 41 08                      |                                             i32.const 8
 00099a: 6a                         |                                             i32.add
 00099b: 36 02 40                   |                                             i32.store 2 64
 00099e: 41 7f                      |                                             i32.const 4294967295
 0009a0: 21 13                      |                                             local.set 19
 0009a2: 20 07                      |                                             local.get 7
 0009a4: 41 08                      |                                             i32.const 8
 0009a6: 6a                         |                                             i32.add
 0009a7: 21 0e                      |                                             local.set 14
 0009a9: 0b                         |                                           end
 0009aa: 41 00                      |                                           i32.const 0
 0009ac: 21 01                      |                                           local.set 1
 0009ae: 02 40                      |                                           block
 0009b0: 03 40                      |                                             loop
 0009b2: 20 0e                      |                                               local.get 14
 0009b4: 28 02 00                   |                                               i32.load 2 0
 0009b7: 22 0f                      |                                               local.tee 15
 0009b9: 45                         |                                               i32.eqz
 0009ba: 0d 01                      |                                               br_if 1
 0009bc: 02 40                      |                                               block
 0009be: 20 07                      |                                                 local.get 7
 0009c0: 41 04                      |                                                 i32.const 4
 0009c2: 6a                         |                                                 i32.add
 0009c3: 20 0f                      |                                                 local.get 15
 0009c5: 10 22                      |                                                 call 34
 0009c7: 22 0f                      |                                                 local.tee 15
 0009c9: 41 00                      |                                                 i32.const 0
 0009cb: 48                         |                                                 i32.lt_s
 0009cc: 22 0c                      |                                                 local.tee 12
 0009ce: 0d 00                      |                                                 br_if 0
 0009d0: 20 0f                      |                                                 local.get 15
 0009d2: 20 13                      |                                                 local.get 19
 0009d4: 20 01                      |                                                 local.get 1
 0009d6: 6b                         |                                                 i32.sub
 0009d7: 4b                         |                                                 i32.gt_u
 0009d8: 0d 00                      |                                                 br_if 0
 0009da: 20 0e                      |                                                 local.get 14
 0009dc: 41 04                      |                                                 i32.const 4
 0009de: 6a                         |                                                 i32.add
 0009df: 21 0e                      |                                                 local.set 14
 0009e1: 20 13                      |                                                 local.get 19
 0009e3: 20 0f                      |                                                 local.get 15
 0009e5: 20 01                      |                                                 local.get 1
 0009e7: 6a                         |                                                 i32.add
 0009e8: 22 01                      |                                                 local.tee 1
 0009ea: 4b                         |                                                 i32.gt_u
 0009eb: 0d 01                      |                                                 br_if 1
 0009ed: 0c 02                      |                                                 br 2
 0009ef: 0b                         |                                               end
 0009f0: 0b                         |                                             end
 0009f1: 41 7f                      |                                             i32.const 4294967295
 0009f3: 21 14                      |                                             local.set 20
 0009f5: 20 0c                      |                                             local.get 12
 0009f7: 0d 15                      |                                             br_if 21
 0009f9: 0b                         |                                           end
 0009fa: 20 00                      |                                           local.get 0
 0009fc: 41 20                      |                                           i32.const 32
 0009fe: 20 12                      |                                           local.get 18
 000a00: 20 01                      |                                           local.get 1
 000a02: 20 0d                      |                                           local.get 13
 000a04: 10 10                      |                                           call 16
 000a06: 02 40                      |                                           block
 000a08: 20 01                      |                                             local.get 1
 000a0a: 0d 00                      |                                             br_if 0
 000a0c: 41 00                      |                                             i32.const 0
 000a0e: 21 01                      |                                             local.set 1
 000a10: 0c 01                      |                                             br 1
 000a12: 0b                         |                                           end
 000a13: 41 00                      |                                           i32.const 0
 000a15: 21 0f                      |                                           local.set 15
 000a17: 20 07                      |                                           local.get 7
 000a19: 28 02 40                   |                                           i32.load 2 64
 000a1c: 21 0e                      |                                           local.set 14
 000a1e: 03 40                      |                                           loop
 000a20: 20 0e                      |                                             local.get 14
 000a22: 28 02 00                   |                                             i32.load 2 0
 000a25: 22 0c                      |                                             local.tee 12
 000a27: 45                         |                                             i32.eqz
 000a28: 0d 01                      |                                             br_if 1
 000a2a: 20 07                      |                                             local.get 7
 000a2c: 41 04                      |                                             i32.const 4
 000a2e: 6a                         |                                             i32.add
 000a2f: 20 0c                      |                                             local.get 12
 000a31: 10 22                      |                                             call 34
 000a33: 22 0c                      |                                             local.tee 12
 000a35: 20 0f                      |                                             local.get 15
 000a37: 6a                         |                                             i32.add
 000a38: 22 0f                      |                                             local.tee 15
 000a3a: 20 01                      |                                             local.get 1
 000a3c: 4a                         |                                             i32.gt_s
 000a3d: 0d 01                      |                                             br_if 1
 000a3f: 20 00                      |                                             local.get 0
 000a41: 20 07                      |                                             local.get 7
 000a43: 41 04                      |                                             i32.const 4
 000a45: 6a                         |                                             i32.add
 000a46: 20 0c                      |                                             local.get 12
 000a48: 10 0d                      |                                             call 13
 000a4a: 20 0e                      |                                             local.get 14
 000a4c: 41 04                      |                                             i32.const 4
 000a4e: 6a                         |                                             i32.add
 000a4f: 21 0e                      |                                             local.set 14
 000a51: 20 0f                      |                                             local.get 15
 000a53: 20 01                      |                                             local.get 1
 000a55: 49                         |                                             i32.lt_u
 000a56: 0d 00                      |                                             br_if 0
 000a58: 0b                         |                                           end
 000a59: 0b                         |                                         end
 000a5a: 20 00                      |                                         local.get 0
 000a5c: 41 20                      |                                         i32.const 32
 000a5e: 20 12                      |                                         local.get 18
 000a60: 20 01                      |                                         local.get 1
 000a62: 20 0d                      |                                         local.get 13
 000a64: 41 80 c0 00                |                                         i32.const 8192
 000a68: 73                         |                                         i32.xor
 000a69: 10 10                      |                                         call 16
 000a6b: 20 12                      |                                         local.get 18
 000a6d: 20 01                      |                                         local.get 1
 000a6f: 20 12                      |                                         local.get 18
 000a71: 20 01                      |                                         local.get 1
 000a73: 4a                         |                                         i32.gt_s
 000a74: 1b                         |                                         select
 000a75: 21 01                      |                                         local.set 1
 000a77: 0c 11                      |                                         br 17
 000a79: 0b                         |                                       end
 000a7a: 20 07                      |                                       local.get 7
 000a7c: 20 01                      |                                       local.get 1
 000a7e: 41 01                      |                                       i32.const 1
 000a80: 6a                         |                                       i32.add
 000a81: 22 0e                      |                                       local.tee 14
 000a83: 36 02 4c                   |                                       i32.store 2 76
 000a86: 20 01                      |                                       local.get 1
 000a88: 2d 00 01                   |                                       i32.load8_u 0 1
 000a8b: 21 0d                      |                                       local.set 13
 000a8d: 20 0e                      |                                       local.get 14
 000a8f: 21 01                      |                                       local.set 1
 000a91: 0c 00                      |                                       br 0
 000a93: 00                         |                                       unreachable
 000a94: 0b                         |                                     end
 000a95: 00                         |                                     unreachable
 000a96: 0b                         |                                   end
 000a97: 20 11                      |                                   local.get 17
 000a99: 0e 21 07 0c 0c 0c 0c 0c 0c |                                   br_table
 000aa2: 0c 0c 01 0c 03 04 01 01 01 | 
 000aab: 0c 04 0c 0c 0c 0c 08 05 06 | 
 000ab4: 0c 0c 02 0c 09 0c 0c 07 07 | 
 000abd: 0b                         |                                 end
 000abe: 20 0b                      |                                 local.get 11
 000ac0: 21 14                      |                                 local.set 20
 000ac2: 20 00                      |                                 local.get 0
 000ac4: 0d 0f                      |                                 br_if 15
 000ac6: 20 0a                      |                                 local.get 10
 000ac8: 45                         |                                 i32.eqz
 000ac9: 0d 0c                      |                                 br_if 12
 000acb: 41 01                      |                                 i32.const 1
 000acd: 21 01                      |                                 local.set 1
 000acf: 02 40                      |                                 block
 000ad1: 03 40                      |                                   loop
 000ad3: 20 04                      |                                     local.get 4
 000ad5: 20 01                      |                                     local.get 1
 000ad7: 41 02                      |                                     i32.const 2
 000ad9: 74                         |                                     i32.shl
 000ada: 6a                         |                                     i32.add
 000adb: 28 02 00                   |                                     i32.load 2 0
 000ade: 22 0d                      |                                     local.tee 13
 000ae0: 45                         |                                     i32.eqz
 000ae1: 0d 01                      |                                     br_if 1
 000ae3: 20 03                      |                                     local.get 3
 000ae5: 20 01                      |                                     local.get 1
 000ae7: 41 03                      |                                     i32.const 3
 000ae9: 74                         |                                     i32.shl
 000aea: 6a                         |                                     i32.add
 000aeb: 20 0d                      |                                     local.get 13
 000aed: 20 02                      |                                     local.get 2
 000aef: 20 06                      |                                     local.get 6
 000af1: 10 0f                      |                                     call 15
 000af3: 41 01                      |                                     i32.const 1
 000af5: 21 14                      |                                     local.set 20
 000af7: 20 01                      |                                     local.get 1
 000af9: 41 01                      |                                     i32.const 1
 000afb: 6a                         |                                     i32.add
 000afc: 22 01                      |                                     local.tee 1
 000afe: 41 0a                      |                                     i32.const 10
 000b00: 47                         |                                     i32.ne
 000b01: 0d 00                      |                                     br_if 0
 000b03: 0c 11                      |                                     br 17
 000b05: 00                         |                                     unreachable
 000b06: 0b                         |                                   end
 000b07: 00                         |                                   unreachable
 000b08: 0b                         |                                 end
 000b09: 41 01                      |                                 i32.const 1
 000b0b: 21 14                      |                                 local.set 20
 000b0d: 20 01                      |                                 local.get 1
 000b0f: 41 09                      |                                 i32.const 9
 000b11: 4b                         |                                 i32.gt_u
 000b12: 0d 0f                      |                                 br_if 15
 000b14: 41 7f                      |                                 i32.const 4294967295
 000b16: 21 14                      |                                 local.set 20
 000b18: 20 04                      |                                 local.get 4
 000b1a: 20 01                      |                                 local.get 1
 000b1c: 41 02                      |                                 i32.const 2
 000b1e: 74                         |                                 i32.shl
 000b1f: 6a                         |                                 i32.add
 000b20: 28 02 00                   |                                 i32.load 2 0
 000b23: 0d 0f                      |                                 br_if 15
 000b25: 02 40                      |                                 block
 000b27: 03 40                      |                                   loop
 000b29: 20 01                      |                                     local.get 1
 000b2b: 41 01                      |                                     i32.const 1
 000b2d: 6a                         |                                     i32.add
 000b2e: 22 01                      |                                     local.tee 1
 000b30: 41 0a                      |                                     i32.const 10
 000b32: 46                         |                                     i32.eq
 000b33: 0d 01                      |                                     br_if 1
 000b35: 20 04                      |                                     local.get 4
 000b37: 20 01                      |                                     local.get 1
 000b39: 41 02                      |                                     i32.const 2
 000b3b: 74                         |                                     i32.shl
 000b3c: 6a                         |                                     i32.add
 000b3d: 28 02 00                   |                                     i32.load 2 0
 000b40: 45                         |                                     i32.eqz
 000b41: 0d 00                      |                                     br_if 0
 000b43: 0b                         |                                   end
 000b44: 0b                         |                                 end
 000b45: 41 7f                      |                                 i32.const 4294967295
 000b47: 41 01                      |                                 i32.const 1
 000b49: 20 01                      |                                 local.get 1
 000b4b: 41 0a                      |                                 i32.const 10
 000b4d: 49                         |                                 i32.lt_u
 000b4e: 1b                         |                                 select
 000b4f: 21 14                      |                                 local.set 20
 000b51: 0c 0f                      |                                 br 15
 000b53: 0b                         |                               end
 000b54: 20 00                      |                               local.get 0
 000b56: 20 07                      |                               local.get 7
 000b58: 2b 03 40                   |                               f64.load 3 64
 000b5b: 20 12                      |                               local.get 18
 000b5d: 20 13                      |                               local.get 19
 000b5f: 20 0d                      |                               local.get 13
 000b61: 20 01                      |                               local.get 1
 000b63: 20 05                      |                               local.get 5
 000b65: 11 01 00                   |                               call_indirect 1 0
 000b68: 21 01                      |                               local.set 1
 000b6a: 0c 0c                      |                               br 12
 000b6c: 0b                         |                             end
 000b6d: 41 00                      |                             i32.const 0
 000b6f: 21 14                      |                             local.set 20
 000b71: 20 07                      |                             local.get 7
 000b73: 28 02 40                   |                             i32.load 2 64
 000b76: 22 01                      |                             local.tee 1
 000b78: 41 97 08                   |                             i32.const 1047
 000b7b: 20 01                      |                             local.get 1
 000b7d: 1b                         |                             select
 000b7e: 22 0c                      |                             local.tee 12
 000b80: 41 00                      |                             i32.const 0
 000b82: 20 13                      |                             local.get 19
 000b84: 10 1f                      |                             call 31
 000b86: 22 01                      |                             local.tee 1
 000b88: 20 0c                      |                             local.get 12
 000b8a: 20 13                      |                             local.get 19
 000b8c: 6a                         |                             i32.add
 000b8d: 20 01                      |                             local.get 1
 000b8f: 1b                         |                             select
 000b90: 21 0e                      |                             local.set 14
 000b92: 20 15                      |                             local.get 21
 000b94: 21 0d                      |                             local.set 13
 000b96: 20 01                      |                             local.get 1
 000b98: 20 0c                      |                             local.get 12
 000b9a: 6b                         |                             i32.sub
 000b9b: 20 13                      |                             local.get 19
 000b9d: 20 01                      |                             local.get 1
 000b9f: 1b                         |                             select
 000ba0: 21 13                      |                             local.set 19
 000ba2: 0c 09                      |                             br 9
 000ba4: 0b                         |                           end
 000ba5: 20 07                      |                           local.get 7
 000ba7: 20 07                      |                           local.get 7
 000ba9: 29 03 40                   |                           i64.load 3 64
 000bac: 3c 00 37                   |                           i64.store8 0 55
 000baf: 41 01                      |                           i32.const 1
 000bb1: 21 13                      |                           local.set 19
 000bb3: 20 08                      |                           local.get 8
 000bb5: 21 0c                      |                           local.set 12
 000bb7: 20 09                      |                           local.get 9
 000bb9: 21 0e                      |                           local.set 14
 000bbb: 20 15                      |                           local.get 21
 000bbd: 21 0d                      |                           local.set 13
 000bbf: 0c 08                      |                           br 8
 000bc1: 0b                         |                         end
 000bc2: 02 40                      |                         block
 000bc4: 20 07                      |                           local.get 7
 000bc6: 29 03 40                   |                           i64.load 3 64
 000bc9: 22 16                      |                           local.tee 22
 000bcb: 42 7f                      |                           i64.const -1
 000bcd: 55                         |                           i64.gt_s
 000bce: 0d 00                      |                           br_if 0
 000bd0: 20 07                      |                           local.get 7
 000bd2: 42 00                      |                           i64.const 0
 000bd4: 20 16                      |                           local.get 22
 000bd6: 7d                         |                           i64.sub
 000bd7: 22 16                      |                           local.tee 22
 000bd9: 37 03 40                   |                           i64.store 3 64
 000bdc: 41 01                      |                           i32.const 1
 000bde: 21 14                      |                           local.set 20
 000be0: 41 8d 08                   |                           i32.const 1037
 000be3: 21 10                      |                           local.set 16
 000be5: 0c 06                      |                           br 6
 000be7: 0b                         |                         end
 000be8: 02 40                      |                         block
 000bea: 20 0d                      |                           local.get 13
 000bec: 41 80 10                   |                           i32.const 2048
 000bef: 71                         |                           i32.and
 000bf0: 45                         |                           i32.eqz
 000bf1: 0d 00                      |                           br_if 0
 000bf3: 41 01                      |                           i32.const 1
 000bf5: 21 14                      |                           local.set 20
 000bf7: 41 8e 08                   |                           i32.const 1038
 000bfa: 21 10                      |                           local.set 16
 000bfc: 0c 06                      |                           br 6
 000bfe: 0b                         |                         end
 000bff: 41 8f 08                   |                         i32.const 1039
 000c02: 41 8d 08                   |                         i32.const 1037
 000c05: 20 0d                      |                         local.get 13
 000c07: 41 01                      |                         i32.const 1
 000c09: 71                         |                         i32.and
 000c0a: 22 14                      |                         local.tee 20
 000c0c: 1b                         |                         select
 000c0d: 21 10                      |                         local.set 16
 000c0f: 0c 05                      |                         br 5
 000c11: 0b                         |                       end
 000c12: 20 07                      |                       local.get 7
 000c14: 29 03 40                   |                       i64.load 3 64
 000c17: 20 09                      |                       local.get 9
 000c19: 10 11                      |                       call 17
 000c1b: 21 0c                      |                       local.set 12
 000c1d: 41 00                      |                       i32.const 0
 000c1f: 21 14                      |                       local.set 20
 000c21: 41 8d 08                   |                       i32.const 1037
 000c24: 21 10                      |                       local.set 16
 000c26: 20 0d                      |                       local.get 13
 000c28: 41 08                      |                       i32.const 8
 000c2a: 71                         |                       i32.and
 000c2b: 45                         |                       i32.eqz
 000c2c: 0d 05                      |                       br_if 5
 000c2e: 20 13                      |                       local.get 19
 000c30: 20 09                      |                       local.get 9
 000c32: 20 0c                      |                       local.get 12
 000c34: 6b                         |                       i32.sub
 000c35: 22 01                      |                       local.tee 1
 000c37: 41 01                      |                       i32.const 1
 000c39: 6a                         |                       i32.add
 000c3a: 20 13                      |                       local.get 19
 000c3c: 20 01                      |                       local.get 1
 000c3e: 4a                         |                       i32.gt_s
 000c3f: 1b                         |                       select
 000c40: 21 13                      |                       local.set 19
 000c42: 0c 05                      |                       br 5
 000c44: 0b                         |                     end
 000c45: 20 13                      |                     local.get 19
 000c47: 41 08                      |                     i32.const 8
 000c49: 20 13                      |                     local.get 19
 000c4b: 41 08                      |                     i32.const 8
 000c4d: 4b                         |                     i32.gt_u
 000c4e: 1b                         |                     select
 000c4f: 21 13                      |                     local.set 19
 000c51: 20 0d                      |                     local.get 13
 000c53: 41 08                      |                     i32.const 8
 000c55: 72                         |                     i32.or
 000c56: 21 0d                      |                     local.set 13
 000c58: 41 f8 00                   |                     i32.const 120
 000c5b: 21 01                      |                     local.set 1
 000c5d: 0b                         |                   end
 000c5e: 20 07                      |                   local.get 7
 000c60: 29 03 40                   |                   i64.load 3 64
 000c63: 20 09                      |                   local.get 9
 000c65: 20 01                      |                   local.get 1
 000c67: 41 20                      |                   i32.const 32
 000c69: 71                         |                   i32.and
 000c6a: 10 12                      |                   call 18
 000c6c: 21 0c                      |                   local.set 12
 000c6e: 41 00                      |                   i32.const 0
 000c70: 21 14                      |                   local.set 20
 000c72: 41 8d 08                   |                   i32.const 1037
 000c75: 21 10                      |                   local.set 16
 000c77: 20 0d                      |                   local.get 13
 000c79: 41 08                      |                   i32.const 8
 000c7b: 71                         |                   i32.and
 000c7c: 45                         |                   i32.eqz
 000c7d: 0d 03                      |                   br_if 3
 000c7f: 20 07                      |                   local.get 7
 000c81: 29 03 40                   |                   i64.load 3 64
 000c84: 50                         |                   i64.eqz
 000c85: 0d 03                      |                   br_if 3
 000c87: 20 01                      |                   local.get 1
 000c89: 41 04                      |                   i32.const 4
 000c8b: 76                         |                   i32.shr_u
 000c8c: 41 8d 08                   |                   i32.const 1037
 000c8f: 6a                         |                   i32.add
 000c90: 21 10                      |                   local.set 16
 000c92: 41 02                      |                   i32.const 2
 000c94: 21 14                      |                   local.set 20
 000c96: 0c 03                      |                   br 3
 000c98: 0b                         |                 end
 000c99: 41 00                      |                 i32.const 0
 000c9b: 21 01                      |                 local.set 1
 000c9d: 20 0f                      |                 local.get 15
 000c9f: 41 ff 01                   |                 i32.const 255
 000ca2: 71                         |                 i32.and
 000ca3: 22 0d                      |                 local.tee 13
 000ca5: 41 07                      |                 i32.const 7
 000ca7: 4b                         |                 i32.gt_u
 000ca8: 0d 05                      |                 br_if 5
 000caa: 02 40                      |                 block
 000cac: 02 40                      |                   block
 000cae: 02 40                      |                     block
 000cb0: 02 40                      |                       block
 000cb2: 02 40                      |                         block
 000cb4: 02 40                      |                           block
 000cb6: 02 40                      |                             block
 000cb8: 20 0d                      |                               local.get 13
 000cba: 0e 08 00 01 02 03 04 0c 05 |                               br_table
 000cc3: 06 00                      | 
 000cc5: 0b                         |                             end
 000cc6: 20 07                      |                             local.get 7
 000cc8: 28 02 40                   |                             i32.load 2 64
 000ccb: 20 0b                      |                             local.get 11
 000ccd: 36 02 00                   |                             i32.store 2 0
 000cd0: 0c 0b                      |                             br 11
 000cd2: 0b                         |                           end
 000cd3: 20 07                      |                           local.get 7
 000cd5: 28 02 40                   |                           i32.load 2 64
 000cd8: 20 0b                      |                           local.get 11
 000cda: 36 02 00                   |                           i32.store 2 0
 000cdd: 0c 0a                      |                           br 10
 000cdf: 0b                         |                         end
 000ce0: 20 07                      |                         local.get 7
 000ce2: 28 02 40                   |                         i32.load 2 64
 000ce5: 20 0b                      |                         local.get 11
 000ce7: ac                         |                         i64.extend_i32_s
 000ce8: 37 03 00                   |                         i64.store 3 0
 000ceb: 0c 09                      |                         br 9
 000ced: 0b                         |                       end
 000cee: 20 07                      |                       local.get 7
 000cf0: 28 02 40                   |                       i32.load 2 64
 000cf3: 20 0b                      |                       local.get 11
 000cf5: 3b 01 00                   |                       i32.store16 1 0
 000cf8: 0c 08                      |                       br 8
 000cfa: 0b                         |                     end
 000cfb: 20 07                      |                     local.get 7
 000cfd: 28 02 40                   |                     i32.load 2 64
 000d00: 20 0b                      |                     local.get 11
 000d02: 3a 00 00                   |                     i32.store8 0 0
 000d05: 0c 07                      |                     br 7
 000d07: 0b                         |                   end
 000d08: 20 07                      |                   local.get 7
 000d0a: 28 02 40                   |                   i32.load 2 64
 000d0d: 20 0b                      |                   local.get 11
 000d0f: 36 02 00                   |                   i32.store 2 0
 000d12: 0c 06                      |                   br 6
 000d14: 0b                         |                 end
 000d15: 20 07                      |                 local.get 7
 000d17: 28 02 40                   |                 i32.load 2 64
 000d1a: 20 0b                      |                 local.get 11
 000d1c: ac                         |                 i64.extend_i32_s
 000d1d: 37 03 00                   |                 i64.store 3 0
 000d20: 0c 05                      |                 br 5
 000d22: 0b                         |               end
 000d23: 41 00                      |               i32.const 0
 000d25: 21 14                      |               local.set 20
 000d27: 41 8d 08                   |               i32.const 1037
 000d2a: 21 10                      |               local.set 16
 000d2c: 20 07                      |               local.get 7
 000d2e: 29 03 40                   |               i64.load 3 64
 000d31: 21 16                      |               local.set 22
 000d33: 0b                         |             end
 000d34: 20 16                      |             local.get 22
 000d36: 20 09                      |             local.get 9
 000d38: 10 13                      |             call 19
 000d3a: 21 0c                      |             local.set 12
 000d3c: 0b                         |           end
 000d3d: 20 0d                      |           local.get 13
 000d3f: 41 ff ff 7b                |           i32.const 4294901759
 000d43: 71                         |           i32.and
 000d44: 20 0d                      |           local.get 13
 000d46: 20 13                      |           local.get 19
 000d48: 41 7f                      |           i32.const 4294967295
 000d4a: 4a                         |           i32.gt_s
 000d4b: 1b                         |           select
 000d4c: 21 0d                      |           local.set 13
 000d4e: 20 07                      |           local.get 7
 000d50: 29 03 40                   |           i64.load 3 64
 000d53: 21 16                      |           local.set 22
 000d55: 02 40                      |           block
 000d57: 02 40                      |             block
 000d59: 20 13                      |               local.get 19
 000d5b: 0d 00                      |               br_if 0
 000d5d: 20 16                      |               local.get 22
 000d5f: 50                         |               i64.eqz
 000d60: 45                         |               i32.eqz
 000d61: 0d 00                      |               br_if 0
 000d63: 41 00                      |               i32.const 0
 000d65: 21 13                      |               local.set 19
 000d67: 20 09                      |               local.get 9
 000d69: 21 0c                      |               local.set 12
 000d6b: 0c 01                      |               br 1
 000d6d: 0b                         |             end
 000d6e: 20 13                      |             local.get 19
 000d70: 20 09                      |             local.get 9
 000d72: 20 0c                      |             local.get 12
 000d74: 6b                         |             i32.sub
 000d75: 20 16                      |             local.get 22
 000d77: 50                         |             i64.eqz
 000d78: 6a                         |             i32.add
 000d79: 22 01                      |             local.tee 1
 000d7b: 20 13                      |             local.get 19
 000d7d: 20 01                      |             local.get 1
 000d7f: 4a                         |             i32.gt_s
 000d80: 1b                         |             select
 000d81: 21 13                      |             local.set 19
 000d83: 0b                         |           end
 000d84: 20 09                      |           local.get 9
 000d86: 21 0e                      |           local.set 14
 000d88: 0b                         |         end
 000d89: 20 00                      |         local.get 0
 000d8b: 41 20                      |         i32.const 32
 000d8d: 20 14                      |         local.get 20
 000d8f: 20 0e                      |         local.get 14
 000d91: 20 0c                      |         local.get 12
 000d93: 6b                         |         i32.sub
 000d94: 22 0f                      |         local.tee 15
 000d96: 20 13                      |         local.get 19
 000d98: 20 13                      |         local.get 19
 000d9a: 20 0f                      |         local.get 15
 000d9c: 48                         |         i32.lt_s
 000d9d: 1b                         |         select
 000d9e: 22 11                      |         local.tee 17
 000da0: 6a                         |         i32.add
 000da1: 22 0e                      |         local.tee 14
 000da3: 20 12                      |         local.get 18
 000da5: 20 12                      |         local.get 18
 000da7: 20 0e                      |         local.get 14
 000da9: 48                         |         i32.lt_s
 000daa: 1b                         |         select
 000dab: 22 01                      |         local.tee 1
 000dad: 20 0e                      |         local.get 14
 000daf: 20 0d                      |         local.get 13
 000db1: 10 10                      |         call 16
 000db3: 20 00                      |         local.get 0
 000db5: 20 10                      |         local.get 16
 000db7: 20 14                      |         local.get 20
 000db9: 10 0d                      |         call 13
 000dbb: 20 00                      |         local.get 0
 000dbd: 41 30                      |         i32.const 48
 000dbf: 20 01                      |         local.get 1
 000dc1: 20 0e                      |         local.get 14
 000dc3: 20 0d                      |         local.get 13
 000dc5: 41 80 80 04                |         i32.const 65536
 000dc9: 73                         |         i32.xor
 000dca: 10 10                      |         call 16
 000dcc: 20 00                      |         local.get 0
 000dce: 41 30                      |         i32.const 48
 000dd0: 20 11                      |         local.get 17
 000dd2: 20 0f                      |         local.get 15
 000dd4: 41 00                      |         i32.const 0
 000dd6: 10 10                      |         call 16
 000dd8: 20 00                      |         local.get 0
 000dda: 20 0c                      |         local.get 12
 000ddc: 20 0f                      |         local.get 15
 000dde: 10 0d                      |         call 13
 000de0: 20 00                      |         local.get 0
 000de2: 41 20                      |         i32.const 32
 000de4: 20 01                      |         local.get 1
 000de6: 20 0e                      |         local.get 14
 000de8: 20 0d                      |         local.get 13
 000dea: 41 80 c0 00                |         i32.const 8192
 000dee: 73                         |         i32.xor
 000def: 10 10                      |         call 16
 000df1: 0c 01                      |         br 1
 000df3: 0b                         |       end
 000df4: 0b                         |     end
 000df5: 41 00                      |     i32.const 0
 000df7: 21 14                      |     local.set 20
 000df9: 0c 01                      |     br 1
 000dfb: 0b                         |   end
 000dfc: 41 7f                      |   i32.const 4294967295
 000dfe: 21 14                      |   local.set 20
 000e00: 0b                         | end
 000e01: 20 07                      | local.get 7
 000e03: 41 d0 00                   | i32.const 80
 000e06: 6a                         | i32.add
 000e07: 24 00                      | global.set 0
 000e09: 20 14                      | local.get 20
 000e0b: 0b                         | end
000e0d func[13]:
 000e0e: 02 40                      | block
 000e10: 20 00                      |   local.get 0
 000e12: 2d 00 00                   |   i32.load8_u 0 0
 000e15: 41 20                      |   i32.const 32
 000e17: 71                         |   i32.and
 000e18: 0d 00                      |   br_if 0
 000e1a: 20 01                      |   local.get 1
 000e1c: 20 02                      |   local.get 2
 000e1e: 20 00                      |   local.get 0
 000e20: 10 1b                      |   call 27
 000e22: 1a                         |   drop
 000e23: 0b                         | end
 000e24: 0b                         | end
000e26 func[14]:
 000e27: 03 7f                      | local[0..2] type=i32
 000e29: 41 00                      | i32.const 0
 000e2b: 21 01                      | local.set 1
 000e2d: 02 40                      | block
 000e2f: 20 00                      |   local.get 0
 000e31: 28 02 00                   |   i32.load 2 0
 000e34: 2c 00 00                   |   i32.load8_s 0 0
 000e37: 10 21                      |   call 33
 000e39: 45                         |   i32.eqz
 000e3a: 0d 00                      |   br_if 0
 000e3c: 03 40                      |   loop
 000e3e: 20 00                      |     local.get 0
 000e40: 28 02 00                   |     i32.load 2 0
 000e43: 22 02                      |     local.tee 2
 000e45: 2c 00 00                   |     i32.load8_s 0 0
 000e48: 21 03                      |     local.set 3
 000e4a: 20 00                      |     local.get 0
 000e4c: 20 02                      |     local.get 2
 000e4e: 41 01                      |     i32.const 1
 000e50: 6a                         |     i32.add
 000e51: 36 02 00                   |     i32.store 2 0
 000e54: 20 03                      |     local.get 3
 000e56: 20 01                      |     local.get 1
 000e58: 41 0a                      |     i32.const 10
 000e5a: 6c                         |     i32.mul
 000e5b: 6a                         |     i32.add
 000e5c: 41 50                      |     i32.const 4294967248
 000e5e: 6a                         |     i32.add
 000e5f: 21 01                      |     local.set 1
 000e61: 20 02                      |     local.get 2
 000e63: 2c 00 01                   |     i32.load8_s 0 1
 000e66: 10 21                      |     call 33
 000e68: 0d 00                      |     br_if 0
 000e6a: 0b                         |   end
 000e6b: 0b                         | end
 000e6c: 20 01                      | local.get 1
 000e6e: 0b                         | end
000e71 func[15]:
 000e72: 02 40                      | block
 000e74: 20 01                      |   local.get 1
 000e76: 41 14                      |   i32.const 20
 000e78: 4b                         |   i32.gt_u
 000e79: 0d 00                      |   br_if 0
 000e7b: 20 01                      |   local.get 1
 000e7d: 41 77                      |   i32.const 4294967287
 000e7f: 6a                         |   i32.add
 000e80: 22 01                      |   local.tee 1
 000e82: 41 09                      |   i32.const 9
 000e84: 4b                         |   i32.gt_u
 000e85: 0d 00                      |   br_if 0
 000e87: 02 40                      |   block
 000e89: 02 40                      |     block
 000e8b: 02 40                      |       block
 000e8d: 02 40                      |         block
 000e8f: 02 40                      |           block
 000e91: 02 40                      |             block
 000e93: 02 40                      |               block
 000e95: 02 40                      |                 block
 000e97: 02 40                      |                   block
 000e99: 02 40                      |                     block
 000e9b: 20 01                      |                       local.get 1
 000e9d: 0e 0a 00 01 02 03 04 05 06 |                       br_table
 000ea6: 07 08 09 00                | 
 000eaa: 0b                         |                     end
 000eab: 20 02                      |                     local.get 2
 000ead: 20 02                      |                     local.get 2
 000eaf: 28 02 00                   |                     i32.load 2 0
 000eb2: 22 01                      |                     local.tee 1
 000eb4: 41 04                      |                     i32.const 4
 000eb6: 6a                         |                     i32.add
 000eb7: 36 02 00                   |                     i32.store 2 0
 000eba: 20 00                      |                     local.get 0
 000ebc: 20 01                      |                     local.get 1
 000ebe: 28 02 00                   |                     i32.load 2 0
 000ec1: 36 02 00                   |                     i32.store 2 0
 000ec4: 0f                         |                     return
 000ec5: 0b                         |                   end
 000ec6: 20 02                      |                   local.get 2
 000ec8: 20 02                      |                   local.get 2
 000eca: 28 02 00                   |                   i32.load 2 0
 000ecd: 22 01                      |                   local.tee 1
 000ecf: 41 04                      |                   i32.const 4
 000ed1: 6a                         |                   i32.add
 000ed2: 36 02 00                   |                   i32.store 2 0
 000ed5: 20 00                      |                   local.get 0
 000ed7: 20 01                      |                   local.get 1
 000ed9: 34 02 00                   |                   i64.load32_s 2 0
 000edc: 37 03 00                   |                   i64.store 3 0
 000edf: 0f                         |                   return
 000ee0: 0b                         |                 end
 000ee1: 20 02                      |                 local.get 2
 000ee3: 20 02                      |                 local.get 2
 000ee5: 28 02 00                   |                 i32.load 2 0
 000ee8: 22 01                      |                 local.tee 1
 000eea: 41 04                      |                 i32.const 4
 000eec: 6a                         |                 i32.add
 000eed: 36 02 00                   |                 i32.store 2 0
 000ef0: 20 00                      |                 local.get 0
 000ef2: 20 01                      |                 local.get 1
 000ef4: 35 02 00                   |                 i64.load32_u 2 0
 000ef7: 37 03 00                   |                 i64.store 3 0
 000efa: 0f                         |                 return
 000efb: 0b                         |               end
 000efc: 20 02                      |               local.get 2
 000efe: 20 02                      |               local.get 2
 000f00: 28 02 00                   |               i32.load 2 0
 000f03: 41 07                      |               i32.const 7
 000f05: 6a                         |               i32.add
 000f06: 41 78                      |               i32.const 4294967288
 000f08: 71                         |               i32.and
 000f09: 22 01                      |               local.tee 1
 000f0b: 41 08                      |               i32.const 8
 000f0d: 6a                         |               i32.add
 000f0e: 36 02 00                   |               i32.store 2 0
 000f11: 20 00                      |               local.get 0
 000f13: 20 01                      |               local.get 1
 000f15: 29 03 00                   |               i64.load 3 0
 000f18: 37 03 00                   |               i64.store 3 0
 000f1b: 0f                         |               return
 000f1c: 0b                         |             end
 000f1d: 20 02                      |             local.get 2
 000f1f: 20 02                      |             local.get 2
 000f21: 28 02 00                   |             i32.load 2 0
 000f24: 22 01                      |             local.tee 1
 000f26: 41 04                      |             i32.const 4
 000f28: 6a                         |             i32.add
 000f29: 36 02 00                   |             i32.store 2 0
 000f2c: 20 00                      |             local.get 0
 000f2e: 20 01                      |             local.get 1
 000f30: 32 01 00                   |             i64.load16_s 1 0
 000f33: 37 03 00                   |             i64.store 3 0
 000f36: 0f                         |             return
 000f37: 0b                         |           end
 000f38: 20 02                      |           local.get 2
 000f3a: 20 02                      |           local.get 2
 000f3c: 28 02 00                   |           i32.load 2 0
 000f3f: 22 01                      |           local.tee 1
 000f41: 41 04                      |           i32.const 4
 000f43: 6a                         |           i32.add
 000f44: 36 02 00                   |           i32.store 2 0
 000f47: 20 00                      |           local.get 0
 000f49: 20 01                      |           local.get 1
 000f4b: 33 01 00                   |           i64.load16_u 1 0
 000f4e: 37 03 00                   |           i64.store 3 0
 000f51: 0f                         |           return
 000f52: 0b                         |         end
 000f53: 20 02                      |         local.get 2
 000f55: 20 02                      |         local.get 2
 000f57: 28 02 00                   |         i32.load 2 0
 000f5a: 22 01                      |         local.tee 1
 000f5c: 41 04                      |         i32.const 4
 000f5e: 6a                         |         i32.add
 000f5f: 36 02 00                   |         i32.store 2 0
 000f62: 20 00                      |         local.get 0
 000f64: 20 01                      |         local.get 1
 000f66: 30 00 00                   |         i64.load8_s 0 0
 000f69: 37 03 00                   |         i64.store 3 0
 000f6c: 0f                         |         return
 000f6d: 0b                         |       end
 000f6e: 20 02                      |       local.get 2
 000f70: 20 02                      |       local.get 2
 000f72: 28 02 00                   |       i32.load 2 0
 000f75: 22 01                      |       local.tee 1
 000f77: 41 04                      |       i32.const 4
 000f79: 6a                         |       i32.add
 000f7a: 36 02 00                   |       i32.store 2 0
 000f7d: 20 00                      |       local.get 0
 000f7f: 20 01                      |       local.get 1
 000f81: 31 00 00                   |       i64.load8_u 0 0
 000f84: 37 03 00                   |       i64.store 3 0
 000f87: 0f                         |       return
 000f88: 0b                         |     end
 000f89: 20 02                      |     local.get 2
 000f8b: 20 02                      |     local.get 2
 000f8d: 28 02 00                   |     i32.load 2 0
 000f90: 41 07                      |     i32.const 7
 000f92: 6a                         |     i32.add
 000f93: 41 78                      |     i32.const 4294967288
 000f95: 71                         |     i32.and
 000f96: 22 01                      |     local.tee 1
 000f98: 41 08                      |     i32.const 8
 000f9a: 6a                         |     i32.add
 000f9b: 36 02 00                   |     i32.store 2 0
 000f9e: 20 00                      |     local.get 0
 000fa0: 20 01                      |     local.get 1
 000fa2: 29 03 00                   |     i64.load 3 0
 000fa5: 37 03 00                   |     i64.store 3 0
 000fa8: 0f                         |     return
 000fa9: 0b                         |   end
 000faa: 20 00                      |   local.get 0
 000fac: 20 02                      |   local.get 2
 000fae: 20 03                      |   local.get 3
 000fb0: 11 02 00                   |   call_indirect 2 0
 000fb3: 0b                         | end
 000fb4: 0b                         | end
000fb6 func[16]:
 000fb7: 02 7f                      | local[0..1] type=i32
 000fb9: 23 00                      | global.get 0
 000fbb: 41 80 02                   | i32.const 256
 000fbe: 6b                         | i32.sub
 000fbf: 22 05                      | local.tee 5
 000fc1: 24 00                      | global.set 0
 000fc3: 02 40                      | block
 000fc5: 20 02                      |   local.get 2
 000fc7: 20 03                      |   local.get 3
 000fc9: 4c                         |   i32.le_s
 000fca: 0d 00                      |   br_if 0
 000fcc: 20 04                      |   local.get 4
 000fce: 41 80 c0 04                |   i32.const 73728
 000fd2: 71                         |   i32.and
 000fd3: 0d 00                      |   br_if 0
 000fd5: 20 05                      |   local.get 5
 000fd7: 20 01                      |   local.get 1
 000fd9: 20 02                      |   local.get 2
 000fdb: 20 03                      |   local.get 3
 000fdd: 6b                         |   i32.sub
 000fde: 22 04                      |   local.tee 4
 000fe0: 41 80 02                   |   i32.const 256
 000fe3: 20 04                      |   local.get 4
 000fe5: 41 80 02                   |   i32.const 256
 000fe8: 49                         |   i32.lt_u
 000fe9: 22 06                      |   local.tee 6
 000feb: 1b                         |   select
 000fec: 10 2c                      |   call 44
 000fee: 1a                         |   drop
 000fef: 02 40                      |   block
 000ff1: 20 06                      |     local.get 6
 000ff3: 0d 00                      |     br_if 0
 000ff5: 20 02                      |     local.get 2
 000ff7: 20 03                      |     local.get 3
 000ff9: 6b                         |     i32.sub
 000ffa: 21 02                      |     local.set 2
 000ffc: 03 40                      |     loop
 000ffe: 20 00                      |       local.get 0
 001000: 20 05                      |       local.get 5
 001002: 41 80 02                   |       i32.const 256
 001005: 10 0d                      |       call 13
 001007: 20 04                      |       local.get 4
 001009: 41 80 7e                   |       i32.const 4294967040
 00100c: 6a                         |       i32.add
 00100d: 22 04                      |       local.tee 4
 00100f: 41 ff 01                   |       i32.const 255
 001012: 4b                         |       i32.gt_u
 001013: 0d 00                      |       br_if 0
 001015: 0b                         |     end
 001016: 20 02                      |     local.get 2
 001018: 41 ff 01                   |     i32.const 255
 00101b: 71                         |     i32.and
 00101c: 21 04                      |     local.set 4
 00101e: 0b                         |   end
 00101f: 20 00                      |   local.get 0
 001021: 20 05                      |   local.get 5
 001023: 20 04                      |   local.get 4
 001025: 10 0d                      |   call 13
 001027: 0b                         | end
 001028: 20 05                      | local.get 5
 00102a: 41 80 02                   | i32.const 256
 00102d: 6a                         | i32.add
 00102e: 24 00                      | global.set 0
 001030: 0b                         | end
001032 func[17]:
 001033: 02 40                      | block
 001035: 20 00                      |   local.get 0
 001037: 50                         |   i64.eqz
 001038: 0d 00                      |   br_if 0
 00103a: 03 40                      |   loop
 00103c: 20 01                      |     local.get 1
 00103e: 41 7f                      |     i32.const 4294967295
 001040: 6a                         |     i32.add
 001041: 22 01                      |     local.tee 1
 001043: 20 00                      |     local.get 0
 001045: a7                         |     i32.wrap_i64
 001046: 41 07                      |     i32.const 7
 001048: 71                         |     i32.and
 001049: 41 30                      |     i32.const 48
 00104b: 72                         |     i32.or
 00104c: 3a 00 00                   |     i32.store8 0 0
 00104f: 20 00                      |     local.get 0
 001051: 42 03                      |     i64.const 3
 001053: 88                         |     i64.shr_u
 001054: 22 00                      |     local.tee 0
 001056: 42 00                      |     i64.const 0
 001058: 52                         |     i64.ne
 001059: 0d 00                      |     br_if 0
 00105b: 0b                         |   end
 00105c: 0b                         | end
 00105d: 20 01                      | local.get 1
 00105f: 0b                         | end
001061 func[18]:
 001062: 02 40                      | block
 001064: 20 00                      |   local.get 0
 001066: 50                         |   i64.eqz
 001067: 0d 00                      |   br_if 0
 001069: 03 40                      |   loop
 00106b: 20 01                      |     local.get 1
 00106d: 41 7f                      |     i32.const 4294967295
 00106f: 6a                         |     i32.add
 001070: 22 01                      |     local.tee 1
 001072: 20 00                      |     local.get 0
 001074: a7                         |     i32.wrap_i64
 001075: 41 0f                      |     i32.const 15
 001077: 71                         |     i32.and
 001078: 41 f0 0b                   |     i32.const 1520
 00107b: 6a                         |     i32.add
 00107c: 2d 00 00                   |     i32.load8_u 0 0
 00107f: 20 02                      |     local.get 2
 001081: 72                         |     i32.or
 001082: 3a 00 00                   |     i32.store8 0 0
 001085: 20 00                      |     local.get 0
 001087: 42 04                      |     i64.const 4
 001089: 88                         |     i64.shr_u
 00108a: 22 00                      |     local.tee 0
 00108c: 42 00                      |     i64.const 0
 00108e: 52                         |     i64.ne
 00108f: 0d 00                      |     br_if 0
 001091: 0b                         |   end
 001092: 0b                         | end
 001093: 20 01                      | local.get 1
 001095: 0b                         | end
001098 func[19]:
 001099: 03 7f                      | local[0..2] type=i32
 00109b: 01 7e                      | local[3] type=i64
 00109d: 02 40                      | block
 00109f: 02 40                      |   block
 0010a1: 20 00                      |     local.get 0
 0010a3: 42 80 80 80 80 10          |     i64.const 4294967296
 0010a9: 5a                         |     i64.ge_u
 0010aa: 0d 00                      |     br_if 0
 0010ac: 20 00                      |     local.get 0
 0010ae: 21 05                      |     local.set 5
 0010b0: 0c 01                      |     br 1
 0010b2: 0b                         |   end
 0010b3: 03 40                      |   loop
 0010b5: 20 01                      |     local.get 1
 0010b7: 41 7f                      |     i32.const 4294967295
 0010b9: 6a                         |     i32.add
 0010ba: 22 01                      |     local.tee 1
 0010bc: 20 00                      |     local.get 0
 0010be: 20 00                      |     local.get 0
 0010c0: 42 0a                      |     i64.const 10
 0010c2: 80                         |     i64.div_u
 0010c3: 22 05                      |     local.tee 5
 0010c5: 42 0a                      |     i64.const 10
 0010c7: 7e                         |     i64.mul
 0010c8: 7d                         |     i64.sub
 0010c9: a7                         |     i32.wrap_i64
 0010ca: 41 30                      |     i32.const 48
 0010cc: 72                         |     i32.or
 0010cd: 3a 00 00                   |     i32.store8 0 0
 0010d0: 20 00                      |     local.get 0
 0010d2: 42 ff ff ff ff 9f 01       |     i64.const 42949672959
 0010d9: 56                         |     i64.gt_u
 0010da: 21 02                      |     local.set 2
 0010dc: 20 05                      |     local.get 5
 0010de: 21 00                      |     local.set 0
 0010e0: 20 02                      |     local.get 2
 0010e2: 0d 00                      |     br_if 0
 0010e4: 0b                         |   end
 0010e5: 0b                         | end
 0010e6: 02 40                      | block
 0010e8: 20 05                      |   local.get 5
 0010ea: a7                         |   i32.wrap_i64
 0010eb: 22 02                      |   local.tee 2
 0010ed: 45                         |   i32.eqz
 0010ee: 0d 00                      |   br_if 0
 0010f0: 03 40                      |   loop
 0010f2: 20 01                      |     local.get 1
 0010f4: 41 7f                      |     i32.const 4294967295
 0010f6: 6a                         |     i32.add
 0010f7: 22 01                      |     local.tee 1
 0010f9: 20 02                      |     local.get 2
 0010fb: 20 02                      |     local.get 2
 0010fd: 41 0a                      |     i32.const 10
 0010ff: 6e                         |     i32.div_u
 001100: 22 03                      |     local.tee 3
 001102: 41 0a                      |     i32.const 10
 001104: 6c                         |     i32.mul
 001105: 6b                         |     i32.sub
 001106: 41 30                      |     i32.const 48
 001108: 72                         |     i32.or
 001109: 3a 00 00                   |     i32.store8 0 0
 00110c: 20 02                      |     local.get 2
 00110e: 41 09                      |     i32.const 9
 001110: 4b                         |     i32.gt_u
 001111: 21 04                      |     local.set 4
 001113: 20 03                      |     local.get 3
 001115: 21 02                      |     local.set 2
 001117: 20 04                      |     local.get 4
 001119: 0d 00                      |     br_if 0
 00111b: 0b                         |   end
 00111c: 0b                         | end
 00111d: 20 01                      | local.get 1
 00111f: 0b                         | end
001121 func[20]:
 001122: 20 00                      | local.get 0
 001124: 20 01                      | local.get 1
 001126: 20 02                      | local.get 2
 001128: 41 03                      | i32.const 3
 00112a: 41 04                      | i32.const 4
 00112c: 10 0b                      | call 11
 00112e: 0b                         | end
001131 func[21]:
 001132: 10 7f                      | local[0..15] type=i32
 001134: 02 7e                      | local[16..17] type=i64
 001136: 01 7c                      | local[18] type=f64
 001138: 23 00                      | global.get 0
 00113a: 41 b0 04                   | i32.const 560
 00113d: 6b                         | i32.sub
 00113e: 22 06                      | local.tee 6
 001140: 24 00                      | global.set 0
 001142: 20 06                      | local.get 6
 001144: 41 00                      | i32.const 0
 001146: 36 02 2c                   | i32.store 2 44
 001149: 02 40                      | block
 00114b: 02 40                      |   block
 00114d: 20 01                      |     local.get 1
 00114f: 10 17                      |     call 23
 001151: 22 16                      |     local.tee 22
 001153: 42 7f                      |     i64.const -1
 001155: 55                         |     i64.gt_s
 001156: 0d 00                      |     br_if 0
 001158: 20 01                      |     local.get 1
 00115a: 9a                         |     f64.neg
 00115b: 22 01                      |     local.tee 1
 00115d: 10 17                      |     call 23
 00115f: 21 16                      |     local.set 22
 001161: 41 01                      |     i32.const 1
 001163: 21 07                      |     local.set 7
 001165: 41 80 0c                   |     i32.const 1536
 001168: 21 08                      |     local.set 8
 00116a: 0c 01                      |     br 1
 00116c: 0b                         |   end
 00116d: 02 40                      |   block
 00116f: 20 04                      |     local.get 4
 001171: 41 80 10                   |     i32.const 2048
 001174: 71                         |     i32.and
 001175: 45                         |     i32.eqz
 001176: 0d 00                      |     br_if 0
 001178: 41 01                      |     i32.const 1
 00117a: 21 07                      |     local.set 7
 00117c: 41 83 0c                   |     i32.const 1539
 00117f: 21 08                      |     local.set 8
 001181: 0c 01                      |     br 1
 001183: 0b                         |   end
 001184: 41 86 0c                   |   i32.const 1542
 001187: 41 81 0c                   |   i32.const 1537
 00118a: 20 04                      |   local.get 4
 00118c: 41 01                      |   i32.const 1
 00118e: 71                         |   i32.and
 00118f: 22 07                      |   local.tee 7
 001191: 1b                         |   select
 001192: 21 08                      |   local.set 8
 001194: 0b                         | end
 001195: 02 40                      | block
 001197: 02 40                      |   block
 001199: 20 16                      |     local.get 22
 00119b: 42 80 80 80 80 80 80 80 f8 |     i64.const 9218868437227405312
 0011a4: ff 00                      | 
 0011a6: 83                         |     i64.and
 0011a7: 42 80 80 80 80 80 80 80 f8 |     i64.const 9218868437227405312
 0011b0: ff 00                      | 
 0011b2: 52                         |     i64.ne
 0011b3: 0d 00                      |     br_if 0
 0011b5: 20 00                      |     local.get 0
 0011b7: 41 20                      |     i32.const 32
 0011b9: 20 02                      |     local.get 2
 0011bb: 20 07                      |     local.get 7
 0011bd: 41 03                      |     i32.const 3
 0011bf: 6a                         |     i32.add
 0011c0: 22 09                      |     local.tee 9
 0011c2: 20 04                      |     local.get 4
 0011c4: 41 ff ff 7b                |     i32.const 4294901759
 0011c8: 71                         |     i32.and
 0011c9: 10 10                      |     call 16
 0011cb: 20 00                      |     local.get 0
 0011cd: 20 08                      |     local.get 8
 0011cf: 20 07                      |     local.get 7
 0011d1: 10 0d                      |     call 13
 0011d3: 20 00                      |     local.get 0
 0011d5: 41 9b 0c                   |     i32.const 1563
 0011d8: 41 9f 0c                   |     i32.const 1567
 0011db: 20 05                      |     local.get 5
 0011dd: 41 05                      |     i32.const 5
 0011df: 76                         |     i32.shr_u
 0011e0: 41 01                      |     i32.const 1
 0011e2: 71                         |     i32.and
 0011e3: 22 0a                      |     local.tee 10
 0011e5: 1b                         |     select
 0011e6: 41 93 0c                   |     i32.const 1555
 0011e9: 41 97 0c                   |     i32.const 1559
 0011ec: 20 0a                      |     local.get 10
 0011ee: 1b                         |     select
 0011ef: 20 01                      |     local.get 1
 0011f1: 20 01                      |     local.get 1
 0011f3: 62                         |     f64.ne
 0011f4: 1b                         |     select
 0011f5: 41 03                      |     i32.const 3
 0011f7: 10 0d                      |     call 13
 0011f9: 20 00                      |     local.get 0
 0011fb: 41 20                      |     i32.const 32
 0011fd: 20 02                      |     local.get 2
 0011ff: 20 09                      |     local.get 9
 001201: 20 04                      |     local.get 4
 001203: 41 80 c0 00                |     i32.const 8192
 001207: 73                         |     i32.xor
 001208: 10 10                      |     call 16
 00120a: 0c 01                      |     br 1
 00120c: 0b                         |   end
 00120d: 02 40                      |   block
 00120f: 20 01                      |     local.get 1
 001211: 20 06                      |     local.get 6
 001213: 41 2c                      |     i32.const 44
 001215: 6a                         |     i32.add
 001216: 10 20                      |     call 32
 001218: 22 01                      |     local.tee 1
 00121a: 20 01                      |     local.get 1
 00121c: a0                         |     f64.add
 00121d: 22 01                      |     local.tee 1
 00121f: 44 00 00 00 00 00 00 00 00 |     f64.const 0x0p+0
 001228: 61                         |     f64.eq
 001229: 0d 00                      |     br_if 0
 00122b: 20 06                      |     local.get 6
 00122d: 20 06                      |     local.get 6
 00122f: 28 02 2c                   |     i32.load 2 44
 001232: 41 7f                      |     i32.const 4294967295
 001234: 6a                         |     i32.add
 001235: 36 02 2c                   |     i32.store 2 44
 001238: 0b                         |   end
 001239: 20 06                      |   local.get 6
 00123b: 41 10                      |   i32.const 16
 00123d: 6a                         |   i32.add
 00123e: 21 0b                      |   local.set 11
 001240: 02 40                      |   block
 001242: 20 05                      |     local.get 5
 001244: 41 20                      |     i32.const 32
 001246: 72                         |     i32.or
 001247: 22 0c                      |     local.tee 12
 001249: 41 e1 00                   |     i32.const 97
 00124c: 47                         |     i32.ne
 00124d: 0d 00                      |     br_if 0
 00124f: 20 08                      |     local.get 8
 001251: 41 09                      |     i32.const 9
 001253: 6a                         |     i32.add
 001254: 20 08                      |     local.get 8
 001256: 20 05                      |     local.get 5
 001258: 41 20                      |     i32.const 32
 00125a: 71                         |     i32.and
 00125b: 22 0d                      |     local.tee 13
 00125d: 1b                         |     select
 00125e: 21 0e                      |     local.set 14
 001260: 02 40                      |     block
 001262: 20 03                      |       local.get 3
 001264: 41 0b                      |       i32.const 11
 001266: 4b                         |       i32.gt_u
 001267: 0d 00                      |       br_if 0
 001269: 41 0c                      |       i32.const 12
 00126b: 20 03                      |       local.get 3
 00126d: 6b                         |       i32.sub
 00126e: 22 0a                      |       local.tee 10
 001270: 45                         |       i32.eqz
 001271: 0d 00                      |       br_if 0
 001273: 44 00 00 00 00 00 00 20 40 |       f64.const 0x1p+3
 00127c: 21 18                      |       local.set 24
 00127e: 03 40                      |       loop
 001280: 20 18                      |         local.get 24
 001282: 44 00 00 00 00 00 00 30 40 |         f64.const 0x1p+4
 00128b: a2                         |         f64.mul
 00128c: 21 18                      |         local.set 24
 00128e: 20 0a                      |         local.get 10
 001290: 41 7f                      |         i32.const 4294967295
 001292: 6a                         |         i32.add
 001293: 22 0a                      |         local.tee 10
 001295: 0d 00                      |         br_if 0
 001297: 0b                         |       end
 001298: 02 40                      |       block
 00129a: 20 0e                      |         local.get 14
 00129c: 2d 00 00                   |         i32.load8_u 0 0
 00129f: 41 2d                      |         i32.const 45
 0012a1: 47                         |         i32.ne
 0012a2: 0d 00                      |         br_if 0
 0012a4: 20 18                      |         local.get 24
 0012a6: 20 01                      |         local.get 1
 0012a8: 9a                         |         f64.neg
 0012a9: 20 18                      |         local.get 24
 0012ab: a1                         |         f64.sub
 0012ac: a0                         |         f64.add
 0012ad: 9a                         |         f64.neg
 0012ae: 21 01                      |         local.set 1
 0012b0: 0c 01                      |         br 1
 0012b2: 0b                         |       end
 0012b3: 20 01                      |       local.get 1
 0012b5: 20 18                      |       local.get 24
 0012b7: a0                         |       f64.add
 0012b8: 20 18                      |       local.get 24
 0012ba: a1                         |       f64.sub
 0012bb: 21 01                      |       local.set 1
 0012bd: 0b                         |     end
 0012be: 02 40                      |     block
 0012c0: 20 06                      |       local.get 6
 0012c2: 28 02 2c                   |       i32.load 2 44
 0012c5: 22 0a                      |       local.tee 10
 0012c7: 20 0a                      |       local.get 10
 0012c9: 41 1f                      |       i32.const 31
 0012cb: 75                         |       i32.shr_s
 0012cc: 22 0a                      |       local.tee 10
 0012ce: 6a                         |       i32.add
 0012cf: 20 0a                      |       local.get 10
 0012d1: 73                         |       i32.xor
 0012d2: ad                         |       i64.extend_i32_u
 0012d3: 20 0b                      |       local.get 11
 0012d5: 10 13                      |       call 19
 0012d7: 22 0a                      |       local.tee 10
 0012d9: 20 0b                      |       local.get 11
 0012db: 47                         |       i32.ne
 0012dc: 0d 00                      |       br_if 0
 0012de: 20 06                      |       local.get 6
 0012e0: 41 30                      |       i32.const 48
 0012e2: 3a 00 0f                   |       i32.store8 0 15
 0012e5: 20 06                      |       local.get 6
 0012e7: 41 0f                      |       i32.const 15
 0012e9: 6a                         |       i32.add
 0012ea: 21 0a                      |       local.set 10
 0012ec: 0b                         |     end
 0012ed: 20 07                      |     local.get 7
 0012ef: 41 02                      |     i32.const 2
 0012f1: 72                         |     i32.or
 0012f2: 21 0f                      |     local.set 15
 0012f4: 20 06                      |     local.get 6
 0012f6: 28 02 2c                   |     i32.load 2 44
 0012f9: 21 10                      |     local.set 16
 0012fb: 20 0a                      |     local.get 10
 0012fd: 41 7e                      |     i32.const 4294967294
 0012ff: 6a                         |     i32.add
 001300: 22 11                      |     local.tee 17
 001302: 20 05                      |     local.get 5
 001304: 41 0f                      |     i32.const 15
 001306: 6a                         |     i32.add
 001307: 3a 00 00                   |     i32.store8 0 0
 00130a: 20 0a                      |     local.get 10
 00130c: 41 7f                      |     i32.const 4294967295
 00130e: 6a                         |     i32.add
 00130f: 41 2d                      |     i32.const 45
 001311: 41 2b                      |     i32.const 43
 001313: 20 10                      |     local.get 16
 001315: 41 00                      |     i32.const 0
 001317: 48                         |     i32.lt_s
 001318: 1b                         |     select
 001319: 3a 00 00                   |     i32.store8 0 0
 00131c: 20 04                      |     local.get 4
 00131e: 41 08                      |     i32.const 8
 001320: 71                         |     i32.and
 001321: 21 12                      |     local.set 18
 001323: 20 06                      |     local.get 6
 001325: 41 10                      |     i32.const 16
 001327: 6a                         |     i32.add
 001328: 21 10                      |     local.set 16
 00132a: 03 40                      |     loop
 00132c: 20 10                      |       local.get 16
 00132e: 21 0a                      |       local.set 10
 001330: 02 40                      |       block
 001332: 02 40                      |         block
 001334: 20 01                      |           local.get 1
 001336: 99                         |           f64.abs
 001337: 44 00 00 00 00 00 00 e0 41 |           f64.const 0x1p+31
 001340: 63                         |           f64.lt
 001341: 45                         |           i32.eqz
 001342: 0d 00                      |           br_if 0
 001344: 20 01                      |           local.get 1
 001346: aa                         |           i32.trunc_f64_s
 001347: 21 10                      |           local.set 16
 001349: 0c 01                      |           br 1
 00134b: 0b                         |         end
 00134c: 41 80 80 80 80 78          |         i32.const 2147483648
 001352: 21 10                      |         local.set 16
 001354: 0b                         |       end
 001355: 20 0a                      |       local.get 10
 001357: 20 10                      |       local.get 16
 001359: 41 f0 0b                   |       i32.const 1520
 00135c: 6a                         |       i32.add
 00135d: 2d 00 00                   |       i32.load8_u 0 0
 001360: 20 0d                      |       local.get 13
 001362: 72                         |       i32.or
 001363: 3a 00 00                   |       i32.store8 0 0
 001366: 20 01                      |       local.get 1
 001368: 20 10                      |       local.get 16
 00136a: b7                         |       f64.convert_i32_s
 00136b: a1                         |       f64.sub
 00136c: 44 00 00 00 00 00 00 30 40 |       f64.const 0x1p+4
 001375: a2                         |       f64.mul
 001376: 21 01                      |       local.set 1
 001378: 02 40                      |       block
 00137a: 20 0a                      |         local.get 10
 00137c: 41 01                      |         i32.const 1
 00137e: 6a                         |         i32.add
 00137f: 22 10                      |         local.tee 16
 001381: 20 06                      |         local.get 6
 001383: 41 10                      |         i32.const 16
 001385: 6a                         |         i32.add
 001386: 6b                         |         i32.sub
 001387: 41 01                      |         i32.const 1
 001389: 47                         |         i32.ne
 00138a: 0d 00                      |         br_if 0
 00138c: 02 40                      |         block
 00138e: 20 12                      |           local.get 18
 001390: 0d 00                      |           br_if 0
 001392: 20 03                      |           local.get 3
 001394: 41 00                      |           i32.const 0
 001396: 4a                         |           i32.gt_s
 001397: 0d 00                      |           br_if 0
 001399: 20 01                      |           local.get 1
 00139b: 44 00 00 00 00 00 00 00 00 |           f64.const 0x0p+0
 0013a4: 61                         |           f64.eq
 0013a5: 0d 01                      |           br_if 1
 0013a7: 0b                         |         end
 0013a8: 20 0a                      |         local.get 10
 0013aa: 41 2e                      |         i32.const 46
 0013ac: 3a 00 01                   |         i32.store8 0 1
 0013af: 20 0a                      |         local.get 10
 0013b1: 41 02                      |         i32.const 2
 0013b3: 6a                         |         i32.add
 0013b4: 21 10                      |         local.set 16
 0013b6: 0b                         |       end
 0013b7: 20 01                      |       local.get 1
 0013b9: 44 00 00 00 00 00 00 00 00 |       f64.const 0x0p+0
 0013c2: 62                         |       f64.ne
 0013c3: 0d 00                      |       br_if 0
 0013c5: 0b                         |     end
 0013c6: 02 40                      |     block
 0013c8: 02 40                      |       block
 0013ca: 20 03                      |         local.get 3
 0013cc: 45                         |         i32.eqz
 0013cd: 0d 00                      |         br_if 0
 0013cf: 20 10                      |         local.get 16
 0013d1: 20 06                      |         local.get 6
 0013d3: 41 10                      |         i32.const 16
 0013d5: 6a                         |         i32.add
 0013d6: 6b                         |         i32.sub
 0013d7: 41 7e                      |         i32.const 4294967294
 0013d9: 6a                         |         i32.add
 0013da: 20 03                      |         local.get 3
 0013dc: 4e                         |         i32.ge_s
 0013dd: 0d 00                      |         br_if 0
 0013df: 20 03                      |         local.get 3
 0013e1: 20 0b                      |         local.get 11
 0013e3: 6a                         |         i32.add
 0013e4: 20 11                      |         local.get 17
 0013e6: 6b                         |         i32.sub
 0013e7: 41 02                      |         i32.const 2
 0013e9: 6a                         |         i32.add
 0013ea: 21 0a                      |         local.set 10
 0013ec: 0c 01                      |         br 1
 0013ee: 0b                         |       end
 0013ef: 20 0b                      |       local.get 11
 0013f1: 20 06                      |       local.get 6
 0013f3: 41 10                      |       i32.const 16
 0013f5: 6a                         |       i32.add
 0013f6: 6b                         |       i32.sub
 0013f7: 20 11                      |       local.get 17
 0013f9: 6b                         |       i32.sub
 0013fa: 20 10                      |       local.get 16
 0013fc: 6a                         |       i32.add
 0013fd: 21 0a                      |       local.set 10
 0013ff: 0b                         |     end
 001400: 20 00                      |     local.get 0
 001402: 41 20                      |     i32.const 32
 001404: 20 02                      |     local.get 2
 001406: 20 0a                      |     local.get 10
 001408: 20 0f                      |     local.get 15
 00140a: 6a                         |     i32.add
 00140b: 22 09                      |     local.tee 9
 00140d: 20 04                      |     local.get 4
 00140f: 10 10                      |     call 16
 001411: 20 00                      |     local.get 0
 001413: 20 0e                      |     local.get 14
 001415: 20 0f                      |     local.get 15
 001417: 10 0d                      |     call 13
 001419: 20 00                      |     local.get 0
 00141b: 41 30                      |     i32.const 48
 00141d: 20 02                      |     local.get 2
 00141f: 20 09                      |     local.get 9
 001421: 20 04                      |     local.get 4
 001423: 41 80 80 04                |     i32.const 65536
 001427: 73                         |     i32.xor
 001428: 10 10                      |     call 16
 00142a: 20 00                      |     local.get 0
 00142c: 20 06                      |     local.get 6
 00142e: 41 10                      |     i32.const 16
 001430: 6a                         |     i32.add
 001431: 20 10                      |     local.get 16
 001433: 20 06                      |     local.get 6
 001435: 41 10                      |     i32.const 16
 001437: 6a                         |     i32.add
 001438: 6b                         |     i32.sub
 001439: 22 10                      |     local.tee 16
 00143b: 10 0d                      |     call 13
 00143d: 20 00                      |     local.get 0
 00143f: 41 30                      |     i32.const 48
 001441: 20 0a                      |     local.get 10
 001443: 20 10                      |     local.get 16
 001445: 20 0b                      |     local.get 11
 001447: 20 11                      |     local.get 17
 001449: 6b                         |     i32.sub
 00144a: 22 0d                      |     local.tee 13
 00144c: 6a                         |     i32.add
 00144d: 6b                         |     i32.sub
 00144e: 41 00                      |     i32.const 0
 001450: 41 00                      |     i32.const 0
 001452: 10 10                      |     call 16
 001454: 20 00                      |     local.get 0
 001456: 20 11                      |     local.get 17
 001458: 20 0d                      |     local.get 13
 00145a: 10 0d                      |     call 13
 00145c: 20 00                      |     local.get 0
 00145e: 41 20                      |     i32.const 32
 001460: 20 02                      |     local.get 2
 001462: 20 09                      |     local.get 9
 001464: 20 04                      |     local.get 4
 001466: 41 80 c0 00                |     i32.const 8192
 00146a: 73                         |     i32.xor
 00146b: 10 10                      |     call 16
 00146d: 0c 01                      |     br 1
 00146f: 0b                         |   end
 001470: 20 03                      |   local.get 3
 001472: 41 00                      |   i32.const 0
 001474: 48                         |   i32.lt_s
 001475: 21 0a                      |   local.set 10
 001477: 02 40                      |   block
 001479: 02 40                      |     block
 00147b: 20 01                      |       local.get 1
 00147d: 44 00 00 00 00 00 00 00 00 |       f64.const 0x0p+0
 001486: 62                         |       f64.ne
 001487: 0d 00                      |       br_if 0
 001489: 20 06                      |       local.get 6
 00148b: 28 02 2c                   |       i32.load 2 44
 00148e: 21 12                      |       local.set 18
 001490: 0c 01                      |       br 1
 001492: 0b                         |     end
 001493: 20 06                      |     local.get 6
 001495: 20 06                      |     local.get 6
 001497: 28 02 2c                   |     i32.load 2 44
 00149a: 41 64                      |     i32.const 4294967268
 00149c: 6a                         |     i32.add
 00149d: 22 12                      |     local.tee 18
 00149f: 36 02 2c                   |     i32.store 2 44
 0014a2: 20 01                      |     local.get 1
 0014a4: 44 00 00 00 00 00 00 b0 41 |     f64.const 0x1p+28
 0014ad: a2                         |     f64.mul
 0014ae: 21 01                      |     local.set 1
 0014b0: 0b                         |   end
 0014b1: 41 06                      |   i32.const 6
 0014b3: 20 03                      |   local.get 3
 0014b5: 20 0a                      |   local.get 10
 0014b7: 1b                         |   select
 0014b8: 21 0e                      |   local.set 14
 0014ba: 20 06                      |   local.get 6
 0014bc: 41 30                      |   i32.const 48
 0014be: 6a                         |   i32.add
 0014bf: 20 06                      |   local.get 6
 0014c1: 41 d0 02                   |   i32.const 336
 0014c4: 6a                         |   i32.add
 0014c5: 20 12                      |   local.get 18
 0014c7: 41 00                      |   i32.const 0
 0014c9: 48                         |   i32.lt_s
 0014ca: 1b                         |   select
 0014cb: 22 13                      |   local.tee 19
 0014cd: 21 0d                      |   local.set 13
 0014cf: 03 40                      |   loop
 0014d1: 02 40                      |     block
 0014d3: 02 40                      |       block
 0014d5: 20 01                      |         local.get 1
 0014d7: 44 00 00 00 00 00 00 f0 41 |         f64.const 0x1p+32
 0014e0: 63                         |         f64.lt
 0014e1: 20 01                      |         local.get 1
 0014e3: 44 00 00 00 00 00 00 00 00 |         f64.const 0x0p+0
 0014ec: 66                         |         f64.ge
 0014ed: 71                         |         i32.and
 0014ee: 45                         |         i32.eqz
 0014ef: 0d 00                      |         br_if 0
 0014f1: 20 01                      |         local.get 1
 0014f3: ab                         |         i32.trunc_f64_u
 0014f4: 21 0a                      |         local.set 10
 0014f6: 0c 01                      |         br 1
 0014f8: 0b                         |       end
 0014f9: 41 00                      |       i32.const 0
 0014fb: 21 0a                      |       local.set 10
 0014fd: 0b                         |     end
 0014fe: 20 0d                      |     local.get 13
 001500: 20 0a                      |     local.get 10
 001502: 36 02 00                   |     i32.store 2 0
 001505: 20 0d                      |     local.get 13
 001507: 41 04                      |     i32.const 4
 001509: 6a                         |     i32.add
 00150a: 21 0d                      |     local.set 13
 00150c: 20 01                      |     local.get 1
 00150e: 20 0a                      |     local.get 10
 001510: b8                         |     f64.convert_i32_u
 001511: a1                         |     f64.sub
 001512: 44 00 00 00 00 65 cd cd 41 |     f64.const 0x1.dcd65p+29
 00151b: a2                         |     f64.mul
 00151c: 22 01                      |     local.tee 1
 00151e: 44 00 00 00 00 00 00 00 00 |     f64.const 0x0p+0
 001527: 62                         |     f64.ne
 001528: 0d 00                      |     br_if 0
 00152a: 0b                         |   end
 00152b: 02 40                      |   block
 00152d: 02 40                      |     block
 00152f: 20 12                      |       local.get 18
 001531: 41 01                      |       i32.const 1
 001533: 4e                         |       i32.ge_s
 001534: 0d 00                      |       br_if 0
 001536: 20 0d                      |       local.get 13
 001538: 21 0a                      |       local.set 10
 00153a: 20 13                      |       local.get 19
 00153c: 21 10                      |       local.set 16
 00153e: 0c 01                      |       br 1
 001540: 0b                         |     end
 001541: 20 13                      |     local.get 19
 001543: 21 10                      |     local.set 16
 001545: 03 40                      |     loop
 001547: 20 12                      |       local.get 18
 001549: 41 1d                      |       i32.const 29
 00154b: 20 12                      |       local.get 18
 00154d: 41 1d                      |       i32.const 29
 00154f: 48                         |       i32.lt_s
 001550: 1b                         |       select
 001551: 21 12                      |       local.set 18
 001553: 02 40                      |       block
 001555: 20 0d                      |         local.get 13
 001557: 41 7c                      |         i32.const 4294967292
 001559: 6a                         |         i32.add
 00155a: 22 0a                      |         local.tee 10
 00155c: 20 10                      |         local.get 16
 00155e: 49                         |         i32.lt_u
 00155f: 0d 00                      |         br_if 0
 001561: 20 12                      |         local.get 18
 001563: ad                         |         i64.extend_i32_u
 001564: 21 17                      |         local.set 23
 001566: 42 00                      |         i64.const 0
 001568: 21 16                      |         local.set 22
 00156a: 03 40                      |         loop
 00156c: 20 0a                      |           local.get 10
 00156e: 20 0a                      |           local.get 10
 001570: 35 02 00                   |           i64.load32_u 2 0
 001573: 20 17                      |           local.get 23
 001575: 86                         |           i64.shl
 001576: 20 16                      |           local.get 22
 001578: 42 ff ff ff ff 0f          |           i64.const 4294967295
 00157e: 83                         |           i64.and
 00157f: 7c                         |           i64.add
 001580: 22 16                      |           local.tee 22
 001582: 20 16                      |           local.get 22
 001584: 42 80 94 eb dc 03          |           i64.const 1000000000
 00158a: 80                         |           i64.div_u
 00158b: 22 16                      |           local.tee 22
 00158d: 42 80 94 eb dc 03          |           i64.const 1000000000
 001593: 7e                         |           i64.mul
 001594: 7d                         |           i64.sub
 001595: 3e 02 00                   |           i64.store32 2 0
 001598: 20 0a                      |           local.get 10
 00159a: 41 7c                      |           i32.const 4294967292
 00159c: 6a                         |           i32.add
 00159d: 22 0a                      |           local.tee 10
 00159f: 20 10                      |           local.get 16
 0015a1: 4f                         |           i32.ge_u
 0015a2: 0d 00                      |           br_if 0
 0015a4: 0b                         |         end
 0015a5: 20 16                      |         local.get 22
 0015a7: a7                         |         i32.wrap_i64
 0015a8: 22 0a                      |         local.tee 10
 0015aa: 45                         |         i32.eqz
 0015ab: 0d 00                      |         br_if 0
 0015ad: 20 10                      |         local.get 16
 0015af: 41 7c                      |         i32.const 4294967292
 0015b1: 6a                         |         i32.add
 0015b2: 22 10                      |         local.tee 16
 0015b4: 20 0a                      |         local.get 10
 0015b6: 36 02 00                   |         i32.store 2 0
 0015b9: 0b                         |       end
 0015ba: 02 40                      |       block
 0015bc: 03 40                      |         loop
 0015be: 20 0d                      |           local.get 13
 0015c0: 22 0a                      |           local.tee 10
 0015c2: 20 10                      |           local.get 16
 0015c4: 4d                         |           i32.le_u
 0015c5: 0d 01                      |           br_if 1
 0015c7: 20 0a                      |           local.get 10
 0015c9: 41 7c                      |           i32.const 4294967292
 0015cb: 6a                         |           i32.add
 0015cc: 22 0d                      |           local.tee 13
 0015ce: 28 02 00                   |           i32.load 2 0
 0015d1: 45                         |           i32.eqz
 0015d2: 0d 00                      |           br_if 0
 0015d4: 0b                         |         end
 0015d5: 0b                         |       end
 0015d6: 20 06                      |       local.get 6
 0015d8: 20 06                      |       local.get 6
 0015da: 28 02 2c                   |       i32.load 2 44
 0015dd: 20 12                      |       local.get 18
 0015df: 6b                         |       i32.sub
 0015e0: 22 12                      |       local.tee 18
 0015e2: 36 02 2c                   |       i32.store 2 44
 0015e5: 20 0a                      |       local.get 10
 0015e7: 21 0d                      |       local.set 13
 0015e9: 20 12                      |       local.get 18
 0015eb: 41 00                      |       i32.const 0
 0015ed: 4a                         |       i32.gt_s
 0015ee: 0d 00                      |       br_if 0
 0015f0: 0b                         |     end
 0015f1: 0b                         |   end
 0015f2: 02 40                      |   block
 0015f4: 20 12                      |     local.get 18
 0015f6: 41 7f                      |     i32.const 4294967295
 0015f8: 4a                         |     i32.gt_s
 0015f9: 0d 00                      |     br_if 0
 0015fb: 20 0e                      |     local.get 14
 0015fd: 41 19                      |     i32.const 25
 0015ff: 6a                         |     i32.add
 001600: 41 09                      |     i32.const 9
 001602: 6d                         |     i32.div_s
 001603: 41 01                      |     i32.const 1
 001605: 6a                         |     i32.add
 001606: 21 14                      |     local.set 20
 001608: 20 0c                      |     local.get 12
 00160a: 41 e6 00                   |     i32.const 102
 00160d: 46                         |     i32.eq
 00160e: 21 15                      |     local.set 21
 001610: 03 40                      |     loop
 001612: 41 09                      |       i32.const 9
 001614: 41 00                      |       i32.const 0
 001616: 20 12                      |       local.get 18
 001618: 6b                         |       i32.sub
 001619: 20 12                      |       local.get 18
 00161b: 41 77                      |       i32.const 4294967287
 00161d: 48                         |       i32.lt_s
 00161e: 1b                         |       select
 00161f: 21 09                      |       local.set 9
 001621: 02 40                      |       block
 001623: 02 40                      |         block
 001625: 20 10                      |           local.get 16
 001627: 20 0a                      |           local.get 10
 001629: 49                         |           i32.lt_u
 00162a: 0d 00                      |           br_if 0
 00162c: 20 10                      |           local.get 16
 00162e: 20 10                      |           local.get 16
 001630: 41 04                      |           i32.const 4
 001632: 6a                         |           i32.add
 001633: 20 10                      |           local.get 16
 001635: 28 02 00                   |           i32.load 2 0
 001638: 1b                         |           select
 001639: 21 10                      |           local.set 16
 00163b: 0c 01                      |           br 1
 00163d: 0b                         |         end
 00163e: 41 80 94 eb dc 03          |         i32.const 1000000000
 001644: 20 09                      |         local.get 9
 001646: 76                         |         i32.shr_u
 001647: 21 11                      |         local.set 17
 001649: 41 7f                      |         i32.const 4294967295
 00164b: 20 09                      |         local.get 9
 00164d: 74                         |         i32.shl
 00164e: 41 7f                      |         i32.const 4294967295
 001650: 73                         |         i32.xor
 001651: 21 0f                      |         local.set 15
 001653: 41 00                      |         i32.const 0
 001655: 21 12                      |         local.set 18
 001657: 20 10                      |         local.get 16
 001659: 21 0d                      |         local.set 13
 00165b: 03 40                      |         loop
 00165d: 20 0d                      |           local.get 13
 00165f: 20 0d                      |           local.get 13
 001661: 28 02 00                   |           i32.load 2 0
 001664: 22 03                      |           local.tee 3
 001666: 20 09                      |           local.get 9
 001668: 76                         |           i32.shr_u
 001669: 20 12                      |           local.get 18
 00166b: 6a                         |           i32.add
 00166c: 36 02 00                   |           i32.store 2 0
 00166f: 20 03                      |           local.get 3
 001671: 20 0f                      |           local.get 15
 001673: 71                         |           i32.and
 001674: 20 11                      |           local.get 17
 001676: 6c                         |           i32.mul
 001677: 21 12                      |           local.set 18
 001679: 20 0d                      |           local.get 13
 00167b: 41 04                      |           i32.const 4
 00167d: 6a                         |           i32.add
 00167e: 22 0d                      |           local.tee 13
 001680: 20 0a                      |           local.get 10
 001682: 49                         |           i32.lt_u
 001683: 0d 00                      |           br_if 0
 001685: 0b                         |         end
 001686: 20 10                      |         local.get 16
 001688: 20 10                      |         local.get 16
 00168a: 41 04                      |         i32.const 4
 00168c: 6a                         |         i32.add
 00168d: 20 10                      |         local.get 16
 00168f: 28 02 00                   |         i32.load 2 0
 001692: 1b                         |         select
 001693: 21 10                      |         local.set 16
 001695: 20 12                      |         local.get 18
 001697: 45                         |         i32.eqz
 001698: 0d 00                      |         br_if 0
 00169a: 20 0a                      |         local.get 10
 00169c: 20 12                      |         local.get 18
 00169e: 36 02 00                   |         i32.store 2 0
 0016a1: 20 0a                      |         local.get 10
 0016a3: 41 04                      |         i32.const 4
 0016a5: 6a                         |         i32.add
 0016a6: 21 0a                      |         local.set 10
 0016a8: 0b                         |       end
 0016a9: 20 06                      |       local.get 6
 0016ab: 20 06                      |       local.get 6
 0016ad: 28 02 2c                   |       i32.load 2 44
 0016b0: 20 09                      |       local.get 9
 0016b2: 6a                         |       i32.add
 0016b3: 22 12                      |       local.tee 18
 0016b5: 36 02 2c                   |       i32.store 2 44
 0016b8: 20 13                      |       local.get 19
 0016ba: 20 10                      |       local.get 16
 0016bc: 20 15                      |       local.get 21
 0016be: 1b                         |       select
 0016bf: 22 0d                      |       local.tee 13
 0016c1: 20 14                      |       local.get 20
 0016c3: 41 02                      |       i32.const 2
 0016c5: 74                         |       i32.shl
 0016c6: 6a                         |       i32.add
 0016c7: 20 0a                      |       local.get 10
 0016c9: 20 0a                      |       local.get 10
 0016cb: 20 0d                      |       local.get 13
 0016cd: 6b                         |       i32.sub
 0016ce: 41 02                      |       i32.const 2
 0016d0: 75                         |       i32.shr_s
 0016d1: 20 14                      |       local.get 20
 0016d3: 4a                         |       i32.gt_s
 0016d4: 1b                         |       select
 0016d5: 21 0a                      |       local.set 10
 0016d7: 20 12                      |       local.get 18
 0016d9: 41 00                      |       i32.const 0
 0016db: 48                         |       i32.lt_s
 0016dc: 0d 00                      |       br_if 0
 0016de: 0b                         |     end
 0016df: 0b                         |   end
 0016e0: 41 00                      |   i32.const 0
 0016e2: 21 0d                      |   local.set 13
 0016e4: 02 40                      |   block
 0016e6: 20 10                      |     local.get 16
 0016e8: 20 0a                      |     local.get 10
 0016ea: 4f                         |     i32.ge_u
 0016eb: 0d 00                      |     br_if 0
 0016ed: 20 13                      |     local.get 19
 0016ef: 20 10                      |     local.get 16
 0016f1: 6b                         |     i32.sub
 0016f2: 41 02                      |     i32.const 2
 0016f4: 75                         |     i32.shr_s
 0016f5: 41 09                      |     i32.const 9
 0016f7: 6c                         |     i32.mul
 0016f8: 21 0d                      |     local.set 13
 0016fa: 41 0a                      |     i32.const 10
 0016fc: 21 12                      |     local.set 18
 0016fe: 20 10                      |     local.get 16
 001700: 28 02 00                   |     i32.load 2 0
 001703: 22 03                      |     local.tee 3
 001705: 41 0a                      |     i32.const 10
 001707: 49                         |     i32.lt_u
 001708: 0d 00                      |     br_if 0
 00170a: 03 40                      |     loop
 00170c: 20 0d                      |       local.get 13
 00170e: 41 01                      |       i32.const 1
 001710: 6a                         |       i32.add
 001711: 21 0d                      |       local.set 13
 001713: 20 03                      |       local.get 3
 001715: 20 12                      |       local.get 18
 001717: 41 0a                      |       i32.const 10
 001719: 6c                         |       i32.mul
 00171a: 22 12                      |       local.tee 18
 00171c: 4f                         |       i32.ge_u
 00171d: 0d 00                      |       br_if 0
 00171f: 0b                         |     end
 001720: 0b                         |   end
 001721: 02 40                      |   block
 001723: 20 0e                      |     local.get 14
 001725: 41 00                      |     i32.const 0
 001727: 20 0d                      |     local.get 13
 001729: 20 0c                      |     local.get 12
 00172b: 41 e6 00                   |     i32.const 102
 00172e: 46                         |     i32.eq
 00172f: 1b                         |     select
 001730: 6b                         |     i32.sub
 001731: 20 0e                      |     local.get 14
 001733: 41 00                      |     i32.const 0
 001735: 47                         |     i32.ne
 001736: 20 0c                      |     local.get 12
 001738: 41 e7 00                   |     i32.const 103
 00173b: 46                         |     i32.eq
 00173c: 71                         |     i32.and
 00173d: 6b                         |     i32.sub
 00173e: 22 12                      |     local.tee 18
 001740: 20 0a                      |     local.get 10
 001742: 20 13                      |     local.get 19
 001744: 6b                         |     i32.sub
 001745: 41 02                      |     i32.const 2
 001747: 75                         |     i32.shr_s
 001748: 41 09                      |     i32.const 9
 00174a: 6c                         |     i32.mul
 00174b: 41 77                      |     i32.const 4294967287
 00174d: 6a                         |     i32.add
 00174e: 4e                         |     i32.ge_s
 00174f: 0d 00                      |     br_if 0
 001751: 20 12                      |     local.get 18
 001753: 41 80 c8 00                |     i32.const 9216
 001757: 6a                         |     i32.add
 001758: 22 03                      |     local.tee 3
 00175a: 41 09                      |     i32.const 9
 00175c: 6d                         |     i32.div_s
 00175d: 22 11                      |     local.tee 17
 00175f: 41 02                      |     i32.const 2
 001761: 74                         |     i32.shl
 001762: 20 13                      |     local.get 19
 001764: 6a                         |     i32.add
 001765: 41 84 60                   |     i32.const 4294963204
 001768: 6a                         |     i32.add
 001769: 21 09                      |     local.set 9
 00176b: 41 0a                      |     i32.const 10
 00176d: 21 12                      |     local.set 18
 00176f: 02 40                      |     block
 001771: 20 03                      |       local.get 3
 001773: 20 11                      |       local.get 17
 001775: 41 09                      |       i32.const 9
 001777: 6c                         |       i32.mul
 001778: 6b                         |       i32.sub
 001779: 41 01                      |       i32.const 1
 00177b: 6a                         |       i32.add
 00177c: 22 03                      |       local.tee 3
 00177e: 41 08                      |       i32.const 8
 001780: 4a                         |       i32.gt_s
 001781: 0d 00                      |       br_if 0
 001783: 03 40                      |       loop
 001785: 20 12                      |         local.get 18
 001787: 41 0a                      |         i32.const 10
 001789: 6c                         |         i32.mul
 00178a: 21 12                      |         local.set 18
 00178c: 20 03                      |         local.get 3
 00178e: 41 01                      |         i32.const 1
 001790: 6a                         |         i32.add
 001791: 22 03                      |         local.tee 3
 001793: 41 09                      |         i32.const 9
 001795: 47                         |         i32.ne
 001796: 0d 00                      |         br_if 0
 001798: 0b                         |       end
 001799: 0b                         |     end
 00179a: 20 09                      |     local.get 9
 00179c: 28 02 00                   |     i32.load 2 0
 00179f: 22 11                      |     local.tee 17
 0017a1: 20 11                      |     local.get 17
 0017a3: 20 12                      |     local.get 18
 0017a5: 6e                         |     i32.div_u
 0017a6: 22 0f                      |     local.tee 15
 0017a8: 20 12                      |     local.get 18
 0017aa: 6c                         |     i32.mul
 0017ab: 6b                         |     i32.sub
 0017ac: 21 03                      |     local.set 3
 0017ae: 02 40                      |     block
 0017b0: 02 40                      |       block
 0017b2: 20 09                      |         local.get 9
 0017b4: 41 04                      |         i32.const 4
 0017b6: 6a                         |         i32.add
 0017b7: 22 14                      |         local.tee 20
 0017b9: 20 0a                      |         local.get 10
 0017bb: 47                         |         i32.ne
 0017bc: 0d 00                      |         br_if 0
 0017be: 20 03                      |         local.get 3
 0017c0: 45                         |         i32.eqz
 0017c1: 0d 01                      |         br_if 1
 0017c3: 0b                         |       end
 0017c4: 44 00 00 00 00 00 00 e0 3f |       f64.const 0x1p-1
 0017cd: 44 00 00 00 00 00 00 f0 3f |       f64.const 0x1p+0
 0017d6: 44 00 00 00 00 00 00 f8 3f |       f64.const 0x1.8p+0
 0017df: 20 03                      |       local.get 3
 0017e1: 20 12                      |       local.get 18
 0017e3: 41 01                      |       i32.const 1
 0017e5: 76                         |       i32.shr_u
 0017e6: 22 15                      |       local.tee 21
 0017e8: 46                         |       i32.eq
 0017e9: 1b                         |       select
 0017ea: 44 00 00 00 00 00 00 f8 3f |       f64.const 0x1.8p+0
 0017f3: 20 14                      |       local.get 20
 0017f5: 20 0a                      |       local.get 10
 0017f7: 46                         |       i32.eq
 0017f8: 1b                         |       select
 0017f9: 20 03                      |       local.get 3
 0017fb: 20 15                      |       local.get 21
 0017fd: 49                         |       i32.lt_u
 0017fe: 1b                         |       select
 0017ff: 21 18                      |       local.set 24
 001801: 44 01 00 00 00 00 00 40 43 |       f64.const 0x1.0000000000001p+53
 00180a: 44 00 00 00 00 00 00 40 43 |       f64.const 0x1p+53
 001813: 20 0f                      |       local.get 15
 001815: 41 01                      |       i32.const 1
 001817: 71                         |       i32.and
 001818: 1b                         |       select
 001819: 21 01                      |       local.set 1
 00181b: 02 40                      |       block
 00181d: 20 07                      |         local.get 7
 00181f: 45                         |         i32.eqz
 001820: 0d 00                      |         br_if 0
 001822: 20 08                      |         local.get 8
 001824: 2d 00 00                   |         i32.load8_u 0 0
 001827: 41 2d                      |         i32.const 45
 001829: 47                         |         i32.ne
 00182a: 0d 00                      |         br_if 0
 00182c: 20 18                      |         local.get 24
 00182e: 9a                         |         f64.neg
 00182f: 21 18                      |         local.set 24
 001831: 20 01                      |         local.get 1
 001833: 9a                         |         f64.neg
 001834: 21 01                      |         local.set 1
 001836: 0b                         |       end
 001837: 20 09                      |       local.get 9
 001839: 20 11                      |       local.get 17
 00183b: 20 03                      |       local.get 3
 00183d: 6b                         |       i32.sub
 00183e: 22 03                      |       local.tee 3
 001840: 36 02 00                   |       i32.store 2 0
 001843: 20 01                      |       local.get 1
 001845: 20 18                      |       local.get 24
 001847: a0                         |       f64.add
 001848: 20 01                      |       local.get 1
 00184a: 61                         |       f64.eq
 00184b: 0d 00                      |       br_if 0
 00184d: 20 09                      |       local.get 9
 00184f: 20 03                      |       local.get 3
 001851: 20 12                      |       local.get 18
 001853: 6a                         |       i32.add
 001854: 22 0d                      |       local.tee 13
 001856: 36 02 00                   |       i32.store 2 0
 001859: 02 40                      |       block
 00185b: 20 0d                      |         local.get 13
 00185d: 41 80 94 eb dc 03          |         i32.const 1000000000
 001863: 49                         |         i32.lt_u
 001864: 0d 00                      |         br_if 0
 001866: 03 40                      |         loop
 001868: 20 09                      |           local.get 9
 00186a: 41 00                      |           i32.const 0
 00186c: 36 02 00                   |           i32.store 2 0
 00186f: 02 40                      |           block
 001871: 20 09                      |             local.get 9
 001873: 41 7c                      |             i32.const 4294967292
 001875: 6a                         |             i32.add
 001876: 22 09                      |             local.tee 9
 001878: 20 10                      |             local.get 16
 00187a: 4f                         |             i32.ge_u
 00187b: 0d 00                      |             br_if 0
 00187d: 20 10                      |             local.get 16
 00187f: 41 7c                      |             i32.const 4294967292
 001881: 6a                         |             i32.add
 001882: 22 10                      |             local.tee 16
 001884: 41 00                      |             i32.const 0
 001886: 36 02 00                   |             i32.store 2 0
 001889: 0b                         |           end
 00188a: 20 09                      |           local.get 9
 00188c: 20 09                      |           local.get 9
 00188e: 28 02 00                   |           i32.load 2 0
 001891: 41 01                      |           i32.const 1
 001893: 6a                         |           i32.add
 001894: 22 0d                      |           local.tee 13
 001896: 36 02 00                   |           i32.store 2 0
 001899: 20 0d                      |           local.get 13
 00189b: 41 ff 93 eb dc 03          |           i32.const 999999999
 0018a1: 4b                         |           i32.gt_u
 0018a2: 0d 00                      |           br_if 0
 0018a4: 0b                         |         end
 0018a5: 0b                         |       end
 0018a6: 20 13                      |       local.get 19
 0018a8: 20 10                      |       local.get 16
 0018aa: 6b                         |       i32.sub
 0018ab: 41 02                      |       i32.const 2
 0018ad: 75                         |       i32.shr_s
 0018ae: 41 09                      |       i32.const 9
 0018b0: 6c                         |       i32.mul
 0018b1: 21 0d                      |       local.set 13
 0018b3: 41 0a                      |       i32.const 10
 0018b5: 21 12                      |       local.set 18
 0018b7: 20 10                      |       local.get 16
 0018b9: 28 02 00                   |       i32.load 2 0
 0018bc: 22 03                      |       local.tee 3
 0018be: 41 0a                      |       i32.const 10
 0018c0: 49                         |       i32.lt_u
 0018c1: 0d 00                      |       br_if 0
 0018c3: 03 40                      |       loop
 0018c5: 20 0d                      |         local.get 13
 0018c7: 41 01                      |         i32.const 1
 0018c9: 6a                         |         i32.add
 0018ca: 21 0d                      |         local.set 13
 0018cc: 20 03                      |         local.get 3
 0018ce: 20 12                      |         local.get 18
 0018d0: 41 0a                      |         i32.const 10
 0018d2: 6c                         |         i32.mul
 0018d3: 22 12                      |         local.tee 18
 0018d5: 4f                         |         i32.ge_u
 0018d6: 0d 00                      |         br_if 0
 0018d8: 0b                         |       end
 0018d9: 0b                         |     end
 0018da: 20 09                      |     local.get 9
 0018dc: 41 04                      |     i32.const 4
 0018de: 6a                         |     i32.add
 0018df: 22 12                      |     local.tee 18
 0018e1: 20 0a                      |     local.get 10
 0018e3: 20 0a                      |     local.get 10
 0018e5: 20 12                      |     local.get 18
 0018e7: 4b                         |     i32.gt_u
 0018e8: 1b                         |     select
 0018e9: 21 0a                      |     local.set 10
 0018eb: 0b                         |   end
 0018ec: 02 40                      |   block
 0018ee: 03 40                      |     loop
 0018f0: 02 40                      |       block
 0018f2: 20 0a                      |         local.get 10
 0018f4: 22 12                      |         local.tee 18
 0018f6: 20 10                      |         local.get 16
 0018f8: 4b                         |         i32.gt_u
 0018f9: 0d 00                      |         br_if 0
 0018fb: 41 00                      |         i32.const 0
 0018fd: 21 15                      |         local.set 21
 0018ff: 0c 02                      |         br 2
 001901: 0b                         |       end
 001902: 20 12                      |       local.get 18
 001904: 41 7c                      |       i32.const 4294967292
 001906: 6a                         |       i32.add
 001907: 22 0a                      |       local.tee 10
 001909: 28 02 00                   |       i32.load 2 0
 00190c: 45                         |       i32.eqz
 00190d: 0d 00                      |       br_if 0
 00190f: 0b                         |     end
 001910: 41 01                      |     i32.const 1
 001912: 21 15                      |     local.set 21
 001914: 0b                         |   end
 001915: 02 40                      |   block
 001917: 02 40                      |     block
 001919: 20 0c                      |       local.get 12
 00191b: 41 e7 00                   |       i32.const 103
 00191e: 46                         |       i32.eq
 00191f: 0d 00                      |       br_if 0
 001921: 20 04                      |       local.get 4
 001923: 41 08                      |       i32.const 8
 001925: 71                         |       i32.and
 001926: 21 0f                      |       local.set 15
 001928: 0c 01                      |       br 1
 00192a: 0b                         |     end
 00192b: 20 0d                      |     local.get 13
 00192d: 41 7f                      |     i32.const 4294967295
 00192f: 73                         |     i32.xor
 001930: 41 7f                      |     i32.const 4294967295
 001932: 20 0e                      |     local.get 14
 001934: 41 01                      |     i32.const 1
 001936: 20 0e                      |     local.get 14
 001938: 1b                         |     select
 001939: 22 0a                      |     local.tee 10
 00193b: 20 0d                      |     local.get 13
 00193d: 4a                         |     i32.gt_s
 00193e: 20 0d                      |     local.get 13
 001940: 41 7b                      |     i32.const 4294967291
 001942: 4a                         |     i32.gt_s
 001943: 71                         |     i32.and
 001944: 22 03                      |     local.tee 3
 001946: 1b                         |     select
 001947: 20 0a                      |     local.get 10
 001949: 6a                         |     i32.add
 00194a: 21 0e                      |     local.set 14
 00194c: 41 7f                      |     i32.const 4294967295
 00194e: 41 7e                      |     i32.const 4294967294
 001950: 20 03                      |     local.get 3
 001952: 1b                         |     select
 001953: 20 05                      |     local.get 5
 001955: 6a                         |     i32.add
 001956: 21 05                      |     local.set 5
 001958: 20 04                      |     local.get 4
 00195a: 41 08                      |     i32.const 8
 00195c: 71                         |     i32.and
 00195d: 22 0f                      |     local.tee 15
 00195f: 0d 00                      |     br_if 0
 001961: 41 09                      |     i32.const 9
 001963: 21 0a                      |     local.set 10
 001965: 02 40                      |     block
 001967: 20 15                      |       local.get 21
 001969: 45                         |       i32.eqz
 00196a: 0d 00                      |       br_if 0
 00196c: 41 09                      |       i32.const 9
 00196e: 21 0a                      |       local.set 10
 001970: 20 12                      |       local.get 18
 001972: 41 7c                      |       i32.const 4294967292
 001974: 6a                         |       i32.add
 001975: 28 02 00                   |       i32.load 2 0
 001978: 22 09                      |       local.tee 9
 00197a: 45                         |       i32.eqz
 00197b: 0d 00                      |       br_if 0
 00197d: 41 0a                      |       i32.const 10
 00197f: 21 03                      |       local.set 3
 001981: 41 00                      |       i32.const 0
 001983: 21 0a                      |       local.set 10
 001985: 20 09                      |       local.get 9
 001987: 41 0a                      |       i32.const 10
 001989: 70                         |       i32.rem_u
 00198a: 0d 00                      |       br_if 0
 00198c: 03 40                      |       loop
 00198e: 20 0a                      |         local.get 10
 001990: 41 01                      |         i32.const 1
 001992: 6a                         |         i32.add
 001993: 21 0a                      |         local.set 10
 001995: 20 09                      |         local.get 9
 001997: 20 03                      |         local.get 3
 001999: 41 0a                      |         i32.const 10
 00199b: 6c                         |         i32.mul
 00199c: 22 03                      |         local.tee 3
 00199e: 70                         |         i32.rem_u
 00199f: 45                         |         i32.eqz
 0019a0: 0d 00                      |         br_if 0
 0019a2: 0b                         |       end
 0019a3: 0b                         |     end
 0019a4: 20 12                      |     local.get 18
 0019a6: 20 13                      |     local.get 19
 0019a8: 6b                         |     i32.sub
 0019a9: 41 02                      |     i32.const 2
 0019ab: 75                         |     i32.shr_s
 0019ac: 41 09                      |     i32.const 9
 0019ae: 6c                         |     i32.mul
 0019af: 41 77                      |     i32.const 4294967287
 0019b1: 6a                         |     i32.add
 0019b2: 21 03                      |     local.set 3
 0019b4: 02 40                      |     block
 0019b6: 20 05                      |       local.get 5
 0019b8: 41 20                      |       i32.const 32
 0019ba: 72                         |       i32.or
 0019bb: 41 e6 00                   |       i32.const 102
 0019be: 47                         |       i32.ne
 0019bf: 0d 00                      |       br_if 0
 0019c1: 41 00                      |       i32.const 0
 0019c3: 21 0f                      |       local.set 15
 0019c5: 20 0e                      |       local.get 14
 0019c7: 20 03                      |       local.get 3
 0019c9: 20 0a                      |       local.get 10
 0019cb: 6b                         |       i32.sub
 0019cc: 22 0a                      |       local.tee 10
 0019ce: 41 00                      |       i32.const 0
 0019d0: 20 0a                      |       local.get 10
 0019d2: 41 00                      |       i32.const 0
 0019d4: 4a                         |       i32.gt_s
 0019d5: 1b                         |       select
 0019d6: 22 0a                      |       local.tee 10
 0019d8: 20 0e                      |       local.get 14
 0019da: 20 0a                      |       local.get 10
 0019dc: 48                         |       i32.lt_s
 0019dd: 1b                         |       select
 0019de: 21 0e                      |       local.set 14
 0019e0: 0c 01                      |       br 1
 0019e2: 0b                         |     end
 0019e3: 41 00                      |     i32.const 0
 0019e5: 21 0f                      |     local.set 15
 0019e7: 20 0e                      |     local.get 14
 0019e9: 20 03                      |     local.get 3
 0019eb: 20 0d                      |     local.get 13
 0019ed: 6a                         |     i32.add
 0019ee: 20 0a                      |     local.get 10
 0019f0: 6b                         |     i32.sub
 0019f1: 22 0a                      |     local.tee 10
 0019f3: 41 00                      |     i32.const 0
 0019f5: 20 0a                      |     local.get 10
 0019f7: 41 00                      |     i32.const 0
 0019f9: 4a                         |     i32.gt_s
 0019fa: 1b                         |     select
 0019fb: 22 0a                      |     local.tee 10
 0019fd: 20 0e                      |     local.get 14
 0019ff: 20 0a                      |     local.get 10
 001a01: 48                         |     i32.lt_s
 001a02: 1b                         |     select
 001a03: 21 0e                      |     local.set 14
 001a05: 0b                         |   end
 001a06: 20 0e                      |   local.get 14
 001a08: 20 0f                      |   local.get 15
 001a0a: 72                         |   i32.or
 001a0b: 22 0c                      |   local.tee 12
 001a0d: 41 00                      |   i32.const 0
 001a0f: 47                         |   i32.ne
 001a10: 21 03                      |   local.set 3
 001a12: 02 40                      |   block
 001a14: 02 40                      |     block
 001a16: 20 05                      |       local.get 5
 001a18: 41 20                      |       i32.const 32
 001a1a: 72                         |       i32.or
 001a1b: 22 11                      |       local.tee 17
 001a1d: 41 e6 00                   |       i32.const 102
 001a20: 47                         |       i32.ne
 001a21: 0d 00                      |       br_if 0
 001a23: 20 0d                      |       local.get 13
 001a25: 41 00                      |       i32.const 0
 001a27: 20 0d                      |       local.get 13
 001a29: 41 00                      |       i32.const 0
 001a2b: 4a                         |       i32.gt_s
 001a2c: 1b                         |       select
 001a2d: 21 0a                      |       local.set 10
 001a2f: 0c 01                      |       br 1
 001a31: 0b                         |     end
 001a32: 02 40                      |     block
 001a34: 20 0b                      |       local.get 11
 001a36: 20 0d                      |       local.get 13
 001a38: 20 0d                      |       local.get 13
 001a3a: 41 1f                      |       i32.const 31
 001a3c: 75                         |       i32.shr_s
 001a3d: 22 0a                      |       local.tee 10
 001a3f: 6a                         |       i32.add
 001a40: 20 0a                      |       local.get 10
 001a42: 73                         |       i32.xor
 001a43: ad                         |       i64.extend_i32_u
 001a44: 20 0b                      |       local.get 11
 001a46: 10 13                      |       call 19
 001a48: 22 0a                      |       local.tee 10
 001a4a: 6b                         |       i32.sub
 001a4b: 41 01                      |       i32.const 1
 001a4d: 4a                         |       i32.gt_s
 001a4e: 0d 00                      |       br_if 0
 001a50: 03 40                      |       loop
 001a52: 20 0a                      |         local.get 10
 001a54: 41 7f                      |         i32.const 4294967295
 001a56: 6a                         |         i32.add
 001a57: 22 0a                      |         local.tee 10
 001a59: 41 30                      |         i32.const 48
 001a5b: 3a 00 00                   |         i32.store8 0 0
 001a5e: 20 0b                      |         local.get 11
 001a60: 20 0a                      |         local.get 10
 001a62: 6b                         |         i32.sub
 001a63: 41 02                      |         i32.const 2
 001a65: 48                         |         i32.lt_s
 001a66: 0d 00                      |         br_if 0
 001a68: 0b                         |       end
 001a69: 0b                         |     end
 001a6a: 20 0a                      |     local.get 10
 001a6c: 41 7e                      |     i32.const 4294967294
 001a6e: 6a                         |     i32.add
 001a6f: 22 14                      |     local.tee 20
 001a71: 20 05                      |     local.get 5
 001a73: 3a 00 00                   |     i32.store8 0 0
 001a76: 20 0a                      |     local.get 10
 001a78: 41 7f                      |     i32.const 4294967295
 001a7a: 6a                         |     i32.add
 001a7b: 41 2d                      |     i32.const 45
 001a7d: 41 2b                      |     i32.const 43
 001a7f: 20 0d                      |     local.get 13
 001a81: 41 00                      |     i32.const 0
 001a83: 48                         |     i32.lt_s
 001a84: 1b                         |     select
 001a85: 3a 00 00                   |     i32.store8 0 0
 001a88: 20 0b                      |     local.get 11
 001a8a: 20 14                      |     local.get 20
 001a8c: 6b                         |     i32.sub
 001a8d: 21 0a                      |     local.set 10
 001a8f: 0b                         |   end
 001a90: 20 00                      |   local.get 0
 001a92: 41 20                      |   i32.const 32
 001a94: 20 02                      |   local.get 2
 001a96: 20 07                      |   local.get 7
 001a98: 20 0e                      |   local.get 14
 001a9a: 6a                         |   i32.add
 001a9b: 20 03                      |   local.get 3
 001a9d: 6a                         |   i32.add
 001a9e: 20 0a                      |   local.get 10
 001aa0: 6a                         |   i32.add
 001aa1: 41 01                      |   i32.const 1
 001aa3: 6a                         |   i32.add
 001aa4: 22 09                      |   local.tee 9
 001aa6: 20 04                      |   local.get 4
 001aa8: 10 10                      |   call 16
 001aaa: 20 00                      |   local.get 0
 001aac: 20 08                      |   local.get 8
 001aae: 20 07                      |   local.get 7
 001ab0: 10 0d                      |   call 13
 001ab2: 20 00                      |   local.get 0
 001ab4: 41 30                      |   i32.const 48
 001ab6: 20 02                      |   local.get 2
 001ab8: 20 09                      |   local.get 9
 001aba: 20 04                      |   local.get 4
 001abc: 41 80 80 04                |   i32.const 65536
 001ac0: 73                         |   i32.xor
 001ac1: 10 10                      |   call 16
 001ac3: 02 40                      |   block
 001ac5: 02 40                      |     block
 001ac7: 20 11                      |       local.get 17
 001ac9: 41 e6 00                   |       i32.const 102
 001acc: 47                         |       i32.ne
 001acd: 0d 00                      |       br_if 0
 001acf: 20 06                      |       local.get 6
 001ad1: 41 10                      |       i32.const 16
 001ad3: 6a                         |       i32.add
 001ad4: 41 08                      |       i32.const 8
 001ad6: 72                         |       i32.or
 001ad7: 21 11                      |       local.set 17
 001ad9: 20 06                      |       local.get 6
 001adb: 41 10                      |       i32.const 16
 001add: 6a                         |       i32.add
 001ade: 41 09                      |       i32.const 9
 001ae0: 72                         |       i32.or
 001ae1: 21 0d                      |       local.set 13
 001ae3: 20 13                      |       local.get 19
 001ae5: 20 10                      |       local.get 16
 001ae7: 20 10                      |       local.get 16
 001ae9: 20 13                      |       local.get 19
 001aeb: 4b                         |       i32.gt_u
 001aec: 1b                         |       select
 001aed: 22 03                      |       local.tee 3
 001aef: 21 10                      |       local.set 16
 001af1: 03 40                      |       loop
 001af3: 20 10                      |         local.get 16
 001af5: 35 02 00                   |         i64.load32_u 2 0
 001af8: 20 0d                      |         local.get 13
 001afa: 10 13                      |         call 19
 001afc: 21 0a                      |         local.set 10
 001afe: 02 40                      |         block
 001b00: 02 40                      |           block
 001b02: 20 10                      |             local.get 16
 001b04: 20 03                      |             local.get 3
 001b06: 46                         |             i32.eq
 001b07: 0d 00                      |             br_if 0
 001b09: 20 0a                      |             local.get 10
 001b0b: 20 06                      |             local.get 6
 001b0d: 41 10                      |             i32.const 16
 001b0f: 6a                         |             i32.add
 001b10: 4d                         |             i32.le_u
 001b11: 0d 01                      |             br_if 1
 001b13: 03 40                      |             loop
 001b15: 20 0a                      |               local.get 10
 001b17: 41 7f                      |               i32.const 4294967295
 001b19: 6a                         |               i32.add
 001b1a: 22 0a                      |               local.tee 10
 001b1c: 41 30                      |               i32.const 48
 001b1e: 3a 00 00                   |               i32.store8 0 0
 001b21: 20 0a                      |               local.get 10
 001b23: 20 06                      |               local.get 6
 001b25: 41 10                      |               i32.const 16
 001b27: 6a                         |               i32.add
 001b28: 4b                         |               i32.gt_u
 001b29: 0d 00                      |               br_if 0
 001b2b: 0c 02                      |               br 2
 001b2d: 00                         |               unreachable
 001b2e: 0b                         |             end
 001b2f: 00                         |             unreachable
 001b30: 0b                         |           end
 001b31: 20 0a                      |           local.get 10
 001b33: 20 0d                      |           local.get 13
 001b35: 47                         |           i32.ne
 001b36: 0d 00                      |           br_if 0
 001b38: 20 06                      |           local.get 6
 001b3a: 41 30                      |           i32.const 48
 001b3c: 3a 00 18                   |           i32.store8 0 24
 001b3f: 20 11                      |           local.get 17
 001b41: 21 0a                      |           local.set 10
 001b43: 0b                         |         end
 001b44: 20 00                      |         local.get 0
 001b46: 20 0a                      |         local.get 10
 001b48: 20 0d                      |         local.get 13
 001b4a: 20 0a                      |         local.get 10
 001b4c: 6b                         |         i32.sub
 001b4d: 10 0d                      |         call 13
 001b4f: 20 10                      |         local.get 16
 001b51: 41 04                      |         i32.const 4
 001b53: 6a                         |         i32.add
 001b54: 22 10                      |         local.tee 16
 001b56: 20 13                      |         local.get 19
 001b58: 4d                         |         i32.le_u
 001b59: 0d 00                      |         br_if 0
 001b5b: 0b                         |       end
 001b5c: 02 40                      |       block
 001b5e: 20 0c                      |         local.get 12
 001b60: 45                         |         i32.eqz
 001b61: 0d 00                      |         br_if 0
 001b63: 20 00                      |         local.get 0
 001b65: 41 a3 0c                   |         i32.const 1571
 001b68: 41 01                      |         i32.const 1
 001b6a: 10 0d                      |         call 13
 001b6c: 0b                         |       end
 001b6d: 02 40                      |       block
 001b6f: 20 10                      |         local.get 16
 001b71: 20 12                      |         local.get 18
 001b73: 4f                         |         i32.ge_u
 001b74: 0d 00                      |         br_if 0
 001b76: 20 0e                      |         local.get 14
 001b78: 41 01                      |         i32.const 1
 001b7a: 48                         |         i32.lt_s
 001b7b: 0d 00                      |         br_if 0
 001b7d: 03 40                      |         loop
 001b7f: 02 40                      |           block
 001b81: 20 10                      |             local.get 16
 001b83: 35 02 00                   |             i64.load32_u 2 0
 001b86: 20 0d                      |             local.get 13
 001b88: 10 13                      |             call 19
 001b8a: 22 0a                      |             local.tee 10
 001b8c: 20 06                      |             local.get 6
 001b8e: 41 10                      |             i32.const 16
 001b90: 6a                         |             i32.add
 001b91: 4d                         |             i32.le_u
 001b92: 0d 00                      |             br_if 0
 001b94: 03 40                      |             loop
 001b96: 20 0a                      |               local.get 10
 001b98: 41 7f                      |               i32.const 4294967295
 001b9a: 6a                         |               i32.add
 001b9b: 22 0a                      |               local.tee 10
 001b9d: 41 30                      |               i32.const 48
 001b9f: 3a 00 00                   |               i32.store8 0 0
 001ba2: 20 0a                      |               local.get 10
 001ba4: 20 06                      |               local.get 6
 001ba6: 41 10                      |               i32.const 16
 001ba8: 6a                         |               i32.add
 001ba9: 4b                         |               i32.gt_u
 001baa: 0d 00                      |               br_if 0
 001bac: 0b                         |             end
 001bad: 0b                         |           end
 001bae: 20 00                      |           local.get 0
 001bb0: 20 0a                      |           local.get 10
 001bb2: 20 0e                      |           local.get 14
 001bb4: 41 09                      |           i32.const 9
 001bb6: 20 0e                      |           local.get 14
 001bb8: 41 09                      |           i32.const 9
 001bba: 48                         |           i32.lt_s
 001bbb: 1b                         |           select
 001bbc: 10 0d                      |           call 13
 001bbe: 20 0e                      |           local.get 14
 001bc0: 41 77                      |           i32.const 4294967287
 001bc2: 6a                         |           i32.add
 001bc3: 21 0e                      |           local.set 14
 001bc5: 20 10                      |           local.get 16
 001bc7: 41 04                      |           i32.const 4
 001bc9: 6a                         |           i32.add
 001bca: 22 10                      |           local.tee 16
 001bcc: 20 12                      |           local.get 18
 001bce: 4f                         |           i32.ge_u
 001bcf: 0d 01                      |           br_if 1
 001bd1: 20 0e                      |           local.get 14
 001bd3: 41 00                      |           i32.const 0
 001bd5: 4a                         |           i32.gt_s
 001bd6: 0d 00                      |           br_if 0
 001bd8: 0b                         |         end
 001bd9: 0b                         |       end
 001bda: 20 00                      |       local.get 0
 001bdc: 41 30                      |       i32.const 48
 001bde: 20 0e                      |       local.get 14
 001be0: 41 09                      |       i32.const 9
 001be2: 6a                         |       i32.add
 001be3: 41 09                      |       i32.const 9
 001be5: 41 00                      |       i32.const 0
 001be7: 10 10                      |       call 16
 001be9: 0c 01                      |       br 1
 001beb: 0b                         |     end
 001bec: 02 40                      |     block
 001bee: 20 0e                      |       local.get 14
 001bf0: 41 00                      |       i32.const 0
 001bf2: 48                         |       i32.lt_s
 001bf3: 0d 00                      |       br_if 0
 001bf5: 20 12                      |       local.get 18
 001bf7: 20 10                      |       local.get 16
 001bf9: 41 04                      |       i32.const 4
 001bfb: 6a                         |       i32.add
 001bfc: 20 15                      |       local.get 21
 001bfe: 1b                         |       select
 001bff: 21 11                      |       local.set 17
 001c01: 20 06                      |       local.get 6
 001c03: 41 10                      |       i32.const 16
 001c05: 6a                         |       i32.add
 001c06: 41 08                      |       i32.const 8
 001c08: 72                         |       i32.or
 001c09: 21 13                      |       local.set 19
 001c0b: 20 06                      |       local.get 6
 001c0d: 41 10                      |       i32.const 16
 001c0f: 6a                         |       i32.add
 001c10: 41 09                      |       i32.const 9
 001c12: 72                         |       i32.or
 001c13: 21 12                      |       local.set 18
 001c15: 20 10                      |       local.get 16
 001c17: 21 0d                      |       local.set 13
 001c19: 03 40                      |       loop
 001c1b: 02 40                      |         block
 001c1d: 20 0d                      |           local.get 13
 001c1f: 35 02 00                   |           i64.load32_u 2 0
 001c22: 20 12                      |           local.get 18
 001c24: 10 13                      |           call 19
 001c26: 22 0a                      |           local.tee 10
 001c28: 20 12                      |           local.get 18
 001c2a: 47                         |           i32.ne
 001c2b: 0d 00                      |           br_if 0
 001c2d: 20 06                      |           local.get 6
 001c2f: 41 30                      |           i32.const 48
 001c31: 3a 00 18                   |           i32.store8 0 24
 001c34: 20 13                      |           local.get 19
 001c36: 21 0a                      |           local.set 10
 001c38: 0b                         |         end
 001c39: 02 40                      |         block
 001c3b: 02 40                      |           block
 001c3d: 20 0d                      |             local.get 13
 001c3f: 20 10                      |             local.get 16
 001c41: 46                         |             i32.eq
 001c42: 0d 00                      |             br_if 0
 001c44: 20 0a                      |             local.get 10
 001c46: 20 06                      |             local.get 6
 001c48: 41 10                      |             i32.const 16
 001c4a: 6a                         |             i32.add
 001c4b: 4d                         |             i32.le_u
 001c4c: 0d 01                      |             br_if 1
 001c4e: 03 40                      |             loop
 001c50: 20 0a                      |               local.get 10
 001c52: 41 7f                      |               i32.const 4294967295
 001c54: 6a                         |               i32.add
 001c55: 22 0a                      |               local.tee 10
 001c57: 41 30                      |               i32.const 48
 001c59: 3a 00 00                   |               i32.store8 0 0
 001c5c: 20 0a                      |               local.get 10
 001c5e: 20 06                      |               local.get 6
 001c60: 41 10                      |               i32.const 16
 001c62: 6a                         |               i32.add
 001c63: 4b                         |               i32.gt_u
 001c64: 0d 00                      |               br_if 0
 001c66: 0c 02                      |               br 2
 001c68: 00                         |               unreachable
 001c69: 0b                         |             end
 001c6a: 00                         |             unreachable
 001c6b: 0b                         |           end
 001c6c: 20 00                      |           local.get 0
 001c6e: 20 0a                      |           local.get 10
 001c70: 41 01                      |           i32.const 1
 001c72: 10 0d                      |           call 13
 001c74: 20 0a                      |           local.get 10
 001c76: 41 01                      |           i32.const 1
 001c78: 6a                         |           i32.add
 001c79: 21 0a                      |           local.set 10
 001c7b: 02 40                      |           block
 001c7d: 20 0f                      |             local.get 15
 001c7f: 0d 00                      |             br_if 0
 001c81: 20 0e                      |             local.get 14
 001c83: 41 01                      |             i32.const 1
 001c85: 48                         |             i32.lt_s
 001c86: 0d 01                      |             br_if 1
 001c88: 0b                         |           end
 001c89: 20 00                      |           local.get 0
 001c8b: 41 a3 0c                   |           i32.const 1571
 001c8e: 41 01                      |           i32.const 1
 001c90: 10 0d                      |           call 13
 001c92: 0b                         |         end
 001c93: 20 00                      |         local.get 0
 001c95: 20 0a                      |         local.get 10
 001c97: 20 12                      |         local.get 18
 001c99: 20 0a                      |         local.get 10
 001c9b: 6b                         |         i32.sub
 001c9c: 22 03                      |         local.tee 3
 001c9e: 20 0e                      |         local.get 14
 001ca0: 20 0e                      |         local.get 14
 001ca2: 20 03                      |         local.get 3
 001ca4: 4a                         |         i32.gt_s
 001ca5: 1b                         |         select
 001ca6: 10 0d                      |         call 13
 001ca8: 20 0e                      |         local.get 14
 001caa: 20 03                      |         local.get 3
 001cac: 6b                         |         i32.sub
 001cad: 21 0e                      |         local.set 14
 001caf: 20 0d                      |         local.get 13
 001cb1: 41 04                      |         i32.const 4
 001cb3: 6a                         |         i32.add
 001cb4: 22 0d                      |         local.tee 13
 001cb6: 20 11                      |         local.get 17
 001cb8: 4f                         |         i32.ge_u
 001cb9: 0d 01                      |         br_if 1
 001cbb: 20 0e                      |         local.get 14
 001cbd: 41 7f                      |         i32.const 4294967295
 001cbf: 4a                         |         i32.gt_s
 001cc0: 0d 00                      |         br_if 0
 001cc2: 0b                         |       end
 001cc3: 0b                         |     end
 001cc4: 20 00                      |     local.get 0
 001cc6: 41 30                      |     i32.const 48
 001cc8: 20 0e                      |     local.get 14
 001cca: 41 12                      |     i32.const 18
 001ccc: 6a                         |     i32.add
 001ccd: 41 12                      |     i32.const 18
 001ccf: 41 00                      |     i32.const 0
 001cd1: 10 10                      |     call 16
 001cd3: 20 00                      |     local.get 0
 001cd5: 20 14                      |     local.get 20
 001cd7: 20 0b                      |     local.get 11
 001cd9: 20 14                      |     local.get 20
 001cdb: 6b                         |     i32.sub
 001cdc: 10 0d                      |     call 13
 001cde: 0b                         |   end
 001cdf: 20 00                      |   local.get 0
 001ce1: 41 20                      |   i32.const 32
 001ce3: 20 02                      |   local.get 2
 001ce5: 20 09                      |   local.get 9
 001ce7: 20 04                      |   local.get 4
 001ce9: 41 80 c0 00                |   i32.const 8192
 001ced: 73                         |   i32.xor
 001cee: 10 10                      |   call 16
 001cf0: 0b                         | end
 001cf1: 20 06                      | local.get 6
 001cf3: 41 b0 04                   | i32.const 560
 001cf6: 6a                         | i32.add
 001cf7: 24 00                      | global.set 0
 001cf9: 20 02                      | local.get 2
 001cfb: 20 09                      | local.get 9
 001cfd: 20 09                      | local.get 9
 001cff: 20 02                      | local.get 2
 001d01: 48                         | i32.lt_s
 001d02: 1b                         | select
 001d03: 0b                         | end
001d05 func[22]:
 001d06: 01 7f                      | local[0] type=i32
 001d08: 20 01                      | local.get 1
 001d0a: 20 01                      | local.get 1
 001d0c: 28 02 00                   | i32.load 2 0
 001d0f: 41 0f                      | i32.const 15
 001d11: 6a                         | i32.add
 001d12: 41 70                      | i32.const 4294967280
 001d14: 71                         | i32.and
 001d15: 22 02                      | local.tee 2
 001d17: 41 10                      | i32.const 16
 001d19: 6a                         | i32.add
 001d1a: 36 02 00                   | i32.store 2 0
 001d1d: 20 00                      | local.get 0
 001d1f: 20 02                      | local.get 2
 001d21: 29 03 00                   | i64.load 3 0
 001d24: 20 02                      | local.get 2
 001d26: 29 03 08                   | i64.load 3 8
 001d29: 10 2a                      | call 42
 001d2b: 39 03 00                   | f64.store 3 0
 001d2e: 0b                         | end
001d30 func[23]:
 001d31: 20 00                      | local.get 0
 001d33: bd                         | i64.reinterpret_f64
 001d34: 0b                         | end
001d36 func[24]:
 001d37: 41 c8 0f                   | i32.const 1992
 001d3a: 10 2d                      | call 45
 001d3c: 41 d0 0f                   | i32.const 2000
 001d3f: 0b                         | end
001d41 func[25]:
 001d42: 41 c8 0f                   | i32.const 1992
 001d45: 10 2e                      | call 46
 001d47: 0b                         | end
001d49 func[26]:
 001d4a: 01 7f                      | local[0] type=i32
 001d4c: 20 00                      | local.get 0
 001d4e: 20 00                      | local.get 0
 001d50: 2d 00 4a                   | i32.load8_u 0 74
 001d53: 22 01                      | local.tee 1
 001d55: 41 7f                      | i32.const 4294967295
 001d57: 6a                         | i32.add
 001d58: 20 01                      | local.get 1
 001d5a: 72                         | i32.or
 001d5b: 3a 00 4a                   | i32.store8 0 74
 001d5e: 02 40                      | block
 001d60: 20 00                      |   local.get 0
 001d62: 28 02 00                   |   i32.load 2 0
 001d65: 22 01                      |   local.tee 1
 001d67: 41 08                      |   i32.const 8
 001d69: 71                         |   i32.and
 001d6a: 45                         |   i32.eqz
 001d6b: 0d 00                      |   br_if 0
 001d6d: 20 00                      |   local.get 0
 001d6f: 20 01                      |   local.get 1
 001d71: 41 20                      |   i32.const 32
 001d73: 72                         |   i32.or
 001d74: 36 02 00                   |   i32.store 2 0
 001d77: 41 7f                      |   i32.const 4294967295
 001d79: 0f                         |   return
 001d7a: 0b                         | end
 001d7b: 20 00                      | local.get 0
 001d7d: 42 00                      | i64.const 0
 001d7f: 37 02 04                   | i64.store 2 4
 001d82: 20 00                      | local.get 0
 001d84: 20 00                      | local.get 0
 001d86: 28 02 2c                   | i32.load 2 44
 001d89: 22 01                      | local.tee 1
 001d8b: 36 02 1c                   | i32.store 2 28
 001d8e: 20 00                      | local.get 0
 001d90: 20 01                      | local.get 1
 001d92: 36 02 14                   | i32.store 2 20
 001d95: 20 00                      | local.get 0
 001d97: 20 01                      | local.get 1
 001d99: 20 00                      | local.get 0
 001d9b: 28 02 30                   | i32.load 2 48
 001d9e: 6a                         | i32.add
 001d9f: 36 02 10                   | i32.store 2 16
 001da2: 41 00                      | i32.const 0
 001da4: 0b                         | end
001da7 func[27]:
 001da8: 04 7f                      | local[0..3] type=i32
 001daa: 02 40                      | block
 001dac: 02 40                      |   block
 001dae: 20 02                      |     local.get 2
 001db0: 28 02 10                   |     i32.load 2 16
 001db3: 22 03                      |     local.tee 3
 001db5: 0d 00                      |     br_if 0
 001db7: 41 00                      |     i32.const 0
 001db9: 21 04                      |     local.set 4
 001dbb: 20 02                      |     local.get 2
 001dbd: 10 1a                      |     call 26
 001dbf: 0d 01                      |     br_if 1
 001dc1: 20 02                      |     local.get 2
 001dc3: 28 02 10                   |     i32.load 2 16
 001dc6: 21 03                      |     local.set 3
 001dc8: 0b                         |   end
 001dc9: 02 40                      |   block
 001dcb: 20 03                      |     local.get 3
 001dcd: 20 02                      |     local.get 2
 001dcf: 28 02 14                   |     i32.load 2 20
 001dd2: 22 05                      |     local.tee 5
 001dd4: 6b                         |     i32.sub
 001dd5: 20 01                      |     local.get 1
 001dd7: 4f                         |     i32.ge_u
 001dd8: 0d 00                      |     br_if 0
 001dda: 20 02                      |     local.get 2
 001ddc: 20 00                      |     local.get 0
 001dde: 20 01                      |     local.get 1
 001de0: 20 02                      |     local.get 2
 001de2: 28 02 24                   |     i32.load 2 36
 001de5: 11 00 00                   |     call_indirect 0 0
 001de8: 0f                         |     return
 001de9: 0b                         |   end
 001dea: 41 00                      |   i32.const 0
 001dec: 21 06                      |   local.set 6
 001dee: 02 40                      |   block
 001df0: 20 02                      |     local.get 2
 001df2: 2c 00 4b                   |     i32.load8_s 0 75
 001df5: 41 00                      |     i32.const 0
 001df7: 48                         |     i32.lt_s
 001df8: 0d 00                      |     br_if 0
 001dfa: 20 01                      |     local.get 1
 001dfc: 21 04                      |     local.set 4
 001dfe: 03 40                      |     loop
 001e00: 20 04                      |       local.get 4
 001e02: 22 03                      |       local.tee 3
 001e04: 45                         |       i32.eqz
 001e05: 0d 01                      |       br_if 1
 001e07: 20 00                      |       local.get 0
 001e09: 20 03                      |       local.get 3
 001e0b: 41 7f                      |       i32.const 4294967295
 001e0d: 6a                         |       i32.add
 001e0e: 22 04                      |       local.tee 4
 001e10: 6a                         |       i32.add
 001e11: 2d 00 00                   |       i32.load8_u 0 0
 001e14: 41 0a                      |       i32.const 10
 001e16: 47                         |       i32.ne
 001e17: 0d 00                      |       br_if 0
 001e19: 0b                         |     end
 001e1a: 20 02                      |     local.get 2
 001e1c: 20 00                      |     local.get 0
 001e1e: 20 03                      |     local.get 3
 001e20: 20 02                      |     local.get 2
 001e22: 28 02 24                   |     i32.load 2 36
 001e25: 11 00 00                   |     call_indirect 0 0
 001e28: 22 04                      |     local.tee 4
 001e2a: 20 03                      |     local.get 3
 001e2c: 49                         |     i32.lt_u
 001e2d: 0d 01                      |     br_if 1
 001e2f: 20 01                      |     local.get 1
 001e31: 20 03                      |     local.get 3
 001e33: 6b                         |     i32.sub
 001e34: 21 01                      |     local.set 1
 001e36: 20 00                      |     local.get 0
 001e38: 20 03                      |     local.get 3
 001e3a: 6a                         |     i32.add
 001e3b: 21 00                      |     local.set 0
 001e3d: 20 02                      |     local.get 2
 001e3f: 28 02 14                   |     i32.load 2 20
 001e42: 21 05                      |     local.set 5
 001e44: 20 03                      |     local.get 3
 001e46: 21 06                      |     local.set 6
 001e48: 0b                         |   end
 001e49: 20 05                      |   local.get 5
 001e4b: 20 00                      |   local.get 0
 001e4d: 20 01                      |   local.get 1
 001e4f: 10 2b                      |   call 43
 001e51: 1a                         |   drop
 001e52: 20 02                      |   local.get 2
 001e54: 20 02                      |   local.get 2
 001e56: 28 02 14                   |   i32.load 2 20
 001e59: 20 01                      |   local.get 1
 001e5b: 6a                         |   i32.add
 001e5c: 36 02 14                   |   i32.store 2 20
 001e5f: 20 06                      |   local.get 6
 001e61: 20 01                      |   local.get 1
 001e63: 6a                         |   i32.add
 001e64: 21 04                      |   local.set 4
 001e66: 0b                         | end
 001e67: 20 04                      | local.get 4
 001e69: 0b                         | end
001e6c func[28]:
 001e6d: 06 7f                      | local[0..5] type=i32
 001e6f: 23 00                      | global.get 0
 001e71: 41 20                      | i32.const 32
 001e73: 6b                         | i32.sub
 001e74: 22 03                      | local.tee 3
 001e76: 24 00                      | global.set 0
 001e78: 20 03                      | local.get 3
 001e7a: 20 00                      | local.get 0
 001e7c: 28 02 1c                   | i32.load 2 28
 001e7f: 22 04                      | local.tee 4
 001e81: 36 02 10                   | i32.store 2 16
 001e84: 20 00                      | local.get 0
 001e86: 28 02 14                   | i32.load 2 20
 001e89: 21 05                      | local.set 5
 001e8b: 20 03                      | local.get 3
 001e8d: 20 02                      | local.get 2
 001e8f: 36 02 1c                   | i32.store 2 28
 001e92: 20 03                      | local.get 3
 001e94: 20 01                      | local.get 1
 001e96: 36 02 18                   | i32.store 2 24
 001e99: 20 03                      | local.get 3
 001e9b: 20 05                      | local.get 5
 001e9d: 20 04                      | local.get 4
 001e9f: 6b                         | i32.sub
 001ea0: 22 01                      | local.tee 1
 001ea2: 36 02 14                   | i32.store 2 20
 001ea5: 20 01                      | local.get 1
 001ea7: 20 02                      | local.get 2
 001ea9: 6a                         | i32.add
 001eaa: 21 06                      | local.set 6
 001eac: 41 02                      | i32.const 2
 001eae: 21 05                      | local.set 5
 001eb0: 20 03                      | local.get 3
 001eb2: 41 10                      | i32.const 16
 001eb4: 6a                         | i32.add
 001eb5: 21 01                      | local.set 1
 001eb7: 03 7f                      | loop i32
 001eb9: 02 40                      |   block
 001ebb: 02 40                      |     block
 001ebd: 20 00                      |       local.get 0
 001ebf: 28 02 3c                   |       i32.load 2 60
 001ec2: 20 01                      |       local.get 1
 001ec4: 20 05                      |       local.get 5
 001ec6: 20 03                      |       local.get 3
 001ec8: 41 0c                      |       i32.const 12
 001eca: 6a                         |       i32.add
 001ecb: 10 03                      |       call 3 <wasi_unstable.fd_write>
 001ecd: 10 27                      |       call 39
 001ecf: 45                         |       i32.eqz
 001ed0: 0d 00                      |       br_if 0
 001ed2: 41 7f                      |       i32.const 4294967295
 001ed4: 21 04                      |       local.set 4
 001ed6: 20 03                      |       local.get 3
 001ed8: 41 7f                      |       i32.const 4294967295
 001eda: 36 02 0c                   |       i32.store 2 12
 001edd: 0c 01                      |       br 1
 001edf: 0b                         |     end
 001ee0: 20 03                      |     local.get 3
 001ee2: 28 02 0c                   |     i32.load 2 12
 001ee5: 21 04                      |     local.set 4
 001ee7: 0b                         |   end
 001ee8: 02 40                      |   block
 001eea: 02 40                      |     block
 001eec: 02 40                      |       block
 001eee: 20 06                      |         local.get 6
 001ef0: 20 04                      |         local.get 4
 001ef2: 47                         |         i32.ne
 001ef3: 0d 00                      |         br_if 0
 001ef5: 20 00                      |         local.get 0
 001ef7: 20 00                      |         local.get 0
 001ef9: 28 02 2c                   |         i32.load 2 44
 001efc: 22 01                      |         local.tee 1
 001efe: 36 02 1c                   |         i32.store 2 28
 001f01: 20 00                      |         local.get 0
 001f03: 20 01                      |         local.get 1
 001f05: 36 02 14                   |         i32.store 2 20
 001f08: 20 00                      |         local.get 0
 001f0a: 20 01                      |         local.get 1
 001f0c: 20 00                      |         local.get 0
 001f0e: 28 02 30                   |         i32.load 2 48
 001f11: 6a                         |         i32.add
 001f12: 36 02 10                   |         i32.store 2 16
 001f15: 20 02                      |         local.get 2
 001f17: 21 04                      |         local.set 4
 001f19: 0c 01                      |         br 1
 001f1b: 0b                         |       end
 001f1c: 20 04                      |       local.get 4
 001f1e: 41 7f                      |       i32.const 4294967295
 001f20: 4a                         |       i32.gt_s
 001f21: 0d 01                      |       br_if 1
 001f23: 41 00                      |       i32.const 0
 001f25: 21 04                      |       local.set 4
 001f27: 20 00                      |       local.get 0
 001f29: 41 00                      |       i32.const 0
 001f2b: 36 02 1c                   |       i32.store 2 28
 001f2e: 20 00                      |       local.get 0
 001f30: 42 00                      |       i64.const 0
 001f32: 37 03 10                   |       i64.store 3 16
 001f35: 20 00                      |       local.get 0
 001f37: 20 00                      |       local.get 0
 001f39: 28 02 00                   |       i32.load 2 0
 001f3c: 41 20                      |       i32.const 32
 001f3e: 72                         |       i32.or
 001f3f: 36 02 00                   |       i32.store 2 0
 001f42: 20 05                      |       local.get 5
 001f44: 41 02                      |       i32.const 2
 001f46: 46                         |       i32.eq
 001f47: 0d 00                      |       br_if 0
 001f49: 20 02                      |       local.get 2
 001f4b: 20 01                      |       local.get 1
 001f4d: 28 02 04                   |       i32.load 2 4
 001f50: 6b                         |       i32.sub
 001f51: 21 04                      |       local.set 4
 001f53: 0b                         |     end
 001f54: 20 03                      |     local.get 3
 001f56: 41 20                      |     i32.const 32
 001f58: 6a                         |     i32.add
 001f59: 24 00                      |     global.set 0
 001f5b: 20 04                      |     local.get 4
 001f5d: 0f                         |     return
 001f5e: 0b                         |   end
 001f5f: 20 01                      |   local.get 1
 001f61: 41 08                      |   i32.const 8
 001f63: 6a                         |   i32.add
 001f64: 20 01                      |   local.get 1
 001f66: 20 04                      |   local.get 4
 001f68: 20 01                      |   local.get 1
 001f6a: 28 02 04                   |   i32.load 2 4
 001f6d: 22 07                      |   local.tee 7
 001f6f: 4b                         |   i32.gt_u
 001f70: 22 08                      |   local.tee 8
 001f72: 1b                         |   select
 001f73: 22 01                      |   local.tee 1
 001f75: 20 01                      |   local.get 1
 001f77: 28 02 00                   |   i32.load 2 0
 001f7a: 20 04                      |   local.get 4
 001f7c: 20 07                      |   local.get 7
 001f7e: 41 00                      |   i32.const 0
 001f80: 20 08                      |   local.get 8
 001f82: 1b                         |   select
 001f83: 6b                         |   i32.sub
 001f84: 22 07                      |   local.tee 7
 001f86: 6a                         |   i32.add
 001f87: 36 02 00                   |   i32.store 2 0
 001f8a: 20 01                      |   local.get 1
 001f8c: 20 01                      |   local.get 1
 001f8e: 28 02 04                   |   i32.load 2 4
 001f91: 20 07                      |   local.get 7
 001f93: 6b                         |   i32.sub
 001f94: 36 02 04                   |   i32.store 2 4
 001f97: 20 06                      |   local.get 6
 001f99: 20 04                      |   local.get 4
 001f9b: 6b                         |   i32.sub
 001f9c: 21 06                      |   local.set 6
 001f9e: 20 05                      |   local.get 5
 001fa0: 20 08                      |   local.get 8
 001fa2: 6b                         |   i32.sub
 001fa3: 21 05                      |   local.set 5
 001fa5: 0c 00                      |   br 0
 001fa7: 0b                         | end
 001fa8: 0b                         | end
001faa func[29]:
 001fab: 41 00                      | i32.const 0
 001fad: 0b                         | end
001faf func[30]:
 001fb0: 42 00                      | i64.const 0
 001fb2: 0b                         | end
001fb5 func[31]:
 001fb6: 04 7f                      | local[0..3] type=i32
 001fb8: 20 02                      | local.get 2
 001fba: 41 00                      | i32.const 0
 001fbc: 47                         | i32.ne
 001fbd: 21 03                      | local.set 3
 001fbf: 02 40                      | block
 001fc1: 02 40                      |   block
 001fc3: 02 40                      |     block
 001fc5: 02 40                      |       block
 001fc7: 20 02                      |         local.get 2
 001fc9: 45                         |         i32.eqz
 001fca: 0d 00                      |         br_if 0
 001fcc: 20 00                      |         local.get 0
 001fce: 41 03                      |         i32.const 3
 001fd0: 71                         |         i32.and
 001fd1: 45                         |         i32.eqz
 001fd2: 0d 00                      |         br_if 0
 001fd4: 20 01                      |         local.get 1
 001fd6: 41 ff 01                   |         i32.const 255
 001fd9: 71                         |         i32.and
 001fda: 21 04                      |         local.set 4
 001fdc: 03 40                      |         loop
 001fde: 20 00                      |           local.get 0
 001fe0: 2d 00 00                   |           i32.load8_u 0 0
 001fe3: 20 04                      |           local.get 4
 001fe5: 46                         |           i32.eq
 001fe6: 0d 02                      |           br_if 2
 001fe8: 20 00                      |           local.get 0
 001fea: 41 01                      |           i32.const 1
 001fec: 6a                         |           i32.add
 001fed: 21 00                      |           local.set 0
 001fef: 20 02                      |           local.get 2
 001ff1: 41 7f                      |           i32.const 4294967295
 001ff3: 6a                         |           i32.add
 001ff4: 22 02                      |           local.tee 2
 001ff6: 41 00                      |           i32.const 0
 001ff8: 47                         |           i32.ne
 001ff9: 21 03                      |           local.set 3
 001ffb: 20 02                      |           local.get 2
 001ffd: 45                         |           i32.eqz
 001ffe: 0d 01                      |           br_if 1
 002000: 20 00                      |           local.get 0
 002002: 41 03                      |           i32.const 3
 002004: 71                         |           i32.and
 002005: 0d 00                      |           br_if 0
 002007: 0b                         |         end
 002008: 0b                         |       end
 002009: 20 03                      |       local.get 3
 00200b: 45                         |       i32.eqz
 00200c: 0d 01                      |       br_if 1
 00200e: 0b                         |     end
 00200f: 20 00                      |     local.get 0
 002011: 2d 00 00                   |     i32.load8_u 0 0
 002014: 20 01                      |     local.get 1
 002016: 41 ff 01                   |     i32.const 255
 002019: 71                         |     i32.and
 00201a: 46                         |     i32.eq
 00201b: 0d 01                      |     br_if 1
 00201d: 02 40                      |     block
 00201f: 02 40                      |       block
 002021: 20 02                      |         local.get 2
 002023: 41 04                      |         i32.const 4
 002025: 49                         |         i32.lt_u
 002026: 0d 00                      |         br_if 0
 002028: 20 01                      |         local.get 1
 00202a: 41 ff 01                   |         i32.const 255
 00202d: 71                         |         i32.and
 00202e: 41 81 82 84 08             |         i32.const 16843009
 002033: 6c                         |         i32.mul
 002034: 21 04                      |         local.set 4
 002036: 20 02                      |         local.get 2
 002038: 41 7c                      |         i32.const 4294967292
 00203a: 6a                         |         i32.add
 00203b: 22 03                      |         local.tee 3
 00203d: 20 03                      |         local.get 3
 00203f: 41 7c                      |         i32.const 4294967292
 002041: 71                         |         i32.and
 002042: 22 03                      |         local.tee 3
 002044: 6b                         |         i32.sub
 002045: 21 05                      |         local.set 5
 002047: 20 03                      |         local.get 3
 002049: 20 00                      |         local.get 0
 00204b: 6a                         |         i32.add
 00204c: 41 04                      |         i32.const 4
 00204e: 6a                         |         i32.add
 00204f: 21 06                      |         local.set 6
 002051: 03 40                      |         loop
 002053: 20 00                      |           local.get 0
 002055: 28 02 00                   |           i32.load 2 0
 002058: 20 04                      |           local.get 4
 00205a: 73                         |           i32.xor
 00205b: 22 03                      |           local.tee 3
 00205d: 41 7f                      |           i32.const 4294967295
 00205f: 73                         |           i32.xor
 002060: 20 03                      |           local.get 3
 002062: 41 ff fd fb 77             |           i32.const 4278124287
 002067: 6a                         |           i32.add
 002068: 71                         |           i32.and
 002069: 41 80 81 82 84 78          |           i32.const 2155905152
 00206f: 71                         |           i32.and
 002070: 0d 02                      |           br_if 2
 002072: 20 00                      |           local.get 0
 002074: 41 04                      |           i32.const 4
 002076: 6a                         |           i32.add
 002077: 21 00                      |           local.set 0
 002079: 20 02                      |           local.get 2
 00207b: 41 7c                      |           i32.const 4294967292
 00207d: 6a                         |           i32.add
 00207e: 22 02                      |           local.tee 2
 002080: 41 03                      |           i32.const 3
 002082: 4b                         |           i32.gt_u
 002083: 0d 00                      |           br_if 0
 002085: 0b                         |         end
 002086: 20 05                      |         local.get 5
 002088: 21 02                      |         local.set 2
 00208a: 20 06                      |         local.get 6
 00208c: 21 00                      |         local.set 0
 00208e: 0b                         |       end
 00208f: 20 02                      |       local.get 2
 002091: 45                         |       i32.eqz
 002092: 0d 01                      |       br_if 1
 002094: 0b                         |     end
 002095: 20 01                      |     local.get 1
 002097: 41 ff 01                   |     i32.const 255
 00209a: 71                         |     i32.and
 00209b: 21 03                      |     local.set 3
 00209d: 03 40                      |     loop
 00209f: 20 00                      |       local.get 0
 0020a1: 2d 00 00                   |       i32.load8_u 0 0
 0020a4: 20 03                      |       local.get 3
 0020a6: 46                         |       i32.eq
 0020a7: 0d 02                      |       br_if 2
 0020a9: 20 00                      |       local.get 0
 0020ab: 41 01                      |       i32.const 1
 0020ad: 6a                         |       i32.add
 0020ae: 21 00                      |       local.set 0
 0020b0: 20 02                      |       local.get 2
 0020b2: 41 7f                      |       i32.const 4294967295
 0020b4: 6a                         |       i32.add
 0020b5: 22 02                      |       local.tee 2
 0020b7: 0d 00                      |       br_if 0
 0020b9: 0b                         |     end
 0020ba: 0b                         |   end
 0020bb: 41 00                      |   i32.const 0
 0020bd: 0f                         |   return
 0020be: 0b                         | end
 0020bf: 20 00                      | local.get 0
 0020c1: 0b                         | end
0020c4 func[32]:
 0020c5: 01 7f                      | local[0] type=i32
 0020c7: 01 7e                      | local[1] type=i64
 0020c9: 02 40                      | block
 0020cb: 20 00                      |   local.get 0
 0020cd: bd                         |   i64.reinterpret_f64
 0020ce: 22 03                      |   local.tee 3
 0020d0: 42 34                      |   i64.const 52
 0020d2: 88                         |   i64.shr_u
 0020d3: a7                         |   i32.wrap_i64
 0020d4: 41 ff 0f                   |   i32.const 2047
 0020d7: 71                         |   i32.and
 0020d8: 22 02                      |   local.tee 2
 0020da: 41 ff 0f                   |   i32.const 2047
 0020dd: 46                         |   i32.eq
 0020de: 0d 00                      |   br_if 0
 0020e0: 02 40                      |   block
 0020e2: 20 02                      |     local.get 2
 0020e4: 0d 00                      |     br_if 0
 0020e6: 02 40                      |     block
 0020e8: 02 40                      |       block
 0020ea: 20 00                      |         local.get 0
 0020ec: 44 00 00 00 00 00 00 00 00 |         f64.const 0x0p+0
 0020f5: 62                         |         f64.ne
 0020f6: 0d 00                      |         br_if 0
 0020f8: 41 00                      |         i32.const 0
 0020fa: 21 02                      |         local.set 2
 0020fc: 0c 01                      |         br 1
 0020fe: 0b                         |       end
 0020ff: 20 00                      |       local.get 0
 002101: 44 00 00 00 00 00 00 f0 43 |       f64.const 0x1p+64
 00210a: a2                         |       f64.mul
 00210b: 20 01                      |       local.get 1
 00210d: 10 20                      |       call 32
 00210f: 21 00                      |       local.set 0
 002111: 20 01                      |       local.get 1
 002113: 28 02 00                   |       i32.load 2 0
 002116: 41 40                      |       i32.const 4294967232
 002118: 6a                         |       i32.add
 002119: 21 02                      |       local.set 2
 00211b: 0b                         |     end
 00211c: 20 01                      |     local.get 1
 00211e: 20 02                      |     local.get 2
 002120: 36 02 00                   |     i32.store 2 0
 002123: 20 00                      |     local.get 0
 002125: 0f                         |     return
 002126: 0b                         |   end
 002127: 20 01                      |   local.get 1
 002129: 20 02                      |   local.get 2
 00212b: 41 82 78                   |   i32.const 4294966274
 00212e: 6a                         |   i32.add
 00212f: 36 02 00                   |   i32.store 2 0
 002132: 20 03                      |   local.get 3
 002134: 42 ff ff ff ff ff ff ff 87 |   i64.const -9218868437227405313
 00213d: 80 7f                      | 
 00213f: 83                         |   i64.and
 002140: 42 80 80 80 80 80 80 80 f0 |   i64.const 4602678819172646912
 002149: 3f                         | 
 00214a: 84                         |   i64.or
 00214b: bf                         |   f64.reinterpret_i64
 00214c: 21 00                      |   local.set 0
 00214e: 0b                         | end
 00214f: 20 00                      | local.get 0
 002151: 0b                         | end
002153 func[33]:
 002154: 20 00                      | local.get 0
 002156: 41 50                      | i32.const 4294967248
 002158: 6a                         | i32.add
 002159: 41 0a                      | i32.const 10
 00215b: 49                         | i32.lt_u
 00215c: 0b                         | end
00215e func[34]:
 00215f: 02 40                      | block
 002161: 20 00                      |   local.get 0
 002163: 0d 00                      |   br_if 0
 002165: 41 00                      |   i32.const 0
 002167: 0f                         |   return
 002168: 0b                         | end
 002169: 20 00                      | local.get 0
 00216b: 20 01                      | local.get 1
 00216d: 41 00                      | i32.const 0
 00216f: 10 24                      | call 36
 002171: 0b                         | end
002173 func[35]:
 002174: 41 c4 0d                   | i32.const 1732
 002177: 0b                         | end
00217a func[36]:
 00217b: 01 7f                      | local[0] type=i32
 00217d: 41 01                      | i32.const 1
 00217f: 21 03                      | local.set 3
 002181: 02 40                      | block
 002183: 02 40                      |   block
 002185: 20 00                      |     local.get 0
 002187: 45                         |     i32.eqz
 002188: 0d 00                      |     br_if 0
 00218a: 20 01                      |     local.get 1
 00218c: 41 ff 00                   |     i32.const 127
 00218f: 4d                         |     i32.le_u
 002190: 0d 01                      |     br_if 1
 002192: 02 40                      |     block
 002194: 02 40                      |       block
 002196: 10 25                      |         call 37
 002198: 28 02 bc 01                |         i32.load 2 188
 00219c: 28 02 00                   |         i32.load 2 0
 00219f: 0d 00                      |         br_if 0
 0021a1: 20 01                      |         local.get 1
 0021a3: 41 80 7f                   |         i32.const 4294967168
 0021a6: 71                         |         i32.and
 0021a7: 41 80 bf 03                |         i32.const 57216
 0021ab: 46                         |         i32.eq
 0021ac: 0d 03                      |         br_if 3
 0021ae: 10 26                      |         call 38 <__errno_location>
 0021b0: 41 19                      |         i32.const 25
 0021b2: 36 02 00                   |         i32.store 2 0
 0021b5: 0c 01                      |         br 1
 0021b7: 0b                         |       end
 0021b8: 02 40                      |       block
 0021ba: 20 01                      |         local.get 1
 0021bc: 41 ff 0f                   |         i32.const 2047
 0021bf: 4b                         |         i32.gt_u
 0021c0: 0d 00                      |         br_if 0
 0021c2: 20 00                      |         local.get 0
 0021c4: 20 01                      |         local.get 1
 0021c6: 41 3f                      |         i32.const 63
 0021c8: 71                         |         i32.and
 0021c9: 41 80 01                   |         i32.const 128
 0021cc: 72                         |         i32.or
 0021cd: 3a 00 01                   |         i32.store8 0 1
 0021d0: 20 00                      |         local.get 0
 0021d2: 20 01                      |         local.get 1
 0021d4: 41 06                      |         i32.const 6
 0021d6: 76                         |         i32.shr_u
 0021d7: 41 c0 01                   |         i32.const 192
 0021da: 72                         |         i32.or
 0021db: 3a 00 00                   |         i32.store8 0 0
 0021de: 41 02                      |         i32.const 2
 0021e0: 0f                         |         return
 0021e1: 0b                         |       end
 0021e2: 02 40                      |       block
 0021e4: 02 40                      |         block
 0021e6: 20 01                      |           local.get 1
 0021e8: 41 80 b0 03                |           i32.const 55296
 0021ec: 49                         |           i32.lt_u
 0021ed: 0d 00                      |           br_if 0
 0021ef: 20 01                      |           local.get 1
 0021f1: 41 80 40                   |           i32.const 4294959104
 0021f4: 71                         |           i32.and
 0021f5: 41 80 c0 03                |           i32.const 57344
 0021f9: 47                         |           i32.ne
 0021fa: 0d 01                      |           br_if 1
 0021fc: 0b                         |         end
 0021fd: 20 00                      |         local.get 0
 0021ff: 20 01                      |         local.get 1
 002201: 41 3f                      |         i32.const 63
 002203: 71                         |         i32.and
 002204: 41 80 01                   |         i32.const 128
 002207: 72                         |         i32.or
 002208: 3a 00 02                   |         i32.store8 0 2
 00220b: 20 00                      |         local.get 0
 00220d: 20 01                      |         local.get 1
 00220f: 41 0c                      |         i32.const 12
 002211: 76                         |         i32.shr_u
 002212: 41 e0 01                   |         i32.const 224
 002215: 72                         |         i32.or
 002216: 3a 00 00                   |         i32.store8 0 0
 002219: 20 00                      |         local.get 0
 00221b: 20 01                      |         local.get 1
 00221d: 41 06                      |         i32.const 6
 00221f: 76                         |         i32.shr_u
 002220: 41 3f                      |         i32.const 63
 002222: 71                         |         i32.and
 002223: 41 80 01                   |         i32.const 128
 002226: 72                         |         i32.or
 002227: 3a 00 01                   |         i32.store8 0 1
 00222a: 41 03                      |         i32.const 3
 00222c: 0f                         |         return
 00222d: 0b                         |       end
 00222e: 02 40                      |       block
 002230: 20 01                      |         local.get 1
 002232: 41 80 80 7c                |         i32.const 4294901760
 002236: 6a                         |         i32.add
 002237: 41 ff ff 3f                |         i32.const 1048575
 00223b: 4b                         |         i32.gt_u
 00223c: 0d 00                      |         br_if 0
 00223e: 20 00                      |         local.get 0
 002240: 20 01                      |         local.get 1
 002242: 41 3f                      |         i32.const 63
 002244: 71                         |         i32.and
 002245: 41 80 01                   |         i32.const 128
 002248: 72                         |         i32.or
 002249: 3a 00 03                   |         i32.store8 0 3
 00224c: 20 00                      |         local.get 0
 00224e: 20 01                      |         local.get 1
 002250: 41 12                      |         i32.const 18
 002252: 76                         |         i32.shr_u
 002253: 41 f0 01                   |         i32.const 240
 002256: 72                         |         i32.or
 002257: 3a 00 00                   |         i32.store8 0 0
 00225a: 20 00                      |         local.get 0
 00225c: 20 01                      |         local.get 1
 00225e: 41 06                      |         i32.const 6
 002260: 76                         |         i32.shr_u
 002261: 41 3f                      |         i32.const 63
 002263: 71                         |         i32.and
 002264: 41 80 01                   |         i32.const 128
 002267: 72                         |         i32.or
 002268: 3a 00 02                   |         i32.store8 0 2
 00226b: 20 00                      |         local.get 0
 00226d: 20 01                      |         local.get 1
 00226f: 41 0c                      |         i32.const 12
 002271: 76                         |         i32.shr_u
 002272: 41 3f                      |         i32.const 63
 002274: 71                         |         i32.and
 002275: 41 80 01                   |         i32.const 128
 002278: 72                         |         i32.or
 002279: 3a 00 01                   |         i32.store8 0 1
 00227c: 41 04                      |         i32.const 4
 00227e: 0f                         |         return
 00227f: 0b                         |       end
 002280: 10 26                      |       call 38 <__errno_location>
 002282: 41 19                      |       i32.const 25
 002284: 36 02 00                   |       i32.store 2 0
 002287: 0b                         |     end
 002288: 41 7f                      |     i32.const 4294967295
 00228a: 21 03                      |     local.set 3
 00228c: 0b                         |   end
 00228d: 20 03                      |   local.get 3
 00228f: 0f                         |   return
 002290: 0b                         | end
 002291: 20 00                      | local.get 0
 002293: 20 01                      | local.get 1
 002295: 3a 00 00                   | i32.store8 0 0
 002298: 41 01                      | i32.const 1
 00229a: 0b                         | end
00229c func[37]:
 00229d: 10 23                      | call 35
 00229f: 0b                         | end
0022a1 func[38] <__errno_location>:
 0022a2: 41 a8 18                   | i32.const 3112
 0022a5: 0b                         | end
0022a7 func[39]:
 0022a8: 02 40                      | block
 0022aa: 20 00                      |   local.get 0
 0022ac: 0d 00                      |   br_if 0
 0022ae: 41 00                      |   i32.const 0
 0022b0: 0f                         |   return
 0022b1: 0b                         | end
 0022b2: 10 26                      | call 38 <__errno_location>
 0022b4: 20 00                      | local.get 0
 0022b6: 36 02 00                   | i32.store 2 0
 0022b9: 41 7f                      | i32.const 4294967295
 0022bb: 0b                         | end
0022bd func[40]:
 0022be: 01 7e                      | local[0] type=i64
 0022c0: 02 40                      | block
 0022c2: 02 40                      |   block
 0022c4: 02 40                      |     block
 0022c6: 20 03                      |       local.get 3
 0022c8: 41 c0 00                   |       i32.const 64
 0022cb: 71                         |       i32.and
 0022cc: 45                         |       i32.eqz
 0022cd: 0d 00                      |       br_if 0
 0022cf: 20 02                      |       local.get 2
 0022d1: 20 03                      |       local.get 3
 0022d3: 41 40                      |       i32.const 4294967232
 0022d5: 6a                         |       i32.add
 0022d6: ad                         |       i64.extend_i32_u
 0022d7: 88                         |       i64.shr_u
 0022d8: 21 01                      |       local.set 1
 0022da: 42 00                      |       i64.const 0
 0022dc: 21 04                      |       local.set 4
 0022de: 42 00                      |       i64.const 0
 0022e0: 21 02                      |       local.set 2
 0022e2: 0c 01                      |       br 1
 0022e4: 0b                         |     end
 0022e5: 20 03                      |     local.get 3
 0022e7: 45                         |     i32.eqz
 0022e8: 0d 01                      |     br_if 1
 0022ea: 20 02                      |     local.get 2
 0022ec: 41 c0 00                   |     i32.const 64
 0022ef: 20 03                      |     local.get 3
 0022f1: 6b                         |     i32.sub
 0022f2: ad                         |     i64.extend_i32_u
 0022f3: 86                         |     i64.shl
 0022f4: 20 01                      |     local.get 1
 0022f6: 20 03                      |     local.get 3
 0022f8: ad                         |     i64.extend_i32_u
 0022f9: 22 04                      |     local.tee 4
 0022fb: 88                         |     i64.shr_u
 0022fc: 84                         |     i64.or
 0022fd: 21 01                      |     local.set 1
 0022ff: 20 02                      |     local.get 2
 002301: 20 04                      |     local.get 4
 002303: 88                         |     i64.shr_u
 002304: 21 02                      |     local.set 2
 002306: 42 00                      |     i64.const 0
 002308: 21 04                      |     local.set 4
 00230a: 0b                         |   end
 00230b: 20 04                      |   local.get 4
 00230d: 20 01                      |   local.get 1
 00230f: 84                         |   i64.or
 002310: 21 01                      |   local.set 1
 002312: 0b                         | end
 002313: 20 00                      | local.get 0
 002315: 20 01                      | local.get 1
 002317: 37 03 00                   | i64.store 3 0
 00231a: 20 00                      | local.get 0
 00231c: 20 02                      | local.get 2
 00231e: 37 03 08                   | i64.store 3 8
 002321: 0b                         | end
002323 func[41]:
 002324: 01 7e                      | local[0] type=i64
 002326: 02 40                      | block
 002328: 02 40                      |   block
 00232a: 02 40                      |     block
 00232c: 20 03                      |       local.get 3
 00232e: 41 c0 00                   |       i32.const 64
 002331: 71                         |       i32.and
 002332: 45                         |       i32.eqz
 002333: 0d 00                      |       br_if 0
 002335: 20 01                      |       local.get 1
 002337: 20 03                      |       local.get 3
 002339: 41 40                      |       i32.const 4294967232
 00233b: 6a                         |       i32.add
 00233c: ad                         |       i64.extend_i32_u
 00233d: 86                         |       i64.shl
 00233e: 21 02                      |       local.set 2
 002340: 42 00                      |       i64.const 0
 002342: 21 01                      |       local.set 1
 002344: 0c 01                      |       br 1
 002346: 0b                         |     end
 002347: 20 03                      |     local.get 3
 002349: 45                         |     i32.eqz
 00234a: 0d 01                      |     br_if 1
 00234c: 20 01                      |     local.get 1
 00234e: 41 c0 00                   |     i32.const 64
 002351: 20 03                      |     local.get 3
 002353: 6b                         |     i32.sub
 002354: ad                         |     i64.extend_i32_u
 002355: 88                         |     i64.shr_u
 002356: 20 02                      |     local.get 2
 002358: 20 03                      |     local.get 3
 00235a: ad                         |     i64.extend_i32_u
 00235b: 22 04                      |     local.tee 4
 00235d: 86                         |     i64.shl
 00235e: 84                         |     i64.or
 00235f: 21 02                      |     local.set 2
 002361: 20 01                      |     local.get 1
 002363: 20 04                      |     local.get 4
 002365: 86                         |     i64.shl
 002366: 21 01                      |     local.set 1
 002368: 0b                         |   end
 002369: 20 02                      |   local.get 2
 00236b: 42 00                      |   i64.const 0
 00236d: 84                         |   i64.or
 00236e: 21 02                      |   local.set 2
 002370: 0b                         | end
 002371: 20 00                      | local.get 0
 002373: 20 01                      | local.get 1
 002375: 37 03 00                   | i64.store 3 0
 002378: 20 00                      | local.get 0
 00237a: 20 02                      | local.get 2
 00237c: 37 03 08                   | i64.store 3 8
 00237f: 0b                         | end
002382 func[42]:
 002383: 02 7f                      | local[0..1] type=i32
 002385: 02 7e                      | local[2..3] type=i64
 002387: 23 00                      | global.get 0
 002389: 41 20                      | i32.const 32
 00238b: 6b                         | i32.sub
 00238c: 22 02                      | local.tee 2
 00238e: 24 00                      | global.set 0
 002390: 02 40                      | block
 002392: 02 40                      |   block
 002394: 20 01                      |     local.get 1
 002396: 42 ff ff ff ff ff ff ff ff |     i64.const 9223372036854775807
 00239f: ff 00                      | 
 0023a1: 83                         |     i64.and
 0023a2: 22 04                      |     local.tee 4
 0023a4: 42 80 80 80 80 80 80 c0 ff |     i64.const -4323737117252386816
 0023ad: 43                         | 
 0023ae: 7c                         |     i64.add
 0023af: 20 04                      |     local.get 4
 0023b1: 42 80 80 80 80 80 80 c0 80 |     i64.const -4899634919602388992
 0023ba: bc 7f                      | 
 0023bc: 7c                         |     i64.add
 0023bd: 5a                         |     i64.ge_u
 0023be: 0d 00                      |     br_if 0
 0023c0: 20 00                      |     local.get 0
 0023c2: 42 3c                      |     i64.const 60
 0023c4: 88                         |     i64.shr_u
 0023c5: 20 01                      |     local.get 1
 0023c7: 42 04                      |     i64.const 4
 0023c9: 86                         |     i64.shl
 0023ca: 84                         |     i64.or
 0023cb: 21 04                      |     local.set 4
 0023cd: 02 40                      |     block
 0023cf: 20 00                      |       local.get 0
 0023d1: 42 ff ff ff ff ff ff ff ff |       i64.const 1152921504606846975
 0023da: 0f                         | 
 0023db: 83                         |       i64.and
 0023dc: 22 00                      |       local.tee 0
 0023de: 42 81 80 80 80 80 80 80 80 |       i64.const 576460752303423489
 0023e7: 08                         | 
 0023e8: 54                         |       i64.lt_u
 0023e9: 0d 00                      |       br_if 0
 0023eb: 20 04                      |       local.get 4
 0023ed: 42 81 80 80 80 80 80 80 80 |       i64.const 4611686018427387905
 0023f6: c0 00                      | 
 0023f8: 7c                         |       i64.add
 0023f9: 21 05                      |       local.set 5
 0023fb: 0c 02                      |       br 2
 0023fd: 0b                         |     end
 0023fe: 20 04                      |     local.get 4
 002400: 42 80 80 80 80 80 80 80 80 |     i64.const 4611686018427387904
 002409: c0 00                      | 
 00240b: 7c                         |     i64.add
 00240c: 21 05                      |     local.set 5
 00240e: 20 00                      |     local.get 0
 002410: 42 80 80 80 80 80 80 80 80 |     i64.const 576460752303423488
 002419: 08                         | 
 00241a: 85                         |     i64.xor
 00241b: 42 00                      |     i64.const 0
 00241d: 52                         |     i64.ne
 00241e: 0d 01                      |     br_if 1
 002420: 20 05                      |     local.get 5
 002422: 42 01                      |     i64.const 1
 002424: 83                         |     i64.and
 002425: 20 05                      |     local.get 5
 002427: 7c                         |     i64.add
 002428: 21 05                      |     local.set 5
 00242a: 0c 01                      |     br 1
 00242c: 0b                         |   end
 00242d: 02 40                      |   block
 00242f: 20 00                      |     local.get 0
 002431: 50                         |     i64.eqz
 002432: 20 04                      |     local.get 4
 002434: 42 80 80 80 80 80 80 c0 ff |     i64.const 9223090561878065152
 00243d: ff 00                      | 
 00243f: 54                         |     i64.lt_u
 002440: 20 04                      |     local.get 4
 002442: 42 80 80 80 80 80 80 c0 ff |     i64.const 9223090561878065152
 00244b: ff 00                      | 
 00244d: 51                         |     i64.eq
 00244e: 1b                         |     select
 00244f: 0d 00                      |     br_if 0
 002451: 20 00                      |     local.get 0
 002453: 42 3c                      |     i64.const 60
 002455: 88                         |     i64.shr_u
 002456: 20 01                      |     local.get 1
 002458: 42 04                      |     i64.const 4
 00245a: 86                         |     i64.shl
 00245b: 84                         |     i64.or
 00245c: 42 ff ff ff ff ff ff ff 03 |     i64.const 2251799813685247
 002465: 83                         |     i64.and
 002466: 42 80 80 80 80 80 80 80 fc |     i64.const 9221120237041090560
 00246f: ff 00                      | 
 002471: 84                         |     i64.or
 002472: 21 05                      |     local.set 5
 002474: 0c 01                      |     br 1
 002476: 0b                         |   end
 002477: 42 80 80 80 80 80 80 80 f8 |   i64.const 9218868437227405312
 002480: ff 00                      | 
 002482: 21 05                      |   local.set 5
 002484: 20 04                      |   local.get 4
 002486: 42 ff ff ff ff ff ff bf ff |   i64.const 4899634919602388991
 00248f: c3 00                      | 
 002491: 56                         |   i64.gt_u
 002492: 0d 00                      |   br_if 0
 002494: 42 00                      |   i64.const 0
 002496: 21 05                      |   local.set 5
 002498: 20 04                      |   local.get 4
 00249a: 42 30                      |   i64.const 48
 00249c: 88                         |   i64.shr_u
 00249d: a7                         |   i32.wrap_i64
 00249e: 22 03                      |   local.tee 3
 0024a0: 41 91 f7 00                |   i32.const 15249
 0024a4: 49                         |   i32.lt_u
 0024a5: 0d 00                      |   br_if 0
 0024a7: 20 02                      |   local.get 2
 0024a9: 20 00                      |   local.get 0
 0024ab: 20 01                      |   local.get 1
 0024ad: 42 ff ff ff ff ff ff 3f    |   i64.const 281474976710655
 0024b5: 83                         |   i64.and
 0024b6: 42 80 80 80 80 80 80 c0 00 |   i64.const 281474976710656
 0024bf: 84                         |   i64.or
 0024c0: 22 04                      |   local.tee 4
 0024c2: 41 81 f8 00                |   i32.const 15361
 0024c6: 20 03                      |   local.get 3
 0024c8: 6b                         |   i32.sub
 0024c9: 10 28                      |   call 40
 0024cb: 20 02                      |   local.get 2
 0024cd: 41 10                      |   i32.const 16
 0024cf: 6a                         |   i32.add
 0024d0: 20 00                      |   local.get 0
 0024d2: 20 04                      |   local.get 4
 0024d4: 20 03                      |   local.get 3
 0024d6: 41 ff 88 7f                |   i32.const 4294952063
 0024da: 6a                         |   i32.add
 0024db: 10 29                      |   call 41
 0024dd: 20 02                      |   local.get 2
 0024df: 29 03 00                   |   i64.load 3 0
 0024e2: 22 04                      |   local.tee 4
 0024e4: 42 3c                      |   i64.const 60
 0024e6: 88                         |   i64.shr_u
 0024e7: 20 02                      |   local.get 2
 0024e9: 41 08                      |   i32.const 8
 0024eb: 6a                         |   i32.add
 0024ec: 29 03 00                   |   i64.load 3 0
 0024ef: 42 04                      |   i64.const 4
 0024f1: 86                         |   i64.shl
 0024f2: 84                         |   i64.or
 0024f3: 21 05                      |   local.set 5
 0024f5: 02 40                      |   block
 0024f7: 20 04                      |     local.get 4
 0024f9: 42 ff ff ff ff ff ff ff ff |     i64.const 1152921504606846975
 002502: 0f                         | 
 002503: 83                         |     i64.and
 002504: 20 02                      |     local.get 2
 002506: 29 03 10                   |     i64.load 3 16
 002509: 20 02                      |     local.get 2
 00250b: 41 10                      |     i32.const 16
 00250d: 6a                         |     i32.add
 00250e: 41 08                      |     i32.const 8
 002510: 6a                         |     i32.add
 002511: 29 03 00                   |     i64.load 3 0
 002514: 84                         |     i64.or
 002515: 42 00                      |     i64.const 0
 002517: 52                         |     i64.ne
 002518: ad                         |     i64.extend_i32_u
 002519: 84                         |     i64.or
 00251a: 22 04                      |     local.tee 4
 00251c: 42 81 80 80 80 80 80 80 80 |     i64.const 576460752303423489
 002525: 08                         | 
 002526: 54                         |     i64.lt_u
 002527: 0d 00                      |     br_if 0
 002529: 20 05                      |     local.get 5
 00252b: 42 01                      |     i64.const 1
 00252d: 7c                         |     i64.add
 00252e: 21 05                      |     local.set 5
 002530: 0c 01                      |     br 1
 002532: 0b                         |   end
 002533: 20 04                      |   local.get 4
 002535: 42 80 80 80 80 80 80 80 80 |   i64.const 576460752303423488
 00253e: 08                         | 
 00253f: 85                         |   i64.xor
 002540: 42 00                      |   i64.const 0
 002542: 52                         |   i64.ne
 002543: 0d 00                      |   br_if 0
 002545: 20 05                      |   local.get 5
 002547: 42 01                      |   i64.const 1
 002549: 83                         |   i64.and
 00254a: 20 05                      |   local.get 5
 00254c: 7c                         |   i64.add
 00254d: 21 05                      |   local.set 5
 00254f: 0b                         | end
 002550: 20 02                      | local.get 2
 002552: 41 20                      | i32.const 32
 002554: 6a                         | i32.add
 002555: 24 00                      | global.set 0
 002557: 20 05                      | local.get 5
 002559: 20 01                      | local.get 1
 00255b: 42 80 80 80 80 80 80 80 80 | i64.const -9223372036854775808
 002564: 80 7f                      | 
 002566: 83                         | i64.and
 002567: 84                         | i64.or
 002568: bf                         | f64.reinterpret_i64
 002569: 0b                         | end
00256c func[43]:
 00256d: 03 7f                      | local[0..2] type=i32
 00256f: 02 40                      | block
 002571: 20 02                      |   local.get 2
 002573: 41 80 c0 00                |   i32.const 8192
 002577: 49                         |   i32.lt_u
 002578: 0d 00                      |   br_if 0
 00257a: 20 00                      |   local.get 0
 00257c: 20 01                      |   local.get 1
 00257e: 20 02                      |   local.get 2
 002580: 10 2f                      |   call 47
 002582: 1a                         |   drop
 002583: 20 00                      |   local.get 0
 002585: 0f                         |   return
 002586: 0b                         | end
 002587: 20 00                      | local.get 0
 002589: 20 02                      | local.get 2
 00258b: 6a                         | i32.add
 00258c: 21 03                      | local.set 3
 00258e: 02 40                      | block
 002590: 02 40                      |   block
 002592: 20 01                      |     local.get 1
 002594: 20 00                      |     local.get 0
 002596: 73                         |     i32.xor
 002597: 41 03                      |     i32.const 3
 002599: 71                         |     i32.and
 00259a: 0d 00                      |     br_if 0
 00259c: 02 40                      |     block
 00259e: 02 40                      |       block
 0025a0: 20 02                      |         local.get 2
 0025a2: 41 01                      |         i32.const 1
 0025a4: 4e                         |         i32.ge_s
 0025a5: 0d 00                      |         br_if 0
 0025a7: 20 00                      |         local.get 0
 0025a9: 21 02                      |         local.set 2
 0025ab: 0c 01                      |         br 1
 0025ad: 0b                         |       end
 0025ae: 02 40                      |       block
 0025b0: 20 00                      |         local.get 0
 0025b2: 41 03                      |         i32.const 3
 0025b4: 71                         |         i32.and
 0025b5: 0d 00                      |         br_if 0
 0025b7: 20 00                      |         local.get 0
 0025b9: 21 02                      |         local.set 2
 0025bb: 0c 01                      |         br 1
 0025bd: 0b                         |       end
 0025be: 20 00                      |       local.get 0
 0025c0: 21 02                      |       local.set 2
 0025c2: 03 40                      |       loop
 0025c4: 20 02                      |         local.get 2
 0025c6: 20 01                      |         local.get 1
 0025c8: 2d 00 00                   |         i32.load8_u 0 0
 0025cb: 3a 00 00                   |         i32.store8 0 0
 0025ce: 20 01                      |         local.get 1
 0025d0: 41 01                      |         i32.const 1
 0025d2: 6a                         |         i32.add
 0025d3: 21 01                      |         local.set 1
 0025d5: 20 02                      |         local.get 2
 0025d7: 41 01                      |         i32.const 1
 0025d9: 6a                         |         i32.add
 0025da: 22 02                      |         local.tee 2
 0025dc: 20 03                      |         local.get 3
 0025de: 4f                         |         i32.ge_u
 0025df: 0d 01                      |         br_if 1
 0025e1: 20 02                      |         local.get 2
 0025e3: 41 03                      |         i32.const 3
 0025e5: 71                         |         i32.and
 0025e6: 0d 00                      |         br_if 0
 0025e8: 0b                         |       end
 0025e9: 0b                         |     end
 0025ea: 02 40                      |     block
 0025ec: 20 03                      |       local.get 3
 0025ee: 41 7c                      |       i32.const 4294967292
 0025f0: 71                         |       i32.and
 0025f1: 22 04                      |       local.tee 4
 0025f3: 41 c0 00                   |       i32.const 64
 0025f6: 49                         |       i32.lt_u
 0025f7: 0d 00                      |       br_if 0
 0025f9: 20 02                      |       local.get 2
 0025fb: 20 04                      |       local.get 4
 0025fd: 41 40                      |       i32.const 4294967232
 0025ff: 6a                         |       i32.add
 002600: 22 05                      |       local.tee 5
 002602: 4b                         |       i32.gt_u
 002603: 0d 00                      |       br_if 0
 002605: 03 40                      |       loop
 002607: 20 02                      |         local.get 2
 002609: 20 01                      |         local.get 1
 00260b: 28 02 00                   |         i32.load 2 0
 00260e: 36 02 00                   |         i32.store 2 0
 002611: 20 02                      |         local.get 2
 002613: 20 01                      |         local.get 1
 002615: 28 02 04                   |         i32.load 2 4
 002618: 36 02 04                   |         i32.store 2 4
 00261b: 20 02                      |         local.get 2
 00261d: 20 01                      |         local.get 1
 00261f: 28 02 08                   |         i32.load 2 8
 002622: 36 02 08                   |         i32.store 2 8
 002625: 20 02                      |         local.get 2
 002627: 20 01                      |         local.get 1
 002629: 28 02 0c                   |         i32.load 2 12
 00262c: 36 02 0c                   |         i32.store 2 12
 00262f: 20 02                      |         local.get 2
 002631: 20 01                      |         local.get 1
 002633: 28 02 10                   |         i32.load 2 16
 002636: 36 02 10                   |         i32.store 2 16
 002639: 20 02                      |         local.get 2
 00263b: 20 01                      |         local.get 1
 00263d: 28 02 14                   |         i32.load 2 20
 002640: 36 02 14                   |         i32.store 2 20
 002643: 20 02                      |         local.get 2
 002645: 20 01                      |         local.get 1
 002647: 28 02 18                   |         i32.load 2 24
 00264a: 36 02 18                   |         i32.store 2 24
 00264d: 20 02                      |         local.get 2
 00264f: 20 01                      |         local.get 1
 002651: 28 02 1c                   |         i32.load 2 28
 002654: 36 02 1c                   |         i32.store 2 28
 002657: 20 02                      |         local.get 2
 002659: 20 01                      |         local.get 1
 00265b: 28 02 20                   |         i32.load 2 32
 00265e: 36 02 20                   |         i32.store 2 32
 002661: 20 02                      |         local.get 2
 002663: 20 01                      |         local.get 1
 002665: 28 02 24                   |         i32.load 2 36
 002668: 36 02 24                   |         i32.store 2 36
 00266b: 20 02                      |         local.get 2
 00266d: 20 01                      |         local.get 1
 00266f: 28 02 28                   |         i32.load 2 40
 002672: 36 02 28                   |         i32.store 2 40
 002675: 20 02                      |         local.get 2
 002677: 20 01                      |         local.get 1
 002679: 28 02 2c                   |         i32.load 2 44
 00267c: 36 02 2c                   |         i32.store 2 44
 00267f: 20 02                      |         local.get 2
 002681: 20 01                      |         local.get 1
 002683: 28 02 30                   |         i32.load 2 48
 002686: 36 02 30                   |         i32.store 2 48
 002689: 20 02                      |         local.get 2
 00268b: 20 01                      |         local.get 1
 00268d: 28 02 34                   |         i32.load 2 52
 002690: 36 02 34                   |         i32.store 2 52
 002693: 20 02                      |         local.get 2
 002695: 20 01                      |         local.get 1
 002697: 28 02 38                   |         i32.load 2 56
 00269a: 36 02 38                   |         i32.store 2 56
 00269d: 20 02                      |         local.get 2
 00269f: 20 01                      |         local.get 1
 0026a1: 28 02 3c                   |         i32.load 2 60
 0026a4: 36 02 3c                   |         i32.store 2 60
 0026a7: 20 01                      |         local.get 1
 0026a9: 41 c0 00                   |         i32.const 64
 0026ac: 6a                         |         i32.add
 0026ad: 21 01                      |         local.set 1
 0026af: 20 02                      |         local.get 2
 0026b1: 41 c0 00                   |         i32.const 64
 0026b4: 6a                         |         i32.add
 0026b5: 22 02                      |         local.tee 2
 0026b7: 20 05                      |         local.get 5
 0026b9: 4d                         |         i32.le_u
 0026ba: 0d 00                      |         br_if 0
 0026bc: 0b                         |       end
 0026bd: 0b                         |     end
 0026be: 20 02                      |     local.get 2
 0026c0: 20 04                      |     local.get 4
 0026c2: 4f                         |     i32.ge_u
 0026c3: 0d 01                      |     br_if 1
 0026c5: 03 40                      |     loop
 0026c7: 20 02                      |       local.get 2
 0026c9: 20 01                      |       local.get 1
 0026cb: 28 02 00                   |       i32.load 2 0
 0026ce: 36 02 00                   |       i32.store 2 0
 0026d1: 20 01                      |       local.get 1
 0026d3: 41 04                      |       i32.const 4
 0026d5: 6a                         |       i32.add
 0026d6: 21 01                      |       local.set 1
 0026d8: 20 02                      |       local.get 2
 0026da: 41 04                      |       i32.const 4
 0026dc: 6a                         |       i32.add
 0026dd: 22 02                      |       local.tee 2
 0026df: 20 04                      |       local.get 4
 0026e1: 49                         |       i32.lt_u
 0026e2: 0d 00                      |       br_if 0
 0026e4: 0c 02                      |       br 2
 0026e6: 00                         |       unreachable
 0026e7: 0b                         |     end
 0026e8: 00                         |     unreachable
 0026e9: 0b                         |   end
 0026ea: 02 40                      |   block
 0026ec: 20 03                      |     local.get 3
 0026ee: 41 04                      |     i32.const 4
 0026f0: 4f                         |     i32.ge_u
 0026f1: 0d 00                      |     br_if 0
 0026f3: 20 00                      |     local.get 0
 0026f5: 21 02                      |     local.set 2
 0026f7: 0c 01                      |     br 1
 0026f9: 0b                         |   end
 0026fa: 02 40                      |   block
 0026fc: 20 03                      |     local.get 3
 0026fe: 41 7c                      |     i32.const 4294967292
 002700: 6a                         |     i32.add
 002701: 22 04                      |     local.tee 4
 002703: 20 00                      |     local.get 0
 002705: 4f                         |     i32.ge_u
 002706: 0d 00                      |     br_if 0
 002708: 20 00                      |     local.get 0
 00270a: 21 02                      |     local.set 2
 00270c: 0c 01                      |     br 1
 00270e: 0b                         |   end
 00270f: 20 00                      |   local.get 0
 002711: 21 02                      |   local.set 2
 002713: 03 40                      |   loop
 002715: 20 02                      |     local.get 2
 002717: 20 01                      |     local.get 1
 002719: 2d 00 00                   |     i32.load8_u 0 0
 00271c: 3a 00 00                   |     i32.store8 0 0
 00271f: 20 02                      |     local.get 2
 002721: 20 01                      |     local.get 1
 002723: 2d 00 01                   |     i32.load8_u 0 1
 002726: 3a 00 01                   |     i32.store8 0 1
 002729: 20 02                      |     local.get 2
 00272b: 20 01                      |     local.get 1
 00272d: 2d 00 02                   |     i32.load8_u 0 2
 002730: 3a 00 02                   |     i32.store8 0 2
 002733: 20 02                      |     local.get 2
 002735: 20 01                      |     local.get 1
 002737: 2d 00 03                   |     i32.load8_u 0 3
 00273a: 3a 00 03                   |     i32.store8 0 3
 00273d: 20 01                      |     local.get 1
 00273f: 41 04                      |     i32.const 4
 002741: 6a                         |     i32.add
 002742: 21 01                      |     local.set 1
 002744: 20 02                      |     local.get 2
 002746: 41 04                      |     i32.const 4
 002748: 6a                         |     i32.add
 002749: 22 02                      |     local.tee 2
 00274b: 20 04                      |     local.get 4
 00274d: 4d                         |     i32.le_u
 00274e: 0d 00                      |     br_if 0
 002750: 0b                         |   end
 002751: 0b                         | end
 002752: 02 40                      | block
 002754: 20 02                      |   local.get 2
 002756: 20 03                      |   local.get 3
 002758: 4f                         |   i32.ge_u
 002759: 0d 00                      |   br_if 0
 00275b: 03 40                      |   loop
 00275d: 20 02                      |     local.get 2
 00275f: 20 01                      |     local.get 1
 002761: 2d 00 00                   |     i32.load8_u 0 0
 002764: 3a 00 00                   |     i32.store8 0 0
 002767: 20 01                      |     local.get 1
 002769: 41 01                      |     i32.const 1
 00276b: 6a                         |     i32.add
 00276c: 21 01                      |     local.set 1
 00276e: 20 02                      |     local.get 2
 002770: 41 01                      |     i32.const 1
 002772: 6a                         |     i32.add
 002773: 22 02                      |     local.tee 2
 002775: 20 03                      |     local.get 3
 002777: 47                         |     i32.ne
 002778: 0d 00                      |     br_if 0
 00277a: 0b                         |   end
 00277b: 0b                         | end
 00277c: 20 00                      | local.get 0
 00277e: 0b                         | end
002781 func[44]:
 002782: 03 7f                      | local[0..2] type=i32
 002784: 01 7e                      | local[3] type=i64
 002786: 02 40                      | block
 002788: 20 02                      |   local.get 2
 00278a: 45                         |   i32.eqz
 00278b: 0d 00                      |   br_if 0
 00278d: 20 02                      |   local.get 2
 00278f: 20 00                      |   local.get 0
 002791: 6a                         |   i32.add
 002792: 22 03                      |   local.tee 3
 002794: 41 7f                      |   i32.const 4294967295
 002796: 6a                         |   i32.add
 002797: 20 01                      |   local.get 1
 002799: 3a 00 00                   |   i32.store8 0 0
 00279c: 20 00                      |   local.get 0
 00279e: 20 01                      |   local.get 1
 0027a0: 3a 00 00                   |   i32.store8 0 0
 0027a3: 20 02                      |   local.get 2
 0027a5: 41 03                      |   i32.const 3
 0027a7: 49                         |   i32.lt_u
 0027a8: 0d 00                      |   br_if 0
 0027aa: 20 03                      |   local.get 3
 0027ac: 41 7e                      |   i32.const 4294967294
 0027ae: 6a                         |   i32.add
 0027af: 20 01                      |   local.get 1
 0027b1: 3a 00 00                   |   i32.store8 0 0
 0027b4: 20 00                      |   local.get 0
 0027b6: 20 01                      |   local.get 1
 0027b8: 3a 00 01                   |   i32.store8 0 1
 0027bb: 20 03                      |   local.get 3
 0027bd: 41 7d                      |   i32.const 4294967293
 0027bf: 6a                         |   i32.add
 0027c0: 20 01                      |   local.get 1
 0027c2: 3a 00 00                   |   i32.store8 0 0
 0027c5: 20 00                      |   local.get 0
 0027c7: 20 01                      |   local.get 1
 0027c9: 3a 00 02                   |   i32.store8 0 2
 0027cc: 20 02                      |   local.get 2
 0027ce: 41 07                      |   i32.const 7
 0027d0: 49                         |   i32.lt_u
 0027d1: 0d 00                      |   br_if 0
 0027d3: 20 03                      |   local.get 3
 0027d5: 41 7c                      |   i32.const 4294967292
 0027d7: 6a                         |   i32.add
 0027d8: 20 01                      |   local.get 1
 0027da: 3a 00 00                   |   i32.store8 0 0
 0027dd: 20 00                      |   local.get 0
 0027df: 20 01                      |   local.get 1
 0027e1: 3a 00 03                   |   i32.store8 0 3
 0027e4: 20 02                      |   local.get 2
 0027e6: 41 09                      |   i32.const 9
 0027e8: 49                         |   i32.lt_u
 0027e9: 0d 00                      |   br_if 0
 0027eb: 20 00                      |   local.get 0
 0027ed: 41 00                      |   i32.const 0
 0027ef: 20 00                      |   local.get 0
 0027f1: 6b                         |   i32.sub
 0027f2: 41 03                      |   i32.const 3
 0027f4: 71                         |   i32.and
 0027f5: 22 04                      |   local.tee 4
 0027f7: 6a                         |   i32.add
 0027f8: 22 03                      |   local.tee 3
 0027fa: 20 01                      |   local.get 1
 0027fc: 41 ff 01                   |   i32.const 255
 0027ff: 71                         |   i32.and
 002800: 41 81 82 84 08             |   i32.const 16843009
 002805: 6c                         |   i32.mul
 002806: 22 01                      |   local.tee 1
 002808: 36 02 00                   |   i32.store 2 0
 00280b: 20 03                      |   local.get 3
 00280d: 20 02                      |   local.get 2
 00280f: 20 04                      |   local.get 4
 002811: 6b                         |   i32.sub
 002812: 41 7c                      |   i32.const 4294967292
 002814: 71                         |   i32.and
 002815: 22 04                      |   local.tee 4
 002817: 6a                         |   i32.add
 002818: 22 02                      |   local.tee 2
 00281a: 41 7c                      |   i32.const 4294967292
 00281c: 6a                         |   i32.add
 00281d: 20 01                      |   local.get 1
 00281f: 36 02 00                   |   i32.store 2 0
 002822: 20 04                      |   local.get 4
 002824: 41 09                      |   i32.const 9
 002826: 49                         |   i32.lt_u
 002827: 0d 00                      |   br_if 0
 002829: 20 03                      |   local.get 3
 00282b: 20 01                      |   local.get 1
 00282d: 36 02 08                   |   i32.store 2 8
 002830: 20 03                      |   local.get 3
 002832: 20 01                      |   local.get 1
 002834: 36 02 04                   |   i32.store 2 4
 002837: 20 02                      |   local.get 2
 002839: 41 78                      |   i32.const 4294967288
 00283b: 6a                         |   i32.add
 00283c: 20 01                      |   local.get 1
 00283e: 36 02 00                   |   i32.store 2 0
 002841: 20 02                      |   local.get 2
 002843: 41 74                      |   i32.const 4294967284
 002845: 6a                         |   i32.add
 002846: 20 01                      |   local.get 1
 002848: 36 02 00                   |   i32.store 2 0
 00284b: 20 04                      |   local.get 4
 00284d: 41 19                      |   i32.const 25
 00284f: 49                         |   i32.lt_u
 002850: 0d 00                      |   br_if 0
 002852: 20 03                      |   local.get 3
 002854: 20 01                      |   local.get 1
 002856: 36 02 18                   |   i32.store 2 24
 002859: 20 03                      |   local.get 3
 00285b: 20 01                      |   local.get 1
 00285d: 36 02 14                   |   i32.store 2 20
 002860: 20 03                      |   local.get 3
 002862: 20 01                      |   local.get 1
 002864: 36 02 10                   |   i32.store 2 16
 002867: 20 03                      |   local.get 3
 002869: 20 01                      |   local.get 1
 00286b: 36 02 0c                   |   i32.store 2 12
 00286e: 20 02                      |   local.get 2
 002870: 41 70                      |   i32.const 4294967280
 002872: 6a                         |   i32.add
 002873: 20 01                      |   local.get 1
 002875: 36 02 00                   |   i32.store 2 0
 002878: 20 02                      |   local.get 2
 00287a: 41 6c                      |   i32.const 4294967276
 00287c: 6a                         |   i32.add
 00287d: 20 01                      |   local.get 1
 00287f: 36 02 00                   |   i32.store 2 0
 002882: 20 02                      |   local.get 2
 002884: 41 68                      |   i32.const 4294967272
 002886: 6a                         |   i32.add
 002887: 20 01                      |   local.get 1
 002889: 36 02 00                   |   i32.store 2 0
 00288c: 20 02                      |   local.get 2
 00288e: 41 64                      |   i32.const 4294967268
 002890: 6a                         |   i32.add
 002891: 20 01                      |   local.get 1
 002893: 36 02 00                   |   i32.store 2 0
 002896: 20 04                      |   local.get 4
 002898: 20 03                      |   local.get 3
 00289a: 41 04                      |   i32.const 4
 00289c: 71                         |   i32.and
 00289d: 41 18                      |   i32.const 24
 00289f: 72                         |   i32.or
 0028a0: 22 05                      |   local.tee 5
 0028a2: 6b                         |   i32.sub
 0028a3: 22 02                      |   local.tee 2
 0028a5: 41 20                      |   i32.const 32
 0028a7: 49                         |   i32.lt_u
 0028a8: 0d 00                      |   br_if 0
 0028aa: 20 01                      |   local.get 1
 0028ac: ad                         |   i64.extend_i32_u
 0028ad: 22 06                      |   local.tee 6
 0028af: 42 20                      |   i64.const 32
 0028b1: 86                         |   i64.shl
 0028b2: 20 06                      |   local.get 6
 0028b4: 84                         |   i64.or
 0028b5: 21 06                      |   local.set 6
 0028b7: 20 03                      |   local.get 3
 0028b9: 20 05                      |   local.get 5
 0028bb: 6a                         |   i32.add
 0028bc: 21 01                      |   local.set 1
 0028be: 03 40                      |   loop
 0028c0: 20 01                      |     local.get 1
 0028c2: 20 06                      |     local.get 6
 0028c4: 37 03 18                   |     i64.store 3 24
 0028c7: 20 01                      |     local.get 1
 0028c9: 20 06                      |     local.get 6
 0028cb: 37 03 10                   |     i64.store 3 16
 0028ce: 20 01                      |     local.get 1
 0028d0: 20 06                      |     local.get 6
 0028d2: 37 03 08                   |     i64.store 3 8
 0028d5: 20 01                      |     local.get 1
 0028d7: 20 06                      |     local.get 6
 0028d9: 37 03 00                   |     i64.store 3 0
 0028dc: 20 01                      |     local.get 1
 0028de: 41 20                      |     i32.const 32
 0028e0: 6a                         |     i32.add
 0028e1: 21 01                      |     local.set 1
 0028e3: 20 02                      |     local.get 2
 0028e5: 41 60                      |     i32.const 4294967264
 0028e7: 6a                         |     i32.add
 0028e8: 22 02                      |     local.tee 2
 0028ea: 41 1f                      |     i32.const 31
 0028ec: 4b                         |     i32.gt_u
 0028ed: 0d 00                      |     br_if 0
 0028ef: 0b                         |   end
 0028f0: 0b                         | end
 0028f1: 20 00                      | local.get 0
 0028f3: 0b                         | end
0028f5 func[45]:
 0028f6: 0b                         | end
0028f8 func[46]:
 0028f9: 0b                         | end
0028fb func[47]:
 0028fc: 02 7f                      | local[0..1] type=i32
 0028fe: 02 40                      | block
 002900: 20 02                      |   local.get 2
 002902: 45                         |   i32.eqz
 002903: 0d 00                      |   br_if 0
 002905: 20 00                      |   local.get 0
 002907: 21 03                      |   local.set 3
 002909: 03 40                      |   loop
 00290b: 20 03                      |     local.get 3
 00290d: 20 01                      |     local.get 1
 00290f: 20 02                      |     local.get 2
 002911: 41 80 20                   |     i32.const 4096
 002914: 20 02                      |     local.get 2
 002916: 41 80 20                   |     i32.const 4096
 002919: 49                         |     i32.lt_u
 00291a: 1b                         |     select
 00291b: 22 04                      |     local.tee 4
 00291d: 10 2b                      |     call 43
 00291f: 21 03                      |     local.set 3
 002921: 20 01                      |     local.get 1
 002923: 41 80 20                   |     i32.const 4096
 002926: 6a                         |     i32.add
 002927: 21 01                      |     local.set 1
 002929: 20 03                      |     local.get 3
 00292b: 41 80 20                   |     i32.const 4096
 00292e: 6a                         |     i32.add
 00292f: 21 03                      |     local.set 3
 002931: 20 02                      |     local.get 2
 002933: 20 04                      |     local.get 4
 002935: 6b                         |     i32.sub
 002936: 22 02                      |     local.tee 2
 002938: 0d 00                      |     br_if 0
 00293a: 0b                         |   end
 00293b: 0b                         | end
 00293c: 20 00                      | local.get 0
 00293e: 0b                         | end
002940 func[48]:
 002941: 41 00                      | i32.const 0
 002943: 0b                         | end
002945 func[49]:
 002946: 03 7f                      | local[0..2] type=i32
 002948: 10 04                      | call 4
 00294a: 21 01                      | local.set 1
 00294c: 3f 00                      | memory.size 0
 00294e: 21 02                      | local.set 2
 002950: 02 40                      | block
 002952: 20 01                      |   local.get 1
 002954: 28 02 00                   |   i32.load 2 0
 002957: 22 03                      |   local.tee 3
 002959: 20 00                      |   local.get 0
 00295b: 6a                         |   i32.add
 00295c: 22 00                      |   local.tee 0
 00295e: 20 02                      |   local.get 2
 002960: 41 10                      |   i32.const 16
 002962: 74                         |   i32.shl
 002963: 4d                         |   i32.le_u
 002964: 0d 00                      |   br_if 0
 002966: 20 00                      |   local.get 0
 002968: 10 30                      |   call 48
 00296a: 0d 00                      |   br_if 0
 00296c: 10 26                      |   call 38 <__errno_location>
 00296e: 41 30                      |   i32.const 48
 002970: 36 02 00                   |   i32.store 2 0
 002973: 41 7f                      |   i32.const 4294967295
 002975: 0f                         |   return
 002976: 0b                         | end
 002977: 20 01                      | local.get 1
 002979: 20 00                      | local.get 0
 00297b: 36 02 00                   | i32.store 2 0
 00297e: 20 03                      | local.get 3
 002980: 0b                         | end
002983 func[50] <malloc>:
 002984: 0b 7f                      | local[0..10] type=i32
 002986: 23 00                      | global.get 0
 002988: 41 10                      | i32.const 16
 00298a: 6b                         | i32.sub
 00298b: 22 01                      | local.tee 1
 00298d: 24 00                      | global.set 0
 00298f: 02 40                      | block
 002991: 02 40                      |   block
 002993: 02 40                      |     block
 002995: 02 40                      |       block
 002997: 02 40                      |         block
 002999: 02 40                      |           block
 00299b: 02 40                      |             block
 00299d: 02 40                      |               block
 00299f: 02 40                      |                 block
 0029a1: 02 40                      |                   block
 0029a3: 02 40                      |                     block
 0029a5: 02 40                      |                       block
 0029a7: 20 00                      |                         local.get 0
 0029a9: 41 f4 01                   |                         i32.const 244
 0029ac: 4b                         |                         i32.gt_u
 0029ad: 0d 00                      |                         br_if 0
 0029af: 02 40                      |                         block
 0029b1: 41 00                      |                           i32.const 0
 0029b3: 28 02 ac 18                |                           i32.load 2 3116
 0029b7: 22 02                      |                           local.tee 2
 0029b9: 41 10                      |                           i32.const 16
 0029bb: 20 00                      |                           local.get 0
 0029bd: 41 0b                      |                           i32.const 11
 0029bf: 6a                         |                           i32.add
 0029c0: 41 78                      |                           i32.const 4294967288
 0029c2: 71                         |                           i32.and
 0029c3: 20 00                      |                           local.get 0
 0029c5: 41 0b                      |                           i32.const 11
 0029c7: 49                         |                           i32.lt_u
 0029c8: 1b                         |                           select
 0029c9: 22 03                      |                           local.tee 3
 0029cb: 41 03                      |                           i32.const 3
 0029cd: 76                         |                           i32.shr_u
 0029ce: 22 04                      |                           local.tee 4
 0029d0: 76                         |                           i32.shr_u
 0029d1: 22 00                      |                           local.tee 0
 0029d3: 41 03                      |                           i32.const 3
 0029d5: 71                         |                           i32.and
 0029d6: 45                         |                           i32.eqz
 0029d7: 0d 00                      |                           br_if 0
 0029d9: 20 00                      |                           local.get 0
 0029db: 41 7f                      |                           i32.const 4294967295
 0029dd: 73                         |                           i32.xor
 0029de: 41 01                      |                           i32.const 1
 0029e0: 71                         |                           i32.and
 0029e1: 20 04                      |                           local.get 4
 0029e3: 6a                         |                           i32.add
 0029e4: 22 03                      |                           local.tee 3
 0029e6: 41 03                      |                           i32.const 3
 0029e8: 74                         |                           i32.shl
 0029e9: 22 05                      |                           local.tee 5
 0029eb: 41 dc 18                   |                           i32.const 3164
 0029ee: 6a                         |                           i32.add
 0029ef: 28 02 00                   |                           i32.load 2 0
 0029f2: 22 04                      |                           local.tee 4
 0029f4: 41 08                      |                           i32.const 8
 0029f6: 6a                         |                           i32.add
 0029f7: 21 00                      |                           local.set 0
 0029f9: 02 40                      |                           block
 0029fb: 02 40                      |                             block
 0029fd: 20 04                      |                               local.get 4
 0029ff: 28 02 08                   |                               i32.load 2 8
 002a02: 22 06                      |                               local.tee 6
 002a04: 20 05                      |                               local.get 5
 002a06: 41 d4 18                   |                               i32.const 3156
 002a09: 6a                         |                               i32.add
 002a0a: 22 05                      |                               local.tee 5
 002a0c: 47                         |                               i32.ne
 002a0d: 0d 00                      |                               br_if 0
 002a0f: 41 00                      |                               i32.const 0
 002a11: 20 02                      |                               local.get 2
 002a13: 41 7e                      |                               i32.const 4294967294
 002a15: 20 03                      |                               local.get 3
 002a17: 77                         |                               i32.rotl
 002a18: 71                         |                               i32.and
 002a19: 36 02 ac 18                |                               i32.store 2 3116
 002a1d: 0c 01                      |                               br 1
 002a1f: 0b                         |                             end
 002a20: 41 00                      |                             i32.const 0
 002a22: 28 02 bc 18                |                             i32.load 2 3132
 002a26: 20 06                      |                             local.get 6
 002a28: 4b                         |                             i32.gt_u
 002a29: 1a                         |                             drop
 002a2a: 20 06                      |                             local.get 6
 002a2c: 20 05                      |                             local.get 5
 002a2e: 36 02 0c                   |                             i32.store 2 12
 002a31: 20 05                      |                             local.get 5
 002a33: 20 06                      |                             local.get 6
 002a35: 36 02 08                   |                             i32.store 2 8
 002a38: 0b                         |                           end
 002a39: 20 04                      |                           local.get 4
 002a3b: 20 03                      |                           local.get 3
 002a3d: 41 03                      |                           i32.const 3
 002a3f: 74                         |                           i32.shl
 002a40: 22 06                      |                           local.tee 6
 002a42: 41 03                      |                           i32.const 3
 002a44: 72                         |                           i32.or
 002a45: 36 02 04                   |                           i32.store 2 4
 002a48: 20 04                      |                           local.get 4
 002a4a: 20 06                      |                           local.get 6
 002a4c: 6a                         |                           i32.add
 002a4d: 22 04                      |                           local.tee 4
 002a4f: 20 04                      |                           local.get 4
 002a51: 28 02 04                   |                           i32.load 2 4
 002a54: 41 01                      |                           i32.const 1
 002a56: 72                         |                           i32.or
 002a57: 36 02 04                   |                           i32.store 2 4
 002a5a: 0c 0c                      |                           br 12
 002a5c: 0b                         |                         end
 002a5d: 20 03                      |                         local.get 3
 002a5f: 41 00                      |                         i32.const 0
 002a61: 28 02 b4 18                |                         i32.load 2 3124
 002a65: 22 07                      |                         local.tee 7
 002a67: 4d                         |                         i32.le_u
 002a68: 0d 01                      |                         br_if 1
 002a6a: 02 40                      |                         block
 002a6c: 20 00                      |                           local.get 0
 002a6e: 45                         |                           i32.eqz
 002a6f: 0d 00                      |                           br_if 0
 002a71: 02 40                      |                           block
 002a73: 02 40                      |                             block
 002a75: 20 00                      |                               local.get 0
 002a77: 20 04                      |                               local.get 4
 002a79: 74                         |                               i32.shl
 002a7a: 41 02                      |                               i32.const 2
 002a7c: 20 04                      |                               local.get 4
 002a7e: 74                         |                               i32.shl
 002a7f: 22 00                      |                               local.tee 0
 002a81: 41 00                      |                               i32.const 0
 002a83: 20 00                      |                               local.get 0
 002a85: 6b                         |                               i32.sub
 002a86: 72                         |                               i32.or
 002a87: 71                         |                               i32.and
 002a88: 22 00                      |                               local.tee 0
 002a8a: 41 00                      |                               i32.const 0
 002a8c: 20 00                      |                               local.get 0
 002a8e: 6b                         |                               i32.sub
 002a8f: 71                         |                               i32.and
 002a90: 41 7f                      |                               i32.const 4294967295
 002a92: 6a                         |                               i32.add
 002a93: 22 00                      |                               local.tee 0
 002a95: 20 00                      |                               local.get 0
 002a97: 41 0c                      |                               i32.const 12
 002a99: 76                         |                               i32.shr_u
 002a9a: 41 10                      |                               i32.const 16
 002a9c: 71                         |                               i32.and
 002a9d: 22 00                      |                               local.tee 0
 002a9f: 76                         |                               i32.shr_u
 002aa0: 22 04                      |                               local.tee 4
 002aa2: 41 05                      |                               i32.const 5
 002aa4: 76                         |                               i32.shr_u
 002aa5: 41 08                      |                               i32.const 8
 002aa7: 71                         |                               i32.and
 002aa8: 22 06                      |                               local.tee 6
 002aaa: 20 00                      |                               local.get 0
 002aac: 72                         |                               i32.or
 002aad: 20 04                      |                               local.get 4
 002aaf: 20 06                      |                               local.get 6
 002ab1: 76                         |                               i32.shr_u
 002ab2: 22 00                      |                               local.tee 0
 002ab4: 41 02                      |                               i32.const 2
 002ab6: 76                         |                               i32.shr_u
 002ab7: 41 04                      |                               i32.const 4
 002ab9: 71                         |                               i32.and
 002aba: 22 04                      |                               local.tee 4
 002abc: 72                         |                               i32.or
 002abd: 20 00                      |                               local.get 0
 002abf: 20 04                      |                               local.get 4
 002ac1: 76                         |                               i32.shr_u
 002ac2: 22 00                      |                               local.tee 0
 002ac4: 41 01                      |                               i32.const 1
 002ac6: 76                         |                               i32.shr_u
 002ac7: 41 02                      |                               i32.const 2
 002ac9: 71                         |                               i32.and
 002aca: 22 04                      |                               local.tee 4
 002acc: 72                         |                               i32.or
 002acd: 20 00                      |                               local.get 0
 002acf: 20 04                      |                               local.get 4
 002ad1: 76                         |                               i32.shr_u
 002ad2: 22 00                      |                               local.tee 0
 002ad4: 41 01                      |                               i32.const 1
 002ad6: 76                         |                               i32.shr_u
 002ad7: 41 01                      |                               i32.const 1
 002ad9: 71                         |                               i32.and
 002ada: 22 04                      |                               local.tee 4
 002adc: 72                         |                               i32.or
 002add: 20 00                      |                               local.get 0
 002adf: 20 04                      |                               local.get 4
 002ae1: 76                         |                               i32.shr_u
 002ae2: 6a                         |                               i32.add
 002ae3: 22 06                      |                               local.tee 6
 002ae5: 41 03                      |                               i32.const 3
 002ae7: 74                         |                               i32.shl
 002ae8: 22 05                      |                               local.tee 5
 002aea: 41 dc 18                   |                               i32.const 3164
 002aed: 6a                         |                               i32.add
 002aee: 28 02 00                   |                               i32.load 2 0
 002af1: 22 04                      |                               local.tee 4
 002af3: 28 02 08                   |                               i32.load 2 8
 002af6: 22 00                      |                               local.tee 0
 002af8: 20 05                      |                               local.get 5
 002afa: 41 d4 18                   |                               i32.const 3156
 002afd: 6a                         |                               i32.add
 002afe: 22 05                      |                               local.tee 5
 002b00: 47                         |                               i32.ne
 002b01: 0d 00                      |                               br_if 0
 002b03: 41 00                      |                               i32.const 0
 002b05: 20 02                      |                               local.get 2
 002b07: 41 7e                      |                               i32.const 4294967294
 002b09: 20 06                      |                               local.get 6
 002b0b: 77                         |                               i32.rotl
 002b0c: 71                         |                               i32.and
 002b0d: 22 02                      |                               local.tee 2
 002b0f: 36 02 ac 18                |                               i32.store 2 3116
 002b13: 0c 01                      |                               br 1
 002b15: 0b                         |                             end
 002b16: 41 00                      |                             i32.const 0
 002b18: 28 02 bc 18                |                             i32.load 2 3132
 002b1c: 20 00                      |                             local.get 0
 002b1e: 4b                         |                             i32.gt_u
 002b1f: 1a                         |                             drop
 002b20: 20 00                      |                             local.get 0
 002b22: 20 05                      |                             local.get 5
 002b24: 36 02 0c                   |                             i32.store 2 12
 002b27: 20 05                      |                             local.get 5
 002b29: 20 00                      |                             local.get 0
 002b2b: 36 02 08                   |                             i32.store 2 8
 002b2e: 0b                         |                           end
 002b2f: 20 04                      |                           local.get 4
 002b31: 41 08                      |                           i32.const 8
 002b33: 6a                         |                           i32.add
 002b34: 21 00                      |                           local.set 0
 002b36: 20 04                      |                           local.get 4
 002b38: 20 03                      |                           local.get 3
 002b3a: 41 03                      |                           i32.const 3
 002b3c: 72                         |                           i32.or
 002b3d: 36 02 04                   |                           i32.store 2 4
 002b40: 20 04                      |                           local.get 4
 002b42: 20 03                      |                           local.get 3
 002b44: 6a                         |                           i32.add
 002b45: 22 05                      |                           local.tee 5
 002b47: 20 06                      |                           local.get 6
 002b49: 41 03                      |                           i32.const 3
 002b4b: 74                         |                           i32.shl
 002b4c: 22 08                      |                           local.tee 8
 002b4e: 20 03                      |                           local.get 3
 002b50: 6b                         |                           i32.sub
 002b51: 22 06                      |                           local.tee 6
 002b53: 41 01                      |                           i32.const 1
 002b55: 72                         |                           i32.or
 002b56: 36 02 04                   |                           i32.store 2 4
 002b59: 20 04                      |                           local.get 4
 002b5b: 20 08                      |                           local.get 8
 002b5d: 6a                         |                           i32.add
 002b5e: 20 06                      |                           local.get 6
 002b60: 36 02 00                   |                           i32.store 2 0
 002b63: 02 40                      |                           block
 002b65: 20 07                      |                             local.get 7
 002b67: 45                         |                             i32.eqz
 002b68: 0d 00                      |                             br_if 0
 002b6a: 20 07                      |                             local.get 7
 002b6c: 41 03                      |                             i32.const 3
 002b6e: 76                         |                             i32.shr_u
 002b6f: 22 08                      |                             local.tee 8
 002b71: 41 03                      |                             i32.const 3
 002b73: 74                         |                             i32.shl
 002b74: 41 d4 18                   |                             i32.const 3156
 002b77: 6a                         |                             i32.add
 002b78: 21 03                      |                             local.set 3
 002b7a: 41 00                      |                             i32.const 0
 002b7c: 28 02 c0 18                |                             i32.load 2 3136
 002b80: 21 04                      |                             local.set 4
 002b82: 02 40                      |                             block
 002b84: 02 40                      |                               block
 002b86: 20 02                      |                                 local.get 2
 002b88: 41 01                      |                                 i32.const 1
 002b8a: 20 08                      |                                 local.get 8
 002b8c: 74                         |                                 i32.shl
 002b8d: 22 08                      |                                 local.tee 8
 002b8f: 71                         |                                 i32.and
 002b90: 0d 00                      |                                 br_if 0
 002b92: 41 00                      |                                 i32.const 0
 002b94: 20 02                      |                                 local.get 2
 002b96: 20 08                      |                                 local.get 8
 002b98: 72                         |                                 i32.or
 002b99: 36 02 ac 18                |                                 i32.store 2 3116
 002b9d: 20 03                      |                                 local.get 3
 002b9f: 21 08                      |                                 local.set 8
 002ba1: 0c 01                      |                                 br 1
 002ba3: 0b                         |                               end
 002ba4: 20 03                      |                               local.get 3
 002ba6: 28 02 08                   |                               i32.load 2 8
 002ba9: 21 08                      |                               local.set 8
 002bab: 0b                         |                             end
 002bac: 20 03                      |                             local.get 3
 002bae: 20 04                      |                             local.get 4
 002bb0: 36 02 08                   |                             i32.store 2 8
 002bb3: 20 08                      |                             local.get 8
 002bb5: 20 04                      |                             local.get 4
 002bb7: 36 02 0c                   |                             i32.store 2 12
 002bba: 20 04                      |                             local.get 4
 002bbc: 20 03                      |                             local.get 3
 002bbe: 36 02 0c                   |                             i32.store 2 12
 002bc1: 20 04                      |                             local.get 4
 002bc3: 20 08                      |                             local.get 8
 002bc5: 36 02 08                   |                             i32.store 2 8
 002bc8: 0b                         |                           end
 002bc9: 41 00                      |                           i32.const 0
 002bcb: 20 05                      |                           local.get 5
 002bcd: 36 02 c0 18                |                           i32.store 2 3136
 002bd1: 41 00                      |                           i32.const 0
 002bd3: 20 06                      |                           local.get 6
 002bd5: 36 02 b4 18                |                           i32.store 2 3124
 002bd9: 0c 0c                      |                           br 12
 002bdb: 0b                         |                         end
 002bdc: 41 00                      |                         i32.const 0
 002bde: 28 02 b0 18                |                         i32.load 2 3120
 002be2: 22 09                      |                         local.tee 9
 002be4: 45                         |                         i32.eqz
 002be5: 0d 01                      |                         br_if 1
 002be7: 20 09                      |                         local.get 9
 002be9: 41 00                      |                         i32.const 0
 002beb: 20 09                      |                         local.get 9
 002bed: 6b                         |                         i32.sub
 002bee: 71                         |                         i32.and
 002bef: 41 7f                      |                         i32.const 4294967295
 002bf1: 6a                         |                         i32.add
 002bf2: 22 00                      |                         local.tee 0
 002bf4: 20 00                      |                         local.get 0
 002bf6: 41 0c                      |                         i32.const 12
 002bf8: 76                         |                         i32.shr_u
 002bf9: 41 10                      |                         i32.const 16
 002bfb: 71                         |                         i32.and
 002bfc: 22 00                      |                         local.tee 0
 002bfe: 76                         |                         i32.shr_u
 002bff: 22 04                      |                         local.tee 4
 002c01: 41 05                      |                         i32.const 5
 002c03: 76                         |                         i32.shr_u
 002c04: 41 08                      |                         i32.const 8
 002c06: 71                         |                         i32.and
 002c07: 22 06                      |                         local.tee 6
 002c09: 20 00                      |                         local.get 0
 002c0b: 72                         |                         i32.or
 002c0c: 20 04                      |                         local.get 4
 002c0e: 20 06                      |                         local.get 6
 002c10: 76                         |                         i32.shr_u
 002c11: 22 00                      |                         local.tee 0
 002c13: 41 02                      |                         i32.const 2
 002c15: 76                         |                         i32.shr_u
 002c16: 41 04                      |                         i32.const 4
 002c18: 71                         |                         i32.and
 002c19: 22 04                      |                         local.tee 4
 002c1b: 72                         |                         i32.or
 002c1c: 20 00                      |                         local.get 0
 002c1e: 20 04                      |                         local.get 4
 002c20: 76                         |                         i32.shr_u
 002c21: 22 00                      |                         local.tee 0
 002c23: 41 01                      |                         i32.const 1
 002c25: 76                         |                         i32.shr_u
 002c26: 41 02                      |                         i32.const 2
 002c28: 71                         |                         i32.and
 002c29: 22 04                      |                         local.tee 4
 002c2b: 72                         |                         i32.or
 002c2c: 20 00                      |                         local.get 0
 002c2e: 20 04                      |                         local.get 4
 002c30: 76                         |                         i32.shr_u
 002c31: 22 00                      |                         local.tee 0
 002c33: 41 01                      |                         i32.const 1
 002c35: 76                         |                         i32.shr_u
 002c36: 41 01                      |                         i32.const 1
 002c38: 71                         |                         i32.and
 002c39: 22 04                      |                         local.tee 4
 002c3b: 72                         |                         i32.or
 002c3c: 20 00                      |                         local.get 0
 002c3e: 20 04                      |                         local.get 4
 002c40: 76                         |                         i32.shr_u
 002c41: 6a                         |                         i32.add
 002c42: 41 02                      |                         i32.const 2
 002c44: 74                         |                         i32.shl
 002c45: 41 dc 1a                   |                         i32.const 3420
 002c48: 6a                         |                         i32.add
 002c49: 28 02 00                   |                         i32.load 2 0
 002c4c: 22 05                      |                         local.tee 5
 002c4e: 28 02 04                   |                         i32.load 2 4
 002c51: 41 78                      |                         i32.const 4294967288
 002c53: 71                         |                         i32.and
 002c54: 20 03                      |                         local.get 3
 002c56: 6b                         |                         i32.sub
 002c57: 21 04                      |                         local.set 4
 002c59: 20 05                      |                         local.get 5
 002c5b: 21 06                      |                         local.set 6
 002c5d: 02 40                      |                         block
 002c5f: 03 40                      |                           loop
 002c61: 02 40                      |                             block
 002c63: 20 06                      |                               local.get 6
 002c65: 28 02 10                   |                               i32.load 2 16
 002c68: 22 00                      |                               local.tee 0
 002c6a: 0d 00                      |                               br_if 0
 002c6c: 20 06                      |                               local.get 6
 002c6e: 41 14                      |                               i32.const 20
 002c70: 6a                         |                               i32.add
 002c71: 28 02 00                   |                               i32.load 2 0
 002c74: 22 00                      |                               local.tee 0
 002c76: 45                         |                               i32.eqz
 002c77: 0d 02                      |                               br_if 2
 002c79: 0b                         |                             end
 002c7a: 20 00                      |                             local.get 0
 002c7c: 28 02 04                   |                             i32.load 2 4
 002c7f: 41 78                      |                             i32.const 4294967288
 002c81: 71                         |                             i32.and
 002c82: 20 03                      |                             local.get 3
 002c84: 6b                         |                             i32.sub
 002c85: 22 06                      |                             local.tee 6
 002c87: 20 04                      |                             local.get 4
 002c89: 20 06                      |                             local.get 6
 002c8b: 20 04                      |                             local.get 4
 002c8d: 49                         |                             i32.lt_u
 002c8e: 22 06                      |                             local.tee 6
 002c90: 1b                         |                             select
 002c91: 21 04                      |                             local.set 4
 002c93: 20 00                      |                             local.get 0
 002c95: 20 05                      |                             local.get 5
 002c97: 20 06                      |                             local.get 6
 002c99: 1b                         |                             select
 002c9a: 21 05                      |                             local.set 5
 002c9c: 20 00                      |                             local.get 0
 002c9e: 21 06                      |                             local.set 6
 002ca0: 0c 00                      |                             br 0
 002ca2: 00                         |                             unreachable
 002ca3: 0b                         |                           end
 002ca4: 00                         |                           unreachable
 002ca5: 0b                         |                         end
 002ca6: 20 05                      |                         local.get 5
 002ca8: 28 02 18                   |                         i32.load 2 24
 002cab: 21 0a                      |                         local.set 10
 002cad: 02 40                      |                         block
 002caf: 20 05                      |                           local.get 5
 002cb1: 28 02 0c                   |                           i32.load 2 12
 002cb4: 22 08                      |                           local.tee 8
 002cb6: 20 05                      |                           local.get 5
 002cb8: 46                         |                           i32.eq
 002cb9: 0d 00                      |                           br_if 0
 002cbb: 02 40                      |                           block
 002cbd: 41 00                      |                             i32.const 0
 002cbf: 28 02 bc 18                |                             i32.load 2 3132
 002cc3: 20 05                      |                             local.get 5
 002cc5: 28 02 08                   |                             i32.load 2 8
 002cc8: 22 00                      |                             local.tee 0
 002cca: 4b                         |                             i32.gt_u
 002ccb: 0d 00                      |                             br_if 0
 002ccd: 20 00                      |                             local.get 0
 002ccf: 28 02 0c                   |                             i32.load 2 12
 002cd2: 20 05                      |                             local.get 5
 002cd4: 47                         |                             i32.ne
 002cd5: 1a                         |                             drop
 002cd6: 0b                         |                           end
 002cd7: 20 00                      |                           local.get 0
 002cd9: 20 08                      |                           local.get 8
 002cdb: 36 02 0c                   |                           i32.store 2 12
 002cde: 20 08                      |                           local.get 8
 002ce0: 20 00                      |                           local.get 0
 002ce2: 36 02 08                   |                           i32.store 2 8
 002ce5: 0c 0b                      |                           br 11
 002ce7: 0b                         |                         end
 002ce8: 02 40                      |                         block
 002cea: 20 05                      |                           local.get 5
 002cec: 41 14                      |                           i32.const 20
 002cee: 6a                         |                           i32.add
 002cef: 22 06                      |                           local.tee 6
 002cf1: 28 02 00                   |                           i32.load 2 0
 002cf4: 22 00                      |                           local.tee 0
 002cf6: 0d 00                      |                           br_if 0
 002cf8: 20 05                      |                           local.get 5
 002cfa: 28 02 10                   |                           i32.load 2 16
 002cfd: 22 00                      |                           local.tee 0
 002cff: 45                         |                           i32.eqz
 002d00: 0d 03                      |                           br_if 3
 002d02: 20 05                      |                           local.get 5
 002d04: 41 10                      |                           i32.const 16
 002d06: 6a                         |                           i32.add
 002d07: 21 06                      |                           local.set 6
 002d09: 0b                         |                         end
 002d0a: 03 40                      |                         loop
 002d0c: 20 06                      |                           local.get 6
 002d0e: 21 0b                      |                           local.set 11
 002d10: 20 00                      |                           local.get 0
 002d12: 22 08                      |                           local.tee 8
 002d14: 41 14                      |                           i32.const 20
 002d16: 6a                         |                           i32.add
 002d17: 22 06                      |                           local.tee 6
 002d19: 28 02 00                   |                           i32.load 2 0
 002d1c: 22 00                      |                           local.tee 0
 002d1e: 0d 00                      |                           br_if 0
 002d20: 20 08                      |                           local.get 8
 002d22: 41 10                      |                           i32.const 16
 002d24: 6a                         |                           i32.add
 002d25: 21 06                      |                           local.set 6
 002d27: 20 08                      |                           local.get 8
 002d29: 28 02 10                   |                           i32.load 2 16
 002d2c: 22 00                      |                           local.tee 0
 002d2e: 0d 00                      |                           br_if 0
 002d30: 0b                         |                         end
 002d31: 20 0b                      |                         local.get 11
 002d33: 41 00                      |                         i32.const 0
 002d35: 36 02 00                   |                         i32.store 2 0
 002d38: 0c 0a                      |                         br 10
 002d3a: 0b                         |                       end
 002d3b: 41 7f                      |                       i32.const 4294967295
 002d3d: 21 03                      |                       local.set 3
 002d3f: 20 00                      |                       local.get 0
 002d41: 41 bf 7f                   |                       i32.const 4294967231
 002d44: 4b                         |                       i32.gt_u
 002d45: 0d 00                      |                       br_if 0
 002d47: 20 00                      |                       local.get 0
 002d49: 41 0b                      |                       i32.const 11
 002d4b: 6a                         |                       i32.add
 002d4c: 22 00                      |                       local.tee 0
 002d4e: 41 78                      |                       i32.const 4294967288
 002d50: 71                         |                       i32.and
 002d51: 21 03                      |                       local.set 3
 002d53: 41 00                      |                       i32.const 0
 002d55: 28 02 b0 18                |                       i32.load 2 3120
 002d59: 22 07                      |                       local.tee 7
 002d5b: 45                         |                       i32.eqz
 002d5c: 0d 00                      |                       br_if 0
 002d5e: 41 00                      |                       i32.const 0
 002d60: 21 0b                      |                       local.set 11
 002d62: 02 40                      |                       block
 002d64: 20 00                      |                         local.get 0
 002d66: 41 08                      |                         i32.const 8
 002d68: 76                         |                         i32.shr_u
 002d69: 22 00                      |                         local.tee 0
 002d6b: 45                         |                         i32.eqz
 002d6c: 0d 00                      |                         br_if 0
 002d6e: 41 1f                      |                         i32.const 31
 002d70: 21 0b                      |                         local.set 11
 002d72: 20 03                      |                         local.get 3
 002d74: 41 ff ff ff 07             |                         i32.const 16777215
 002d79: 4b                         |                         i32.gt_u
 002d7a: 0d 00                      |                         br_if 0
 002d7c: 20 00                      |                         local.get 0
 002d7e: 20 00                      |                         local.get 0
 002d80: 41 80 fe 3f                |                         i32.const 1048320
 002d84: 6a                         |                         i32.add
 002d85: 41 10                      |                         i32.const 16
 002d87: 76                         |                         i32.shr_u
 002d88: 41 08                      |                         i32.const 8
 002d8a: 71                         |                         i32.and
 002d8b: 22 04                      |                         local.tee 4
 002d8d: 74                         |                         i32.shl
 002d8e: 22 00                      |                         local.tee 0
 002d90: 20 00                      |                         local.get 0
 002d92: 41 80 e0 1f                |                         i32.const 520192
 002d96: 6a                         |                         i32.add
 002d97: 41 10                      |                         i32.const 16
 002d99: 76                         |                         i32.shr_u
 002d9a: 41 04                      |                         i32.const 4
 002d9c: 71                         |                         i32.and
 002d9d: 22 00                      |                         local.tee 0
 002d9f: 74                         |                         i32.shl
 002da0: 22 06                      |                         local.tee 6
 002da2: 20 06                      |                         local.get 6
 002da4: 41 80 80 0f                |                         i32.const 245760
 002da8: 6a                         |                         i32.add
 002da9: 41 10                      |                         i32.const 16
 002dab: 76                         |                         i32.shr_u
 002dac: 41 02                      |                         i32.const 2
 002dae: 71                         |                         i32.and
 002daf: 22 06                      |                         local.tee 6
 002db1: 74                         |                         i32.shl
 002db2: 41 0f                      |                         i32.const 15
 002db4: 76                         |                         i32.shr_u
 002db5: 20 00                      |                         local.get 0
 002db7: 20 04                      |                         local.get 4
 002db9: 72                         |                         i32.or
 002dba: 20 06                      |                         local.get 6
 002dbc: 72                         |                         i32.or
 002dbd: 6b                         |                         i32.sub
 002dbe: 22 00                      |                         local.tee 0
 002dc0: 41 01                      |                         i32.const 1
 002dc2: 74                         |                         i32.shl
 002dc3: 20 03                      |                         local.get 3
 002dc5: 20 00                      |                         local.get 0
 002dc7: 41 15                      |                         i32.const 21
 002dc9: 6a                         |                         i32.add
 002dca: 76                         |                         i32.shr_u
 002dcb: 41 01                      |                         i32.const 1
 002dcd: 71                         |                         i32.and
 002dce: 72                         |                         i32.or
 002dcf: 41 1c                      |                         i32.const 28
 002dd1: 6a                         |                         i32.add
 002dd2: 21 0b                      |                         local.set 11
 002dd4: 0b                         |                       end
 002dd5: 41 00                      |                       i32.const 0
 002dd7: 20 03                      |                       local.get 3
 002dd9: 6b                         |                       i32.sub
 002dda: 21 06                      |                       local.set 6
 002ddc: 02 40                      |                       block
 002dde: 02 40                      |                         block
 002de0: 02 40                      |                           block
 002de2: 02 40                      |                             block
 002de4: 20 0b                      |                               local.get 11
 002de6: 41 02                      |                               i32.const 2
 002de8: 74                         |                               i32.shl
 002de9: 41 dc 1a                   |                               i32.const 3420
 002dec: 6a                         |                               i32.add
 002ded: 28 02 00                   |                               i32.load 2 0
 002df0: 22 04                      |                               local.tee 4
 002df2: 0d 00                      |                               br_if 0
 002df4: 41 00                      |                               i32.const 0
 002df6: 21 00                      |                               local.set 0
 002df8: 41 00                      |                               i32.const 0
 002dfa: 21 08                      |                               local.set 8
 002dfc: 0c 01                      |                               br 1
 002dfe: 0b                         |                             end
 002dff: 20 03                      |                             local.get 3
 002e01: 41 00                      |                             i32.const 0
 002e03: 41 19                      |                             i32.const 25
 002e05: 20 0b                      |                             local.get 11
 002e07: 41 01                      |                             i32.const 1
 002e09: 76                         |                             i32.shr_u
 002e0a: 6b                         |                             i32.sub
 002e0b: 20 0b                      |                             local.get 11
 002e0d: 41 1f                      |                             i32.const 31
 002e0f: 46                         |                             i32.eq
 002e10: 1b                         |                             select
 002e11: 74                         |                             i32.shl
 002e12: 21 05                      |                             local.set 5
 002e14: 41 00                      |                             i32.const 0
 002e16: 21 00                      |                             local.set 0
 002e18: 41 00                      |                             i32.const 0
 002e1a: 21 08                      |                             local.set 8
 002e1c: 03 40                      |                             loop
 002e1e: 02 40                      |                               block
 002e20: 20 04                      |                                 local.get 4
 002e22: 28 02 04                   |                                 i32.load 2 4
 002e25: 41 78                      |                                 i32.const 4294967288
 002e27: 71                         |                                 i32.and
 002e28: 20 03                      |                                 local.get 3
 002e2a: 6b                         |                                 i32.sub
 002e2b: 22 02                      |                                 local.tee 2
 002e2d: 20 06                      |                                 local.get 6
 002e2f: 4f                         |                                 i32.ge_u
 002e30: 0d 00                      |                                 br_if 0
 002e32: 20 02                      |                                 local.get 2
 002e34: 21 06                      |                                 local.set 6
 002e36: 20 04                      |                                 local.get 4
 002e38: 21 08                      |                                 local.set 8
 002e3a: 20 02                      |                                 local.get 2
 002e3c: 0d 00                      |                                 br_if 0
 002e3e: 41 00                      |                                 i32.const 0
 002e40: 21 06                      |                                 local.set 6
 002e42: 20 04                      |                                 local.get 4
 002e44: 21 08                      |                                 local.set 8
 002e46: 20 04                      |                                 local.get 4
 002e48: 21 00                      |                                 local.set 0
 002e4a: 0c 03                      |                                 br 3
 002e4c: 0b                         |                               end
 002e4d: 20 00                      |                               local.get 0
 002e4f: 20 04                      |                               local.get 4
 002e51: 41 14                      |                               i32.const 20
 002e53: 6a                         |                               i32.add
 002e54: 28 02 00                   |                               i32.load 2 0
 002e57: 22 02                      |                               local.tee 2
 002e59: 20 02                      |                               local.get 2
 002e5b: 20 04                      |                               local.get 4
 002e5d: 20 05                      |                               local.get 5
 002e5f: 41 1d                      |                               i32.const 29
 002e61: 76                         |                               i32.shr_u
 002e62: 41 04                      |                               i32.const 4
 002e64: 71                         |                               i32.and
 002e65: 6a                         |                               i32.add
 002e66: 41 10                      |                               i32.const 16
 002e68: 6a                         |                               i32.add
 002e69: 28 02 00                   |                               i32.load 2 0
 002e6c: 22 04                      |                               local.tee 4
 002e6e: 46                         |                               i32.eq
 002e6f: 1b                         |                               select
 002e70: 20 00                      |                               local.get 0
 002e72: 20 02                      |                               local.get 2
 002e74: 1b                         |                               select
 002e75: 21 00                      |                               local.set 0
 002e77: 20 05                      |                               local.get 5
 002e79: 20 04                      |                               local.get 4
 002e7b: 41 00                      |                               i32.const 0
 002e7d: 47                         |                               i32.ne
 002e7e: 74                         |                               i32.shl
 002e7f: 21 05                      |                               local.set 5
 002e81: 20 04                      |                               local.get 4
 002e83: 0d 00                      |                               br_if 0
 002e85: 0b                         |                             end
 002e86: 0b                         |                           end
 002e87: 02 40                      |                           block
 002e89: 20 00                      |                             local.get 0
 002e8b: 20 08                      |                             local.get 8
 002e8d: 72                         |                             i32.or
 002e8e: 0d 00                      |                             br_if 0
 002e90: 41 02                      |                             i32.const 2
 002e92: 20 0b                      |                             local.get 11
 002e94: 74                         |                             i32.shl
 002e95: 22 00                      |                             local.tee 0
 002e97: 41 00                      |                             i32.const 0
 002e99: 20 00                      |                             local.get 0
 002e9b: 6b                         |                             i32.sub
 002e9c: 72                         |                             i32.or
 002e9d: 20 07                      |                             local.get 7
 002e9f: 71                         |                             i32.and
 002ea0: 22 00                      |                             local.tee 0
 002ea2: 45                         |                             i32.eqz
 002ea3: 0d 03                      |                             br_if 3
 002ea5: 20 00                      |                             local.get 0
 002ea7: 41 00                      |                             i32.const 0
 002ea9: 20 00                      |                             local.get 0
 002eab: 6b                         |                             i32.sub
 002eac: 71                         |                             i32.and
 002ead: 41 7f                      |                             i32.const 4294967295
 002eaf: 6a                         |                             i32.add
 002eb0: 22 00                      |                             local.tee 0
 002eb2: 20 00                      |                             local.get 0
 002eb4: 41 0c                      |                             i32.const 12
 002eb6: 76                         |                             i32.shr_u
 002eb7: 41 10                      |                             i32.const 16
 002eb9: 71                         |                             i32.and
 002eba: 22 00                      |                             local.tee 0
 002ebc: 76                         |                             i32.shr_u
 002ebd: 22 04                      |                             local.tee 4
 002ebf: 41 05                      |                             i32.const 5
 002ec1: 76                         |                             i32.shr_u
 002ec2: 41 08                      |                             i32.const 8
 002ec4: 71                         |                             i32.and
 002ec5: 22 05                      |                             local.tee 5
 002ec7: 20 00                      |                             local.get 0
 002ec9: 72                         |                             i32.or
 002eca: 20 04                      |                             local.get 4
 002ecc: 20 05                      |                             local.get 5
 002ece: 76                         |                             i32.shr_u
 002ecf: 22 00                      |                             local.tee 0
 002ed1: 41 02                      |                             i32.const 2
 002ed3: 76                         |                             i32.shr_u
 002ed4: 41 04                      |                             i32.const 4
 002ed6: 71                         |                             i32.and
 002ed7: 22 04                      |                             local.tee 4
 002ed9: 72                         |                             i32.or
 002eda: 20 00                      |                             local.get 0
 002edc: 20 04                      |                             local.get 4
 002ede: 76                         |                             i32.shr_u
 002edf: 22 00                      |                             local.tee 0
 002ee1: 41 01                      |                             i32.const 1
 002ee3: 76                         |                             i32.shr_u
 002ee4: 41 02                      |                             i32.const 2
 002ee6: 71                         |                             i32.and
 002ee7: 22 04                      |                             local.tee 4
 002ee9: 72                         |                             i32.or
 002eea: 20 00                      |                             local.get 0
 002eec: 20 04                      |                             local.get 4
 002eee: 76                         |                             i32.shr_u
 002eef: 22 00                      |                             local.tee 0
 002ef1: 41 01                      |                             i32.const 1
 002ef3: 76                         |                             i32.shr_u
 002ef4: 41 01                      |                             i32.const 1
 002ef6: 71                         |                             i32.and
 002ef7: 22 04                      |                             local.tee 4
 002ef9: 72                         |                             i32.or
 002efa: 20 00                      |                             local.get 0
 002efc: 20 04                      |                             local.get 4
 002efe: 76                         |                             i32.shr_u
 002eff: 6a                         |                             i32.add
 002f00: 41 02                      |                             i32.const 2
 002f02: 74                         |                             i32.shl
 002f03: 41 dc 1a                   |                             i32.const 3420
 002f06: 6a                         |                             i32.add
 002f07: 28 02 00                   |                             i32.load 2 0
 002f0a: 21 00                      |                             local.set 0
 002f0c: 0b                         |                           end
 002f0d: 20 00                      |                           local.get 0
 002f0f: 45                         |                           i32.eqz
 002f10: 0d 01                      |                           br_if 1
 002f12: 0b                         |                         end
 002f13: 03 40                      |                         loop
 002f15: 20 00                      |                           local.get 0
 002f17: 28 02 04                   |                           i32.load 2 4
 002f1a: 41 78                      |                           i32.const 4294967288
 002f1c: 71                         |                           i32.and
 002f1d: 20 03                      |                           local.get 3
 002f1f: 6b                         |                           i32.sub
 002f20: 22 02                      |                           local.tee 2
 002f22: 20 06                      |                           local.get 6
 002f24: 49                         |                           i32.lt_u
 002f25: 21 05                      |                           local.set 5
 002f27: 02 40                      |                           block
 002f29: 20 00                      |                             local.get 0
 002f2b: 28 02 10                   |                             i32.load 2 16
 002f2e: 22 04                      |                             local.tee 4
 002f30: 0d 00                      |                             br_if 0
 002f32: 20 00                      |                             local.get 0
 002f34: 41 14                      |                             i32.const 20
 002f36: 6a                         |                             i32.add
 002f37: 28 02 00                   |                             i32.load 2 0
 002f3a: 21 04                      |                             local.set 4
 002f3c: 0b                         |                           end
 002f3d: 20 02                      |                           local.get 2
 002f3f: 20 06                      |                           local.get 6
 002f41: 20 05                      |                           local.get 5
 002f43: 1b                         |                           select
 002f44: 21 06                      |                           local.set 6
 002f46: 20 00                      |                           local.get 0
 002f48: 20 08                      |                           local.get 8
 002f4a: 20 05                      |                           local.get 5
 002f4c: 1b                         |                           select
 002f4d: 21 08                      |                           local.set 8
 002f4f: 20 04                      |                           local.get 4
 002f51: 21 00                      |                           local.set 0
 002f53: 20 04                      |                           local.get 4
 002f55: 0d 00                      |                           br_if 0
 002f57: 0b                         |                         end
 002f58: 0b                         |                       end
 002f59: 20 08                      |                       local.get 8
 002f5b: 45                         |                       i32.eqz
 002f5c: 0d 00                      |                       br_if 0
 002f5e: 20 06                      |                       local.get 6
 002f60: 41 00                      |                       i32.const 0
 002f62: 28 02 b4 18                |                       i32.load 2 3124
 002f66: 20 03                      |                       local.get 3
 002f68: 6b                         |                       i32.sub
 002f69: 4f                         |                       i32.ge_u
 002f6a: 0d 00                      |                       br_if 0
 002f6c: 20 08                      |                       local.get 8
 002f6e: 28 02 18                   |                       i32.load 2 24
 002f71: 21 0b                      |                       local.set 11
 002f73: 02 40                      |                       block
 002f75: 20 08                      |                         local.get 8
 002f77: 28 02 0c                   |                         i32.load 2 12
 002f7a: 22 05                      |                         local.tee 5
 002f7c: 20 08                      |                         local.get 8
 002f7e: 46                         |                         i32.eq
 002f7f: 0d 00                      |                         br_if 0
 002f81: 02 40                      |                         block
 002f83: 41 00                      |                           i32.const 0
 002f85: 28 02 bc 18                |                           i32.load 2 3132
 002f89: 20 08                      |                           local.get 8
 002f8b: 28 02 08                   |                           i32.load 2 8
 002f8e: 22 00                      |                           local.tee 0
 002f90: 4b                         |                           i32.gt_u
 002f91: 0d 00                      |                           br_if 0
 002f93: 20 00                      |                           local.get 0
 002f95: 28 02 0c                   |                           i32.load 2 12
 002f98: 20 08                      |                           local.get 8
 002f9a: 47                         |                           i32.ne
 002f9b: 1a                         |                           drop
 002f9c: 0b                         |                         end
 002f9d: 20 00                      |                         local.get 0
 002f9f: 20 05                      |                         local.get 5
 002fa1: 36 02 0c                   |                         i32.store 2 12
 002fa4: 20 05                      |                         local.get 5
 002fa6: 20 00                      |                         local.get 0
 002fa8: 36 02 08                   |                         i32.store 2 8
 002fab: 0c 09                      |                         br 9
 002fad: 0b                         |                       end
 002fae: 02 40                      |                       block
 002fb0: 20 08                      |                         local.get 8
 002fb2: 41 14                      |                         i32.const 20
 002fb4: 6a                         |                         i32.add
 002fb5: 22 04                      |                         local.tee 4
 002fb7: 28 02 00                   |                         i32.load 2 0
 002fba: 22 00                      |                         local.tee 0
 002fbc: 0d 00                      |                         br_if 0
 002fbe: 20 08                      |                         local.get 8
 002fc0: 28 02 10                   |                         i32.load 2 16
 002fc3: 22 00                      |                         local.tee 0
 002fc5: 45                         |                         i32.eqz
 002fc6: 0d 03                      |                         br_if 3
 002fc8: 20 08                      |                         local.get 8
 002fca: 41 10                      |                         i32.const 16
 002fcc: 6a                         |                         i32.add
 002fcd: 21 04                      |                         local.set 4
 002fcf: 0b                         |                       end
 002fd0: 03 40                      |                       loop
 002fd2: 20 04                      |                         local.get 4
 002fd4: 21 02                      |                         local.set 2
 002fd6: 20 00                      |                         local.get 0
 002fd8: 22 05                      |                         local.tee 5
 002fda: 41 14                      |                         i32.const 20
 002fdc: 6a                         |                         i32.add
 002fdd: 22 04                      |                         local.tee 4
 002fdf: 28 02 00                   |                         i32.load 2 0
 002fe2: 22 00                      |                         local.tee 0
 002fe4: 0d 00                      |                         br_if 0
 002fe6: 20 05                      |                         local.get 5
 002fe8: 41 10                      |                         i32.const 16
 002fea: 6a                         |                         i32.add
 002feb: 21 04                      |                         local.set 4
 002fed: 20 05                      |                         local.get 5
 002fef: 28 02 10                   |                         i32.load 2 16
 002ff2: 22 00                      |                         local.tee 0
 002ff4: 0d 00                      |                         br_if 0
 002ff6: 0b                         |                       end
 002ff7: 20 02                      |                       local.get 2
 002ff9: 41 00                      |                       i32.const 0
 002ffb: 36 02 00                   |                       i32.store 2 0
 002ffe: 0c 08                      |                       br 8
 003000: 0b                         |                     end
 003001: 02 40                      |                     block
 003003: 41 00                      |                       i32.const 0
 003005: 28 02 b4 18                |                       i32.load 2 3124
 003009: 22 00                      |                       local.tee 0
 00300b: 20 03                      |                       local.get 3
 00300d: 49                         |                       i32.lt_u
 00300e: 0d 00                      |                       br_if 0
 003010: 41 00                      |                       i32.const 0
 003012: 28 02 c0 18                |                       i32.load 2 3136
 003016: 21 04                      |                       local.set 4
 003018: 02 40                      |                       block
 00301a: 02 40                      |                         block
 00301c: 20 00                      |                           local.get 0
 00301e: 20 03                      |                           local.get 3
 003020: 6b                         |                           i32.sub
 003021: 22 06                      |                           local.tee 6
 003023: 41 10                      |                           i32.const 16
 003025: 49                         |                           i32.lt_u
 003026: 0d 00                      |                           br_if 0
 003028: 41 00                      |                           i32.const 0
 00302a: 20 06                      |                           local.get 6
 00302c: 36 02 b4 18                |                           i32.store 2 3124
 003030: 41 00                      |                           i32.const 0
 003032: 20 04                      |                           local.get 4
 003034: 20 03                      |                           local.get 3
 003036: 6a                         |                           i32.add
 003037: 22 05                      |                           local.tee 5
 003039: 36 02 c0 18                |                           i32.store 2 3136
 00303d: 20 05                      |                           local.get 5
 00303f: 20 06                      |                           local.get 6
 003041: 41 01                      |                           i32.const 1
 003043: 72                         |                           i32.or
 003044: 36 02 04                   |                           i32.store 2 4
 003047: 20 04                      |                           local.get 4
 003049: 20 00                      |                           local.get 0
 00304b: 6a                         |                           i32.add
 00304c: 20 06                      |                           local.get 6
 00304e: 36 02 00                   |                           i32.store 2 0
 003051: 20 04                      |                           local.get 4
 003053: 20 03                      |                           local.get 3
 003055: 41 03                      |                           i32.const 3
 003057: 72                         |                           i32.or
 003058: 36 02 04                   |                           i32.store 2 4
 00305b: 0c 01                      |                           br 1
 00305d: 0b                         |                         end
 00305e: 41 00                      |                         i32.const 0
 003060: 41 00                      |                         i32.const 0
 003062: 36 02 c0 18                |                         i32.store 2 3136
 003066: 41 00                      |                         i32.const 0
 003068: 41 00                      |                         i32.const 0
 00306a: 36 02 b4 18                |                         i32.store 2 3124
 00306e: 20 04                      |                         local.get 4
 003070: 20 00                      |                         local.get 0
 003072: 41 03                      |                         i32.const 3
 003074: 72                         |                         i32.or
 003075: 36 02 04                   |                         i32.store 2 4
 003078: 20 04                      |                         local.get 4
 00307a: 20 00                      |                         local.get 0
 00307c: 6a                         |                         i32.add
 00307d: 22 00                      |                         local.tee 0
 00307f: 20 00                      |                         local.get 0
 003081: 28 02 04                   |                         i32.load 2 4
 003084: 41 01                      |                         i32.const 1
 003086: 72                         |                         i32.or
 003087: 36 02 04                   |                         i32.store 2 4
 00308a: 0b                         |                       end
 00308b: 20 04                      |                       local.get 4
 00308d: 41 08                      |                       i32.const 8
 00308f: 6a                         |                       i32.add
 003090: 21 00                      |                       local.set 0
 003092: 0c 0a                      |                       br 10
 003094: 0b                         |                     end
 003095: 02 40                      |                     block
 003097: 41 00                      |                       i32.const 0
 003099: 28 02 b8 18                |                       i32.load 2 3128
 00309d: 22 05                      |                       local.tee 5
 00309f: 20 03                      |                       local.get 3
 0030a1: 4d                         |                       i32.le_u
 0030a2: 0d 00                      |                       br_if 0
 0030a4: 41 00                      |                       i32.const 0
 0030a6: 20 05                      |                       local.get 5
 0030a8: 20 03                      |                       local.get 3
 0030aa: 6b                         |                       i32.sub
 0030ab: 22 04                      |                       local.tee 4
 0030ad: 36 02 b8 18                |                       i32.store 2 3128
 0030b1: 41 00                      |                       i32.const 0
 0030b3: 41 00                      |                       i32.const 0
 0030b5: 28 02 c4 18                |                       i32.load 2 3140
 0030b9: 22 00                      |                       local.tee 0
 0030bb: 20 03                      |                       local.get 3
 0030bd: 6a                         |                       i32.add
 0030be: 22 06                      |                       local.tee 6
 0030c0: 36 02 c4 18                |                       i32.store 2 3140
 0030c4: 20 06                      |                       local.get 6
 0030c6: 20 04                      |                       local.get 4
 0030c8: 41 01                      |                       i32.const 1
 0030ca: 72                         |                       i32.or
 0030cb: 36 02 04                   |                       i32.store 2 4
 0030ce: 20 00                      |                       local.get 0
 0030d0: 20 03                      |                       local.get 3
 0030d2: 41 03                      |                       i32.const 3
 0030d4: 72                         |                       i32.or
 0030d5: 36 02 04                   |                       i32.store 2 4
 0030d8: 20 00                      |                       local.get 0
 0030da: 41 08                      |                       i32.const 8
 0030dc: 6a                         |                       i32.add
 0030dd: 21 00                      |                       local.set 0
 0030df: 0c 0a                      |                       br 10
 0030e1: 0b                         |                     end
 0030e2: 02 40                      |                     block
 0030e4: 02 40                      |                       block
 0030e6: 41 00                      |                         i32.const 0
 0030e8: 28 02 84 1c                |                         i32.load 2 3588
 0030ec: 45                         |                         i32.eqz
 0030ed: 0d 00                      |                         br_if 0
 0030ef: 41 00                      |                         i32.const 0
 0030f1: 28 02 8c 1c                |                         i32.load 2 3596
 0030f5: 21 04                      |                         local.set 4
 0030f7: 0c 01                      |                         br 1
 0030f9: 0b                         |                       end
 0030fa: 41 00                      |                       i32.const 0
 0030fc: 42 7f                      |                       i64.const -1
 0030fe: 37 02 90 1c                |                       i64.store 2 3600
 003102: 41 00                      |                       i32.const 0
 003104: 42 80 a0 80 80 80 80 04    |                       i64.const 17592186048512
 00310c: 37 02 88 1c                |                       i64.store 2 3592
 003110: 41 00                      |                       i32.const 0
 003112: 20 01                      |                       local.get 1
 003114: 41 0c                      |                       i32.const 12
 003116: 6a                         |                       i32.add
 003117: 41 70                      |                       i32.const 4294967280
 003119: 71                         |                       i32.and
 00311a: 41 d8 aa d5 aa 05          |                       i32.const 1431655768
 003120: 73                         |                       i32.xor
 003121: 36 02 84 1c                |                       i32.store 2 3588
 003125: 41 00                      |                       i32.const 0
 003127: 41 00                      |                       i32.const 0
 003129: 36 02 98 1c                |                       i32.store 2 3608
 00312d: 41 00                      |                       i32.const 0
 00312f: 41 00                      |                       i32.const 0
 003131: 36 02 e8 1b                |                       i32.store 2 3560
 003135: 41 80 20                   |                       i32.const 4096
 003138: 21 04                      |                       local.set 4
 00313a: 0b                         |                     end
 00313b: 41 00                      |                     i32.const 0
 00313d: 21 00                      |                     local.set 0
 00313f: 20 04                      |                     local.get 4
 003141: 20 03                      |                     local.get 3
 003143: 41 2f                      |                     i32.const 47
 003145: 6a                         |                     i32.add
 003146: 22 07                      |                     local.tee 7
 003148: 6a                         |                     i32.add
 003149: 22 02                      |                     local.tee 2
 00314b: 41 00                      |                     i32.const 0
 00314d: 20 04                      |                     local.get 4
 00314f: 6b                         |                     i32.sub
 003150: 22 0b                      |                     local.tee 11
 003152: 71                         |                     i32.and
 003153: 22 08                      |                     local.tee 8
 003155: 20 03                      |                     local.get 3
 003157: 4d                         |                     i32.le_u
 003158: 0d 09                      |                     br_if 9
 00315a: 41 00                      |                     i32.const 0
 00315c: 21 00                      |                     local.set 0
 00315e: 02 40                      |                     block
 003160: 41 00                      |                       i32.const 0
 003162: 28 02 e4 1b                |                       i32.load 2 3556
 003166: 22 04                      |                       local.tee 4
 003168: 45                         |                       i32.eqz
 003169: 0d 00                      |                       br_if 0
 00316b: 41 00                      |                       i32.const 0
 00316d: 28 02 dc 1b                |                       i32.load 2 3548
 003171: 22 06                      |                       local.tee 6
 003173: 20 08                      |                       local.get 8
 003175: 6a                         |                       i32.add
 003176: 22 09                      |                       local.tee 9
 003178: 20 06                      |                       local.get 6
 00317a: 4d                         |                       i32.le_u
 00317b: 0d 0a                      |                       br_if 10
 00317d: 20 09                      |                       local.get 9
 00317f: 20 04                      |                       local.get 4
 003181: 4b                         |                       i32.gt_u
 003182: 0d 0a                      |                       br_if 10
 003184: 0b                         |                     end
 003185: 41 00                      |                     i32.const 0
 003187: 2d 00 e8 1b                |                     i32.load8_u 0 3560
 00318b: 41 04                      |                     i32.const 4
 00318d: 71                         |                     i32.and
 00318e: 0d 04                      |                     br_if 4
 003190: 02 40                      |                     block
 003192: 02 40                      |                       block
 003194: 02 40                      |                         block
 003196: 41 00                      |                           i32.const 0
 003198: 28 02 c4 18                |                           i32.load 2 3140
 00319c: 22 04                      |                           local.tee 4
 00319e: 45                         |                           i32.eqz
 00319f: 0d 00                      |                           br_if 0
 0031a1: 41 ec 1b                   |                           i32.const 3564
 0031a4: 21 00                      |                           local.set 0
 0031a6: 03 40                      |                           loop
 0031a8: 02 40                      |                             block
 0031aa: 20 00                      |                               local.get 0
 0031ac: 28 02 00                   |                               i32.load 2 0
 0031af: 22 06                      |                               local.tee 6
 0031b1: 20 04                      |                               local.get 4
 0031b3: 4b                         |                               i32.gt_u
 0031b4: 0d 00                      |                               br_if 0
 0031b6: 20 06                      |                               local.get 6
 0031b8: 20 00                      |                               local.get 0
 0031ba: 28 02 04                   |                               i32.load 2 4
 0031bd: 6a                         |                               i32.add
 0031be: 20 04                      |                               local.get 4
 0031c0: 4b                         |                               i32.gt_u
 0031c1: 0d 03                      |                               br_if 3
 0031c3: 0b                         |                             end
 0031c4: 20 00                      |                             local.get 0
 0031c6: 28 02 08                   |                             i32.load 2 8
 0031c9: 22 00                      |                             local.tee 0
 0031cb: 0d 00                      |                             br_if 0
 0031cd: 0b                         |                           end
 0031ce: 0b                         |                         end
 0031cf: 41 00                      |                         i32.const 0
 0031d1: 10 31                      |                         call 49
 0031d3: 22 05                      |                         local.tee 5
 0031d5: 41 7f                      |                         i32.const 4294967295
 0031d7: 46                         |                         i32.eq
 0031d8: 0d 05                      |                         br_if 5
 0031da: 20 08                      |                         local.get 8
 0031dc: 21 02                      |                         local.set 2
 0031de: 02 40                      |                         block
 0031e0: 41 00                      |                           i32.const 0
 0031e2: 28 02 88 1c                |                           i32.load 2 3592
 0031e6: 22 00                      |                           local.tee 0
 0031e8: 41 7f                      |                           i32.const 4294967295
 0031ea: 6a                         |                           i32.add
 0031eb: 22 04                      |                           local.tee 4
 0031ed: 20 05                      |                           local.get 5
 0031ef: 71                         |                           i32.and
 0031f0: 45                         |                           i32.eqz
 0031f1: 0d 00                      |                           br_if 0
 0031f3: 20 08                      |                           local.get 8
 0031f5: 20 05                      |                           local.get 5
 0031f7: 6b                         |                           i32.sub
 0031f8: 20 04                      |                           local.get 4
 0031fa: 20 05                      |                           local.get 5
 0031fc: 6a                         |                           i32.add
 0031fd: 41 00                      |                           i32.const 0
 0031ff: 20 00                      |                           local.get 0
 003201: 6b                         |                           i32.sub
 003202: 71                         |                           i32.and
 003203: 6a                         |                           i32.add
 003204: 21 02                      |                           local.set 2
 003206: 0b                         |                         end
 003207: 20 02                      |                         local.get 2
 003209: 20 03                      |                         local.get 3
 00320b: 4d                         |                         i32.le_u
 00320c: 0d 05                      |                         br_if 5
 00320e: 20 02                      |                         local.get 2
 003210: 41 fe ff ff ff 07          |                         i32.const 2147483646
 003216: 4b                         |                         i32.gt_u
 003217: 0d 05                      |                         br_if 5
 003219: 02 40                      |                         block
 00321b: 41 00                      |                           i32.const 0
 00321d: 28 02 e4 1b                |                           i32.load 2 3556
 003221: 22 00                      |                           local.tee 0
 003223: 45                         |                           i32.eqz
 003224: 0d 00                      |                           br_if 0
 003226: 41 00                      |                           i32.const 0
 003228: 28 02 dc 1b                |                           i32.load 2 3548
 00322c: 22 04                      |                           local.tee 4
 00322e: 20 02                      |                           local.get 2
 003230: 6a                         |                           i32.add
 003231: 22 06                      |                           local.tee 6
 003233: 20 04                      |                           local.get 4
 003235: 4d                         |                           i32.le_u
 003236: 0d 06                      |                           br_if 6
 003238: 20 06                      |                           local.get 6
 00323a: 20 00                      |                           local.get 0
 00323c: 4b                         |                           i32.gt_u
 00323d: 0d 06                      |                           br_if 6
 00323f: 0b                         |                         end
 003240: 20 02                      |                         local.get 2
 003242: 10 31                      |                         call 49
 003244: 22 00                      |                         local.tee 0
 003246: 20 05                      |                         local.get 5
 003248: 47                         |                         i32.ne
 003249: 0d 01                      |                         br_if 1
 00324b: 0c 07                      |                         br 7
 00324d: 0b                         |                       end
 00324e: 20 02                      |                       local.get 2
 003250: 20 05                      |                       local.get 5
 003252: 6b                         |                       i32.sub
 003253: 20 0b                      |                       local.get 11
 003255: 71                         |                       i32.and
 003256: 22 02                      |                       local.tee 2
 003258: 41 fe ff ff ff 07          |                       i32.const 2147483646
 00325e: 4b                         |                       i32.gt_u
 00325f: 0d 04                      |                       br_if 4
 003261: 20 02                      |                       local.get 2
 003263: 10 31                      |                       call 49
 003265: 22 05                      |                       local.tee 5
 003267: 20 00                      |                       local.get 0
 003269: 28 02 00                   |                       i32.load 2 0
 00326c: 20 00                      |                       local.get 0
 00326e: 28 02 04                   |                       i32.load 2 4
 003271: 6a                         |                       i32.add
 003272: 46                         |                       i32.eq
 003273: 0d 03                      |                       br_if 3
 003275: 20 05                      |                       local.get 5
 003277: 21 00                      |                       local.set 0
 003279: 0b                         |                     end
 00327a: 20 00                      |                     local.get 0
 00327c: 21 05                      |                     local.set 5
 00327e: 02 40                      |                     block
 003280: 20 03                      |                       local.get 3
 003282: 41 30                      |                       i32.const 48
 003284: 6a                         |                       i32.add
 003285: 20 02                      |                       local.get 2
 003287: 4d                         |                       i32.le_u
 003288: 0d 00                      |                       br_if 0
 00328a: 20 02                      |                       local.get 2
 00328c: 41 fe ff ff ff 07          |                       i32.const 2147483646
 003292: 4b                         |                       i32.gt_u
 003293: 0d 00                      |                       br_if 0
 003295: 20 05                      |                       local.get 5
 003297: 41 7f                      |                       i32.const 4294967295
 003299: 46                         |                       i32.eq
 00329a: 0d 00                      |                       br_if 0
 00329c: 20 07                      |                       local.get 7
 00329e: 20 02                      |                       local.get 2
 0032a0: 6b                         |                       i32.sub
 0032a1: 41 00                      |                       i32.const 0
 0032a3: 28 02 8c 1c                |                       i32.load 2 3596
 0032a7: 22 00                      |                       local.tee 0
 0032a9: 6a                         |                       i32.add
 0032aa: 41 00                      |                       i32.const 0
 0032ac: 20 00                      |                       local.get 0
 0032ae: 6b                         |                       i32.sub
 0032af: 71                         |                       i32.and
 0032b0: 22 00                      |                       local.tee 0
 0032b2: 41 fe ff ff ff 07          |                       i32.const 2147483646
 0032b8: 4b                         |                       i32.gt_u
 0032b9: 0d 06                      |                       br_if 6
 0032bb: 02 40                      |                       block
 0032bd: 20 00                      |                         local.get 0
 0032bf: 10 31                      |                         call 49
 0032c1: 41 7f                      |                         i32.const 4294967295
 0032c3: 46                         |                         i32.eq
 0032c4: 0d 00                      |                         br_if 0
 0032c6: 20 00                      |                         local.get 0
 0032c8: 20 02                      |                         local.get 2
 0032ca: 6a                         |                         i32.add
 0032cb: 21 02                      |                         local.set 2
 0032cd: 0c 07                      |                         br 7
 0032cf: 0b                         |                       end
 0032d0: 41 00                      |                       i32.const 0
 0032d2: 20 02                      |                       local.get 2
 0032d4: 6b                         |                       i32.sub
 0032d5: 10 31                      |                       call 49
 0032d7: 1a                         |                       drop
 0032d8: 0c 04                      |                       br 4
 0032da: 0b                         |                     end
 0032db: 20 05                      |                     local.get 5
 0032dd: 41 7f                      |                     i32.const 4294967295
 0032df: 47                         |                     i32.ne
 0032e0: 0d 05                      |                     br_if 5
 0032e2: 0c 03                      |                     br 3
 0032e4: 0b                         |                   end
 0032e5: 41 00                      |                   i32.const 0
 0032e7: 21 08                      |                   local.set 8
 0032e9: 0c 07                      |                   br 7
 0032eb: 0b                         |                 end
 0032ec: 41 00                      |                 i32.const 0
 0032ee: 21 05                      |                 local.set 5
 0032f0: 0c 05                      |                 br 5
 0032f2: 0b                         |               end
 0032f3: 20 05                      |               local.get 5
 0032f5: 41 7f                      |               i32.const 4294967295
 0032f7: 47                         |               i32.ne
 0032f8: 0d 02                      |               br_if 2
 0032fa: 0b                         |             end
 0032fb: 41 00                      |             i32.const 0
 0032fd: 41 00                      |             i32.const 0
 0032ff: 28 02 e8 1b                |             i32.load 2 3560
 003303: 41 04                      |             i32.const 4
 003305: 72                         |             i32.or
 003306: 36 02 e8 1b                |             i32.store 2 3560
 00330a: 0b                         |           end
 00330b: 20 08                      |           local.get 8
 00330d: 41 fe ff ff ff 07          |           i32.const 2147483646
 003313: 4b                         |           i32.gt_u
 003314: 0d 01                      |           br_if 1
 003316: 20 08                      |           local.get 8
 003318: 10 31                      |           call 49
 00331a: 22 05                      |           local.tee 5
 00331c: 41 00                      |           i32.const 0
 00331e: 10 31                      |           call 49
 003320: 22 00                      |           local.tee 0
 003322: 4f                         |           i32.ge_u
 003323: 0d 01                      |           br_if 1
 003325: 20 05                      |           local.get 5
 003327: 41 7f                      |           i32.const 4294967295
 003329: 46                         |           i32.eq
 00332a: 0d 01                      |           br_if 1
 00332c: 20 00                      |           local.get 0
 00332e: 41 7f                      |           i32.const 4294967295
 003330: 46                         |           i32.eq
 003331: 0d 01                      |           br_if 1
 003333: 20 00                      |           local.get 0
 003335: 20 05                      |           local.get 5
 003337: 6b                         |           i32.sub
 003338: 22 02                      |           local.tee 2
 00333a: 20 03                      |           local.get 3
 00333c: 41 28                      |           i32.const 40
 00333e: 6a                         |           i32.add
 00333f: 4d                         |           i32.le_u
 003340: 0d 01                      |           br_if 1
 003342: 0b                         |         end
 003343: 41 00                      |         i32.const 0
 003345: 41 00                      |         i32.const 0
 003347: 28 02 dc 1b                |         i32.load 2 3548
 00334b: 20 02                      |         local.get 2
 00334d: 6a                         |         i32.add
 00334e: 22 00                      |         local.tee 0
 003350: 36 02 dc 1b                |         i32.store 2 3548
 003354: 02 40                      |         block
 003356: 20 00                      |           local.get 0
 003358: 41 00                      |           i32.const 0
 00335a: 28 02 e0 1b                |           i32.load 2 3552
 00335e: 4d                         |           i32.le_u
 00335f: 0d 00                      |           br_if 0
 003361: 41 00                      |           i32.const 0
 003363: 20 00                      |           local.get 0
 003365: 36 02 e0 1b                |           i32.store 2 3552
 003369: 0b                         |         end
 00336a: 02 40                      |         block
 00336c: 02 40                      |           block
 00336e: 02 40                      |             block
 003370: 02 40                      |               block
 003372: 41 00                      |                 i32.const 0
 003374: 28 02 c4 18                |                 i32.load 2 3140
 003378: 22 04                      |                 local.tee 4
 00337a: 45                         |                 i32.eqz
 00337b: 0d 00                      |                 br_if 0
 00337d: 41 ec 1b                   |                 i32.const 3564
 003380: 21 00                      |                 local.set 0
 003382: 03 40                      |                 loop
 003384: 20 05                      |                   local.get 5
 003386: 20 00                      |                   local.get 0
 003388: 28 02 00                   |                   i32.load 2 0
 00338b: 22 06                      |                   local.tee 6
 00338d: 20 00                      |                   local.get 0
 00338f: 28 02 04                   |                   i32.load 2 4
 003392: 22 08                      |                   local.tee 8
 003394: 6a                         |                   i32.add
 003395: 46                         |                   i32.eq
 003396: 0d 02                      |                   br_if 2
 003398: 20 00                      |                   local.get 0
 00339a: 28 02 08                   |                   i32.load 2 8
 00339d: 22 00                      |                   local.tee 0
 00339f: 0d 00                      |                   br_if 0
 0033a1: 0c 03                      |                   br 3
 0033a3: 00                         |                   unreachable
 0033a4: 0b                         |                 end
 0033a5: 00                         |                 unreachable
 0033a6: 0b                         |               end
 0033a7: 02 40                      |               block
 0033a9: 02 40                      |                 block
 0033ab: 41 00                      |                   i32.const 0
 0033ad: 28 02 bc 18                |                   i32.load 2 3132
 0033b1: 22 00                      |                   local.tee 0
 0033b3: 45                         |                   i32.eqz
 0033b4: 0d 00                      |                   br_if 0
 0033b6: 20 05                      |                   local.get 5
 0033b8: 20 00                      |                   local.get 0
 0033ba: 4f                         |                   i32.ge_u
 0033bb: 0d 01                      |                   br_if 1
 0033bd: 0b                         |                 end
 0033be: 41 00                      |                 i32.const 0
 0033c0: 20 05                      |                 local.get 5
 0033c2: 36 02 bc 18                |                 i32.store 2 3132
 0033c6: 0b                         |               end
 0033c7: 41 00                      |               i32.const 0
 0033c9: 21 00                      |               local.set 0
 0033cb: 41 00                      |               i32.const 0
 0033cd: 20 02                      |               local.get 2
 0033cf: 36 02 f0 1b                |               i32.store 2 3568
 0033d3: 41 00                      |               i32.const 0
 0033d5: 20 05                      |               local.get 5
 0033d7: 36 02 ec 1b                |               i32.store 2 3564
 0033db: 41 00                      |               i32.const 0
 0033dd: 41 7f                      |               i32.const 4294967295
 0033df: 36 02 cc 18                |               i32.store 2 3148
 0033e3: 41 00                      |               i32.const 0
 0033e5: 41 00                      |               i32.const 0
 0033e7: 28 02 84 1c                |               i32.load 2 3588
 0033eb: 36 02 d0 18                |               i32.store 2 3152
 0033ef: 41 00                      |               i32.const 0
 0033f1: 41 00                      |               i32.const 0
 0033f3: 36 02 f8 1b                |               i32.store 2 3576
 0033f7: 03 40                      |               loop
 0033f9: 20 00                      |                 local.get 0
 0033fb: 41 03                      |                 i32.const 3
 0033fd: 74                         |                 i32.shl
 0033fe: 22 04                      |                 local.tee 4
 003400: 41 dc 18                   |                 i32.const 3164
 003403: 6a                         |                 i32.add
 003404: 20 04                      |                 local.get 4
 003406: 41 d4 18                   |                 i32.const 3156
 003409: 6a                         |                 i32.add
 00340a: 22 06                      |                 local.tee 6
 00340c: 36 02 00                   |                 i32.store 2 0
 00340f: 20 04                      |                 local.get 4
 003411: 41 e0 18                   |                 i32.const 3168
 003414: 6a                         |                 i32.add
 003415: 20 06                      |                 local.get 6
 003417: 36 02 00                   |                 i32.store 2 0
 00341a: 20 00                      |                 local.get 0
 00341c: 41 01                      |                 i32.const 1
 00341e: 6a                         |                 i32.add
 00341f: 22 00                      |                 local.tee 0
 003421: 41 20                      |                 i32.const 32
 003423: 47                         |                 i32.ne
 003424: 0d 00                      |                 br_if 0
 003426: 0b                         |               end
 003427: 41 00                      |               i32.const 0
 003429: 20 02                      |               local.get 2
 00342b: 41 58                      |               i32.const 4294967256
 00342d: 6a                         |               i32.add
 00342e: 22 00                      |               local.tee 0
 003430: 41 78                      |               i32.const 4294967288
 003432: 20 05                      |               local.get 5
 003434: 6b                         |               i32.sub
 003435: 41 07                      |               i32.const 7
 003437: 71                         |               i32.and
 003438: 41 00                      |               i32.const 0
 00343a: 20 05                      |               local.get 5
 00343c: 41 08                      |               i32.const 8
 00343e: 6a                         |               i32.add
 00343f: 41 07                      |               i32.const 7
 003441: 71                         |               i32.and
 003442: 1b                         |               select
 003443: 22 04                      |               local.tee 4
 003445: 6b                         |               i32.sub
 003446: 22 06                      |               local.tee 6
 003448: 36 02 b8 18                |               i32.store 2 3128
 00344c: 41 00                      |               i32.const 0
 00344e: 20 05                      |               local.get 5
 003450: 20 04                      |               local.get 4
 003452: 6a                         |               i32.add
 003453: 22 04                      |               local.tee 4
 003455: 36 02 c4 18                |               i32.store 2 3140
 003459: 20 04                      |               local.get 4
 00345b: 20 06                      |               local.get 6
 00345d: 41 01                      |               i32.const 1
 00345f: 72                         |               i32.or
 003460: 36 02 04                   |               i32.store 2 4
 003463: 20 05                      |               local.get 5
 003465: 20 00                      |               local.get 0
 003467: 6a                         |               i32.add
 003468: 41 28                      |               i32.const 40
 00346a: 36 02 04                   |               i32.store 2 4
 00346d: 41 00                      |               i32.const 0
 00346f: 41 00                      |               i32.const 0
 003471: 28 02 94 1c                |               i32.load 2 3604
 003475: 36 02 c8 18                |               i32.store 2 3144
 003479: 0c 02                      |               br 2
 00347b: 0b                         |             end
 00347c: 20 00                      |             local.get 0
 00347e: 2d 00 0c                   |             i32.load8_u 0 12
 003481: 41 08                      |             i32.const 8
 003483: 71                         |             i32.and
 003484: 0d 00                      |             br_if 0
 003486: 20 05                      |             local.get 5
 003488: 20 04                      |             local.get 4
 00348a: 4d                         |             i32.le_u
 00348b: 0d 00                      |             br_if 0
 00348d: 20 06                      |             local.get 6
 00348f: 20 04                      |             local.get 4
 003491: 4b                         |             i32.gt_u
 003492: 0d 00                      |             br_if 0
 003494: 20 00                      |             local.get 0
 003496: 20 08                      |             local.get 8
 003498: 20 02                      |             local.get 2
 00349a: 6a                         |             i32.add
 00349b: 36 02 04                   |             i32.store 2 4
 00349e: 41 00                      |             i32.const 0
 0034a0: 20 04                      |             local.get 4
 0034a2: 41 78                      |             i32.const 4294967288
 0034a4: 20 04                      |             local.get 4
 0034a6: 6b                         |             i32.sub
 0034a7: 41 07                      |             i32.const 7
 0034a9: 71                         |             i32.and
 0034aa: 41 00                      |             i32.const 0
 0034ac: 20 04                      |             local.get 4
 0034ae: 41 08                      |             i32.const 8
 0034b0: 6a                         |             i32.add
 0034b1: 41 07                      |             i32.const 7
 0034b3: 71                         |             i32.and
 0034b4: 1b                         |             select
 0034b5: 22 00                      |             local.tee 0
 0034b7: 6a                         |             i32.add
 0034b8: 22 06                      |             local.tee 6
 0034ba: 36 02 c4 18                |             i32.store 2 3140
 0034be: 41 00                      |             i32.const 0
 0034c0: 41 00                      |             i32.const 0
 0034c2: 28 02 b8 18                |             i32.load 2 3128
 0034c6: 20 02                      |             local.get 2
 0034c8: 6a                         |             i32.add
 0034c9: 22 05                      |             local.tee 5
 0034cb: 20 00                      |             local.get 0
 0034cd: 6b                         |             i32.sub
 0034ce: 22 00                      |             local.tee 0
 0034d0: 36 02 b8 18                |             i32.store 2 3128
 0034d4: 20 06                      |             local.get 6
 0034d6: 20 00                      |             local.get 0
 0034d8: 41 01                      |             i32.const 1
 0034da: 72                         |             i32.or
 0034db: 36 02 04                   |             i32.store 2 4
 0034de: 20 04                      |             local.get 4
 0034e0: 20 05                      |             local.get 5
 0034e2: 6a                         |             i32.add
 0034e3: 41 28                      |             i32.const 40
 0034e5: 36 02 04                   |             i32.store 2 4
 0034e8: 41 00                      |             i32.const 0
 0034ea: 41 00                      |             i32.const 0
 0034ec: 28 02 94 1c                |             i32.load 2 3604
 0034f0: 36 02 c8 18                |             i32.store 2 3144
 0034f4: 0c 01                      |             br 1
 0034f6: 0b                         |           end
 0034f7: 02 40                      |           block
 0034f9: 20 05                      |             local.get 5
 0034fb: 41 00                      |             i32.const 0
 0034fd: 28 02 bc 18                |             i32.load 2 3132
 003501: 22 08                      |             local.tee 8
 003503: 4f                         |             i32.ge_u
 003504: 0d 00                      |             br_if 0
 003506: 41 00                      |             i32.const 0
 003508: 20 05                      |             local.get 5
 00350a: 36 02 bc 18                |             i32.store 2 3132
 00350e: 20 05                      |             local.get 5
 003510: 21 08                      |             local.set 8
 003512: 0b                         |           end
 003513: 20 05                      |           local.get 5
 003515: 20 02                      |           local.get 2
 003517: 6a                         |           i32.add
 003518: 21 06                      |           local.set 6
 00351a: 41 ec 1b                   |           i32.const 3564
 00351d: 21 00                      |           local.set 0
 00351f: 02 40                      |           block
 003521: 02 40                      |             block
 003523: 02 40                      |               block
 003525: 02 40                      |                 block
 003527: 02 40                      |                   block
 003529: 02 40                      |                     block
 00352b: 02 40                      |                       block
 00352d: 03 40                      |                         loop
 00352f: 20 00                      |                           local.get 0
 003531: 28 02 00                   |                           i32.load 2 0
 003534: 20 06                      |                           local.get 6
 003536: 46                         |                           i32.eq
 003537: 0d 01                      |                           br_if 1
 003539: 20 00                      |                           local.get 0
 00353b: 28 02 08                   |                           i32.load 2 8
 00353e: 22 00                      |                           local.tee 0
 003540: 0d 00                      |                           br_if 0
 003542: 0c 02                      |                           br 2
 003544: 00                         |                           unreachable
 003545: 0b                         |                         end
 003546: 00                         |                         unreachable
 003547: 0b                         |                       end
 003548: 20 00                      |                       local.get 0
 00354a: 2d 00 0c                   |                       i32.load8_u 0 12
 00354d: 41 08                      |                       i32.const 8
 00354f: 71                         |                       i32.and
 003550: 45                         |                       i32.eqz
 003551: 0d 01                      |                       br_if 1
 003553: 0b                         |                     end
 003554: 41 ec 1b                   |                     i32.const 3564
 003557: 21 00                      |                     local.set 0
 003559: 03 40                      |                     loop
 00355b: 02 40                      |                       block
 00355d: 20 00                      |                         local.get 0
 00355f: 28 02 00                   |                         i32.load 2 0
 003562: 22 06                      |                         local.tee 6
 003564: 20 04                      |                         local.get 4
 003566: 4b                         |                         i32.gt_u
 003567: 0d 00                      |                         br_if 0
 003569: 20 06                      |                         local.get 6
 00356b: 20 00                      |                         local.get 0
 00356d: 28 02 04                   |                         i32.load 2 4
 003570: 6a                         |                         i32.add
 003571: 22 06                      |                         local.tee 6
 003573: 20 04                      |                         local.get 4
 003575: 4b                         |                         i32.gt_u
 003576: 0d 03                      |                         br_if 3
 003578: 0b                         |                       end
 003579: 20 00                      |                       local.get 0
 00357b: 28 02 08                   |                       i32.load 2 8
 00357e: 21 00                      |                       local.set 0
 003580: 0c 00                      |                       br 0
 003582: 00                         |                       unreachable
 003583: 0b                         |                     end
 003584: 00                         |                     unreachable
 003585: 0b                         |                   end
 003586: 20 00                      |                   local.get 0
 003588: 20 05                      |                   local.get 5
 00358a: 36 02 00                   |                   i32.store 2 0
 00358d: 20 00                      |                   local.get 0
 00358f: 20 00                      |                   local.get 0
 003591: 28 02 04                   |                   i32.load 2 4
 003594: 20 02                      |                   local.get 2
 003596: 6a                         |                   i32.add
 003597: 36 02 04                   |                   i32.store 2 4
 00359a: 20 05                      |                   local.get 5
 00359c: 41 78                      |                   i32.const 4294967288
 00359e: 20 05                      |                   local.get 5
 0035a0: 6b                         |                   i32.sub
 0035a1: 41 07                      |                   i32.const 7
 0035a3: 71                         |                   i32.and
 0035a4: 41 00                      |                   i32.const 0
 0035a6: 20 05                      |                   local.get 5
 0035a8: 41 08                      |                   i32.const 8
 0035aa: 6a                         |                   i32.add
 0035ab: 41 07                      |                   i32.const 7
 0035ad: 71                         |                   i32.and
 0035ae: 1b                         |                   select
 0035af: 6a                         |                   i32.add
 0035b0: 22 0b                      |                   local.tee 11
 0035b2: 20 03                      |                   local.get 3
 0035b4: 41 03                      |                   i32.const 3
 0035b6: 72                         |                   i32.or
 0035b7: 36 02 04                   |                   i32.store 2 4
 0035ba: 20 06                      |                   local.get 6
 0035bc: 41 78                      |                   i32.const 4294967288
 0035be: 20 06                      |                   local.get 6
 0035c0: 6b                         |                   i32.sub
 0035c1: 41 07                      |                   i32.const 7
 0035c3: 71                         |                   i32.and
 0035c4: 41 00                      |                   i32.const 0
 0035c6: 20 06                      |                   local.get 6
 0035c8: 41 08                      |                   i32.const 8
 0035ca: 6a                         |                   i32.add
 0035cb: 41 07                      |                   i32.const 7
 0035cd: 71                         |                   i32.and
 0035ce: 1b                         |                   select
 0035cf: 6a                         |                   i32.add
 0035d0: 22 05                      |                   local.tee 5
 0035d2: 20 0b                      |                   local.get 11
 0035d4: 6b                         |                   i32.sub
 0035d5: 20 03                      |                   local.get 3
 0035d7: 6b                         |                   i32.sub
 0035d8: 21 00                      |                   local.set 0
 0035da: 20 0b                      |                   local.get 11
 0035dc: 20 03                      |                   local.get 3
 0035de: 6a                         |                   i32.add
 0035df: 21 06                      |                   local.set 6
 0035e1: 02 40                      |                   block
 0035e3: 20 04                      |                     local.get 4
 0035e5: 20 05                      |                     local.get 5
 0035e7: 47                         |                     i32.ne
 0035e8: 0d 00                      |                     br_if 0
 0035ea: 41 00                      |                     i32.const 0
 0035ec: 20 06                      |                     local.get 6
 0035ee: 36 02 c4 18                |                     i32.store 2 3140
 0035f2: 41 00                      |                     i32.const 0
 0035f4: 41 00                      |                     i32.const 0
 0035f6: 28 02 b8 18                |                     i32.load 2 3128
 0035fa: 20 00                      |                     local.get 0
 0035fc: 6a                         |                     i32.add
 0035fd: 22 00                      |                     local.tee 0
 0035ff: 36 02 b8 18                |                     i32.store 2 3128
 003603: 20 06                      |                     local.get 6
 003605: 20 00                      |                     local.get 0
 003607: 41 01                      |                     i32.const 1
 003609: 72                         |                     i32.or
 00360a: 36 02 04                   |                     i32.store 2 4
 00360d: 0c 03                      |                     br 3
 00360f: 0b                         |                   end
 003610: 02 40                      |                   block
 003612: 41 00                      |                     i32.const 0
 003614: 28 02 c0 18                |                     i32.load 2 3136
 003618: 20 05                      |                     local.get 5
 00361a: 47                         |                     i32.ne
 00361b: 0d 00                      |                     br_if 0
 00361d: 41 00                      |                     i32.const 0
 00361f: 20 06                      |                     local.get 6
 003621: 36 02 c0 18                |                     i32.store 2 3136
 003625: 41 00                      |                     i32.const 0
 003627: 41 00                      |                     i32.const 0
 003629: 28 02 b4 18                |                     i32.load 2 3124
 00362d: 20 00                      |                     local.get 0
 00362f: 6a                         |                     i32.add
 003630: 22 00                      |                     local.tee 0
 003632: 36 02 b4 18                |                     i32.store 2 3124
 003636: 20 06                      |                     local.get 6
 003638: 20 00                      |                     local.get 0
 00363a: 41 01                      |                     i32.const 1
 00363c: 72                         |                     i32.or
 00363d: 36 02 04                   |                     i32.store 2 4
 003640: 20 06                      |                     local.get 6
 003642: 20 00                      |                     local.get 0
 003644: 6a                         |                     i32.add
 003645: 20 00                      |                     local.get 0
 003647: 36 02 00                   |                     i32.store 2 0
 00364a: 0c 03                      |                     br 3
 00364c: 0b                         |                   end
 00364d: 02 40                      |                   block
 00364f: 20 05                      |                     local.get 5
 003651: 28 02 04                   |                     i32.load 2 4
 003654: 22 04                      |                     local.tee 4
 003656: 41 03                      |                     i32.const 3
 003658: 71                         |                     i32.and
 003659: 41 01                      |                     i32.const 1
 00365b: 47                         |                     i32.ne
 00365c: 0d 00                      |                     br_if 0
 00365e: 20 04                      |                     local.get 4
 003660: 41 78                      |                     i32.const 4294967288
 003662: 71                         |                     i32.and
 003663: 21 07                      |                     local.set 7
 003665: 02 40                      |                     block
 003667: 02 40                      |                       block
 003669: 20 04                      |                         local.get 4
 00366b: 41 ff 01                   |                         i32.const 255
 00366e: 4b                         |                         i32.gt_u
 00366f: 0d 00                      |                         br_if 0
 003671: 20 05                      |                         local.get 5
 003673: 28 02 0c                   |                         i32.load 2 12
 003676: 21 03                      |                         local.set 3
 003678: 02 40                      |                         block
 00367a: 20 05                      |                           local.get 5
 00367c: 28 02 08                   |                           i32.load 2 8
 00367f: 22 02                      |                           local.tee 2
 003681: 20 04                      |                           local.get 4
 003683: 41 03                      |                           i32.const 3
 003685: 76                         |                           i32.shr_u
 003686: 22 09                      |                           local.tee 9
 003688: 41 03                      |                           i32.const 3
 00368a: 74                         |                           i32.shl
 00368b: 41 d4 18                   |                           i32.const 3156
 00368e: 6a                         |                           i32.add
 00368f: 22 04                      |                           local.tee 4
 003691: 46                         |                           i32.eq
 003692: 0d 00                      |                           br_if 0
 003694: 20 08                      |                           local.get 8
 003696: 20 02                      |                           local.get 2
 003698: 4b                         |                           i32.gt_u
 003699: 1a                         |                           drop
 00369a: 0b                         |                         end
 00369b: 02 40                      |                         block
 00369d: 20 03                      |                           local.get 3
 00369f: 20 02                      |                           local.get 2
 0036a1: 47                         |                           i32.ne
 0036a2: 0d 00                      |                           br_if 0
 0036a4: 41 00                      |                           i32.const 0
 0036a6: 41 00                      |                           i32.const 0
 0036a8: 28 02 ac 18                |                           i32.load 2 3116
 0036ac: 41 7e                      |                           i32.const 4294967294
 0036ae: 20 09                      |                           local.get 9
 0036b0: 77                         |                           i32.rotl
 0036b1: 71                         |                           i32.and
 0036b2: 36 02 ac 18                |                           i32.store 2 3116
 0036b6: 0c 02                      |                           br 2
 0036b8: 0b                         |                         end
 0036b9: 02 40                      |                         block
 0036bb: 20 03                      |                           local.get 3
 0036bd: 20 04                      |                           local.get 4
 0036bf: 46                         |                           i32.eq
 0036c0: 0d 00                      |                           br_if 0
 0036c2: 20 08                      |                           local.get 8
 0036c4: 20 03                      |                           local.get 3
 0036c6: 4b                         |                           i32.gt_u
 0036c7: 1a                         |                           drop
 0036c8: 0b                         |                         end
 0036c9: 20 02                      |                         local.get 2
 0036cb: 20 03                      |                         local.get 3
 0036cd: 36 02 0c                   |                         i32.store 2 12
 0036d0: 20 03                      |                         local.get 3
 0036d2: 20 02                      |                         local.get 2
 0036d4: 36 02 08                   |                         i32.store 2 8
 0036d7: 0c 01                      |                         br 1
 0036d9: 0b                         |                       end
 0036da: 20 05                      |                       local.get 5
 0036dc: 28 02 18                   |                       i32.load 2 24
 0036df: 21 09                      |                       local.set 9
 0036e1: 02 40                      |                       block
 0036e3: 02 40                      |                         block
 0036e5: 20 05                      |                           local.get 5
 0036e7: 28 02 0c                   |                           i32.load 2 12
 0036ea: 22 02                      |                           local.tee 2
 0036ec: 20 05                      |                           local.get 5
 0036ee: 46                         |                           i32.eq
 0036ef: 0d 00                      |                           br_if 0
 0036f1: 02 40                      |                           block
 0036f3: 20 08                      |                             local.get 8
 0036f5: 20 05                      |                             local.get 5
 0036f7: 28 02 08                   |                             i32.load 2 8
 0036fa: 22 04                      |                             local.tee 4
 0036fc: 4b                         |                             i32.gt_u
 0036fd: 0d 00                      |                             br_if 0
 0036ff: 20 04                      |                             local.get 4
 003701: 28 02 0c                   |                             i32.load 2 12
 003704: 20 05                      |                             local.get 5
 003706: 47                         |                             i32.ne
 003707: 1a                         |                             drop
 003708: 0b                         |                           end
 003709: 20 04                      |                           local.get 4
 00370b: 20 02                      |                           local.get 2
 00370d: 36 02 0c                   |                           i32.store 2 12
 003710: 20 02                      |                           local.get 2
 003712: 20 04                      |                           local.get 4
 003714: 36 02 08                   |                           i32.store 2 8
 003717: 0c 01                      |                           br 1
 003719: 0b                         |                         end
 00371a: 02 40                      |                         block
 00371c: 20 05                      |                           local.get 5
 00371e: 41 14                      |                           i32.const 20
 003720: 6a                         |                           i32.add
 003721: 22 04                      |                           local.tee 4
 003723: 28 02 00                   |                           i32.load 2 0
 003726: 22 03                      |                           local.tee 3
 003728: 0d 00                      |                           br_if 0
 00372a: 20 05                      |                           local.get 5
 00372c: 41 10                      |                           i32.const 16
 00372e: 6a                         |                           i32.add
 00372f: 22 04                      |                           local.tee 4
 003731: 28 02 00                   |                           i32.load 2 0
 003734: 22 03                      |                           local.tee 3
 003736: 0d 00                      |                           br_if 0
 003738: 41 00                      |                           i32.const 0
 00373a: 21 02                      |                           local.set 2
 00373c: 0c 01                      |                           br 1
 00373e: 0b                         |                         end
 00373f: 03 40                      |                         loop
 003741: 20 04                      |                           local.get 4
 003743: 21 08                      |                           local.set 8
 003745: 20 03                      |                           local.get 3
 003747: 22 02                      |                           local.tee 2
 003749: 41 14                      |                           i32.const 20
 00374b: 6a                         |                           i32.add
 00374c: 22 04                      |                           local.tee 4
 00374e: 28 02 00                   |                           i32.load 2 0
 003751: 22 03                      |                           local.tee 3
 003753: 0d 00                      |                           br_if 0
 003755: 20 02                      |                           local.get 2
 003757: 41 10                      |                           i32.const 16
 003759: 6a                         |                           i32.add
 00375a: 21 04                      |                           local.set 4
 00375c: 20 02                      |                           local.get 2
 00375e: 28 02 10                   |                           i32.load 2 16
 003761: 22 03                      |                           local.tee 3
 003763: 0d 00                      |                           br_if 0
 003765: 0b                         |                         end
 003766: 20 08                      |                         local.get 8
 003768: 41 00                      |                         i32.const 0
 00376a: 36 02 00                   |                         i32.store 2 0
 00376d: 0b                         |                       end
 00376e: 20 09                      |                       local.get 9
 003770: 45                         |                       i32.eqz
 003771: 0d 00                      |                       br_if 0
 003773: 02 40                      |                       block
 003775: 02 40                      |                         block
 003777: 20 05                      |                           local.get 5
 003779: 28 02 1c                   |                           i32.load 2 28
 00377c: 22 03                      |                           local.tee 3
 00377e: 41 02                      |                           i32.const 2
 003780: 74                         |                           i32.shl
 003781: 41 dc 1a                   |                           i32.const 3420
 003784: 6a                         |                           i32.add
 003785: 22 04                      |                           local.tee 4
 003787: 28 02 00                   |                           i32.load 2 0
 00378a: 20 05                      |                           local.get 5
 00378c: 47                         |                           i32.ne
 00378d: 0d 00                      |                           br_if 0
 00378f: 20 04                      |                           local.get 4
 003791: 20 02                      |                           local.get 2
 003793: 36 02 00                   |                           i32.store 2 0
 003796: 20 02                      |                           local.get 2
 003798: 0d 01                      |                           br_if 1
 00379a: 41 00                      |                           i32.const 0
 00379c: 41 00                      |                           i32.const 0
 00379e: 28 02 b0 18                |                           i32.load 2 3120
 0037a2: 41 7e                      |                           i32.const 4294967294
 0037a4: 20 03                      |                           local.get 3
 0037a6: 77                         |                           i32.rotl
 0037a7: 71                         |                           i32.and
 0037a8: 36 02 b0 18                |                           i32.store 2 3120
 0037ac: 0c 02                      |                           br 2
 0037ae: 0b                         |                         end
 0037af: 20 09                      |                         local.get 9
 0037b1: 41 10                      |                         i32.const 16
 0037b3: 41 14                      |                         i32.const 20
 0037b5: 20 09                      |                         local.get 9
 0037b7: 28 02 10                   |                         i32.load 2 16
 0037ba: 20 05                      |                         local.get 5
 0037bc: 46                         |                         i32.eq
 0037bd: 1b                         |                         select
 0037be: 6a                         |                         i32.add
 0037bf: 20 02                      |                         local.get 2
 0037c1: 36 02 00                   |                         i32.store 2 0
 0037c4: 20 02                      |                         local.get 2
 0037c6: 45                         |                         i32.eqz
 0037c7: 0d 01                      |                         br_if 1
 0037c9: 0b                         |                       end
 0037ca: 20 02                      |                       local.get 2
 0037cc: 20 09                      |                       local.get 9
 0037ce: 36 02 18                   |                       i32.store 2 24
 0037d1: 02 40                      |                       block
 0037d3: 20 05                      |                         local.get 5
 0037d5: 28 02 10                   |                         i32.load 2 16
 0037d8: 22 04                      |                         local.tee 4
 0037da: 45                         |                         i32.eqz
 0037db: 0d 00                      |                         br_if 0
 0037dd: 20 02                      |                         local.get 2
 0037df: 20 04                      |                         local.get 4
 0037e1: 36 02 10                   |                         i32.store 2 16
 0037e4: 20 04                      |                         local.get 4
 0037e6: 20 02                      |                         local.get 2
 0037e8: 36 02 18                   |                         i32.store 2 24
 0037eb: 0b                         |                       end
 0037ec: 20 05                      |                       local.get 5
 0037ee: 28 02 14                   |                       i32.load 2 20
 0037f1: 22 04                      |                       local.tee 4
 0037f3: 45                         |                       i32.eqz
 0037f4: 0d 00                      |                       br_if 0
 0037f6: 20 02                      |                       local.get 2
 0037f8: 41 14                      |                       i32.const 20
 0037fa: 6a                         |                       i32.add
 0037fb: 20 04                      |                       local.get 4
 0037fd: 36 02 00                   |                       i32.store 2 0
 003800: 20 04                      |                       local.get 4
 003802: 20 02                      |                       local.get 2
 003804: 36 02 18                   |                       i32.store 2 24
 003807: 0b                         |                     end
 003808: 20 07                      |                     local.get 7
 00380a: 20 00                      |                     local.get 0
 00380c: 6a                         |                     i32.add
 00380d: 21 00                      |                     local.set 0
 00380f: 20 05                      |                     local.get 5
 003811: 20 07                      |                     local.get 7
 003813: 6a                         |                     i32.add
 003814: 21 05                      |                     local.set 5
 003816: 0b                         |                   end
 003817: 20 05                      |                   local.get 5
 003819: 20 05                      |                   local.get 5
 00381b: 28 02 04                   |                   i32.load 2 4
 00381e: 41 7e                      |                   i32.const 4294967294
 003820: 71                         |                   i32.and
 003821: 36 02 04                   |                   i32.store 2 4
 003824: 20 06                      |                   local.get 6
 003826: 20 00                      |                   local.get 0
 003828: 41 01                      |                   i32.const 1
 00382a: 72                         |                   i32.or
 00382b: 36 02 04                   |                   i32.store 2 4
 00382e: 20 06                      |                   local.get 6
 003830: 20 00                      |                   local.get 0
 003832: 6a                         |                   i32.add
 003833: 20 00                      |                   local.get 0
 003835: 36 02 00                   |                   i32.store 2 0
 003838: 02 40                      |                   block
 00383a: 20 00                      |                     local.get 0
 00383c: 41 ff 01                   |                     i32.const 255
 00383f: 4b                         |                     i32.gt_u
 003840: 0d 00                      |                     br_if 0
 003842: 20 00                      |                     local.get 0
 003844: 41 03                      |                     i32.const 3
 003846: 76                         |                     i32.shr_u
 003847: 22 04                      |                     local.tee 4
 003849: 41 03                      |                     i32.const 3
 00384b: 74                         |                     i32.shl
 00384c: 41 d4 18                   |                     i32.const 3156
 00384f: 6a                         |                     i32.add
 003850: 21 00                      |                     local.set 0
 003852: 02 40                      |                     block
 003854: 02 40                      |                       block
 003856: 41 00                      |                         i32.const 0
 003858: 28 02 ac 18                |                         i32.load 2 3116
 00385c: 22 03                      |                         local.tee 3
 00385e: 41 01                      |                         i32.const 1
 003860: 20 04                      |                         local.get 4
 003862: 74                         |                         i32.shl
 003863: 22 04                      |                         local.tee 4
 003865: 71                         |                         i32.and
 003866: 0d 00                      |                         br_if 0
 003868: 41 00                      |                         i32.const 0
 00386a: 20 03                      |                         local.get 3
 00386c: 20 04                      |                         local.get 4
 00386e: 72                         |                         i32.or
 00386f: 36 02 ac 18                |                         i32.store 2 3116
 003873: 20 00                      |                         local.get 0
 003875: 21 04                      |                         local.set 4
 003877: 0c 01                      |                         br 1
 003879: 0b                         |                       end
 00387a: 20 00                      |                       local.get 0
 00387c: 28 02 08                   |                       i32.load 2 8
 00387f: 21 04                      |                       local.set 4
 003881: 0b                         |                     end
 003882: 20 00                      |                     local.get 0
 003884: 20 06                      |                     local.get 6
 003886: 36 02 08                   |                     i32.store 2 8
 003889: 20 04                      |                     local.get 4
 00388b: 20 06                      |                     local.get 6
 00388d: 36 02 0c                   |                     i32.store 2 12
 003890: 20 06                      |                     local.get 6
 003892: 20 00                      |                     local.get 0
 003894: 36 02 0c                   |                     i32.store 2 12
 003897: 20 06                      |                     local.get 6
 003899: 20 04                      |                     local.get 4
 00389b: 36 02 08                   |                     i32.store 2 8
 00389e: 0c 03                      |                     br 3
 0038a0: 0b                         |                   end
 0038a1: 41 00                      |                   i32.const 0
 0038a3: 21 04                      |                   local.set 4
 0038a5: 02 40                      |                   block
 0038a7: 20 00                      |                     local.get 0
 0038a9: 41 08                      |                     i32.const 8
 0038ab: 76                         |                     i32.shr_u
 0038ac: 22 03                      |                     local.tee 3
 0038ae: 45                         |                     i32.eqz
 0038af: 0d 00                      |                     br_if 0
 0038b1: 41 1f                      |                     i32.const 31
 0038b3: 21 04                      |                     local.set 4
 0038b5: 20 00                      |                     local.get 0
 0038b7: 41 ff ff ff 07             |                     i32.const 16777215
 0038bc: 4b                         |                     i32.gt_u
 0038bd: 0d 00                      |                     br_if 0
 0038bf: 20 03                      |                     local.get 3
 0038c1: 20 03                      |                     local.get 3
 0038c3: 41 80 fe 3f                |                     i32.const 1048320
 0038c7: 6a                         |                     i32.add
 0038c8: 41 10                      |                     i32.const 16
 0038ca: 76                         |                     i32.shr_u
 0038cb: 41 08                      |                     i32.const 8
 0038cd: 71                         |                     i32.and
 0038ce: 22 04                      |                     local.tee 4
 0038d0: 74                         |                     i32.shl
 0038d1: 22 03                      |                     local.tee 3
 0038d3: 20 03                      |                     local.get 3
 0038d5: 41 80 e0 1f                |                     i32.const 520192
 0038d9: 6a                         |                     i32.add
 0038da: 41 10                      |                     i32.const 16
 0038dc: 76                         |                     i32.shr_u
 0038dd: 41 04                      |                     i32.const 4
 0038df: 71                         |                     i32.and
 0038e0: 22 03                      |                     local.tee 3
 0038e2: 74                         |                     i32.shl
 0038e3: 22 05                      |                     local.tee 5
 0038e5: 20 05                      |                     local.get 5
 0038e7: 41 80 80 0f                |                     i32.const 245760
 0038eb: 6a                         |                     i32.add
 0038ec: 41 10                      |                     i32.const 16
 0038ee: 76                         |                     i32.shr_u
 0038ef: 41 02                      |                     i32.const 2
 0038f1: 71                         |                     i32.and
 0038f2: 22 05                      |                     local.tee 5
 0038f4: 74                         |                     i32.shl
 0038f5: 41 0f                      |                     i32.const 15
 0038f7: 76                         |                     i32.shr_u
 0038f8: 20 03                      |                     local.get 3
 0038fa: 20 04                      |                     local.get 4
 0038fc: 72                         |                     i32.or
 0038fd: 20 05                      |                     local.get 5
 0038ff: 72                         |                     i32.or
 003900: 6b                         |                     i32.sub
 003901: 22 04                      |                     local.tee 4
 003903: 41 01                      |                     i32.const 1
 003905: 74                         |                     i32.shl
 003906: 20 00                      |                     local.get 0
 003908: 20 04                      |                     local.get 4
 00390a: 41 15                      |                     i32.const 21
 00390c: 6a                         |                     i32.add
 00390d: 76                         |                     i32.shr_u
 00390e: 41 01                      |                     i32.const 1
 003910: 71                         |                     i32.and
 003911: 72                         |                     i32.or
 003912: 41 1c                      |                     i32.const 28
 003914: 6a                         |                     i32.add
 003915: 21 04                      |                     local.set 4
 003917: 0b                         |                   end
 003918: 20 06                      |                   local.get 6
 00391a: 20 04                      |                   local.get 4
 00391c: 36 02 1c                   |                   i32.store 2 28
 00391f: 20 06                      |                   local.get 6
 003921: 42 00                      |                   i64.const 0
 003923: 37 02 10                   |                   i64.store 2 16
 003926: 20 04                      |                   local.get 4
 003928: 41 02                      |                   i32.const 2
 00392a: 74                         |                   i32.shl
 00392b: 41 dc 1a                   |                   i32.const 3420
 00392e: 6a                         |                   i32.add
 00392f: 21 03                      |                   local.set 3
 003931: 02 40                      |                   block
 003933: 02 40                      |                     block
 003935: 41 00                      |                       i32.const 0
 003937: 28 02 b0 18                |                       i32.load 2 3120
 00393b: 22 05                      |                       local.tee 5
 00393d: 41 01                      |                       i32.const 1
 00393f: 20 04                      |                       local.get 4
 003941: 74                         |                       i32.shl
 003942: 22 08                      |                       local.tee 8
 003944: 71                         |                       i32.and
 003945: 0d 00                      |                       br_if 0
 003947: 41 00                      |                       i32.const 0
 003949: 20 05                      |                       local.get 5
 00394b: 20 08                      |                       local.get 8
 00394d: 72                         |                       i32.or
 00394e: 36 02 b0 18                |                       i32.store 2 3120
 003952: 20 03                      |                       local.get 3
 003954: 20 06                      |                       local.get 6
 003956: 36 02 00                   |                       i32.store 2 0
 003959: 20 06                      |                       local.get 6
 00395b: 20 03                      |                       local.get 3
 00395d: 36 02 18                   |                       i32.store 2 24
 003960: 0c 01                      |                       br 1
 003962: 0b                         |                     end
 003963: 20 00                      |                     local.get 0
 003965: 41 00                      |                     i32.const 0
 003967: 41 19                      |                     i32.const 25
 003969: 20 04                      |                     local.get 4
 00396b: 41 01                      |                     i32.const 1
 00396d: 76                         |                     i32.shr_u
 00396e: 6b                         |                     i32.sub
 00396f: 20 04                      |                     local.get 4
 003971: 41 1f                      |                     i32.const 31
 003973: 46                         |                     i32.eq
 003974: 1b                         |                     select
 003975: 74                         |                     i32.shl
 003976: 21 04                      |                     local.set 4
 003978: 20 03                      |                     local.get 3
 00397a: 28 02 00                   |                     i32.load 2 0
 00397d: 21 05                      |                     local.set 5
 00397f: 03 40                      |                     loop
 003981: 20 05                      |                       local.get 5
 003983: 22 03                      |                       local.tee 3
 003985: 28 02 04                   |                       i32.load 2 4
 003988: 41 78                      |                       i32.const 4294967288
 00398a: 71                         |                       i32.and
 00398b: 20 00                      |                       local.get 0
 00398d: 46                         |                       i32.eq
 00398e: 0d 03                      |                       br_if 3
 003990: 20 04                      |                       local.get 4
 003992: 41 1d                      |                       i32.const 29
 003994: 76                         |                       i32.shr_u
 003995: 21 05                      |                       local.set 5
 003997: 20 04                      |                       local.get 4
 003999: 41 01                      |                       i32.const 1
 00399b: 74                         |                       i32.shl
 00399c: 21 04                      |                       local.set 4
 00399e: 20 03                      |                       local.get 3
 0039a0: 20 05                      |                       local.get 5
 0039a2: 41 04                      |                       i32.const 4
 0039a4: 71                         |                       i32.and
 0039a5: 6a                         |                       i32.add
 0039a6: 41 10                      |                       i32.const 16
 0039a8: 6a                         |                       i32.add
 0039a9: 22 08                      |                       local.tee 8
 0039ab: 28 02 00                   |                       i32.load 2 0
 0039ae: 22 05                      |                       local.tee 5
 0039b0: 0d 00                      |                       br_if 0
 0039b2: 0b                         |                     end
 0039b3: 20 08                      |                     local.get 8
 0039b5: 20 06                      |                     local.get 6
 0039b7: 36 02 00                   |                     i32.store 2 0
 0039ba: 20 06                      |                     local.get 6
 0039bc: 20 03                      |                     local.get 3
 0039be: 36 02 18                   |                     i32.store 2 24
 0039c1: 0b                         |                   end
 0039c2: 20 06                      |                   local.get 6
 0039c4: 20 06                      |                   local.get 6
 0039c6: 36 02 0c                   |                   i32.store 2 12
 0039c9: 20 06                      |                   local.get 6
 0039cb: 20 06                      |                   local.get 6
 0039cd: 36 02 08                   |                   i32.store 2 8
 0039d0: 0c 02                      |                   br 2
 0039d2: 0b                         |                 end
 0039d3: 41 00                      |                 i32.const 0
 0039d5: 20 02                      |                 local.get 2
 0039d7: 41 58                      |                 i32.const 4294967256
 0039d9: 6a                         |                 i32.add
 0039da: 22 00                      |                 local.tee 0
 0039dc: 41 78                      |                 i32.const 4294967288
 0039de: 20 05                      |                 local.get 5
 0039e0: 6b                         |                 i32.sub
 0039e1: 41 07                      |                 i32.const 7
 0039e3: 71                         |                 i32.and
 0039e4: 41 00                      |                 i32.const 0
 0039e6: 20 05                      |                 local.get 5
 0039e8: 41 08                      |                 i32.const 8
 0039ea: 6a                         |                 i32.add
 0039eb: 41 07                      |                 i32.const 7
 0039ed: 71                         |                 i32.and
 0039ee: 1b                         |                 select
 0039ef: 22 08                      |                 local.tee 8
 0039f1: 6b                         |                 i32.sub
 0039f2: 22 0b                      |                 local.tee 11
 0039f4: 36 02 b8 18                |                 i32.store 2 3128
 0039f8: 41 00                      |                 i32.const 0
 0039fa: 20 05                      |                 local.get 5
 0039fc: 20 08                      |                 local.get 8
 0039fe: 6a                         |                 i32.add
 0039ff: 22 08                      |                 local.tee 8
 003a01: 36 02 c4 18                |                 i32.store 2 3140
 003a05: 20 08                      |                 local.get 8
 003a07: 20 0b                      |                 local.get 11
 003a09: 41 01                      |                 i32.const 1
 003a0b: 72                         |                 i32.or
 003a0c: 36 02 04                   |                 i32.store 2 4
 003a0f: 20 05                      |                 local.get 5
 003a11: 20 00                      |                 local.get 0
 003a13: 6a                         |                 i32.add
 003a14: 41 28                      |                 i32.const 40
 003a16: 36 02 04                   |                 i32.store 2 4
 003a19: 41 00                      |                 i32.const 0
 003a1b: 41 00                      |                 i32.const 0
 003a1d: 28 02 94 1c                |                 i32.load 2 3604
 003a21: 36 02 c8 18                |                 i32.store 2 3144
 003a25: 20 04                      |                 local.get 4
 003a27: 20 06                      |                 local.get 6
 003a29: 41 27                      |                 i32.const 39
 003a2b: 20 06                      |                 local.get 6
 003a2d: 6b                         |                 i32.sub
 003a2e: 41 07                      |                 i32.const 7
 003a30: 71                         |                 i32.and
 003a31: 41 00                      |                 i32.const 0
 003a33: 20 06                      |                 local.get 6
 003a35: 41 59                      |                 i32.const 4294967257
 003a37: 6a                         |                 i32.add
 003a38: 41 07                      |                 i32.const 7
 003a3a: 71                         |                 i32.and
 003a3b: 1b                         |                 select
 003a3c: 6a                         |                 i32.add
 003a3d: 41 51                      |                 i32.const 4294967249
 003a3f: 6a                         |                 i32.add
 003a40: 22 00                      |                 local.tee 0
 003a42: 20 00                      |                 local.get 0
 003a44: 20 04                      |                 local.get 4
 003a46: 41 10                      |                 i32.const 16
 003a48: 6a                         |                 i32.add
 003a49: 49                         |                 i32.lt_u
 003a4a: 1b                         |                 select
 003a4b: 22 08                      |                 local.tee 8
 003a4d: 41 1b                      |                 i32.const 27
 003a4f: 36 02 04                   |                 i32.store 2 4
 003a52: 20 08                      |                 local.get 8
 003a54: 41 10                      |                 i32.const 16
 003a56: 6a                         |                 i32.add
 003a57: 41 00                      |                 i32.const 0
 003a59: 29 02 f4 1b                |                 i64.load 2 3572
 003a5d: 37 02 00                   |                 i64.store 2 0
 003a60: 20 08                      |                 local.get 8
 003a62: 41 00                      |                 i32.const 0
 003a64: 29 02 ec 1b                |                 i64.load 2 3564
 003a68: 37 02 08                   |                 i64.store 2 8
 003a6b: 41 00                      |                 i32.const 0
 003a6d: 20 08                      |                 local.get 8
 003a6f: 41 08                      |                 i32.const 8
 003a71: 6a                         |                 i32.add
 003a72: 36 02 f4 1b                |                 i32.store 2 3572
 003a76: 41 00                      |                 i32.const 0
 003a78: 20 02                      |                 local.get 2
 003a7a: 36 02 f0 1b                |                 i32.store 2 3568
 003a7e: 41 00                      |                 i32.const 0
 003a80: 20 05                      |                 local.get 5
 003a82: 36 02 ec 1b                |                 i32.store 2 3564
 003a86: 41 00                      |                 i32.const 0
 003a88: 41 00                      |                 i32.const 0
 003a8a: 36 02 f8 1b                |                 i32.store 2 3576
 003a8e: 20 08                      |                 local.get 8
 003a90: 41 18                      |                 i32.const 24
 003a92: 6a                         |                 i32.add
 003a93: 21 00                      |                 local.set 0
 003a95: 03 40                      |                 loop
 003a97: 20 00                      |                   local.get 0
 003a99: 41 07                      |                   i32.const 7
 003a9b: 36 02 04                   |                   i32.store 2 4
 003a9e: 20 00                      |                   local.get 0
 003aa0: 41 08                      |                   i32.const 8
 003aa2: 6a                         |                   i32.add
 003aa3: 21 05                      |                   local.set 5
 003aa5: 20 00                      |                   local.get 0
 003aa7: 41 04                      |                   i32.const 4
 003aa9: 6a                         |                   i32.add
 003aaa: 21 00                      |                   local.set 0
 003aac: 20 05                      |                   local.get 5
 003aae: 20 06                      |                   local.get 6
 003ab0: 49                         |                   i32.lt_u
 003ab1: 0d 00                      |                   br_if 0
 003ab3: 0b                         |                 end
 003ab4: 20 08                      |                 local.get 8
 003ab6: 20 04                      |                 local.get 4
 003ab8: 46                         |                 i32.eq
 003ab9: 0d 03                      |                 br_if 3
 003abb: 20 08                      |                 local.get 8
 003abd: 20 08                      |                 local.get 8
 003abf: 28 02 04                   |                 i32.load 2 4
 003ac2: 41 7e                      |                 i32.const 4294967294
 003ac4: 71                         |                 i32.and
 003ac5: 36 02 04                   |                 i32.store 2 4
 003ac8: 20 04                      |                 local.get 4
 003aca: 20 08                      |                 local.get 8
 003acc: 20 04                      |                 local.get 4
 003ace: 6b                         |                 i32.sub
 003acf: 22 02                      |                 local.tee 2
 003ad1: 41 01                      |                 i32.const 1
 003ad3: 72                         |                 i32.or
 003ad4: 36 02 04                   |                 i32.store 2 4
 003ad7: 20 08                      |                 local.get 8
 003ad9: 20 02                      |                 local.get 2
 003adb: 36 02 00                   |                 i32.store 2 0
 003ade: 02 40                      |                 block
 003ae0: 20 02                      |                   local.get 2
 003ae2: 41 ff 01                   |                   i32.const 255
 003ae5: 4b                         |                   i32.gt_u
 003ae6: 0d 00                      |                   br_if 0
 003ae8: 20 02                      |                   local.get 2
 003aea: 41 03                      |                   i32.const 3
 003aec: 76                         |                   i32.shr_u
 003aed: 22 06                      |                   local.tee 6
 003aef: 41 03                      |                   i32.const 3
 003af1: 74                         |                   i32.shl
 003af2: 41 d4 18                   |                   i32.const 3156
 003af5: 6a                         |                   i32.add
 003af6: 21 00                      |                   local.set 0
 003af8: 02 40                      |                   block
 003afa: 02 40                      |                     block
 003afc: 41 00                      |                       i32.const 0
 003afe: 28 02 ac 18                |                       i32.load 2 3116
 003b02: 22 05                      |                       local.tee 5
 003b04: 41 01                      |                       i32.const 1
 003b06: 20 06                      |                       local.get 6
 003b08: 74                         |                       i32.shl
 003b09: 22 06                      |                       local.tee 6
 003b0b: 71                         |                       i32.and
 003b0c: 0d 00                      |                       br_if 0
 003b0e: 41 00                      |                       i32.const 0
 003b10: 20 05                      |                       local.get 5
 003b12: 20 06                      |                       local.get 6
 003b14: 72                         |                       i32.or
 003b15: 36 02 ac 18                |                       i32.store 2 3116
 003b19: 20 00                      |                       local.get 0
 003b1b: 21 06                      |                       local.set 6
 003b1d: 0c 01                      |                       br 1
 003b1f: 0b                         |                     end
 003b20: 20 00                      |                     local.get 0
 003b22: 28 02 08                   |                     i32.load 2 8
 003b25: 21 06                      |                     local.set 6
 003b27: 0b                         |                   end
 003b28: 20 00                      |                   local.get 0
 003b2a: 20 04                      |                   local.get 4
 003b2c: 36 02 08                   |                   i32.store 2 8
 003b2f: 20 06                      |                   local.get 6
 003b31: 20 04                      |                   local.get 4
 003b33: 36 02 0c                   |                   i32.store 2 12
 003b36: 20 04                      |                   local.get 4
 003b38: 20 00                      |                   local.get 0
 003b3a: 36 02 0c                   |                   i32.store 2 12
 003b3d: 20 04                      |                   local.get 4
 003b3f: 20 06                      |                   local.get 6
 003b41: 36 02 08                   |                   i32.store 2 8
 003b44: 0c 04                      |                   br 4
 003b46: 0b                         |                 end
 003b47: 41 00                      |                 i32.const 0
 003b49: 21 00                      |                 local.set 0
 003b4b: 02 40                      |                 block
 003b4d: 20 02                      |                   local.get 2
 003b4f: 41 08                      |                   i32.const 8
 003b51: 76                         |                   i32.shr_u
 003b52: 22 06                      |                   local.tee 6
 003b54: 45                         |                   i32.eqz
 003b55: 0d 00                      |                   br_if 0
 003b57: 41 1f                      |                   i32.const 31
 003b59: 21 00                      |                   local.set 0
 003b5b: 20 02                      |                   local.get 2
 003b5d: 41 ff ff ff 07             |                   i32.const 16777215
 003b62: 4b                         |                   i32.gt_u
 003b63: 0d 00                      |                   br_if 0
 003b65: 20 06                      |                   local.get 6
 003b67: 20 06                      |                   local.get 6
 003b69: 41 80 fe 3f                |                   i32.const 1048320
 003b6d: 6a                         |                   i32.add
 003b6e: 41 10                      |                   i32.const 16
 003b70: 76                         |                   i32.shr_u
 003b71: 41 08                      |                   i32.const 8
 003b73: 71                         |                   i32.and
 003b74: 22 00                      |                   local.tee 0
 003b76: 74                         |                   i32.shl
 003b77: 22 06                      |                   local.tee 6
 003b79: 20 06                      |                   local.get 6
 003b7b: 41 80 e0 1f                |                   i32.const 520192
 003b7f: 6a                         |                   i32.add
 003b80: 41 10                      |                   i32.const 16
 003b82: 76                         |                   i32.shr_u
 003b83: 41 04                      |                   i32.const 4
 003b85: 71                         |                   i32.and
 003b86: 22 06                      |                   local.tee 6
 003b88: 74                         |                   i32.shl
 003b89: 22 05                      |                   local.tee 5
 003b8b: 20 05                      |                   local.get 5
 003b8d: 41 80 80 0f                |                   i32.const 245760
 003b91: 6a                         |                   i32.add
 003b92: 41 10                      |                   i32.const 16
 003b94: 76                         |                   i32.shr_u
 003b95: 41 02                      |                   i32.const 2
 003b97: 71                         |                   i32.and
 003b98: 22 05                      |                   local.tee 5
 003b9a: 74                         |                   i32.shl
 003b9b: 41 0f                      |                   i32.const 15
 003b9d: 76                         |                   i32.shr_u
 003b9e: 20 06                      |                   local.get 6
 003ba0: 20 00                      |                   local.get 0
 003ba2: 72                         |                   i32.or
 003ba3: 20 05                      |                   local.get 5
 003ba5: 72                         |                   i32.or
 003ba6: 6b                         |                   i32.sub
 003ba7: 22 00                      |                   local.tee 0
 003ba9: 41 01                      |                   i32.const 1
 003bab: 74                         |                   i32.shl
 003bac: 20 02                      |                   local.get 2
 003bae: 20 00                      |                   local.get 0
 003bb0: 41 15                      |                   i32.const 21
 003bb2: 6a                         |                   i32.add
 003bb3: 76                         |                   i32.shr_u
 003bb4: 41 01                      |                   i32.const 1
 003bb6: 71                         |                   i32.and
 003bb7: 72                         |                   i32.or
 003bb8: 41 1c                      |                   i32.const 28
 003bba: 6a                         |                   i32.add
 003bbb: 21 00                      |                   local.set 0
 003bbd: 0b                         |                 end
 003bbe: 20 04                      |                 local.get 4
 003bc0: 42 00                      |                 i64.const 0
 003bc2: 37 02 10                   |                 i64.store 2 16
 003bc5: 20 04                      |                 local.get 4
 003bc7: 41 1c                      |                 i32.const 28
 003bc9: 6a                         |                 i32.add
 003bca: 20 00                      |                 local.get 0
 003bcc: 36 02 00                   |                 i32.store 2 0
 003bcf: 20 00                      |                 local.get 0
 003bd1: 41 02                      |                 i32.const 2
 003bd3: 74                         |                 i32.shl
 003bd4: 41 dc 1a                   |                 i32.const 3420
 003bd7: 6a                         |                 i32.add
 003bd8: 21 06                      |                 local.set 6
 003bda: 02 40                      |                 block
 003bdc: 02 40                      |                   block
 003bde: 41 00                      |                     i32.const 0
 003be0: 28 02 b0 18                |                     i32.load 2 3120
 003be4: 22 05                      |                     local.tee 5
 003be6: 41 01                      |                     i32.const 1
 003be8: 20 00                      |                     local.get 0
 003bea: 74                         |                     i32.shl
 003beb: 22 08                      |                     local.tee 8
 003bed: 71                         |                     i32.and
 003bee: 0d 00                      |                     br_if 0
 003bf0: 41 00                      |                     i32.const 0
 003bf2: 20 05                      |                     local.get 5
 003bf4: 20 08                      |                     local.get 8
 003bf6: 72                         |                     i32.or
 003bf7: 36 02 b0 18                |                     i32.store 2 3120
 003bfb: 20 06                      |                     local.get 6
 003bfd: 20 04                      |                     local.get 4
 003bff: 36 02 00                   |                     i32.store 2 0
 003c02: 20 04                      |                     local.get 4
 003c04: 41 18                      |                     i32.const 24
 003c06: 6a                         |                     i32.add
 003c07: 20 06                      |                     local.get 6
 003c09: 36 02 00                   |                     i32.store 2 0
 003c0c: 0c 01                      |                     br 1
 003c0e: 0b                         |                   end
 003c0f: 20 02                      |                   local.get 2
 003c11: 41 00                      |                   i32.const 0
 003c13: 41 19                      |                   i32.const 25
 003c15: 20 00                      |                   local.get 0
 003c17: 41 01                      |                   i32.const 1
 003c19: 76                         |                   i32.shr_u
 003c1a: 6b                         |                   i32.sub
 003c1b: 20 00                      |                   local.get 0
 003c1d: 41 1f                      |                   i32.const 31
 003c1f: 46                         |                   i32.eq
 003c20: 1b                         |                   select
 003c21: 74                         |                   i32.shl
 003c22: 21 00                      |                   local.set 0
 003c24: 20 06                      |                   local.get 6
 003c26: 28 02 00                   |                   i32.load 2 0
 003c29: 21 05                      |                   local.set 5
 003c2b: 03 40                      |                   loop
 003c2d: 20 05                      |                     local.get 5
 003c2f: 22 06                      |                     local.tee 6
 003c31: 28 02 04                   |                     i32.load 2 4
 003c34: 41 78                      |                     i32.const 4294967288
 003c36: 71                         |                     i32.and
 003c37: 20 02                      |                     local.get 2
 003c39: 46                         |                     i32.eq
 003c3a: 0d 04                      |                     br_if 4
 003c3c: 20 00                      |                     local.get 0
 003c3e: 41 1d                      |                     i32.const 29
 003c40: 76                         |                     i32.shr_u
 003c41: 21 05                      |                     local.set 5
 003c43: 20 00                      |                     local.get 0
 003c45: 41 01                      |                     i32.const 1
 003c47: 74                         |                     i32.shl
 003c48: 21 00                      |                     local.set 0
 003c4a: 20 06                      |                     local.get 6
 003c4c: 20 05                      |                     local.get 5
 003c4e: 41 04                      |                     i32.const 4
 003c50: 71                         |                     i32.and
 003c51: 6a                         |                     i32.add
 003c52: 41 10                      |                     i32.const 16
 003c54: 6a                         |                     i32.add
 003c55: 22 08                      |                     local.tee 8
 003c57: 28 02 00                   |                     i32.load 2 0
 003c5a: 22 05                      |                     local.tee 5
 003c5c: 0d 00                      |                     br_if 0
 003c5e: 0b                         |                   end
 003c5f: 20 08                      |                   local.get 8
 003c61: 20 04                      |                   local.get 4
 003c63: 36 02 00                   |                   i32.store 2 0
 003c66: 20 04                      |                   local.get 4
 003c68: 41 18                      |                   i32.const 24
 003c6a: 6a                         |                   i32.add
 003c6b: 20 06                      |                   local.get 6
 003c6d: 36 02 00                   |                   i32.store 2 0
 003c70: 0b                         |                 end
 003c71: 20 04                      |                 local.get 4
 003c73: 20 04                      |                 local.get 4
 003c75: 36 02 0c                   |                 i32.store 2 12
 003c78: 20 04                      |                 local.get 4
 003c7a: 20 04                      |                 local.get 4
 003c7c: 36 02 08                   |                 i32.store 2 8
 003c7f: 0c 03                      |                 br 3
 003c81: 0b                         |               end
 003c82: 20 03                      |               local.get 3
 003c84: 28 02 08                   |               i32.load 2 8
 003c87: 22 00                      |               local.tee 0
 003c89: 20 06                      |               local.get 6
 003c8b: 36 02 0c                   |               i32.store 2 12
 003c8e: 20 03                      |               local.get 3
 003c90: 20 06                      |               local.get 6
 003c92: 36 02 08                   |               i32.store 2 8
 003c95: 20 06                      |               local.get 6
 003c97: 41 00                      |               i32.const 0
 003c99: 36 02 18                   |               i32.store 2 24
 003c9c: 20 06                      |               local.get 6
 003c9e: 20 03                      |               local.get 3
 003ca0: 36 02 0c                   |               i32.store 2 12
 003ca3: 20 06                      |               local.get 6
 003ca5: 20 00                      |               local.get 0
 003ca7: 36 02 08                   |               i32.store 2 8
 003caa: 0b                         |             end
 003cab: 20 0b                      |             local.get 11
 003cad: 41 08                      |             i32.const 8
 003caf: 6a                         |             i32.add
 003cb0: 21 00                      |             local.set 0
 003cb2: 0c 05                      |             br 5
 003cb4: 0b                         |           end
 003cb5: 20 06                      |           local.get 6
 003cb7: 28 02 08                   |           i32.load 2 8
 003cba: 22 00                      |           local.tee 0
 003cbc: 20 04                      |           local.get 4
 003cbe: 36 02 0c                   |           i32.store 2 12
 003cc1: 20 06                      |           local.get 6
 003cc3: 20 04                      |           local.get 4
 003cc5: 36 02 08                   |           i32.store 2 8
 003cc8: 20 04                      |           local.get 4
 003cca: 41 18                      |           i32.const 24
 003ccc: 6a                         |           i32.add
 003ccd: 41 00                      |           i32.const 0
 003ccf: 36 02 00                   |           i32.store 2 0
 003cd2: 20 04                      |           local.get 4
 003cd4: 20 06                      |           local.get 6
 003cd6: 36 02 0c                   |           i32.store 2 12
 003cd9: 20 04                      |           local.get 4
 003cdb: 20 00                      |           local.get 0
 003cdd: 36 02 08                   |           i32.store 2 8
 003ce0: 0b                         |         end
 003ce1: 41 00                      |         i32.const 0
 003ce3: 28 02 b8 18                |         i32.load 2 3128
 003ce7: 22 00                      |         local.tee 0
 003ce9: 20 03                      |         local.get 3
 003ceb: 4d                         |         i32.le_u
 003cec: 0d 00                      |         br_if 0
 003cee: 41 00                      |         i32.const 0
 003cf0: 20 00                      |         local.get 0
 003cf2: 20 03                      |         local.get 3
 003cf4: 6b                         |         i32.sub
 003cf5: 22 04                      |         local.tee 4
 003cf7: 36 02 b8 18                |         i32.store 2 3128
 003cfb: 41 00                      |         i32.const 0
 003cfd: 41 00                      |         i32.const 0
 003cff: 28 02 c4 18                |         i32.load 2 3140
 003d03: 22 00                      |         local.tee 0
 003d05: 20 03                      |         local.get 3
 003d07: 6a                         |         i32.add
 003d08: 22 06                      |         local.tee 6
 003d0a: 36 02 c4 18                |         i32.store 2 3140
 003d0e: 20 06                      |         local.get 6
 003d10: 20 04                      |         local.get 4
 003d12: 41 01                      |         i32.const 1
 003d14: 72                         |         i32.or
 003d15: 36 02 04                   |         i32.store 2 4
 003d18: 20 00                      |         local.get 0
 003d1a: 20 03                      |         local.get 3
 003d1c: 41 03                      |         i32.const 3
 003d1e: 72                         |         i32.or
 003d1f: 36 02 04                   |         i32.store 2 4
 003d22: 20 00                      |         local.get 0
 003d24: 41 08                      |         i32.const 8
 003d26: 6a                         |         i32.add
 003d27: 21 00                      |         local.set 0
 003d29: 0c 03                      |         br 3
 003d2b: 0b                         |       end
 003d2c: 10 26                      |       call 38 <__errno_location>
 003d2e: 41 30                      |       i32.const 48
 003d30: 36 02 00                   |       i32.store 2 0
 003d33: 41 00                      |       i32.const 0
 003d35: 21 00                      |       local.set 0
 003d37: 0c 02                      |       br 2
 003d39: 0b                         |     end
 003d3a: 02 40                      |     block
 003d3c: 20 0b                      |       local.get 11
 003d3e: 45                         |       i32.eqz
 003d3f: 0d 00                      |       br_if 0
 003d41: 02 40                      |       block
 003d43: 02 40                      |         block
 003d45: 20 08                      |           local.get 8
 003d47: 20 08                      |           local.get 8
 003d49: 28 02 1c                   |           i32.load 2 28
 003d4c: 22 04                      |           local.tee 4
 003d4e: 41 02                      |           i32.const 2
 003d50: 74                         |           i32.shl
 003d51: 41 dc 1a                   |           i32.const 3420
 003d54: 6a                         |           i32.add
 003d55: 22 00                      |           local.tee 0
 003d57: 28 02 00                   |           i32.load 2 0
 003d5a: 47                         |           i32.ne
 003d5b: 0d 00                      |           br_if 0
 003d5d: 20 00                      |           local.get 0
 003d5f: 20 05                      |           local.get 5
 003d61: 36 02 00                   |           i32.store 2 0
 003d64: 20 05                      |           local.get 5
 003d66: 0d 01                      |           br_if 1
 003d68: 41 00                      |           i32.const 0
 003d6a: 20 07                      |           local.get 7
 003d6c: 41 7e                      |           i32.const 4294967294
 003d6e: 20 04                      |           local.get 4
 003d70: 77                         |           i32.rotl
 003d71: 71                         |           i32.and
 003d72: 22 07                      |           local.tee 7
 003d74: 36 02 b0 18                |           i32.store 2 3120
 003d78: 0c 02                      |           br 2
 003d7a: 0b                         |         end
 003d7b: 20 0b                      |         local.get 11
 003d7d: 41 10                      |         i32.const 16
 003d7f: 41 14                      |         i32.const 20
 003d81: 20 0b                      |         local.get 11
 003d83: 28 02 10                   |         i32.load 2 16
 003d86: 20 08                      |         local.get 8
 003d88: 46                         |         i32.eq
 003d89: 1b                         |         select
 003d8a: 6a                         |         i32.add
 003d8b: 20 05                      |         local.get 5
 003d8d: 36 02 00                   |         i32.store 2 0
 003d90: 20 05                      |         local.get 5
 003d92: 45                         |         i32.eqz
 003d93: 0d 01                      |         br_if 1
 003d95: 0b                         |       end
 003d96: 20 05                      |       local.get 5
 003d98: 20 0b                      |       local.get 11
 003d9a: 36 02 18                   |       i32.store 2 24
 003d9d: 02 40                      |       block
 003d9f: 20 08                      |         local.get 8
 003da1: 28 02 10                   |         i32.load 2 16
 003da4: 22 00                      |         local.tee 0
 003da6: 45                         |         i32.eqz
 003da7: 0d 00                      |         br_if 0
 003da9: 20 05                      |         local.get 5
 003dab: 20 00                      |         local.get 0
 003dad: 36 02 10                   |         i32.store 2 16
 003db0: 20 00                      |         local.get 0
 003db2: 20 05                      |         local.get 5
 003db4: 36 02 18                   |         i32.store 2 24
 003db7: 0b                         |       end
 003db8: 20 08                      |       local.get 8
 003dba: 41 14                      |       i32.const 20
 003dbc: 6a                         |       i32.add
 003dbd: 28 02 00                   |       i32.load 2 0
 003dc0: 22 00                      |       local.tee 0
 003dc2: 45                         |       i32.eqz
 003dc3: 0d 00                      |       br_if 0
 003dc5: 20 05                      |       local.get 5
 003dc7: 41 14                      |       i32.const 20
 003dc9: 6a                         |       i32.add
 003dca: 20 00                      |       local.get 0
 003dcc: 36 02 00                   |       i32.store 2 0
 003dcf: 20 00                      |       local.get 0
 003dd1: 20 05                      |       local.get 5
 003dd3: 36 02 18                   |       i32.store 2 24
 003dd6: 0b                         |     end
 003dd7: 02 40                      |     block
 003dd9: 02 40                      |       block
 003ddb: 20 06                      |         local.get 6
 003ddd: 41 0f                      |         i32.const 15
 003ddf: 4b                         |         i32.gt_u
 003de0: 0d 00                      |         br_if 0
 003de2: 20 08                      |         local.get 8
 003de4: 20 06                      |         local.get 6
 003de6: 20 03                      |         local.get 3
 003de8: 6a                         |         i32.add
 003de9: 22 00                      |         local.tee 0
 003deb: 41 03                      |         i32.const 3
 003ded: 72                         |         i32.or
 003dee: 36 02 04                   |         i32.store 2 4
 003df1: 20 08                      |         local.get 8
 003df3: 20 00                      |         local.get 0
 003df5: 6a                         |         i32.add
 003df6: 22 00                      |         local.tee 0
 003df8: 20 00                      |         local.get 0
 003dfa: 28 02 04                   |         i32.load 2 4
 003dfd: 41 01                      |         i32.const 1
 003dff: 72                         |         i32.or
 003e00: 36 02 04                   |         i32.store 2 4
 003e03: 0c 01                      |         br 1
 003e05: 0b                         |       end
 003e06: 20 08                      |       local.get 8
 003e08: 20 03                      |       local.get 3
 003e0a: 41 03                      |       i32.const 3
 003e0c: 72                         |       i32.or
 003e0d: 36 02 04                   |       i32.store 2 4
 003e10: 20 08                      |       local.get 8
 003e12: 20 03                      |       local.get 3
 003e14: 6a                         |       i32.add
 003e15: 22 05                      |       local.tee 5
 003e17: 20 06                      |       local.get 6
 003e19: 41 01                      |       i32.const 1
 003e1b: 72                         |       i32.or
 003e1c: 36 02 04                   |       i32.store 2 4
 003e1f: 20 05                      |       local.get 5
 003e21: 20 06                      |       local.get 6
 003e23: 6a                         |       i32.add
 003e24: 20 06                      |       local.get 6
 003e26: 36 02 00                   |       i32.store 2 0
 003e29: 02 40                      |       block
 003e2b: 20 06                      |         local.get 6
 003e2d: 41 ff 01                   |         i32.const 255
 003e30: 4b                         |         i32.gt_u
 003e31: 0d 00                      |         br_if 0
 003e33: 20 06                      |         local.get 6
 003e35: 41 03                      |         i32.const 3
 003e37: 76                         |         i32.shr_u
 003e38: 22 04                      |         local.tee 4
 003e3a: 41 03                      |         i32.const 3
 003e3c: 74                         |         i32.shl
 003e3d: 41 d4 18                   |         i32.const 3156
 003e40: 6a                         |         i32.add
 003e41: 21 00                      |         local.set 0
 003e43: 02 40                      |         block
 003e45: 02 40                      |           block
 003e47: 41 00                      |             i32.const 0
 003e49: 28 02 ac 18                |             i32.load 2 3116
 003e4d: 22 06                      |             local.tee 6
 003e4f: 41 01                      |             i32.const 1
 003e51: 20 04                      |             local.get 4
 003e53: 74                         |             i32.shl
 003e54: 22 04                      |             local.tee 4
 003e56: 71                         |             i32.and
 003e57: 0d 00                      |             br_if 0
 003e59: 41 00                      |             i32.const 0
 003e5b: 20 06                      |             local.get 6
 003e5d: 20 04                      |             local.get 4
 003e5f: 72                         |             i32.or
 003e60: 36 02 ac 18                |             i32.store 2 3116
 003e64: 20 00                      |             local.get 0
 003e66: 21 04                      |             local.set 4
 003e68: 0c 01                      |             br 1
 003e6a: 0b                         |           end
 003e6b: 20 00                      |           local.get 0
 003e6d: 28 02 08                   |           i32.load 2 8
 003e70: 21 04                      |           local.set 4
 003e72: 0b                         |         end
 003e73: 20 00                      |         local.get 0
 003e75: 20 05                      |         local.get 5
 003e77: 36 02 08                   |         i32.store 2 8
 003e7a: 20 04                      |         local.get 4
 003e7c: 20 05                      |         local.get 5
 003e7e: 36 02 0c                   |         i32.store 2 12
 003e81: 20 05                      |         local.get 5
 003e83: 20 00                      |         local.get 0
 003e85: 36 02 0c                   |         i32.store 2 12
 003e88: 20 05                      |         local.get 5
 003e8a: 20 04                      |         local.get 4
 003e8c: 36 02 08                   |         i32.store 2 8
 003e8f: 0c 01                      |         br 1
 003e91: 0b                         |       end
 003e92: 02 40                      |       block
 003e94: 02 40                      |         block
 003e96: 20 06                      |           local.get 6
 003e98: 41 08                      |           i32.const 8
 003e9a: 76                         |           i32.shr_u
 003e9b: 22 04                      |           local.tee 4
 003e9d: 0d 00                      |           br_if 0
 003e9f: 41 00                      |           i32.const 0
 003ea1: 21 00                      |           local.set 0
 003ea3: 0c 01                      |           br 1
 003ea5: 0b                         |         end
 003ea6: 41 1f                      |         i32.const 31
 003ea8: 21 00                      |         local.set 0
 003eaa: 20 06                      |         local.get 6
 003eac: 41 ff ff ff 07             |         i32.const 16777215
 003eb1: 4b                         |         i32.gt_u
 003eb2: 0d 00                      |         br_if 0
 003eb4: 20 04                      |         local.get 4
 003eb6: 20 04                      |         local.get 4
 003eb8: 41 80 fe 3f                |         i32.const 1048320
 003ebc: 6a                         |         i32.add
 003ebd: 41 10                      |         i32.const 16
 003ebf: 76                         |         i32.shr_u
 003ec0: 41 08                      |         i32.const 8
 003ec2: 71                         |         i32.and
 003ec3: 22 00                      |         local.tee 0
 003ec5: 74                         |         i32.shl
 003ec6: 22 04                      |         local.tee 4
 003ec8: 20 04                      |         local.get 4
 003eca: 41 80 e0 1f                |         i32.const 520192
 003ece: 6a                         |         i32.add
 003ecf: 41 10                      |         i32.const 16
 003ed1: 76                         |         i32.shr_u
 003ed2: 41 04                      |         i32.const 4
 003ed4: 71                         |         i32.and
 003ed5: 22 04                      |         local.tee 4
 003ed7: 74                         |         i32.shl
 003ed8: 22 03                      |         local.tee 3
 003eda: 20 03                      |         local.get 3
 003edc: 41 80 80 0f                |         i32.const 245760
 003ee0: 6a                         |         i32.add
 003ee1: 41 10                      |         i32.const 16
 003ee3: 76                         |         i32.shr_u
 003ee4: 41 02                      |         i32.const 2
 003ee6: 71                         |         i32.and
 003ee7: 22 03                      |         local.tee 3
 003ee9: 74                         |         i32.shl
 003eea: 41 0f                      |         i32.const 15
 003eec: 76                         |         i32.shr_u
 003eed: 20 04                      |         local.get 4
 003eef: 20 00                      |         local.get 0
 003ef1: 72                         |         i32.or
 003ef2: 20 03                      |         local.get 3
 003ef4: 72                         |         i32.or
 003ef5: 6b                         |         i32.sub
 003ef6: 22 00                      |         local.tee 0
 003ef8: 41 01                      |         i32.const 1
 003efa: 74                         |         i32.shl
 003efb: 20 06                      |         local.get 6
 003efd: 20 00                      |         local.get 0
 003eff: 41 15                      |         i32.const 21
 003f01: 6a                         |         i32.add
 003f02: 76                         |         i32.shr_u
 003f03: 41 01                      |         i32.const 1
 003f05: 71                         |         i32.and
 003f06: 72                         |         i32.or
 003f07: 41 1c                      |         i32.const 28
 003f09: 6a                         |         i32.add
 003f0a: 21 00                      |         local.set 0
 003f0c: 0b                         |       end
 003f0d: 20 05                      |       local.get 5
 003f0f: 20 00                      |       local.get 0
 003f11: 36 02 1c                   |       i32.store 2 28
 003f14: 20 05                      |       local.get 5
 003f16: 42 00                      |       i64.const 0
 003f18: 37 02 10                   |       i64.store 2 16
 003f1b: 20 00                      |       local.get 0
 003f1d: 41 02                      |       i32.const 2
 003f1f: 74                         |       i32.shl
 003f20: 41 dc 1a                   |       i32.const 3420
 003f23: 6a                         |       i32.add
 003f24: 21 04                      |       local.set 4
 003f26: 02 40                      |       block
 003f28: 02 40                      |         block
 003f2a: 02 40                      |           block
 003f2c: 20 07                      |             local.get 7
 003f2e: 41 01                      |             i32.const 1
 003f30: 20 00                      |             local.get 0
 003f32: 74                         |             i32.shl
 003f33: 22 03                      |             local.tee 3
 003f35: 71                         |             i32.and
 003f36: 0d 00                      |             br_if 0
 003f38: 41 00                      |             i32.const 0
 003f3a: 20 07                      |             local.get 7
 003f3c: 20 03                      |             local.get 3
 003f3e: 72                         |             i32.or
 003f3f: 36 02 b0 18                |             i32.store 2 3120
 003f43: 20 04                      |             local.get 4
 003f45: 20 05                      |             local.get 5
 003f47: 36 02 00                   |             i32.store 2 0
 003f4a: 20 05                      |             local.get 5
 003f4c: 20 04                      |             local.get 4
 003f4e: 36 02 18                   |             i32.store 2 24
 003f51: 0c 01                      |             br 1
 003f53: 0b                         |           end
 003f54: 20 06                      |           local.get 6
 003f56: 41 00                      |           i32.const 0
 003f58: 41 19                      |           i32.const 25
 003f5a: 20 00                      |           local.get 0
 003f5c: 41 01                      |           i32.const 1
 003f5e: 76                         |           i32.shr_u
 003f5f: 6b                         |           i32.sub
 003f60: 20 00                      |           local.get 0
 003f62: 41 1f                      |           i32.const 31
 003f64: 46                         |           i32.eq
 003f65: 1b                         |           select
 003f66: 74                         |           i32.shl
 003f67: 21 00                      |           local.set 0
 003f69: 20 04                      |           local.get 4
 003f6b: 28 02 00                   |           i32.load 2 0
 003f6e: 21 03                      |           local.set 3
 003f70: 03 40                      |           loop
 003f72: 20 03                      |             local.get 3
 003f74: 22 04                      |             local.tee 4
 003f76: 28 02 04                   |             i32.load 2 4
 003f79: 41 78                      |             i32.const 4294967288
 003f7b: 71                         |             i32.and
 003f7c: 20 06                      |             local.get 6
 003f7e: 46                         |             i32.eq
 003f7f: 0d 02                      |             br_if 2
 003f81: 20 00                      |             local.get 0
 003f83: 41 1d                      |             i32.const 29
 003f85: 76                         |             i32.shr_u
 003f86: 21 03                      |             local.set 3
 003f88: 20 00                      |             local.get 0
 003f8a: 41 01                      |             i32.const 1
 003f8c: 74                         |             i32.shl
 003f8d: 21 00                      |             local.set 0
 003f8f: 20 04                      |             local.get 4
 003f91: 20 03                      |             local.get 3
 003f93: 41 04                      |             i32.const 4
 003f95: 71                         |             i32.and
 003f96: 6a                         |             i32.add
 003f97: 41 10                      |             i32.const 16
 003f99: 6a                         |             i32.add
 003f9a: 22 02                      |             local.tee 2
 003f9c: 28 02 00                   |             i32.load 2 0
 003f9f: 22 03                      |             local.tee 3
 003fa1: 0d 00                      |             br_if 0
 003fa3: 0b                         |           end
 003fa4: 20 02                      |           local.get 2
 003fa6: 20 05                      |           local.get 5
 003fa8: 36 02 00                   |           i32.store 2 0
 003fab: 20 05                      |           local.get 5
 003fad: 20 04                      |           local.get 4
 003faf: 36 02 18                   |           i32.store 2 24
 003fb2: 0b                         |         end
 003fb3: 20 05                      |         local.get 5
 003fb5: 20 05                      |         local.get 5
 003fb7: 36 02 0c                   |         i32.store 2 12
 003fba: 20 05                      |         local.get 5
 003fbc: 20 05                      |         local.get 5
 003fbe: 36 02 08                   |         i32.store 2 8
 003fc1: 0c 01                      |         br 1
 003fc3: 0b                         |       end
 003fc4: 20 04                      |       local.get 4
 003fc6: 28 02 08                   |       i32.load 2 8
 003fc9: 22 00                      |       local.tee 0
 003fcb: 20 05                      |       local.get 5
 003fcd: 36 02 0c                   |       i32.store 2 12
 003fd0: 20 04                      |       local.get 4
 003fd2: 20 05                      |       local.get 5
 003fd4: 36 02 08                   |       i32.store 2 8
 003fd7: 20 05                      |       local.get 5
 003fd9: 41 00                      |       i32.const 0
 003fdb: 36 02 18                   |       i32.store 2 24
 003fde: 20 05                      |       local.get 5
 003fe0: 20 04                      |       local.get 4
 003fe2: 36 02 0c                   |       i32.store 2 12
 003fe5: 20 05                      |       local.get 5
 003fe7: 20 00                      |       local.get 0
 003fe9: 36 02 08                   |       i32.store 2 8
 003fec: 0b                         |     end
 003fed: 20 08                      |     local.get 8
 003fef: 41 08                      |     i32.const 8
 003ff1: 6a                         |     i32.add
 003ff2: 21 00                      |     local.set 0
 003ff4: 0c 01                      |     br 1
 003ff6: 0b                         |   end
 003ff7: 02 40                      |   block
 003ff9: 20 0a                      |     local.get 10
 003ffb: 45                         |     i32.eqz
 003ffc: 0d 00                      |     br_if 0
 003ffe: 02 40                      |     block
 004000: 02 40                      |       block
 004002: 20 05                      |         local.get 5
 004004: 20 05                      |         local.get 5
 004006: 28 02 1c                   |         i32.load 2 28
 004009: 22 06                      |         local.tee 6
 00400b: 41 02                      |         i32.const 2
 00400d: 74                         |         i32.shl
 00400e: 41 dc 1a                   |         i32.const 3420
 004011: 6a                         |         i32.add
 004012: 22 00                      |         local.tee 0
 004014: 28 02 00                   |         i32.load 2 0
 004017: 47                         |         i32.ne
 004018: 0d 00                      |         br_if 0
 00401a: 20 00                      |         local.get 0
 00401c: 20 08                      |         local.get 8
 00401e: 36 02 00                   |         i32.store 2 0
 004021: 20 08                      |         local.get 8
 004023: 0d 01                      |         br_if 1
 004025: 41 00                      |         i32.const 0
 004027: 20 09                      |         local.get 9
 004029: 41 7e                      |         i32.const 4294967294
 00402b: 20 06                      |         local.get 6
 00402d: 77                         |         i32.rotl
 00402e: 71                         |         i32.and
 00402f: 36 02 b0 18                |         i32.store 2 3120
 004033: 0c 02                      |         br 2
 004035: 0b                         |       end
 004036: 20 0a                      |       local.get 10
 004038: 41 10                      |       i32.const 16
 00403a: 41 14                      |       i32.const 20
 00403c: 20 0a                      |       local.get 10
 00403e: 28 02 10                   |       i32.load 2 16
 004041: 20 05                      |       local.get 5
 004043: 46                         |       i32.eq
 004044: 1b                         |       select
 004045: 6a                         |       i32.add
 004046: 20 08                      |       local.get 8
 004048: 36 02 00                   |       i32.store 2 0
 00404b: 20 08                      |       local.get 8
 00404d: 45                         |       i32.eqz
 00404e: 0d 01                      |       br_if 1
 004050: 0b                         |     end
 004051: 20 08                      |     local.get 8
 004053: 20 0a                      |     local.get 10
 004055: 36 02 18                   |     i32.store 2 24
 004058: 02 40                      |     block
 00405a: 20 05                      |       local.get 5
 00405c: 28 02 10                   |       i32.load 2 16
 00405f: 22 00                      |       local.tee 0
 004061: 45                         |       i32.eqz
 004062: 0d 00                      |       br_if 0
 004064: 20 08                      |       local.get 8
 004066: 20 00                      |       local.get 0
 004068: 36 02 10                   |       i32.store 2 16
 00406b: 20 00                      |       local.get 0
 00406d: 20 08                      |       local.get 8
 00406f: 36 02 18                   |       i32.store 2 24
 004072: 0b                         |     end
 004073: 20 05                      |     local.get 5
 004075: 41 14                      |     i32.const 20
 004077: 6a                         |     i32.add
 004078: 28 02 00                   |     i32.load 2 0
 00407b: 22 00                      |     local.tee 0
 00407d: 45                         |     i32.eqz
 00407e: 0d 00                      |     br_if 0
 004080: 20 08                      |     local.get 8
 004082: 41 14                      |     i32.const 20
 004084: 6a                         |     i32.add
 004085: 20 00                      |     local.get 0
 004087: 36 02 00                   |     i32.store 2 0
 00408a: 20 00                      |     local.get 0
 00408c: 20 08                      |     local.get 8
 00408e: 36 02 18                   |     i32.store 2 24
 004091: 0b                         |   end
 004092: 02 40                      |   block
 004094: 02 40                      |     block
 004096: 20 04                      |       local.get 4
 004098: 41 0f                      |       i32.const 15
 00409a: 4b                         |       i32.gt_u
 00409b: 0d 00                      |       br_if 0
 00409d: 20 05                      |       local.get 5
 00409f: 20 04                      |       local.get 4
 0040a1: 20 03                      |       local.get 3
 0040a3: 6a                         |       i32.add
 0040a4: 22 00                      |       local.tee 0
 0040a6: 41 03                      |       i32.const 3
 0040a8: 72                         |       i32.or
 0040a9: 36 02 04                   |       i32.store 2 4
 0040ac: 20 05                      |       local.get 5
 0040ae: 20 00                      |       local.get 0
 0040b0: 6a                         |       i32.add
 0040b1: 22 00                      |       local.tee 0
 0040b3: 20 00                      |       local.get 0
 0040b5: 28 02 04                   |       i32.load 2 4
 0040b8: 41 01                      |       i32.const 1
 0040ba: 72                         |       i32.or
 0040bb: 36 02 04                   |       i32.store 2 4
 0040be: 0c 01                      |       br 1
 0040c0: 0b                         |     end
 0040c1: 20 05                      |     local.get 5
 0040c3: 20 03                      |     local.get 3
 0040c5: 41 03                      |     i32.const 3
 0040c7: 72                         |     i32.or
 0040c8: 36 02 04                   |     i32.store 2 4
 0040cb: 20 05                      |     local.get 5
 0040cd: 20 03                      |     local.get 3
 0040cf: 6a                         |     i32.add
 0040d0: 22 06                      |     local.tee 6
 0040d2: 20 04                      |     local.get 4
 0040d4: 41 01                      |     i32.const 1
 0040d6: 72                         |     i32.or
 0040d7: 36 02 04                   |     i32.store 2 4
 0040da: 20 06                      |     local.get 6
 0040dc: 20 04                      |     local.get 4
 0040de: 6a                         |     i32.add
 0040df: 20 04                      |     local.get 4
 0040e1: 36 02 00                   |     i32.store 2 0
 0040e4: 02 40                      |     block
 0040e6: 20 07                      |       local.get 7
 0040e8: 45                         |       i32.eqz
 0040e9: 0d 00                      |       br_if 0
 0040eb: 20 07                      |       local.get 7
 0040ed: 41 03                      |       i32.const 3
 0040ef: 76                         |       i32.shr_u
 0040f0: 22 08                      |       local.tee 8
 0040f2: 41 03                      |       i32.const 3
 0040f4: 74                         |       i32.shl
 0040f5: 41 d4 18                   |       i32.const 3156
 0040f8: 6a                         |       i32.add
 0040f9: 21 03                      |       local.set 3
 0040fb: 41 00                      |       i32.const 0
 0040fd: 28 02 c0 18                |       i32.load 2 3136
 004101: 21 00                      |       local.set 0
 004103: 02 40                      |       block
 004105: 02 40                      |         block
 004107: 41 01                      |           i32.const 1
 004109: 20 08                      |           local.get 8
 00410b: 74                         |           i32.shl
 00410c: 22 08                      |           local.tee 8
 00410e: 20 02                      |           local.get 2
 004110: 71                         |           i32.and
 004111: 0d 00                      |           br_if 0
 004113: 41 00                      |           i32.const 0
 004115: 20 08                      |           local.get 8
 004117: 20 02                      |           local.get 2
 004119: 72                         |           i32.or
 00411a: 36 02 ac 18                |           i32.store 2 3116
 00411e: 20 03                      |           local.get 3
 004120: 21 08                      |           local.set 8
 004122: 0c 01                      |           br 1
 004124: 0b                         |         end
 004125: 20 03                      |         local.get 3
 004127: 28 02 08                   |         i32.load 2 8
 00412a: 21 08                      |         local.set 8
 00412c: 0b                         |       end
 00412d: 20 03                      |       local.get 3
 00412f: 20 00                      |       local.get 0
 004131: 36 02 08                   |       i32.store 2 8
 004134: 20 08                      |       local.get 8
 004136: 20 00                      |       local.get 0
 004138: 36 02 0c                   |       i32.store 2 12
 00413b: 20 00                      |       local.get 0
 00413d: 20 03                      |       local.get 3
 00413f: 36 02 0c                   |       i32.store 2 12
 004142: 20 00                      |       local.get 0
 004144: 20 08                      |       local.get 8
 004146: 36 02 08                   |       i32.store 2 8
 004149: 0b                         |     end
 00414a: 41 00                      |     i32.const 0
 00414c: 20 06                      |     local.get 6
 00414e: 36 02 c0 18                |     i32.store 2 3136
 004152: 41 00                      |     i32.const 0
 004154: 20 04                      |     local.get 4
 004156: 36 02 b4 18                |     i32.store 2 3124
 00415a: 0b                         |   end
 00415b: 20 05                      |   local.get 5
 00415d: 41 08                      |   i32.const 8
 00415f: 6a                         |   i32.add
 004160: 21 00                      |   local.set 0
 004162: 0b                         | end
 004163: 20 01                      | local.get 1
 004165: 41 10                      | i32.const 16
 004167: 6a                         | i32.add
 004168: 24 00                      | global.set 0
 00416a: 20 00                      | local.get 0
 00416c: 0b                         | end
00416f func[51] <free>:
 004170: 07 7f                      | local[0..6] type=i32
 004172: 02 40                      | block
 004174: 20 00                      |   local.get 0
 004176: 45                         |   i32.eqz
 004177: 0d 00                      |   br_if 0
 004179: 20 00                      |   local.get 0
 00417b: 41 78                      |   i32.const 4294967288
 00417d: 6a                         |   i32.add
 00417e: 22 01                      |   local.tee 1
 004180: 20 00                      |   local.get 0
 004182: 41 7c                      |   i32.const 4294967292
 004184: 6a                         |   i32.add
 004185: 28 02 00                   |   i32.load 2 0
 004188: 22 02                      |   local.tee 2
 00418a: 41 78                      |   i32.const 4294967288
 00418c: 71                         |   i32.and
 00418d: 22 00                      |   local.tee 0
 00418f: 6a                         |   i32.add
 004190: 21 03                      |   local.set 3
 004192: 02 40                      |   block
 004194: 20 02                      |     local.get 2
 004196: 41 01                      |     i32.const 1
 004198: 71                         |     i32.and
 004199: 0d 00                      |     br_if 0
 00419b: 20 02                      |     local.get 2
 00419d: 41 03                      |     i32.const 3
 00419f: 71                         |     i32.and
 0041a0: 45                         |     i32.eqz
 0041a1: 0d 01                      |     br_if 1
 0041a3: 20 01                      |     local.get 1
 0041a5: 20 01                      |     local.get 1
 0041a7: 28 02 00                   |     i32.load 2 0
 0041aa: 22 02                      |     local.tee 2
 0041ac: 6b                         |     i32.sub
 0041ad: 22 01                      |     local.tee 1
 0041af: 41 00                      |     i32.const 0
 0041b1: 28 02 bc 18                |     i32.load 2 3132
 0041b5: 22 04                      |     local.tee 4
 0041b7: 49                         |     i32.lt_u
 0041b8: 0d 01                      |     br_if 1
 0041ba: 20 02                      |     local.get 2
 0041bc: 20 00                      |     local.get 0
 0041be: 6a                         |     i32.add
 0041bf: 21 00                      |     local.set 0
 0041c1: 02 40                      |     block
 0041c3: 41 00                      |       i32.const 0
 0041c5: 28 02 c0 18                |       i32.load 2 3136
 0041c9: 20 01                      |       local.get 1
 0041cb: 46                         |       i32.eq
 0041cc: 0d 00                      |       br_if 0
 0041ce: 02 40                      |       block
 0041d0: 20 02                      |         local.get 2
 0041d2: 41 ff 01                   |         i32.const 255
 0041d5: 4b                         |         i32.gt_u
 0041d6: 0d 00                      |         br_if 0
 0041d8: 20 01                      |         local.get 1
 0041da: 28 02 0c                   |         i32.load 2 12
 0041dd: 21 05                      |         local.set 5
 0041df: 02 40                      |         block
 0041e1: 20 01                      |           local.get 1
 0041e3: 28 02 08                   |           i32.load 2 8
 0041e6: 22 06                      |           local.tee 6
 0041e8: 20 02                      |           local.get 2
 0041ea: 41 03                      |           i32.const 3
 0041ec: 76                         |           i32.shr_u
 0041ed: 22 07                      |           local.tee 7
 0041ef: 41 03                      |           i32.const 3
 0041f1: 74                         |           i32.shl
 0041f2: 41 d4 18                   |           i32.const 3156
 0041f5: 6a                         |           i32.add
 0041f6: 22 02                      |           local.tee 2
 0041f8: 46                         |           i32.eq
 0041f9: 0d 00                      |           br_if 0
 0041fb: 20 04                      |           local.get 4
 0041fd: 20 06                      |           local.get 6
 0041ff: 4b                         |           i32.gt_u
 004200: 1a                         |           drop
 004201: 0b                         |         end
 004202: 02 40                      |         block
 004204: 20 05                      |           local.get 5
 004206: 20 06                      |           local.get 6
 004208: 47                         |           i32.ne
 004209: 0d 00                      |           br_if 0
 00420b: 41 00                      |           i32.const 0
 00420d: 41 00                      |           i32.const 0
 00420f: 28 02 ac 18                |           i32.load 2 3116
 004213: 41 7e                      |           i32.const 4294967294
 004215: 20 07                      |           local.get 7
 004217: 77                         |           i32.rotl
 004218: 71                         |           i32.and
 004219: 36 02 ac 18                |           i32.store 2 3116
 00421d: 0c 03                      |           br 3
 00421f: 0b                         |         end
 004220: 02 40                      |         block
 004222: 20 05                      |           local.get 5
 004224: 20 02                      |           local.get 2
 004226: 46                         |           i32.eq
 004227: 0d 00                      |           br_if 0
 004229: 20 04                      |           local.get 4
 00422b: 20 05                      |           local.get 5
 00422d: 4b                         |           i32.gt_u
 00422e: 1a                         |           drop
 00422f: 0b                         |         end
 004230: 20 06                      |         local.get 6
 004232: 20 05                      |         local.get 5
 004234: 36 02 0c                   |         i32.store 2 12
 004237: 20 05                      |         local.get 5
 004239: 20 06                      |         local.get 6
 00423b: 36 02 08                   |         i32.store 2 8
 00423e: 0c 02                      |         br 2
 004240: 0b                         |       end
 004241: 20 01                      |       local.get 1
 004243: 28 02 18                   |       i32.load 2 24
 004246: 21 07                      |       local.set 7
 004248: 02 40                      |       block
 00424a: 02 40                      |         block
 00424c: 20 01                      |           local.get 1
 00424e: 28 02 0c                   |           i32.load 2 12
 004251: 22 05                      |           local.tee 5
 004253: 20 01                      |           local.get 1
 004255: 46                         |           i32.eq
 004256: 0d 00                      |           br_if 0
 004258: 02 40                      |           block
 00425a: 20 04                      |             local.get 4
 00425c: 20 01                      |             local.get 1
 00425e: 28 02 08                   |             i32.load 2 8
 004261: 22 02                      |             local.tee 2
 004263: 4b                         |             i32.gt_u
 004264: 0d 00                      |             br_if 0
 004266: 20 02                      |             local.get 2
 004268: 28 02 0c                   |             i32.load 2 12
 00426b: 20 01                      |             local.get 1
 00426d: 47                         |             i32.ne
 00426e: 1a                         |             drop
 00426f: 0b                         |           end
 004270: 20 02                      |           local.get 2
 004272: 20 05                      |           local.get 5
 004274: 36 02 0c                   |           i32.store 2 12
 004277: 20 05                      |           local.get 5
 004279: 20 02                      |           local.get 2
 00427b: 36 02 08                   |           i32.store 2 8
 00427e: 0c 01                      |           br 1
 004280: 0b                         |         end
 004281: 02 40                      |         block
 004283: 20 01                      |           local.get 1
 004285: 41 14                      |           i32.const 20
 004287: 6a                         |           i32.add
 004288: 22 02                      |           local.tee 2
 00428a: 28 02 00                   |           i32.load 2 0
 00428d: 22 04                      |           local.tee 4
 00428f: 0d 00                      |           br_if 0
 004291: 20 01                      |           local.get 1
 004293: 41 10                      |           i32.const 16
 004295: 6a                         |           i32.add
 004296: 22 02                      |           local.tee 2
 004298: 28 02 00                   |           i32.load 2 0
 00429b: 22 04                      |           local.tee 4
 00429d: 0d 00                      |           br_if 0
 00429f: 41 00                      |           i32.const 0
 0042a1: 21 05                      |           local.set 5
 0042a3: 0c 01                      |           br 1
 0042a5: 0b                         |         end
 0042a6: 03 40                      |         loop
 0042a8: 20 02                      |           local.get 2
 0042aa: 21 06                      |           local.set 6
 0042ac: 20 04                      |           local.get 4
 0042ae: 22 05                      |           local.tee 5
 0042b0: 41 14                      |           i32.const 20
 0042b2: 6a                         |           i32.add
 0042b3: 22 02                      |           local.tee 2
 0042b5: 28 02 00                   |           i32.load 2 0
 0042b8: 22 04                      |           local.tee 4
 0042ba: 0d 00                      |           br_if 0
 0042bc: 20 05                      |           local.get 5
 0042be: 41 10                      |           i32.const 16
 0042c0: 6a                         |           i32.add
 0042c1: 21 02                      |           local.set 2
 0042c3: 20 05                      |           local.get 5
 0042c5: 28 02 10                   |           i32.load 2 16
 0042c8: 22 04                      |           local.tee 4
 0042ca: 0d 00                      |           br_if 0
 0042cc: 0b                         |         end
 0042cd: 20 06                      |         local.get 6
 0042cf: 41 00                      |         i32.const 0
 0042d1: 36 02 00                   |         i32.store 2 0
 0042d4: 0b                         |       end
 0042d5: 20 07                      |       local.get 7
 0042d7: 45                         |       i32.eqz
 0042d8: 0d 01                      |       br_if 1
 0042da: 02 40                      |       block
 0042dc: 02 40                      |         block
 0042de: 20 01                      |           local.get 1
 0042e0: 28 02 1c                   |           i32.load 2 28
 0042e3: 22 04                      |           local.tee 4
 0042e5: 41 02                      |           i32.const 2
 0042e7: 74                         |           i32.shl
 0042e8: 41 dc 1a                   |           i32.const 3420
 0042eb: 6a                         |           i32.add
 0042ec: 22 02                      |           local.tee 2
 0042ee: 28 02 00                   |           i32.load 2 0
 0042f1: 20 01                      |           local.get 1
 0042f3: 47                         |           i32.ne
 0042f4: 0d 00                      |           br_if 0
 0042f6: 20 02                      |           local.get 2
 0042f8: 20 05                      |           local.get 5
 0042fa: 36 02 00                   |           i32.store 2 0
 0042fd: 20 05                      |           local.get 5
 0042ff: 0d 01                      |           br_if 1
 004301: 41 00                      |           i32.const 0
 004303: 41 00                      |           i32.const 0
 004305: 28 02 b0 18                |           i32.load 2 3120
 004309: 41 7e                      |           i32.const 4294967294
 00430b: 20 04                      |           local.get 4
 00430d: 77                         |           i32.rotl
 00430e: 71                         |           i32.and
 00430f: 36 02 b0 18                |           i32.store 2 3120
 004313: 0c 03                      |           br 3
 004315: 0b                         |         end
 004316: 20 07                      |         local.get 7
 004318: 41 10                      |         i32.const 16
 00431a: 41 14                      |         i32.const 20
 00431c: 20 07                      |         local.get 7
 00431e: 28 02 10                   |         i32.load 2 16
 004321: 20 01                      |         local.get 1
 004323: 46                         |         i32.eq
 004324: 1b                         |         select
 004325: 6a                         |         i32.add
 004326: 20 05                      |         local.get 5
 004328: 36 02 00                   |         i32.store 2 0
 00432b: 20 05                      |         local.get 5
 00432d: 45                         |         i32.eqz
 00432e: 0d 02                      |         br_if 2
 004330: 0b                         |       end
 004331: 20 05                      |       local.get 5
 004333: 20 07                      |       local.get 7
 004335: 36 02 18                   |       i32.store 2 24
 004338: 02 40                      |       block
 00433a: 20 01                      |         local.get 1
 00433c: 28 02 10                   |         i32.load 2 16
 00433f: 22 02                      |         local.tee 2
 004341: 45                         |         i32.eqz
 004342: 0d 00                      |         br_if 0
 004344: 20 05                      |         local.get 5
 004346: 20 02                      |         local.get 2
 004348: 36 02 10                   |         i32.store 2 16
 00434b: 20 02                      |         local.get 2
 00434d: 20 05                      |         local.get 5
 00434f: 36 02 18                   |         i32.store 2 24
 004352: 0b                         |       end
 004353: 20 01                      |       local.get 1
 004355: 28 02 14                   |       i32.load 2 20
 004358: 22 02                      |       local.tee 2
 00435a: 45                         |       i32.eqz
 00435b: 0d 01                      |       br_if 1
 00435d: 20 05                      |       local.get 5
 00435f: 41 14                      |       i32.const 20
 004361: 6a                         |       i32.add
 004362: 20 02                      |       local.get 2
 004364: 36 02 00                   |       i32.store 2 0
 004367: 20 02                      |       local.get 2
 004369: 20 05                      |       local.get 5
 00436b: 36 02 18                   |       i32.store 2 24
 00436e: 0c 01                      |       br 1
 004370: 0b                         |     end
 004371: 20 03                      |     local.get 3
 004373: 28 02 04                   |     i32.load 2 4
 004376: 22 02                      |     local.tee 2
 004378: 41 03                      |     i32.const 3
 00437a: 71                         |     i32.and
 00437b: 41 03                      |     i32.const 3
 00437d: 47                         |     i32.ne
 00437e: 0d 00                      |     br_if 0
 004380: 41 00                      |     i32.const 0
 004382: 20 00                      |     local.get 0
 004384: 36 02 b4 18                |     i32.store 2 3124
 004388: 20 03                      |     local.get 3
 00438a: 20 02                      |     local.get 2
 00438c: 41 7e                      |     i32.const 4294967294
 00438e: 71                         |     i32.and
 00438f: 36 02 04                   |     i32.store 2 4
 004392: 20 01                      |     local.get 1
 004394: 20 00                      |     local.get 0
 004396: 41 01                      |     i32.const 1
 004398: 72                         |     i32.or
 004399: 36 02 04                   |     i32.store 2 4
 00439c: 20 01                      |     local.get 1
 00439e: 20 00                      |     local.get 0
 0043a0: 6a                         |     i32.add
 0043a1: 20 00                      |     local.get 0
 0043a3: 36 02 00                   |     i32.store 2 0
 0043a6: 0f                         |     return
 0043a7: 0b                         |   end
 0043a8: 20 03                      |   local.get 3
 0043aa: 20 01                      |   local.get 1
 0043ac: 4d                         |   i32.le_u
 0043ad: 0d 00                      |   br_if 0
 0043af: 20 03                      |   local.get 3
 0043b1: 28 02 04                   |   i32.load 2 4
 0043b4: 22 02                      |   local.tee 2
 0043b6: 41 01                      |   i32.const 1
 0043b8: 71                         |   i32.and
 0043b9: 45                         |   i32.eqz
 0043ba: 0d 00                      |   br_if 0
 0043bc: 02 40                      |   block
 0043be: 02 40                      |     block
 0043c0: 20 02                      |       local.get 2
 0043c2: 41 02                      |       i32.const 2
 0043c4: 71                         |       i32.and
 0043c5: 0d 00                      |       br_if 0
 0043c7: 02 40                      |       block
 0043c9: 41 00                      |         i32.const 0
 0043cb: 28 02 c4 18                |         i32.load 2 3140
 0043cf: 20 03                      |         local.get 3
 0043d1: 47                         |         i32.ne
 0043d2: 0d 00                      |         br_if 0
 0043d4: 41 00                      |         i32.const 0
 0043d6: 20 01                      |         local.get 1
 0043d8: 36 02 c4 18                |         i32.store 2 3140
 0043dc: 41 00                      |         i32.const 0
 0043de: 41 00                      |         i32.const 0
 0043e0: 28 02 b8 18                |         i32.load 2 3128
 0043e4: 20 00                      |         local.get 0
 0043e6: 6a                         |         i32.add
 0043e7: 22 00                      |         local.tee 0
 0043e9: 36 02 b8 18                |         i32.store 2 3128
 0043ed: 20 01                      |         local.get 1
 0043ef: 20 00                      |         local.get 0
 0043f1: 41 01                      |         i32.const 1
 0043f3: 72                         |         i32.or
 0043f4: 36 02 04                   |         i32.store 2 4
 0043f7: 20 01                      |         local.get 1
 0043f9: 41 00                      |         i32.const 0
 0043fb: 28 02 c0 18                |         i32.load 2 3136
 0043ff: 47                         |         i32.ne
 004400: 0d 03                      |         br_if 3
 004402: 41 00                      |         i32.const 0
 004404: 41 00                      |         i32.const 0
 004406: 36 02 b4 18                |         i32.store 2 3124
 00440a: 41 00                      |         i32.const 0
 00440c: 41 00                      |         i32.const 0
 00440e: 36 02 c0 18                |         i32.store 2 3136
 004412: 0f                         |         return
 004413: 0b                         |       end
 004414: 02 40                      |       block
 004416: 41 00                      |         i32.const 0
 004418: 28 02 c0 18                |         i32.load 2 3136
 00441c: 20 03                      |         local.get 3
 00441e: 47                         |         i32.ne
 00441f: 0d 00                      |         br_if 0
 004421: 41 00                      |         i32.const 0
 004423: 20 01                      |         local.get 1
 004425: 36 02 c0 18                |         i32.store 2 3136
 004429: 41 00                      |         i32.const 0
 00442b: 41 00                      |         i32.const 0
 00442d: 28 02 b4 18                |         i32.load 2 3124
 004431: 20 00                      |         local.get 0
 004433: 6a                         |         i32.add
 004434: 22 00                      |         local.tee 0
 004436: 36 02 b4 18                |         i32.store 2 3124
 00443a: 20 01                      |         local.get 1
 00443c: 20 00                      |         local.get 0
 00443e: 41 01                      |         i32.const 1
 004440: 72                         |         i32.or
 004441: 36 02 04                   |         i32.store 2 4
 004444: 20 01                      |         local.get 1
 004446: 20 00                      |         local.get 0
 004448: 6a                         |         i32.add
 004449: 20 00                      |         local.get 0
 00444b: 36 02 00                   |         i32.store 2 0
 00444e: 0f                         |         return
 00444f: 0b                         |       end
 004450: 20 02                      |       local.get 2
 004452: 41 78                      |       i32.const 4294967288
 004454: 71                         |       i32.and
 004455: 20 00                      |       local.get 0
 004457: 6a                         |       i32.add
 004458: 21 00                      |       local.set 0
 00445a: 02 40                      |       block
 00445c: 02 40                      |         block
 00445e: 20 02                      |           local.get 2
 004460: 41 ff 01                   |           i32.const 255
 004463: 4b                         |           i32.gt_u
 004464: 0d 00                      |           br_if 0
 004466: 20 03                      |           local.get 3
 004468: 28 02 0c                   |           i32.load 2 12
 00446b: 21 04                      |           local.set 4
 00446d: 02 40                      |           block
 00446f: 20 03                      |             local.get 3
 004471: 28 02 08                   |             i32.load 2 8
 004474: 22 05                      |             local.tee 5
 004476: 20 02                      |             local.get 2
 004478: 41 03                      |             i32.const 3
 00447a: 76                         |             i32.shr_u
 00447b: 22 03                      |             local.tee 3
 00447d: 41 03                      |             i32.const 3
 00447f: 74                         |             i32.shl
 004480: 41 d4 18                   |             i32.const 3156
 004483: 6a                         |             i32.add
 004484: 22 02                      |             local.tee 2
 004486: 46                         |             i32.eq
 004487: 0d 00                      |             br_if 0
 004489: 41 00                      |             i32.const 0
 00448b: 28 02 bc 18                |             i32.load 2 3132
 00448f: 20 05                      |             local.get 5
 004491: 4b                         |             i32.gt_u
 004492: 1a                         |             drop
 004493: 0b                         |           end
 004494: 02 40                      |           block
 004496: 20 04                      |             local.get 4
 004498: 20 05                      |             local.get 5
 00449a: 47                         |             i32.ne
 00449b: 0d 00                      |             br_if 0
 00449d: 41 00                      |             i32.const 0
 00449f: 41 00                      |             i32.const 0
 0044a1: 28 02 ac 18                |             i32.load 2 3116
 0044a5: 41 7e                      |             i32.const 4294967294
 0044a7: 20 03                      |             local.get 3
 0044a9: 77                         |             i32.rotl
 0044aa: 71                         |             i32.and
 0044ab: 36 02 ac 18                |             i32.store 2 3116
 0044af: 0c 02                      |             br 2
 0044b1: 0b                         |           end
 0044b2: 02 40                      |           block
 0044b4: 20 04                      |             local.get 4
 0044b6: 20 02                      |             local.get 2
 0044b8: 46                         |             i32.eq
 0044b9: 0d 00                      |             br_if 0
 0044bb: 41 00                      |             i32.const 0
 0044bd: 28 02 bc 18                |             i32.load 2 3132
 0044c1: 20 04                      |             local.get 4
 0044c3: 4b                         |             i32.gt_u
 0044c4: 1a                         |             drop
 0044c5: 0b                         |           end
 0044c6: 20 05                      |           local.get 5
 0044c8: 20 04                      |           local.get 4
 0044ca: 36 02 0c                   |           i32.store 2 12
 0044cd: 20 04                      |           local.get 4
 0044cf: 20 05                      |           local.get 5
 0044d1: 36 02 08                   |           i32.store 2 8
 0044d4: 0c 01                      |           br 1
 0044d6: 0b                         |         end
 0044d7: 20 03                      |         local.get 3
 0044d9: 28 02 18                   |         i32.load 2 24
 0044dc: 21 07                      |         local.set 7
 0044de: 02 40                      |         block
 0044e0: 02 40                      |           block
 0044e2: 20 03                      |             local.get 3
 0044e4: 28 02 0c                   |             i32.load 2 12
 0044e7: 22 05                      |             local.tee 5
 0044e9: 20 03                      |             local.get 3
 0044eb: 46                         |             i32.eq
 0044ec: 0d 00                      |             br_if 0
 0044ee: 02 40                      |             block
 0044f0: 41 00                      |               i32.const 0
 0044f2: 28 02 bc 18                |               i32.load 2 3132
 0044f6: 20 03                      |               local.get 3
 0044f8: 28 02 08                   |               i32.load 2 8
 0044fb: 22 02                      |               local.tee 2
 0044fd: 4b                         |               i32.gt_u
 0044fe: 0d 00                      |               br_if 0
 004500: 20 02                      |               local.get 2
 004502: 28 02 0c                   |               i32.load 2 12
 004505: 20 03                      |               local.get 3
 004507: 47                         |               i32.ne
 004508: 1a                         |               drop
 004509: 0b                         |             end
 00450a: 20 02                      |             local.get 2
 00450c: 20 05                      |             local.get 5
 00450e: 36 02 0c                   |             i32.store 2 12
 004511: 20 05                      |             local.get 5
 004513: 20 02                      |             local.get 2
 004515: 36 02 08                   |             i32.store 2 8
 004518: 0c 01                      |             br 1
 00451a: 0b                         |           end
 00451b: 02 40                      |           block
 00451d: 20 03                      |             local.get 3
 00451f: 41 14                      |             i32.const 20
 004521: 6a                         |             i32.add
 004522: 22 02                      |             local.tee 2
 004524: 28 02 00                   |             i32.load 2 0
 004527: 22 04                      |             local.tee 4
 004529: 0d 00                      |             br_if 0
 00452b: 20 03                      |             local.get 3
 00452d: 41 10                      |             i32.const 16
 00452f: 6a                         |             i32.add
 004530: 22 02                      |             local.tee 2
 004532: 28 02 00                   |             i32.load 2 0
 004535: 22 04                      |             local.tee 4
 004537: 0d 00                      |             br_if 0
 004539: 41 00                      |             i32.const 0
 00453b: 21 05                      |             local.set 5
 00453d: 0c 01                      |             br 1
 00453f: 0b                         |           end
 004540: 03 40                      |           loop
 004542: 20 02                      |             local.get 2
 004544: 21 06                      |             local.set 6
 004546: 20 04                      |             local.get 4
 004548: 22 05                      |             local.tee 5
 00454a: 41 14                      |             i32.const 20
 00454c: 6a                         |             i32.add
 00454d: 22 02                      |             local.tee 2
 00454f: 28 02 00                   |             i32.load 2 0
 004552: 22 04                      |             local.tee 4
 004554: 0d 00                      |             br_if 0
 004556: 20 05                      |             local.get 5
 004558: 41 10                      |             i32.const 16
 00455a: 6a                         |             i32.add
 00455b: 21 02                      |             local.set 2
 00455d: 20 05                      |             local.get 5
 00455f: 28 02 10                   |             i32.load 2 16
 004562: 22 04                      |             local.tee 4
 004564: 0d 00                      |             br_if 0
 004566: 0b                         |           end
 004567: 20 06                      |           local.get 6
 004569: 41 00                      |           i32.const 0
 00456b: 36 02 00                   |           i32.store 2 0
 00456e: 0b                         |         end
 00456f: 20 07                      |         local.get 7
 004571: 45                         |         i32.eqz
 004572: 0d 00                      |         br_if 0
 004574: 02 40                      |         block
 004576: 02 40                      |           block
 004578: 20 03                      |             local.get 3
 00457a: 28 02 1c                   |             i32.load 2 28
 00457d: 22 04                      |             local.tee 4
 00457f: 41 02                      |             i32.const 2
 004581: 74                         |             i32.shl
 004582: 41 dc 1a                   |             i32.const 3420
 004585: 6a                         |             i32.add
 004586: 22 02                      |             local.tee 2
 004588: 28 02 00                   |             i32.load 2 0
 00458b: 20 03                      |             local.get 3
 00458d: 47                         |             i32.ne
 00458e: 0d 00                      |             br_if 0
 004590: 20 02                      |             local.get 2
 004592: 20 05                      |             local.get 5
 004594: 36 02 00                   |             i32.store 2 0
 004597: 20 05                      |             local.get 5
 004599: 0d 01                      |             br_if 1
 00459b: 41 00                      |             i32.const 0
 00459d: 41 00                      |             i32.const 0
 00459f: 28 02 b0 18                |             i32.load 2 3120
 0045a3: 41 7e                      |             i32.const 4294967294
 0045a5: 20 04                      |             local.get 4
 0045a7: 77                         |             i32.rotl
 0045a8: 71                         |             i32.and
 0045a9: 36 02 b0 18                |             i32.store 2 3120
 0045ad: 0c 02                      |             br 2
 0045af: 0b                         |           end
 0045b0: 20 07                      |           local.get 7
 0045b2: 41 10                      |           i32.const 16
 0045b4: 41 14                      |           i32.const 20
 0045b6: 20 07                      |           local.get 7
 0045b8: 28 02 10                   |           i32.load 2 16
 0045bb: 20 03                      |           local.get 3
 0045bd: 46                         |           i32.eq
 0045be: 1b                         |           select
 0045bf: 6a                         |           i32.add
 0045c0: 20 05                      |           local.get 5
 0045c2: 36 02 00                   |           i32.store 2 0
 0045c5: 20 05                      |           local.get 5
 0045c7: 45                         |           i32.eqz
 0045c8: 0d 01                      |           br_if 1
 0045ca: 0b                         |         end
 0045cb: 20 05                      |         local.get 5
 0045cd: 20 07                      |         local.get 7
 0045cf: 36 02 18                   |         i32.store 2 24
 0045d2: 02 40                      |         block
 0045d4: 20 03                      |           local.get 3
 0045d6: 28 02 10                   |           i32.load 2 16
 0045d9: 22 02                      |           local.tee 2
 0045db: 45                         |           i32.eqz
 0045dc: 0d 00                      |           br_if 0
 0045de: 20 05                      |           local.get 5
 0045e0: 20 02                      |           local.get 2
 0045e2: 36 02 10                   |           i32.store 2 16
 0045e5: 20 02                      |           local.get 2
 0045e7: 20 05                      |           local.get 5
 0045e9: 36 02 18                   |           i32.store 2 24
 0045ec: 0b                         |         end
 0045ed: 20 03                      |         local.get 3
 0045ef: 28 02 14                   |         i32.load 2 20
 0045f2: 22 02                      |         local.tee 2
 0045f4: 45                         |         i32.eqz
 0045f5: 0d 00                      |         br_if 0
 0045f7: 20 05                      |         local.get 5
 0045f9: 41 14                      |         i32.const 20
 0045fb: 6a                         |         i32.add
 0045fc: 20 02                      |         local.get 2
 0045fe: 36 02 00                   |         i32.store 2 0
 004601: 20 02                      |         local.get 2
 004603: 20 05                      |         local.get 5
 004605: 36 02 18                   |         i32.store 2 24
 004608: 0b                         |       end
 004609: 20 01                      |       local.get 1
 00460b: 20 00                      |       local.get 0
 00460d: 41 01                      |       i32.const 1
 00460f: 72                         |       i32.or
 004610: 36 02 04                   |       i32.store 2 4
 004613: 20 01                      |       local.get 1
 004615: 20 00                      |       local.get 0
 004617: 6a                         |       i32.add
 004618: 20 00                      |       local.get 0
 00461a: 36 02 00                   |       i32.store 2 0
 00461d: 20 01                      |       local.get 1
 00461f: 41 00                      |       i32.const 0
 004621: 28 02 c0 18                |       i32.load 2 3136
 004625: 47                         |       i32.ne
 004626: 0d 01                      |       br_if 1
 004628: 41 00                      |       i32.const 0
 00462a: 20 00                      |       local.get 0
 00462c: 36 02 b4 18                |       i32.store 2 3124
 004630: 0f                         |       return
 004631: 0b                         |     end
 004632: 20 03                      |     local.get 3
 004634: 20 02                      |     local.get 2
 004636: 41 7e                      |     i32.const 4294967294
 004638: 71                         |     i32.and
 004639: 36 02 04                   |     i32.store 2 4
 00463c: 20 01                      |     local.get 1
 00463e: 20 00                      |     local.get 0
 004640: 41 01                      |     i32.const 1
 004642: 72                         |     i32.or
 004643: 36 02 04                   |     i32.store 2 4
 004646: 20 01                      |     local.get 1
 004648: 20 00                      |     local.get 0
 00464a: 6a                         |     i32.add
 00464b: 20 00                      |     local.get 0
 00464d: 36 02 00                   |     i32.store 2 0
 004650: 0b                         |   end
 004651: 02 40                      |   block
 004653: 20 00                      |     local.get 0
 004655: 41 ff 01                   |     i32.const 255
 004658: 4b                         |     i32.gt_u
 004659: 0d 00                      |     br_if 0
 00465b: 20 00                      |     local.get 0
 00465d: 41 03                      |     i32.const 3
 00465f: 76                         |     i32.shr_u
 004660: 22 02                      |     local.tee 2
 004662: 41 03                      |     i32.const 3
 004664: 74                         |     i32.shl
 004665: 41 d4 18                   |     i32.const 3156
 004668: 6a                         |     i32.add
 004669: 21 00                      |     local.set 0
 00466b: 02 40                      |     block
 00466d: 02 40                      |       block
 00466f: 41 00                      |         i32.const 0
 004671: 28 02 ac 18                |         i32.load 2 3116
 004675: 22 04                      |         local.tee 4
 004677: 41 01                      |         i32.const 1
 004679: 20 02                      |         local.get 2
 00467b: 74                         |         i32.shl
 00467c: 22 02                      |         local.tee 2
 00467e: 71                         |         i32.and
 00467f: 0d 00                      |         br_if 0
 004681: 41 00                      |         i32.const 0
 004683: 20 04                      |         local.get 4
 004685: 20 02                      |         local.get 2
 004687: 72                         |         i32.or
 004688: 36 02 ac 18                |         i32.store 2 3116
 00468c: 20 00                      |         local.get 0
 00468e: 21 02                      |         local.set 2
 004690: 0c 01                      |         br 1
 004692: 0b                         |       end
 004693: 20 00                      |       local.get 0
 004695: 28 02 08                   |       i32.load 2 8
 004698: 21 02                      |       local.set 2
 00469a: 0b                         |     end
 00469b: 20 00                      |     local.get 0
 00469d: 20 01                      |     local.get 1
 00469f: 36 02 08                   |     i32.store 2 8
 0046a2: 20 02                      |     local.get 2
 0046a4: 20 01                      |     local.get 1
 0046a6: 36 02 0c                   |     i32.store 2 12
 0046a9: 20 01                      |     local.get 1
 0046ab: 20 00                      |     local.get 0
 0046ad: 36 02 0c                   |     i32.store 2 12
 0046b0: 20 01                      |     local.get 1
 0046b2: 20 02                      |     local.get 2
 0046b4: 36 02 08                   |     i32.store 2 8
 0046b7: 0f                         |     return
 0046b8: 0b                         |   end
 0046b9: 41 00                      |   i32.const 0
 0046bb: 21 02                      |   local.set 2
 0046bd: 02 40                      |   block
 0046bf: 20 00                      |     local.get 0
 0046c1: 41 08                      |     i32.const 8
 0046c3: 76                         |     i32.shr_u
 0046c4: 22 04                      |     local.tee 4
 0046c6: 45                         |     i32.eqz
 0046c7: 0d 00                      |     br_if 0
 0046c9: 41 1f                      |     i32.const 31
 0046cb: 21 02                      |     local.set 2
 0046cd: 20 00                      |     local.get 0
 0046cf: 41 ff ff ff 07             |     i32.const 16777215
 0046d4: 4b                         |     i32.gt_u
 0046d5: 0d 00                      |     br_if 0
 0046d7: 20 04                      |     local.get 4
 0046d9: 20 04                      |     local.get 4
 0046db: 41 80 fe 3f                |     i32.const 1048320
 0046df: 6a                         |     i32.add
 0046e0: 41 10                      |     i32.const 16
 0046e2: 76                         |     i32.shr_u
 0046e3: 41 08                      |     i32.const 8
 0046e5: 71                         |     i32.and
 0046e6: 22 02                      |     local.tee 2
 0046e8: 74                         |     i32.shl
 0046e9: 22 04                      |     local.tee 4
 0046eb: 20 04                      |     local.get 4
 0046ed: 41 80 e0 1f                |     i32.const 520192
 0046f1: 6a                         |     i32.add
 0046f2: 41 10                      |     i32.const 16
 0046f4: 76                         |     i32.shr_u
 0046f5: 41 04                      |     i32.const 4
 0046f7: 71                         |     i32.and
 0046f8: 22 04                      |     local.tee 4
 0046fa: 74                         |     i32.shl
 0046fb: 22 05                      |     local.tee 5
 0046fd: 20 05                      |     local.get 5
 0046ff: 41 80 80 0f                |     i32.const 245760
 004703: 6a                         |     i32.add
 004704: 41 10                      |     i32.const 16
 004706: 76                         |     i32.shr_u
 004707: 41 02                      |     i32.const 2
 004709: 71                         |     i32.and
 00470a: 22 05                      |     local.tee 5
 00470c: 74                         |     i32.shl
 00470d: 41 0f                      |     i32.const 15
 00470f: 76                         |     i32.shr_u
 004710: 20 04                      |     local.get 4
 004712: 20 02                      |     local.get 2
 004714: 72                         |     i32.or
 004715: 20 05                      |     local.get 5
 004717: 72                         |     i32.or
 004718: 6b                         |     i32.sub
 004719: 22 02                      |     local.tee 2
 00471b: 41 01                      |     i32.const 1
 00471d: 74                         |     i32.shl
 00471e: 20 00                      |     local.get 0
 004720: 20 02                      |     local.get 2
 004722: 41 15                      |     i32.const 21
 004724: 6a                         |     i32.add
 004725: 76                         |     i32.shr_u
 004726: 41 01                      |     i32.const 1
 004728: 71                         |     i32.and
 004729: 72                         |     i32.or
 00472a: 41 1c                      |     i32.const 28
 00472c: 6a                         |     i32.add
 00472d: 21 02                      |     local.set 2
 00472f: 0b                         |   end
 004730: 20 01                      |   local.get 1
 004732: 42 00                      |   i64.const 0
 004734: 37 02 10                   |   i64.store 2 16
 004737: 20 01                      |   local.get 1
 004739: 41 1c                      |   i32.const 28
 00473b: 6a                         |   i32.add
 00473c: 20 02                      |   local.get 2
 00473e: 36 02 00                   |   i32.store 2 0
 004741: 20 02                      |   local.get 2
 004743: 41 02                      |   i32.const 2
 004745: 74                         |   i32.shl
 004746: 41 dc 1a                   |   i32.const 3420
 004749: 6a                         |   i32.add
 00474a: 21 04                      |   local.set 4
 00474c: 02 40                      |   block
 00474e: 02 40                      |     block
 004750: 41 00                      |       i32.const 0
 004752: 28 02 b0 18                |       i32.load 2 3120
 004756: 22 05                      |       local.tee 5
 004758: 41 01                      |       i32.const 1
 00475a: 20 02                      |       local.get 2
 00475c: 74                         |       i32.shl
 00475d: 22 03                      |       local.tee 3
 00475f: 71                         |       i32.and
 004760: 0d 00                      |       br_if 0
 004762: 41 00                      |       i32.const 0
 004764: 20 05                      |       local.get 5
 004766: 20 03                      |       local.get 3
 004768: 72                         |       i32.or
 004769: 36 02 b0 18                |       i32.store 2 3120
 00476d: 20 04                      |       local.get 4
 00476f: 20 01                      |       local.get 1
 004771: 36 02 00                   |       i32.store 2 0
 004774: 20 01                      |       local.get 1
 004776: 20 01                      |       local.get 1
 004778: 36 02 0c                   |       i32.store 2 12
 00477b: 20 01                      |       local.get 1
 00477d: 41 18                      |       i32.const 24
 00477f: 6a                         |       i32.add
 004780: 20 04                      |       local.get 4
 004782: 36 02 00                   |       i32.store 2 0
 004785: 20 01                      |       local.get 1
 004787: 20 01                      |       local.get 1
 004789: 36 02 08                   |       i32.store 2 8
 00478c: 0c 01                      |       br 1
 00478e: 0b                         |     end
 00478f: 20 00                      |     local.get 0
 004791: 41 00                      |     i32.const 0
 004793: 41 19                      |     i32.const 25
 004795: 20 02                      |     local.get 2
 004797: 41 01                      |     i32.const 1
 004799: 76                         |     i32.shr_u
 00479a: 6b                         |     i32.sub
 00479b: 20 02                      |     local.get 2
 00479d: 41 1f                      |     i32.const 31
 00479f: 46                         |     i32.eq
 0047a0: 1b                         |     select
 0047a1: 74                         |     i32.shl
 0047a2: 21 02                      |     local.set 2
 0047a4: 20 04                      |     local.get 4
 0047a6: 28 02 00                   |     i32.load 2 0
 0047a9: 21 05                      |     local.set 5
 0047ab: 02 40                      |     block
 0047ad: 03 40                      |       loop
 0047af: 20 05                      |         local.get 5
 0047b1: 22 04                      |         local.tee 4
 0047b3: 28 02 04                   |         i32.load 2 4
 0047b6: 41 78                      |         i32.const 4294967288
 0047b8: 71                         |         i32.and
 0047b9: 20 00                      |         local.get 0
 0047bb: 46                         |         i32.eq
 0047bc: 0d 01                      |         br_if 1
 0047be: 20 02                      |         local.get 2
 0047c0: 41 1d                      |         i32.const 29
 0047c2: 76                         |         i32.shr_u
 0047c3: 21 05                      |         local.set 5
 0047c5: 20 02                      |         local.get 2
 0047c7: 41 01                      |         i32.const 1
 0047c9: 74                         |         i32.shl
 0047ca: 21 02                      |         local.set 2
 0047cc: 20 04                      |         local.get 4
 0047ce: 20 05                      |         local.get 5
 0047d0: 41 04                      |         i32.const 4
 0047d2: 71                         |         i32.and
 0047d3: 6a                         |         i32.add
 0047d4: 41 10                      |         i32.const 16
 0047d6: 6a                         |         i32.add
 0047d7: 22 03                      |         local.tee 3
 0047d9: 28 02 00                   |         i32.load 2 0
 0047dc: 22 05                      |         local.tee 5
 0047de: 0d 00                      |         br_if 0
 0047e0: 0b                         |       end
 0047e1: 20 03                      |       local.get 3
 0047e3: 20 01                      |       local.get 1
 0047e5: 36 02 00                   |       i32.store 2 0
 0047e8: 20 01                      |       local.get 1
 0047ea: 20 01                      |       local.get 1
 0047ec: 36 02 0c                   |       i32.store 2 12
 0047ef: 20 01                      |       local.get 1
 0047f1: 41 18                      |       i32.const 24
 0047f3: 6a                         |       i32.add
 0047f4: 20 04                      |       local.get 4
 0047f6: 36 02 00                   |       i32.store 2 0
 0047f9: 20 01                      |       local.get 1
 0047fb: 20 01                      |       local.get 1
 0047fd: 36 02 08                   |       i32.store 2 8
 004800: 0c 01                      |       br 1
 004802: 0b                         |     end
 004803: 20 04                      |     local.get 4
 004805: 28 02 08                   |     i32.load 2 8
 004808: 22 00                      |     local.tee 0
 00480a: 20 01                      |     local.get 1
 00480c: 36 02 0c                   |     i32.store 2 12
 00480f: 20 04                      |     local.get 4
 004811: 20 01                      |     local.get 1
 004813: 36 02 08                   |     i32.store 2 8
 004816: 20 01                      |     local.get 1
 004818: 41 18                      |     i32.const 24
 00481a: 6a                         |     i32.add
 00481b: 41 00                      |     i32.const 0
 00481d: 36 02 00                   |     i32.store 2 0
 004820: 20 01                      |     local.get 1
 004822: 20 04                      |     local.get 4
 004824: 36 02 0c                   |     i32.store 2 12
 004827: 20 01                      |     local.get 1
 004829: 20 00                      |     local.get 0
 00482b: 36 02 08                   |     i32.store 2 8
 00482e: 0b                         |   end
 00482f: 41 00                      |   i32.const 0
 004831: 41 00                      |   i32.const 0
 004833: 28 02 cc 18                |   i32.load 2 3148
 004837: 41 7f                      |   i32.const 4294967295
 004839: 6a                         |   i32.add
 00483a: 22 01                      |   local.tee 1
 00483c: 36 02 cc 18                |   i32.store 2 3148
 004840: 20 01                      |   local.get 1
 004842: 0d 00                      |   br_if 0
 004844: 41 f4 1b                   |   i32.const 3572
 004847: 21 01                      |   local.set 1
 004849: 03 40                      |   loop
 00484b: 20 01                      |     local.get 1
 00484d: 28 02 00                   |     i32.load 2 0
 004850: 22 00                      |     local.tee 0
 004852: 41 08                      |     i32.const 8
 004854: 6a                         |     i32.add
 004855: 21 01                      |     local.set 1
 004857: 20 00                      |     local.get 0
 004859: 0d 00                      |     br_if 0
 00485b: 0b                         |   end
 00485c: 41 00                      |   i32.const 0
 00485e: 41 7f                      |   i32.const 4294967295
 004860: 36 02 cc 18                |   i32.store 2 3148
 004864: 0b                         | end
 004865: 0b                         | end
004867 func[52] <setThrew>:
 004868: 02 40                      | block
 00486a: 41 00                      |   i32.const 0
 00486c: 28 02 9c 1c                |   i32.load 2 3612
 004870: 0d 00                      |   br_if 0
 004872: 41 00                      |   i32.const 0
 004874: 20 01                      |   local.get 1
 004876: 36 02 a0 1c                |   i32.store 2 3616
 00487a: 41 00                      |   i32.const 0
 00487c: 20 00                      |   local.get 0
 00487e: 36 02 9c 1c                |   i32.store 2 3612
 004882: 0b                         | end
 004883: 0b                         | end
004886 func[53] <fflush>:
 004887: 02 7f                      | local[0..1] type=i32
 004889: 02 40                      | block
 00488b: 02 40                      |   block
 00488d: 20 00                      |     local.get 0
 00488f: 45                         |     i32.eqz
 004890: 0d 00                      |     br_if 0
 004892: 02 40                      |     block
 004894: 20 00                      |       local.get 0
 004896: 28 02 4c                   |       i32.load 2 76
 004899: 41 7f                      |       i32.const 4294967295
 00489b: 4a                         |       i32.gt_s
 00489c: 0d 00                      |       br_if 0
 00489e: 20 00                      |       local.get 0
 0048a0: 10 36                      |       call 54
 0048a2: 0f                         |       return
 0048a3: 0b                         |     end
 0048a4: 20 00                      |     local.get 0
 0048a6: 10 09                      |     call 9
 0048a8: 21 01                      |     local.set 1
 0048aa: 20 00                      |     local.get 0
 0048ac: 10 36                      |     call 54
 0048ae: 21 02                      |     local.set 2
 0048b0: 20 01                      |     local.get 1
 0048b2: 45                         |     i32.eqz
 0048b3: 0d 01                      |     br_if 1
 0048b5: 20 00                      |     local.get 0
 0048b7: 10 0a                      |     call 10
 0048b9: 20 02                      |     local.get 2
 0048bb: 0f                         |     return
 0048bc: 0b                         |   end
 0048bd: 41 00                      |   i32.const 0
 0048bf: 21 02                      |   local.set 2
 0048c1: 02 40                      |   block
 0048c3: 41 00                      |     i32.const 0
 0048c5: 28 02 c0 0d                |     i32.load 2 1728
 0048c9: 45                         |     i32.eqz
 0048ca: 0d 00                      |     br_if 0
 0048cc: 41 00                      |     i32.const 0
 0048ce: 28 02 c0 0d                |     i32.load 2 1728
 0048d2: 10 35                      |     call 53 <fflush>
 0048d4: 21 02                      |     local.set 2
 0048d6: 0b                         |   end
 0048d7: 02 40                      |   block
 0048d9: 10 18                      |     call 24
 0048db: 28 02 00                   |     i32.load 2 0
 0048de: 22 00                      |     local.tee 0
 0048e0: 45                         |     i32.eqz
 0048e1: 0d 00                      |     br_if 0
 0048e3: 03 40                      |     loop
 0048e5: 41 00                      |       i32.const 0
 0048e7: 21 01                      |       local.set 1
 0048e9: 02 40                      |       block
 0048eb: 20 00                      |         local.get 0
 0048ed: 28 02 4c                   |         i32.load 2 76
 0048f0: 41 00                      |         i32.const 0
 0048f2: 48                         |         i32.lt_s
 0048f3: 0d 00                      |         br_if 0
 0048f5: 20 00                      |         local.get 0
 0048f7: 10 09                      |         call 9
 0048f9: 21 01                      |         local.set 1
 0048fb: 0b                         |       end
 0048fc: 02 40                      |       block
 0048fe: 20 00                      |         local.get 0
 004900: 28 02 14                   |         i32.load 2 20
 004903: 20 00                      |         local.get 0
 004905: 28 02 1c                   |         i32.load 2 28
 004908: 4d                         |         i32.le_u
 004909: 0d 00                      |         br_if 0
 00490b: 20 00                      |         local.get 0
 00490d: 10 36                      |         call 54
 00490f: 20 02                      |         local.get 2
 004911: 72                         |         i32.or
 004912: 21 02                      |         local.set 2
 004914: 0b                         |       end
 004915: 02 40                      |       block
 004917: 20 01                      |         local.get 1
 004919: 45                         |         i32.eqz
 00491a: 0d 00                      |         br_if 0
 00491c: 20 00                      |         local.get 0
 00491e: 10 0a                      |         call 10
 004920: 0b                         |       end
 004921: 20 00                      |       local.get 0
 004923: 28 02 38                   |       i32.load 2 56
 004926: 22 00                      |       local.tee 0
 004928: 0d 00                      |       br_if 0
 00492a: 0b                         |     end
 00492b: 0b                         |   end
 00492c: 10 19                      |   call 25
 00492e: 0b                         | end
 00492f: 20 02                      | local.get 2
 004931: 0b                         | end
004933 func[54]:
 004934: 02 7f                      | local[0..1] type=i32
 004936: 02 40                      | block
 004938: 20 00                      |   local.get 0
 00493a: 28 02 14                   |   i32.load 2 20
 00493d: 20 00                      |   local.get 0
 00493f: 28 02 1c                   |   i32.load 2 28
 004942: 4d                         |   i32.le_u
 004943: 0d 00                      |   br_if 0
 004945: 20 00                      |   local.get 0
 004947: 41 00                      |   i32.const 0
 004949: 41 00                      |   i32.const 0
 00494b: 20 00                      |   local.get 0
 00494d: 28 02 24                   |   i32.load 2 36
 004950: 11 00 00                   |   call_indirect 0 0
 004953: 1a                         |   drop
 004954: 20 00                      |   local.get 0
 004956: 28 02 14                   |   i32.load 2 20
 004959: 0d 00                      |   br_if 0
 00495b: 41 7f                      |   i32.const 4294967295
 00495d: 0f                         |   return
 00495e: 0b                         | end
 00495f: 02 40                      | block
 004961: 20 00                      |   local.get 0
 004963: 28 02 04                   |   i32.load 2 4
 004966: 22 01                      |   local.tee 1
 004968: 20 00                      |   local.get 0
 00496a: 28 02 08                   |   i32.load 2 8
 00496d: 22 02                      |   local.tee 2
 00496f: 4f                         |   i32.ge_u
 004970: 0d 00                      |   br_if 0
 004972: 20 00                      |   local.get 0
 004974: 20 01                      |   local.get 1
 004976: 20 02                      |   local.get 2
 004978: 6b                         |   i32.sub
 004979: ac                         |   i64.extend_i32_s
 00497a: 41 01                      |   i32.const 1
 00497c: 20 00                      |   local.get 0
 00497e: 28 02 28                   |   i32.load 2 40
 004981: 11 03 00                   |   call_indirect 3 0
 004984: 1a                         |   drop
 004985: 0b                         | end
 004986: 20 00                      | local.get 0
 004988: 41 00                      | i32.const 0
 00498a: 36 02 1c                   | i32.store 2 28
 00498d: 20 00                      | local.get 0
 00498f: 42 00                      | i64.const 0
 004991: 37 03 10                   | i64.store 3 16
 004994: 20 00                      | local.get 0
 004996: 42 00                      | i64.const 0
 004998: 37 02 04                   | i64.store 2 4
 00499b: 41 00                      | i32.const 0
 00499d: 0b                         | end
00499f func[55] <stackSave>:
 0049a0: 23 00                      | global.get 0
 0049a2: 0b                         | end
0049a4 func[56] <stackAlloc>:
 0049a5: 01 7f                      | local[0] type=i32
 0049a7: 23 00                      | global.get 0
 0049a9: 20 00                      | local.get 0
 0049ab: 6b                         | i32.sub
 0049ac: 41 70                      | i32.const 4294967280
 0049ae: 71                         | i32.and
 0049af: 22 01                      | local.tee 1
 0049b1: 24 00                      | global.set 0
 0049b3: 20 01                      | local.get 1
 0049b5: 0b                         | end
0049b7 func[57] <stackRestore>:
 0049b8: 20 00                      | local.get 0
 0049ba: 24 00                      | global.set 0
 0049bc: 0b                         | end
0049be func[58] <__growWasmMemory>:
 0049bf: 20 00                      | local.get 0
 0049c1: 40 00                      | memory.grow 0
 0049c3: 0b                         | end
