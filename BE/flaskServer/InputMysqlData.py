
import pandas as pd
import numpy as np
import pymysql
import urllib.parse

from sqlalchemy import create_engine
# desc : 크롤링한 데이터를 mysql로 넣기 위한 py파일
#
#

def rename(name):
    if '(' in name:
        return name[ :name.index('(')]
    else:
        return name


data = pd.read_csv('data/정제된데이터.csv', encoding='utf-8', index_col=0) # 맥주 리뷰 데이터 전처리 후
data['아이디'] = data['아이디'].apply(rename)
user_list = list(data['아이디'].unique())

unique_name_city_df = data[['아이디']].drop_duplicates().reset_index(drop=True)
n_rows = len(unique_name_city_df)
new_col = [f"{i+1}@review.com" for i in range(n_rows)]

unique_name_city_df['email'] = new_col
unique_name_city_df['created_at']= "2023-03-22 09:56:24.00000"
unique_name_city_df['updated_at']= "2023-03-22 09:56:24.00000"
unique_name_city_df['constructor']="admin@admin.com"
unique_name_city_df['is_delete']=False
unique_name_city_df['updater']="admin@admin.com"
unique_name_city_df['birth']="2021-02-01"
unique_name_city_df['gender']="M"
unique_name_city_df.rename(columns={'아이디': 'nickName'} ,inplace=True)
unique_name_city_df['profile_image']="https://cdn.pixabay.com/photo/2016/09/14/11/35/beer-1669273_960_720.png"
unique_name_city_df['role']=0

password = 'candy@b105'
password_encoded = urllib.parse.quote_plus(password)
## DB연결을 위한 정보
engine = create_engine('mysql+pymysql://candy:{password_encoded}@j8b105.p.ssafy.io:8306/candycharset=utf8')
# conn = engine.connect()
# conn = pymysql.connect(
#     host='j8b105.p.ssafy.io',
#     port=8306,
#     user='candy',
#     password='candy@b105',
#     db='candy'
# )
unique_name_city_df.to_sql(
    name='user',
    con=engine,
    if_exists='append',
    index=False
)
# conn.close()
##

print(unique_name_city_df.columns)

