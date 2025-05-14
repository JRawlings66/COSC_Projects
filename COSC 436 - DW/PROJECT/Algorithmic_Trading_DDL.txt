CREATE DATABASE AlgorithmicTradingDW2024;
GO
USE AlgorithmicTradingDW2024;
GO

--Fact Tables--
--NOTE: These use 'fact_id' as a surrogate key. This is to prevent any composite keys.--
CREATE TABLE Fact_Bond_Prices(
	fact_id INT IDENTITY(1,1) PRIMARY KEY,
	bond_id BIGINT,
	time_id INT,
	one_month DECIMAL(5,2),
	two_month DECIMAL(5,2),
	three_month DECIMAL(5,2),
	six_month DECIMAL(5,2),
	one_year DECIMAL(5,2),
	two_year DECIMAL(5,2),
	three_year DECIMAL(5,2),
	five_year DECIMAL(5,2),
	ten_year DECIMAL(5,2),
	twenty_year DECIMAL(5,2),
	thirty_year DECIMAL(5,2),
);
GO

CREATE TABLE Fact_Stock_Prices(
	fact_id INT IDENTITY(1,1) PRIMARY KEY
	company_id BIGINT,
	time_id INT,
);
GO

CREATE TABLE Fact_Commodity_Prices(
	fact_id INT IDENTITY(1,1) PRIMARY KEY
	commodity_id BIGINT,
	time_id INT,
);
GO

CREATE TABLE Fact_Index_Prices(
	fact_id INT IDENTITY(1,1) PRIMARY KEY
	index_id BIGINT,
	time_id INT,
);
GO

--Dim Tables--
CREATE TABLE Dim_Time(
	time_id INT IDENTITY(1,1) PRIMARY KEY,
);
GO