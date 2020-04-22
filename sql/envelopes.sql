select * from producttype
select * from ProductCategory
select * from product

/*
insert into productcategory(Description) values ('Double Window Envelope')
go
insert into producttype(productcategorykey, description, shippingrategroupkey)
values (4,'Standard Fit #9 3-7/8 " x 8-7/8"', 1)

insert into producttype(productcategorykey, description, shippingrategroupkey)
values (4,'Tight Fit 3-5/8 " x 8-3/4"', 1)
go
insert into product
(producttypekey,description,price,shippingrate,quantity)
values
(10,'1,000 Self-Seal Envelopes CP31-603-SS',65,null,1)

insert into product
(producttypekey,description,price,shippingrate,quantity)
values
(10,'1,000 Standard Envelopes CP31-603',39,null,1)

insert into product
(producttypekey,description,price,shippingrate,quantity)
values
(11,'1,000 Self-Seal Envelopes CP31-605-SS',65,null,1)

insert into product
(producttypekey,description,price,shippingrate,quantity)
values
(11,'1,000 Standard Envelopes CP31-605',40,null,1)
*/

update product set description = '1,000 Self-Seal Envelopes CP31-603-SS' where productkey = 44
update product set description = '1,000 Standard Envelopes CP31-603' where productkey = 45
update product set description = '1,000 Self-Seal Envelopes CP31-605-SS' where productkey = 46
update product set description = '1,000 Standard Envelopes CP31-605' where productkey = 47