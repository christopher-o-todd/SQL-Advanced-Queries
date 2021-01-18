/* Alter table ORDERS to ensure that both ShipAddressID and BillingAddressID reference table Addresses. */

ALTER TABLE Orders WITH CHECK
ADD FOREIGN KEY (ShipAddressID) REFERENCES
Addresses(AddressID);

ALTER TABLE Orders WITH CHECK
ADD FOREIGN KEY (BillingAddressID) REFERENCES
Addresses(AddressID);
