create table user
(
    id   int  not null
        primary key,
    meta json null
);

INSERT INTO test.user (id, meta) VALUES (1, '{"age": "21", "name": "shubham", "orders": [1, 4]}');
INSERT INTO test.user (id, meta) VALUES (2, '{"age": "25", "name": "akshat", "orders": [2, 3, 4]}');
INSERT INTO test.user (id, meta) VALUES (3, '{"age": "30", "name": "rahul", "orders": [10, 11, 12]}');

select * from user;

# json extract (column, json_path)
select json_extract(meta, '$.name') as name from user;
select meta->'$.name' from user;

# searching within json object
# json_contains (col, val to be searched, path)
SELECT * FROM user WHERE JSON_EXTRACT(meta, '$.name') = 'shubham';
select * from user where json_contains(meta, '{"name":"shubham"}');

#searching within json array
select * from user where json_contains(meta, '4', '$.orders');

# inserting into json object and arrays
# json_insert insert a new value into a JSON document if the target path does not already exist
select json_insert(meta, '$.address', 'Mumbai') as meta from user where id = 1;
SELECT JSON_ARRAY_APPEND(meta, '$.orders', 10) as meta from user where id = 1;


# length of array or no of keys in object
select json_length(meta, '$') from user;

# aggregation
#  find the max order if for each user
# json table convert each value in json path to a key with columns defined and automatically join with row
select id, max(orderId) from user,
            JSON_TABLE(meta,
            '$.orders[*]'
            COLUMNS (orderId int path '$' default '0' on ERROR default '0' on EMPTY )) as jt
group by id;
