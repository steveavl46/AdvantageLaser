SELECT        i.InvoiceKey, i.OrderDate, i.ShippingTotal, c.FirstName, c.LastName, c.BusinessName, c.EMailAddress, c.AlternateEMailAddress, c.DayPhone, 
                         c.EveningPhone, c.CellPhone, v.Description, v.Quantity, v.Price, d.BankName, d.RoutingNumber, d.AccountNumber, d.Fraction, d.BankCSZ, d.BankPhone, 
                         d.Line1, d.Line2, d.Line3, d.Line4, d.Line5
FROM            Invoice AS i INNER JOIN
                         Customer AS c ON c.CustomerKey = i.CustomerKey INNER JOIN
                         InvoiceItem AS v ON v.InvoiceKey = i.InvoiceKey INNER JOIN
                         DepositSlip AS d ON v.DepositSlipKey = d.DepositSlipKey
WHERE        (i.InvoiceKey = 11)