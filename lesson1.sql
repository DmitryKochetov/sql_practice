SELECT * FROM myfirstdatabase.mobile_phones WHERE product_count >2;
SELECT * FROM myfirstdatabase.mobile_phones WHERE manufacturer = 'samsung';
SELECT * FROM myfirstdatabase.mobile_phones WHERE manufacturer LIKE '%Iphone%' OR product_name LIKE '%Iphone%';
SELECT * FROM myfirstdatabase.mobile_phones WHERE manufacturer LIKE '%[0-9]%' OR product_name LIKE '%[0-9]%';
SELECT * FROM myfirstdatabase.mobile_phones WHERE manufacturer LIKE '%8%' OR product_name LIKE '%8%';

