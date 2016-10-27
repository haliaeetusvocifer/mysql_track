/*
What do different columns in the output of EXPLAIN mean? What possible values can
those have? What is the meaning of those values?
*/



The EXPLAIN statement provides information about the execution plan for a SELECT statement.
  Each output row from EXPLAIN provides information about one table.


  EXPLAIN SELECT * FROM table_name;


    The possible values are: 


      id :  This is a  sequential identifier for each SELECT within the query, 

      select_type :  The type of SELECT, which can be any of these values SIMPLE, PRIMARY, DERIVED, SUBQUERY, DEPENDENT SUBQUERY,
                     UNCACHEABLE SUBQUERY, UNION, DEPENDENT UNION, UNION RESULT

      table: The name of the table to which the row of output refers,

      type: How Mysql joins the table in use. It indicate missing indexes or how the query should be considered. Values are: SYSTEM, CONST, REF, 
                                              REF_OR_NULL, INDEX_MERGE, UNIQUE_SUBQUERY, INDEX_SUBQUERY, RANGE, INDEX, ALL

      possible_keys : Shows the keys that can be used by MYSQL to find rows from table,

      Key : Indicates the actual index used by MYSQL,

      key_len : Indicates the length of the index the QUery optimizer chose to use.

      ref : Shows the columns or constants that are compared to the index name in the key column.

      rows : list the number of records that were examined to produce the output.

      extra : contains additional information regarding the query execution plan. 



/*
The value under 'rows' column in the output of EXPLAIN query and SELECT query
after it are same. What does it mean?
*/


  This tell us that a total of 1002345 rows were examined to give us the result of our query




/*
Is the SELECT query optimal? If no, how do we optimize it?
*/

  No
   We can optimize the SELECT query by making use of index(es)
   We optimize the select query by indexing user_id





/*
EXPLAIN a SELECT query against one of your databases which employs an INNER
JOIN between two tables. What does the output look like? What do the values
under different columns mean? Do you get only one row in EXPLAIN's output?
*/


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




/*
Form the same select query in above question using a subquery instead of a
JOIN. What does the EXPLAIN output look like now? Which query is better and
why?
*/




/*SUBQUERY*/

  EXPLAIN SELECT comments.article, comment 
  FROM comments, articles   
    WHERE (
      comments.article = articles.article
    ) ORDER BY articles.article;



+----+-------------+----------+------+---------------+------+---------+------+------+----------------------------------------------------+
| id | select_type | table    | type | possible_keys | key  | key_len | ref  | rows | Extra                                              |
+----+-------------+----------+------+---------------+------+---------+------+------+----------------------------------------------------+
|  1 | SIMPLE      | comments | ALL  | NULL          | NULL | NULL    | NULL |    5 | Using temporary; Using filesort                    |
|  1 | SIMPLE      | articles | ALL  | NULL          | NULL | NULL    | NULL |    5 | Using where; Using join buffer (Block Nested Loop) |
+----+-------------+----------+------+---------------+------+---------+------+------+----------------------------------------------------+


The outputs are the same as seen above table










