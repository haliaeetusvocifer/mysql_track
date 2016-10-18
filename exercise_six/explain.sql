
The EXPLAIN statement provides information about the execution plan for a SELECT statement.
  Each output row from EXPLAIN provides information about one table.


  EXPLAIN SELECT * FROM table_name;


    The possible values are: 

      id (The SELECT identifier), 

      select_type (The type of SELECT, which can be any of SIMPLE, PRIMARY, UNION, SUBQUERY, etc),

      table (The name of the table to which the row of output refers),

      type, 

      possible_keys (The possible_keys column indicates which indexes MySQL can choose from use to find the rows in this table), 

      key, key_len, filtered, extra



  The output of rows using "EXPLAIN SELECT * FROM comments WHERE user_id = 41;" and "SELECT count(id) FROM comments;"
    are the same because the EXPLAIN listed the number of records that were examined to produce the output and the latter 
    counts the number of records.



Is the SELECT query optimal? If no, how do we optimize it?

   We can optimize the SELECT query by: tighten the Schema, use of index(es), avoid overuse of primary keys








/*INNER JOIN*/
    EXPLAIN SELECT articles.article, comments.comment

      FROM articles INNER JOIN comments

      ON articles.article = comments.article 

      ORDER BY articles.article;


  +----+-------------+----------+------+---------------+------+---------+------+------+----------------------------------------------------+
| id | select_type | table    | type | possible_keys | key  | key_len | ref  | rows | Extra                                              |
+----+-------------+----------+------+---------------+------+---------+------+------+----------------------------------------------------+
|  1 | SIMPLE      | articles | ALL  | NULL          | NULL | NULL    | NULL |    5 | Using temporary; Using filesort                    |
|  1 | SIMPLE      | comments | ALL  | NULL          | NULL | NULL    | NULL |    5 | Using where; Using join buffer (Block Nested Loop) |
+----+-------------+----------+------+---------------+------+---------+------+------+----------------------------------------------------+



/*SUBQUERY*/

  EXPLAIN SELECT comments.article, comment FROM comments, articles   

    WHERE (comments.article=articles.article)
    ORDER BY articles.article;



+----+-------------+----------+------+---------------+------+---------+------+------+----------------------------------------------------+
| id | select_type | table    | type | possible_keys | key  | key_len | ref  | rows | Extra                                              |
+----+-------------+----------+------+---------------+------+---------+------+------+----------------------------------------------------+
|  1 | SIMPLE      | comments | ALL  | NULL          | NULL | NULL    | NULL |    5 | Using temporary; Using filesort                    |
|  1 | SIMPLE      | articles | ALL  | NULL          | NULL | NULL    | NULL |    5 | Using where; Using join buffer (Block Nested Loop) |
+----+-------------+----------+------+---------------+------+---------+------+------+----------------------------------------------------+


The outputs are the same as seen above table










