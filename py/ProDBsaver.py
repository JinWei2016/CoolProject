#encoding:UTF-8
import re
import pymongo
from pymongo import MongoClient 

def getInfoFromTxt():
    file_path="../aaa/province/"
    location=1
    while(location<=32):
        year=2008
        while(year<=2016):           
            file_name=str(location)+"&&"+str(year)+".txt"
            file=file_path+file_name
            fo=open(file,"r+")
            while True:
                str_info=fo.readline()
                if str_info:
                    pattern="&(.+?)&"
                    information=re.findall(pattern, str_info)
                    InsertInfoIntoMG(information)
                else:
                    break
            fo.close()
            year+=1
        print("Location:"+str(location)+" completed")
        location+=1
        
        
def InsertInfoIntoMG(information):
    client=MongoClient("localhost",27017)
    db=client['ProvinceDB']
    collection=db['ProYearScoreLine']
    collection.insert({"Province":information[1],"Year":information[0],"WenLi":information[2],"PiCi":information[3],"ScoreLine":information[4]})
    

if __name__=="__main__":
    getInfoFromTxt()
    print("HelloWorld")