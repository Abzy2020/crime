import pandas as pd
import mysql.connector
from sqlalchemy import create_engine, text


class CrimeData:
    def __init__(self):
        self.engine = create_engine('mysql+mysqlconnector://root:B46usg30!mbK@localhost:3306/crime', echo=False)
        self.filename = ''
        self.data = ''

    def read_data(self, filename):
        self.data = pd.read_csv(filename, encoding='latin-1')
        return self.data

    def get_crime_by_year(self, year):
        self.data = self.data[self.data['Date Rptd'].str.contains(year)]
        return self.data

    def get_crime_by_sex_and_age(self, sex):
        convert_dict = {'Vict Age': int}
        self.data = self.data.astype(convert_dict)
        self.data = self.data[['Vict Sex', 'Vict Age', 'Vict Descent', 'Crm Cd Desc']]
        self.data = self.data[self.data['Vict Sex'].str.contains(sex, na=False)]
        #self.data = self.data[self.data['Vict Age'] <= age]
        return self.data
    

if __name__ == '__main__':
    c = CrimeData()
    #exports crimes data from 2020 to 2022 to a sql database
    print(c.read_data('crime/data/Crime_Data_from_2020_to_Present.csv').head(100000)
        .to_sql(name='crime_stats', con=c.engine, if_exists ='append', index=False))
