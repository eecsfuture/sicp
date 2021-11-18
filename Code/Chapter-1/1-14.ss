The tree illustration can be as given below. The order of value of coins have been reversed inorder to reduce the size of the diagram. 
As said in the section 1.2.2, order of coins does not matter. So the resultant procedure will be as given below.

                                 11 => 50 25 10 5 1
                                       4|0
                             +----------+---------+
                             |                    |
                        11 => 25 10 5 1      -39 => 50 25 10 5 1
                            4|0
                    +--------+-------+
                    |                |
               11 => 10 5 1    -14 => 25 10 5 1
                   3|1
            +-------+--------------------------------------+
            |                                              |
      11 => 5 1                                       1=> 10 5 1
           1|2                                            1|0
    +-------+-------+                                 +----+---------+
    |               |                                 |              |
 11=> 1          6 => 5 1                           1=> 5 1      -9 => 10 5 1
                   1|1                               1|0
           +--------+----+                      +-----+---+
           |             |                      |         |
        6 => 1        1 => 5 1               1 => 1     -4=> 5 1
                        1|0
                    +----+----+
                    |         |
                1 => 1     -4=> 5 1

Time Complexity:  O(n^5) 
Space Complexity: O(n)

http://community.schemewiki.org/?sicp-ex-1.14
https://www.ysagade.nl/2015/04/12/sicp-change-growth/