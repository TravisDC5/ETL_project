--Creates table for invoice details
CREATE TABLE invdetails(
	InvoiceDetailID INTEGER PRIMARY KEY,
	InvoiceID INTEGER,
	ProductID INTEGER,
	ProductPrice DECIMAL,
	TaxAmount DECIMAL,
	ConsignorID INTEGER,
	StoreOwned BOOLEAN,
	ItemCost DECIMAL,
	FedTax INTEGER,
	Voided BOOLEAN,
	TaxRef DECIMAL,
	FedTaxRef DECIMAL,
	DiscRef DECIMAL,
	CardNumber DECIMAL,
	VoidBy VARCHAR (10),
	StoreID INTEGER,
	EffPrice DECIMAL
);

--Creates table for invoices
CREATE TABLE invoices(
	 InvoiceID INTEGER,
     Employee VARCHAR,
     InvoiceDate DATE,
     PaymentTerms VARCHAR,
     GrossDue DECIMAL,
     Discount DECIMAL,
     SalesTax DECIMAL,
     AcctCredit DECIMAL,
     NetDue DECIMAL,
     ItemCount INTEGER,
     CreditCardCut INTEGER,
     InvCost DECIMAL,
     FedSalesTax DECIMAL,
     Text1 VARCHAR,
     Num1 INTEGER,
     PayTerms2 VARCHAR,
     PayAmt1 DECIMAL,
     PayAmt2 DECIMAL,
     BuyersFee DECIMAL,
     Layaways DECIMAL,
     TaxExemptNo VARCHAR,
     LayCredit DECIMAL,
     RegisterID INTEGER,
     Advertise VARCHAR,
     ConsID INTEGER,
     GCSales DECIMAL,
     GCCredits DECIMAL,
     CustNo INTEGER,
     StoreID INTEGER,
     PCName VARCHAR,
     SaleTime VARCHAR,
     TaxJ VARCHAR
);

--Creates table for merchandise details
CREATE TABLE merchandise(
	ProductID DECIMAL,
	ProductType VARCHAR,
	ProductColor VARCHAR,
	ProductSize VARCHAR,
	ProductDescription VARCHAR,
	OrigPrice VARCHAR,
	Price VARCHAR,
	EnterDate DATE,
	TransferDate DATE,
	TransferPrice DECIMAL,
	TransferInd VARCHAR,
	TransferBy VARCHAR,
	CustomerID DECIMAL,
	ReqPrice DECIMAL,
	InvoiceNumber DECIMAL,
	Return BOOLEAN,
	MarkdownDate1 DATE,
	MarkdownDate2 DATE,
	MarkdownDate3 DATE,
	LabelPrinted BOOLEAN,
	MercCut DECIMAL,
	DownPymt DECIMAL,
	DownWho VARCHAR,
	DownDate DATE,
	ItemCount DECIMAL,
	Text1 VARCHAR,
	Num1 DECIMAL,
	ExpireDate DATE,
	LayawayGrp DECIMAL,
	PCName VARCHAR,
	DontPrintTag BOOLEAN,
	WholesalePrice BOOLEAN,
	BuyersFee DECIMAL,
	DownPhone VARCHAR,
	ResaleNow BOOLEAN,
	PreviousOwner DECIMAL,
	AuctionID VARCHAR,
	Taxable VARCHAR,
	NeverMD VARCHAR,
	ListOnline BOOLEAN,
	CustNo DECIMAL,
	FixSplit BOOLEAN,
	TaxRate DECIMAL,
	PhyDate DATE,
	Auction2 VARCHAR,
	ConCode VARCHAR,
	BuyOut BOOLEAN,
	CardFee DECIMAL,
	Reminded BOOLEAN,
	StoreID DECIMAL,
	AddedBy VARCHAR,
	GroupNo DECIMAL,
	OrigBuyersFee DECIMAL,
	PrintOn VARCHAR,
	IsStore BOOLEAN
);

--Creates table for consignment vendors details
CREATE TABLE vendors(
     Booth VARCHAR,
     CP DECIMAL,
     VendorName VARCHAR,
     Rent DECIMAL
);

CREATE TABLE peter AS
SELECT Invoices.InvoiceID, InvDetails.InvoiceDetailID, InvDetails.ProductID, InvDetails.ProductPrice, InvDetails.ItemCost, 
	   InvDetails.ConsignorID, Invoices.InvoiceDate, Merchandise.ProductType, Merchandise.ProductColor, Merchandise.ProductSize, 
	   Merchandise.ProductDescription, Merchandise.Return, Merchandise.AuctionID, Merchandise.ItemCount, vendors.cp, 
	   vendors.rent, vendors.vendorname
FROM vendors 
	INNER JOIN (Invoices 
        INNER JOIN (Merchandise 
	INNER JOIN InvDetails ON Merchandise.ProductID = InvDetails.ProductID) 
	                      ON Invoices.InvoiceID = InvDetails.InvoiceID) 
			      ON vendors.cp = InvDetails.ConsignorID;
												  
SELECT * FROM results;


