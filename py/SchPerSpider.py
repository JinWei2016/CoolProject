#encoding:UTF-8
import re
import urllib.request
import http.cookiejar
from selenium import webdriver
from selenium.webdriver.support.select import Select
import time

Province=["北京","天津","上海","重庆","河北","河南","山东","山西","安徽","江西","江苏","浙江","湖北","湖南","广东","广西",
           "云南","贵州","四川","陕西","青海","宁夏","黑龙江","吉林","辽宁","西藏","新疆","内蒙古","海南","福建","甘肃","港澳台"]
WenLi=["文科","理科"]
raw_id=[10001,10055,10246,10611,10075,10300,10422,10108,10357,10404,10284,10335,10486,10530,10558,10593,10673,10657,10613,10697,10743,10749,10212,10183,10140,10694,
        10755,10126,10589,10384,10730,50189]

Url_Prefix="http://kaoshi.edu.sina.com.cn/college/c/"
usr_agent='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36'
headers={'User-Agent':usr_agent}


Temp_Saver=""

def findByStuProvince():
    provid=1;
    while(provid<33):
        findByYear(provid)
        provid+=1
        
        
def findByYear(provid):
    global Url_Prefix,WenLi,Province,raw_id
    my_id=raw_id[provid-1]
    my_cookie=http.cookiejar.CookieJar()
    my_handler=urllib.request.HTTPCookieProcessor(my_cookie)
    my_openner=urllib.request.build_opener(my_handler)
    URL=Url_Prefix+"?provid="+str(provid)+"&id="+str(my_id)+"&ie=utf-8"
    headers['Referer']=URL
    raw_request=urllib.request.Request(URL,None,headers)
    raw_response=my_openner.open(raw_request)
    raw_data=raw_response.read()
    raw_data=raw_data.decode('UTF-8')   
    #获取网页源码，查询一个地区的学校数量
    select_pattern='<select id="colname1"(.*?)<input type='
    select=re.findall(select_pattern, raw_data, re.S)
    select=str(select)
    id_pattern='value="(.*?)">'
    id_List=re.findall(id_pattern, select)   
    for id in id_List:
        browser=webdriver.Chrome()
        update_Url=Url_Prefix+"major/"+str(id)+".shtml"
        browser.get(update_Url)
        time.sleep(2)
        College_Name=browser.find_element_by_class_name('collegeName').text
        Temp_Saver="@"+College_Name+"@\r\n"
        year=0
        while year<=3:
            location=0
            while location<=31:
                wenli=0
                while wenli<=1:
                    sel=browser.find_element_by_xpath('//select[@class="middleContentSel sel_year"]')
                    Select(sel).select_by_index(year)
                    sel=browser.find_element_by_xpath('//select[@class="middleContentSel sel_wl"]')
                    Select(sel).select_by_index(wenli)
                    sel=browser.find_element_by_xpath('//select[@class="middleContentSel sel_province"]')
                    Select(sel).select_by_index(location)
                    data=browser.find_element_by_id("scoreTable2").text
                    data=str(data)
                    pattern='(.*?) '
                    my_string=re.findall(pattern,data)
                    i=0
                    while(i<len(my_string)):
                        if (i+1)%9==6:
                            i+=3
                            Temp_Saver+="&\n"
                        elif i%9==0:
                            Temp_Saver=Temp_Saver+"&"+str(2015-year)+"&&"+WenLi[wenli]+"&&"+Province[location]+"&&"+my_string[i]
                        else:
                            Temp_Saver=Temp_Saver+"&&"+my_string[i]
                        i+=1
                    wenli+=1
                location+=1
            year+=1
        file_name="sch_major/"+College_Name+".txt"
        save_in_txt=open(file_name,"w")
        save_in_txt.write(Temp_Saver)
        save_in_txt.close()         
        print("School:"+College_Name+" completed!")
        browser.quit()

    
if __name__=="__main__":
#     findByStuProvince()
    findByYear(1)
    print("HelloWorld")