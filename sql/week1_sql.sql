{\rtf1\ansi\ansicpg1251\cocoartf2868
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fnil\fcharset0 Menlo-Bold;\f2\fnil\fcharset0 Menlo-Italic;
}
{\colortbl;\red255\green255\blue255;\red102\green151\blue104;\red115\green158\blue202;\red204\green204\blue204;
\red0\green184\blue184;\red183\green136\blue211;\red238\green204\blue100;\red202\green197\blue128;\red192\green192\blue192;
\red193\green170\blue108;\red158\green158\blue158;}
{\*\expandedcolortbl;;\csgenericrgb\c40000\c59216\c40784;\csgenericrgb\c45098\c61961\c79216;\csgenericrgb\c80000\c80000\c80000;
\csgenericrgb\c0\c72157\c72157;\csgenericrgb\c71765\c53333\c82745;\csgenericrgb\c93333\c80000\c39216;\csgenericrgb\c79216\c77255\c50196;\csgenericrgb\c75294\c75294\c75294;
\csgenericrgb\c75686\c66667\c42353;\csgenericrgb\c61961\c61961\c61961;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 -- Week 1 SQL Practice \'97 dvdrental database\cf0 \
\cf2 -- Topics: SELECT, WHERE, GROUP BY, JOIN,\cf0 \
\cf2 --         Subqueries, CTE, Window Functions\cf0 \
\cf2 -- Author: slk\cf0 \
\
\
\
\cf2 -- BLOCK 1: SELECT, WHERE, ORDER BY, LIMIT\cf0 \
\
\cf2 -- All films sorted by rental rate\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 title\cf4 , \cf5 rental_rate\cf4 , \cf5 rating\cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 film\cf0 \

\f1\b \cf3 ORDER
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 rental_rate\cf4  
\f1\b \cf3 DESC
\f0\b0 \cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Films with rating 'R' longer than 100 minutes\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 title\cf4 , \cf5 rating\cf4 , \cf5 length\cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 film\cf0 \

\f1\b \cf3 WHERE
\f0\b0 \cf4  \cf5 rating\cf4  = \cf8 'R'\cf4  
\f1\b \cf3 AND
\f0\b0 \cf4  \cf5 length\cf4  > \cf9 100\cf0 \

\f1\b \cf3 ORDER
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 length\cf4  
\f1\b \cf3 DESC
\f0\b0 \cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Films containing 'Dragon' in title\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 title\cf4 , \cf5 rating\cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 film\cf0 \

\f1\b \cf3 WHERE
\f0\b0 \cf4  \cf5 title\cf4  
\f1\b \cf3 LIKE
\f0\b0 \cf4  \cf8 '%Dragon%'\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Films with rental rate 0.99\'962.99 and length > 120 min\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 title\cf4 , \cf5 rental_rate\cf4 , \cf5 length\cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 film\cf0 \

\f1\b \cf3 WHERE
\f0\b0 \cf4  \cf5 rental_rate\cf4  
\f1\b \cf3 BETWEEN
\f0\b0 \cf4  \cf9 0.99\cf4  
\f1\b \cf3 AND
\f0\b0 \cf4  \cf9 2.99\cf0 \
\pard\pardeftab720\partightenfactor0
\cf4   
\f1\b \cf3 AND
\f0\b0 \cf4  \cf5 length\cf4  > \cf9 120\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 ORDER
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 rental_rate\cf4  
\f1\b \cf3 DESC
\f0\b0 \cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Customers with no email (IS NULL)\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 first_name\cf4 , \cf5 last_name\cf4 , \cf5 email\cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 customer\cf0 \

\f1\b \cf3 WHERE
\f0\b0 \cf4  \cf5 email\cf4  
\f1\b \cf3 IS
\f0\b0 \cf4  
\f1\b \cf3 NULL
\f0\b0 \cf7 ;\cf0 \
\
\
\pard\pardeftab720\partightenfactor0
\cf2 -- BLOCK 2: GROUP BY, HAVING, Aggregates\cf0 \
\
\
\cf2 -- Count of films per rating\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 rating\cf4 , 
\f1\b \cf10 COUNT
\f0\b0 \cf4 (*) 
\f1\b \cf3 AS
\f0\b0 \cf4  \cf11 \uc0\u1082 \u1086 \u1083 \u1080 \u1095 \u1077 \u1089 \u1090 \u1074 \u1086 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 film\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 rating\cf0 \

\f1\b \cf3 ORDER
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf11 \uc0\u1082 \u1086 \u1083 \u1080 \u1095 \u1077 \u1089 \u1090 \u1074 \u1086 \cf4  
\f1\b \cf3 DESC
\f0\b0 \cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Average rental rate per rating (only > 3.00)\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 rating\cf4 , 
\f1\b \cf10 AVG
\f0\b0 \cf4 (\cf5 rental_rate\cf4 ) 
\f1\b \cf3 AS
\f0\b0 \cf4  \cf11 \uc0\u1089 \u1088 \u1077 \u1076 \u1085 \u1103 \u1103 _\u1094 \u1077 \u1085 \u1072 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 film\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 rating\cf0 \

\f1\b \cf3 HAVING
\f0\b0 \cf4  
\f1\b \cf10 AVG
\f0\b0 \cf4 (\cf5 rental_rate\cf4 ) > \cf9 3.00\cf0 \

\f1\b \cf3 ORDER
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf11 \uc0\u1089 \u1088 \u1077 \u1076 \u1085 \u1103 \u1103 _\u1094 \u1077 \u1085 \u1072 \cf4  
\f1\b \cf3 DESC
\f0\b0 \cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Number of payments per customer\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 customer_id\cf4 , 
\f1\b \cf10 COUNT
\f0\b0 \cf4 (*) 
\f1\b \cf3 AS
\f0\b0 \cf4  
\f2\i \cf5 total_payments
\f0\i0 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 payment\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 customer_id\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Total amount per customer\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 customer_id\cf4 , 
\f1\b \cf10 SUM
\f0\b0 \cf4 (\cf5 amount\cf4 ) 
\f1\b \cf3 AS
\f0\b0 \cf4  
\f2\i \cf5 total_amount
\f0\i0 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 payment\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 customer_id\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Average payment per customer\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 customer_id\cf4 , 
\f1\b \cf10 AVG
\f0\b0 \cf4 (\cf5 amount\cf4 ) 
\f1\b \cf3 AS
\f0\b0 \cf4  
\f2\i \cf5 avg_amount
\f0\i0 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 payment\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 customer_id\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Customers with total payments > 100\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 customer_id\cf4 , 
\f1\b \cf10 SUM
\f0\b0 \cf4 (\cf5 amount\cf4 ) 
\f1\b \cf3 AS
\f0\b0 \cf4  
\f2\i \cf5 total
\f0\i0 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 payment\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 customer_id\cf0 \

\f1\b \cf3 HAVING
\f0\b0 \cf4  
\f1\b \cf10 SUM
\f0\b0 \cf4 (\cf5 amount\cf4 ) > \cf9 100\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Customers with average payment > 4\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 customer_id\cf4 , 
\f1\b \cf10 AVG
\f0\b0 \cf4 (\cf5 amount\cf4 ) 
\f1\b \cf3 AS
\f0\b0 \cf4  
\f2\i \cf5 avg_payment
\f0\i0 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 payment\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 customer_id\cf0 \

\f1\b \cf3 HAVING
\f0\b0 \cf4  
\f1\b \cf10 AVG
\f0\b0 \cf4 (\cf5 amount\cf4 ) > \cf9 4\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Customers with more than 35 payments\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 customer_id\cf4 , 
\f1\b \cf10 COUNT
\f0\b0 \cf4 (*) 
\f1\b \cf3 AS
\f0\b0 \cf4  
\f2\i \cf5 payment_count
\f0\i0 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 payment\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 customer_id\cf0 \

\f1\b \cf3 HAVING
\f0\b0 \cf4  
\f1\b \cf10 COUNT
\f0\b0 \cf4 (*) > \cf9 35\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Customers: total > 150 AND average > 5\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 customer_id\cf4 , 
\f1\b \cf10 SUM
\f0\b0 \cf4 (\cf5 amount\cf4 ) 
\f1\b \cf3 AS
\f0\b0 \cf4  
\f2\i \cf5 total
\f0\i0 \cf4 , 
\f1\b \cf10 AVG
\f0\b0 \cf4 (\cf5 amount\cf4 ) 
\f1\b \cf3 AS
\f0\b0 \cf4  
\f2\i \cf5 avg_payment
\f0\i0 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 payment\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 customer_id\cf0 \

\f1\b \cf3 HAVING
\f0\b0 \cf4  
\f1\b \cf10 SUM
\f0\b0 \cf4 (\cf5 amount\cf4 ) > \cf9 150\cf4  
\f1\b \cf3 AND
\f0\b0 \cf4  
\f1\b \cf10 AVG
\f0\b0 \cf4 (\cf5 amount\cf4 ) > \cf9 5\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Customers: min payment < 1 AND max payment > 8\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 customer_id\cf4 , 
\f1\b \cf10 MIN
\f0\b0 \cf4 (\cf5 amount\cf4 ) 
\f1\b \cf3 AS
\f0\b0 \cf4  
\f2\i \cf5 min_pay
\f0\i0 \cf4 , 
\f1\b \cf10 MAX
\f0\b0 \cf4 (\cf5 amount\cf4 ) 
\f1\b \cf3 AS
\f0\b0 \cf4  
\f2\i \cf5 max_pay
\f0\i0 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 payment\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 customer_id\cf0 \

\f1\b \cf3 HAVING
\f0\b0 \cf4  
\f1\b \cf10 MIN
\f0\b0 \cf4 (\cf5 amount\cf4 ) < \cf9 1\cf4  
\f1\b \cf3 AND
\f0\b0 \cf4  
\f1\b \cf10 MAX
\f0\b0 \cf4 (\cf5 amount\cf4 ) > \cf9 8\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Sum of payments > 7 per customer\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 customer_id\cf4 , 
\f1\b \cf10 SUM
\f0\b0 \cf4 (\cf5 amount\cf4 ) 
\f1\b \cf3 AS
\f0\b0 \cf4  
\f2\i \cf5 total
\f0\i0 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 payment\cf0 \

\f1\b \cf3 WHERE
\f0\b0 \cf4  \cf5 amount\cf4  > \cf9 7\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf5 customer_id\cf7 ;\cf0 \
\
\
\pard\pardeftab720\partightenfactor0
\cf2 -- BLOCK 3: JOIN\cf0 \
\
\
\cf2 -- Customer name + rental date (INNER JOIN)\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 first_name\cf4 , 
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 last_name\cf4 , 
\f2\i \cf6 r
\f0\i0 \cf4 .\cf5 rental_date\cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 customer\cf4  
\f2\i \cf6 c
\f0\i0 \cf0 \

\f1\b \cf3 JOIN
\f0\b0 \cf4  \cf6 rental\cf4  
\f2\i \cf6 r
\f0\i0 \cf4  
\f1\b \cf3 ON
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 customer_id\cf4  = 
\f2\i \cf6 r
\f0\i0 \cf4 .\cf5 customer_id\cf0 \

\f1\b \cf3 LIMIT
\f0\b0 \cf4  \cf9 10\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Total rentals count (INNER JOIN)\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  
\f1\b \cf10 COUNT
\f0\b0 \cf4 (*)\cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 customer\cf4  
\f2\i \cf6 c
\f0\i0 \cf0 \

\f1\b \cf3 JOIN
\f0\b0 \cf4  \cf6 rental\cf4  
\f2\i \cf6 r
\f0\i0 \cf4  
\f1\b \cf3 ON
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 customer_id\cf4  = 
\f2\i \cf6 r
\f0\i0 \cf4 .\cf5 customer_id\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Top 10 payments with customer name\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 first_name\cf4 , 
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 last_name\cf4 , 
\f2\i \cf6 p
\f0\i0 \cf4 .\cf5 amount\cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 payment\cf4  
\f2\i \cf6 p
\f0\i0 \cf0 \

\f1\b \cf3 JOIN
\f0\b0 \cf4  \cf6 customer\cf4  
\f2\i \cf6 c
\f0\i0 \cf4  
\f1\b \cf3 ON
\f0\b0 \cf4  
\f2\i \cf6 p
\f0\i0 \cf4 .\cf5 customer_id\cf4  = 
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 customer_id\cf0 \

\f1\b \cf3 ORDER
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  
\f2\i \cf6 p
\f0\i0 \cf4 .\cf5 amount\cf4  
\f1\b \cf3 DESC
\f0\b0 \cf0 \

\f1\b \cf3 LIMIT
\f0\b0 \cf4  \cf9 10\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Top 10 most rented films (3 tables)\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  
\f2\i \cf6 f
\f0\i0 \cf4 .\cf5 title\cf4 , 
\f1\b \cf10 COUNT
\f0\b0 \cf4 (*) 
\f1\b \cf3 AS
\f0\b0 \cf4  \cf11 \uc0\u1082 \u1086 \u1083 \u1080 \u1095 \u1077 \u1089 \u1090 \u1074 \u1086 _\u1072 \u1088 \u1077 \u1085 \u1076 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 rental\cf4  
\f2\i \cf6 r
\f0\i0 \cf0 \

\f1\b \cf3 JOIN
\f0\b0 \cf4  \cf6 inventory\cf4  
\f2\i \cf6 i
\f0\i0 \cf4  
\f1\b \cf3 ON
\f0\b0 \cf4  
\f2\i \cf6 r
\f0\i0 \cf4 .\cf5 inventory_id\cf4  = 
\f2\i \cf6 i
\f0\i0 \cf4 .\cf5 inventory_id\cf0 \

\f1\b \cf3 JOIN
\f0\b0 \cf4  \cf6 film\cf4  
\f2\i \cf6 f
\f0\i0 \cf4       
\f1\b \cf3 ON
\f0\b0 \cf4  
\f2\i \cf6 i
\f0\i0 \cf4 .\cf5 film_id\cf4       = 
\f2\i \cf6 f
\f0\i0 \cf4 .\cf5 film_id\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  
\f2\i \cf6 f
\f0\i0 \cf4 .\cf5 title\cf0 \

\f1\b \cf3 ORDER
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf11 \uc0\u1082 \u1086 \u1083 \u1080 \u1095 \u1077 \u1089 \u1090 \u1074 \u1086 _\u1072 \u1088 \u1077 \u1085 \u1076 \cf4  
\f1\b \cf3 DESC
\f0\b0 \cf0 \

\f1\b \cf3 LIMIT
\f0\b0 \cf4  \cf9 10\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Customers with total payments > 15\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 first_name\cf4 , 
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 last_name\cf4 , 
\f1\b \cf10 SUM
\f0\b0 \cf4 (
\f2\i \cf6 p
\f0\i0 \cf4 .\cf5 amount\cf4 ) 
\f1\b \cf3 AS
\f0\b0 \cf4  \cf11 \uc0\u1080 \u1090 \u1086 \u1075 \u1086 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 customer\cf4  
\f2\i \cf6 c
\f0\i0 \cf0 \

\f1\b \cf3 JOIN
\f0\b0 \cf4  \cf6 payment\cf4  
\f2\i \cf6 p
\f0\i0 \cf4  
\f1\b \cf3 ON
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 customer_id\cf4  = 
\f2\i \cf6 p
\f0\i0 \cf4 .\cf5 customer_id\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 first_name\cf4 , 
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 last_name\cf0 \

\f1\b \cf3 HAVING
\f0\b0 \cf4  
\f1\b \cf10 SUM
\f0\b0 \cf4 (
\f2\i \cf6 p
\f0\i0 \cf4 .\cf5 amount\cf4 ) > \cf9 15\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Films never rented (LEFT JOIN + IS NULL)\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  
\f2\i \cf6 f
\f0\i0 \cf4 .\cf5 title\cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 film\cf4  
\f2\i \cf6 f
\f0\i0 \cf0 \

\f1\b \cf3 LEFT
\f0\b0 \cf4  
\f1\b \cf3 JOIN
\f0\b0 \cf4  \cf6 inventory\cf4  
\f2\i \cf6 i
\f0\i0 \cf4  
\f1\b \cf3 ON
\f0\b0 \cf4  
\f2\i \cf6 f
\f0\i0 \cf4 .\cf5 film_id\cf4  = 
\f2\i \cf6 i
\f0\i0 \cf4 .\cf5 film_id\cf0 \

\f1\b \cf3 LEFT
\f0\b0 \cf4  
\f1\b \cf3 JOIN
\f0\b0 \cf4  \cf6 rental\cf4  
\f2\i \cf6 r
\f0\i0 \cf4     
\f1\b \cf3 ON
\f0\b0 \cf4  
\f2\i \cf6 i
\f0\i0 \cf4 .\cf5 inventory_id\cf4  = 
\f2\i \cf6 r
\f0\i0 \cf4 .\cf5 inventory_id\cf0 \

\f1\b \cf3 WHERE
\f0\b0 \cf4  
\f2\i \cf6 r
\f0\i0 \cf4 .\cf5 rental_id\cf4  
\f1\b \cf3 IS
\f0\b0 \cf4  
\f1\b \cf3 NULL
\f0\b0 \cf7 ;\cf0 \
\
\
\pard\pardeftab720\partightenfactor0
\cf2 -- BLOCK 4: Subqueries\cf0 \
\
\
\cf2 -- Films with rental rate above average\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 title\cf4 , \cf5 rental_rate\cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 film\cf0 \

\f1\b \cf3 WHERE
\f0\b0 \cf4  \cf5 rental_rate\cf4  > (
\f1\b \cf3 SELECT
\f0\b0 \cf4  
\f1\b \cf10 AVG
\f0\b0 \cf4 (\cf5 rental_rate\cf4 ) 
\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 film\cf4 )\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Customers with total payments above average (subquery in HAVING)\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 first_name\cf4 , 
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 last_name\cf4 , 
\f1\b \cf10 SUM
\f0\b0 \cf4 (
\f2\i \cf6 p
\f0\i0 \cf4 .\cf5 amount\cf4 ) 
\f1\b \cf3 AS
\f0\b0 \cf4  \cf11 \uc0\u1080 \u1090 \u1086 \u1075 \u1086 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 customer\cf4  
\f2\i \cf6 c
\f0\i0 \cf0 \

\f1\b \cf3 JOIN
\f0\b0 \cf4  \cf6 payment\cf4  
\f2\i \cf6 p
\f0\i0 \cf4  
\f1\b \cf3 ON
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 customer_id\cf4  = 
\f2\i \cf6 p
\f0\i0 \cf4 .\cf5 customer_id\cf0 \

\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 first_name\cf4 , 
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 last_name\cf0 \

\f1\b \cf3 HAVING
\f0\b0 \cf4  
\f1\b \cf10 SUM
\f0\b0 \cf4 (
\f2\i \cf6 p
\f0\i0 \cf4 .\cf5 amount\cf4 ) > (
\f1\b \cf3 SELECT
\f0\b0 \cf4  
\f1\b \cf10 AVG
\f0\b0 \cf4 (\cf5 amount\cf4 ) 
\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 payment\cf4 )\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Films never rented (NOT IN subquery \'97 more accurate)\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 title\cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 film\cf0 \

\f1\b \cf3 WHERE
\f0\b0 \cf4  \cf5 film_id\cf4  
\f1\b \cf3 NOT
\f0\b0 \cf4  
\f1\b \cf3 IN
\f0\b0 \cf4  (\cf0 \
\pard\pardeftab720\partightenfactor0
\cf4     
\f1\b \cf3 SELECT
\f0\b0 \cf4  
\f1\b \cf3 DISTINCT
\f0\b0 \cf4  
\f2\i \cf6 i
\f0\i0 \cf4 .\cf5 film_id\cf0 \
\cf4     
\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 inventory\cf4  
\f2\i \cf6 i
\f0\i0 \cf0 \
\cf4     
\f1\b \cf3 JOIN
\f0\b0 \cf4  \cf6 rental\cf4  
\f2\i \cf6 r
\f0\i0 \cf4  
\f1\b \cf3 ON
\f0\b0 \cf4  
\f2\i \cf6 i
\f0\i0 \cf4 .\cf5 inventory_id\cf4  = 
\f2\i \cf6 r
\f0\i0 \cf4 .\cf5 inventory_id\cf0 \
\cf4 )\cf7 ;\cf0 \
\
\
\pard\pardeftab720\partightenfactor0
\cf2 -- BLOCK 5: CTE (WITH)\cf0 \
\
\
\cf2 -- Customers with total payments above average (CTE version)\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 WITH
\f0\b0 \cf4  
\f2\i \cf6 customer_totals
\f0\i0 \cf4  
\f1\b \cf3 AS
\f0\b0 \cf4  (\cf0 \
\pard\pardeftab720\partightenfactor0
\cf4     
\f1\b \cf3 SELECT
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 first_name\cf4 , 
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 last_name\cf4 , 
\f1\b \cf10 SUM
\f0\b0 \cf4 (
\f2\i \cf6 p
\f0\i0 \cf4 .\cf5 amount\cf4 ) 
\f1\b \cf3 AS
\f0\b0 \cf4  \cf11 \uc0\u1080 \u1090 \u1086 \u1075 \u1086 \cf0 \
\cf4     
\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 customer\cf4  
\f2\i \cf6 c
\f0\i0 \cf0 \
\cf4     
\f1\b \cf3 JOIN
\f0\b0 \cf4  \cf6 payment\cf4  
\f2\i \cf6 p
\f0\i0 \cf4  
\f1\b \cf3 ON
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 customer_id\cf4  = 
\f2\i \cf6 p
\f0\i0 \cf4 .\cf5 customer_id\cf0 \
\cf4     
\f1\b \cf3 GROUP
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 first_name\cf4 , 
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 last_name\cf0 \
\cf4 )\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 first_name\cf4 , \cf5 last_name\cf4 , \cf11 \uc0\u1080 \u1090 \u1086 \u1075 \u1086 \cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  
\f2\i \cf6 customer_totals
\f0\i0 \cf0 \

\f1\b \cf3 WHERE
\f0\b0 \cf4  \cf11 \uc0\u1080 \u1090 \u1086 \u1075 \u1086 \cf4  > (
\f1\b \cf3 SELECT
\f0\b0 \cf4  
\f1\b \cf10 AVG
\f0\b0 \cf4 (\cf11 amount\cf4 ) 
\f1\b \cf3 FROM
\f0\b0 \cf4  \cf11 payment\cf4 )\cf7 ;\cf0 \
\
\
\pard\pardeftab720\partightenfactor0
\cf2 -- BLOCK 6: Window Functions\cf0 \
\
\
\cf2 -- Number each payment per customer by date\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 customer_id\cf4 , \cf5 amount\cf4 , \cf5 payment_date\cf4 ,\cf0 \
\pard\pardeftab720\partightenfactor0
\cf4        
\f1\b \cf10 ROW_NUMBER
\f0\b0 \cf4 () 
\f1\b \cf3 OVER
\f0\b0 \cf4  (\cf0 \
\cf4            
\f1\b \cf3 PARTITION
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf11 customer_id\cf0 \
\cf4            
\f1\b \cf3 ORDER
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf11 payment_date\cf0 \
\cf4        ) 
\f1\b \cf3 AS
\f0\b0 \cf4  \cf11 \uc0\u1085 \u1086 \u1084 \u1077 \u1088 _\u1087 \u1083 \u1072 \u1090 \u1077 \u1078 \u1072 \cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 payment\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Most expensive payment per customer (CTE + ROW_NUMBER)\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 WITH
\f0\b0 \cf4  
\f2\i \cf6 ranked_payments
\f0\i0 \cf4  
\f1\b \cf3 AS
\f0\b0 \cf4  (\cf0 \
\pard\pardeftab720\partightenfactor0
\cf4     
\f1\b \cf3 SELECT
\f0\b0 \cf0 \
\cf4         
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 first_name\cf4 ,\cf0 \
\cf4         
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 last_name\cf4 ,\cf0 \
\cf4         
\f2\i \cf6 p
\f0\i0 \cf4 .\cf5 amount\cf4 ,\cf0 \
\cf4         
\f1\b \cf10 ROW_NUMBER
\f0\b0 \cf4 () 
\f1\b \cf3 OVER
\f0\b0 \cf4  (\cf0 \
\cf4             
\f1\b \cf3 PARTITION
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf11 c\cf4 .\cf11 customer_id\cf0 \
\cf4             
\f1\b \cf3 ORDER
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf11 p\cf4 .\cf11 amount\cf4  
\f1\b \cf3 DESC
\f0\b0 \cf0 \
\cf4         ) 
\f1\b \cf3 AS
\f0\b0 \cf4  
\f2\i \cf5 rn
\f0\i0 \cf0 \
\cf4     
\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 customer\cf4  
\f2\i \cf6 c
\f0\i0 \cf0 \
\cf4     
\f1\b \cf3 JOIN
\f0\b0 \cf4  \cf6 payment\cf4  
\f2\i \cf6 p
\f0\i0 \cf4  
\f1\b \cf3 ON
\f0\b0 \cf4  
\f2\i \cf6 c
\f0\i0 \cf4 .\cf5 customer_id\cf4  = 
\f2\i \cf6 p
\f0\i0 \cf4 .\cf5 customer_id\cf0 \
\cf4 )\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 first_name\cf4 , \cf5 last_name\cf4 , \cf5 amount\cf0 \

\f1\b \cf3 FROM
\f0\b0 \cf4  
\f2\i \cf6 ranked_payments
\f0\i0 \cf0 \

\f1\b \cf3 WHERE
\f0\b0 \cf4  
\f2\i \cf5 rn
\f0\i0 \cf4  = \cf9 1\cf7 ;\cf0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 -- Difference from previous payment per customer (LAG)\cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 SELECT
\f0\b0 \cf4  \cf5 customer_id\cf4 , \cf5 payment_date\cf4 , \cf5 amount\cf4 ,\cf0 \
\pard\pardeftab720\partightenfactor0
\cf4        
\f1\b \cf10 LAG
\f0\b0 \cf4 (\cf5 amount\cf4 ) 
\f1\b \cf3 OVER
\f0\b0 \cf4  (\cf0 \
\cf4            
\f1\b \cf3 PARTITION
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf11 customer_id\cf0 \
\cf4            
\f1\b \cf3 ORDER
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf11 payment_date\cf0 \
\cf4        ) 
\f1\b \cf3 AS
\f0\b0 \cf4  \cf11 \uc0\u1087 \u1088 \u1077 \u1076 \u1099 \u1076 \u1091 \u1097 \u1080 \u1081 _\u1087 \u1083 \u1072 \u1090 \u1105 \u1078 \cf4 ,\cf0 \
\cf4        \cf5 amount\cf4  - 
\f1\b \cf10 LAG
\f0\b0 \cf4 (\cf5 amount\cf4 ) 
\f1\b \cf3 OVER
\f0\b0 \cf4  (\cf0 \
\cf4            
\f1\b \cf3 PARTITION
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf11 customer_id\cf0 \
\cf4            
\f1\b \cf3 ORDER
\f0\b0 \cf4  
\f1\b \cf3 BY
\f0\b0 \cf4  \cf11 payment_date\cf0 \
\cf4        ) 
\f1\b \cf3 AS
\f0\b0 \cf4  \cf11 \uc0\u1088 \u1072 \u1079 \u1085 \u1080 \u1094 \u1072 \cf0 \
\pard\pardeftab720\partightenfactor0

\f1\b \cf3 FROM
\f0\b0 \cf4  \cf6 payment\cf7 ;\
}