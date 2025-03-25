use quanlybanhang;

insert customer(cName, cAge) values ("Minh Quan", 10);
insert customer(cName, cAge) values ("Ngoc Oanh", 20);
insert customer(cName, cAge) values ("Hong Ha", 50);
select * from customer;

insert orderbill(oID, cID, oDate, oTotalPrice) values(1, 1, "2006-3-21", null);
insert orderbill(oID, cID, oDate, oTotalPrice) values(2, 2, "2006-3-21", null);
insert orderbill(oID, cID, oDate, oTotalPrice) values(3, 1, "2006-3-21", null);
select * from orderbill;

insert product(pID, pName, pPrice) values(1, "May Giat", 3);
insert product(pID, pName, pPrice) values(2, "Tu Lanh", 5);
insert product(pID, pName, pPrice) values(3, "Dieu Hoa", 7);
insert product(pID, pName, pPrice) values(4, "Quat", 1);
insert product(pID, pName, pPrice) values(5, "Bep Dien", 2);
select * from product;

insert orderdetail(oID, pID, odQTY) values(1, 1, 3);
insert orderdetail(oID, pID, odQTY) values(1, 3, 7);
insert orderdetail(oID, pID, odQTY) values(1, 4, 2);
insert orderdetail(oID, pID, odQTY) values(2, 1, 1);
insert orderdetail(oID, pID, odQTY) values(3, 1, 8);
insert orderdetail(oID, pID, odQTY) values(2, 5, 4);
insert orderdetail(oID, pID, odQTY) values(2, 3, 3);
select * from orderdetail;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách.
SELECT DISTINCT c.cID, c.cName, p.pID, p.pName
FROM customer c
JOIN orderbill o ON c.cID = o.cID
JOIN orderdetail od ON o.oID = od.oID
JOIN product p ON od.pID = p.pID
ORDER BY c.cID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.cID, c.cName
FROM customer c
LEFT JOIN orderbill o ON c.cID = o.cID
WHERE o.oID IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT o.oID, o.oDate, SUM(od.odQTY * p.pPrice) AS TotalPrice
FROM orderbill o
JOIN orderdetail od ON o.oID = od.oID
JOIN product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;