import traceback
import sqlalchemy
from sqlalchemy import create_engine, text
import csv

# GLOBALS
OUTPUT_FILE_PATH = 'ui/output/Bonds-data.csv'
DATABASE_URL = "mysql+mysqlconnector://username:password@host/dbname"

# Setup connection to the database
engine = create_engine(DATABASE_URL)

def load_bonds(connection, bond_data_file=OUTPUT_FILE_PATH):
    '''
    ETL function for treasury bond data.
    Loads data from CSV, processes it, and inserts it into the Fact_Bond_Prices table.
    '''
    with open(bond_data_file, "r") as bonds_data:
        reader = csv.DictReader(bonds_data)
        for row in reader:
            try:
                insert_query = text("""
                    INSERT INTO Fact_Bond_Prices (
                        bond_id, one_month, two_month, three_month, six_month, one_year,
                        two_year, three_year, five_year, ten_year, twenty_year, thirty_year
                    ) VALUES (
                        :bond_id, :one_month, :two_month, :three_month, :six_month, :one_year,
                        :two_year, :three_year, :five_year, :ten_year, :twenty_year, :thirty_year
                    )
                """)
                connection.execute(insert_query, **row)
            except Exception as e:
                print("Error inserting bond data:", e)
                traceback.print_exc()

def load_commodities(connection, commodity_data_file=OUTPUT_FILE_PATH):
    '''
    ETL function for commodity data.
    Loads data from CSV, processes it, and inserts it into the Fact_Commodity_Prices table.
    '''
    with open(commodity_data_file, "r") as commodity_data:
        reader = csv.DictReader(commodity_data)
        for row in reader:
            try:
                insert_query = text("""
                    INSERT INTO Fact_Commodity_Prices (
                        commodity_id, price, change_percentage, volume
                    ) VALUES (
                        :commodity_id, :price, :change_percentage, :volume
                    )
                """)
                connection.execute(insert_query, **row)
            except Exception as e:
                print("Error inserting commodity data:", e)
                traceback.print_exc()

def load_stocks(connection, stock_data_file=OUTPUT_FILE_PATH):
    '''
    ETL function for stock data.
    Loads data from CSV, processes it, and inserts it into the Fact_Stock_Prices table.
    '''
    with open(stock_data_file, "r") as stock_data:
        reader = csv.DictReader(stock_data)
        for row in reader:
            try:
                insert_query = text("""
                    INSERT INTO Fact_Stock_Prices (
                        company_id, open, high, low, close, adj_close, volume
                    ) VALUES (
                        :company_id, :open, :high, :low, :close, :adj_close, :volume
                    )
                """)
                connection.execute(insert_query, **row)
            except Exception as e:
                print("Error inserting stock data:", e)
                traceback.print_exc()

def load_indexes(connection, index_data_file=OUTPUT_FILE_PATH):
    '''
    ETL function for index data.
    Loads data from CSV, processes it, and inserts it into the Fact_Index_Prices table.
    '''
    with open(index_data_file, "r") as index_data:
        reader = csv.DictReader(index_data)
        for row in reader:
            try:
                insert_query = text("""
                    INSERT INTO Fact_Index_Prices (
                        index_id, open, high, low, close, volume
                    ) VALUES (
                        :index_id, :open, :high, :low, :close, :volume
                    )
                """)
                connection.execute(insert_query, **row)
            except Exception as e:
                print("Error inserting index data:", e)
                traceback.print_exc()

# Main execution
if __name__ == "__main__":
    try:
        # Establish connection to the database
        with engine.connect() as connection:
            load_bonds(connection)
            load_commodities(connection)
            load_stocks(connection)
            load_indexes(connection)
    except Exception as e:
        print("Error in database connection or data loading:", e)
        traceback.print_exc()
