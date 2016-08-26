#encoding:UTF-8
import urllib.request
import re
from bs4 import BeautifulSoup
"""
tab--  null:高校分数线      major:专业分数线       batch:按地域 
wl--   0:不限                     1:理科                      2:文科                  3:综合                      4:其他
local--0~31:北京  天津  上海  重庆  河北  河南  山东  山西  安徽  江西  江苏  
                                浙江  湖北  湖南  广东  广西  云南  贵州  四川  陕西  青海  宁夏  黑龙江  吉林  辽宁  西藏  新疆  内蒙古  海南  福建  甘肃   港澳台
batch--0:不限                    1:本科提前批        2:本科第一批  3:本科第二批       4：三批                   5：专科
year-- 0:不限   2008~2016
"""
Url_Tab="batch"
Url_Wl=""
# Url_Local=11
Url_Batch=""
Url_Year=2008
Url_Prefix="http://kaoshi.edu.sina.com.cn/college/scorelist?"

Dict_Province={}
Temp_Saver=""

def findByProvince():
    location=1;
    while(location<33):
        findByYear(location)
        location+=1
        
        
def findByYear(location):
    global Url_Tab,Url_Wl,Url_Batch,Url_Year,Url_Prefix,Temp_Saver
    Url_Year=2008
    while(Url_Year<=2016):
        URL=Url_Prefix+"tab="+Url_Tab+"&wl="+Url_Wl+"&local="+str(location)+"&batch="+Url_Batch+"&syear="+str(Url_Year)
        raw_data=urllib.request.urlopen(URL).read()
        raw_data=raw_data.decode('UTF-8')
        raw_pattern='<tr class="tbl2tbody">(.+?)</tr>'
        raw_result=re.findall(raw_pattern, raw_data,re.S)
        raw_result=str(raw_result)
        fur_pattern='<td>(.+?)</td>'
        fur_result=re.findall(fur_pattern,raw_result)
        Temp_Saver="" #用作分隔符方便正则提取
        for i in range(len(fur_result)):
            if (i+1)%6==0 and i!=0:
                Temp_Saver+="&\n"
            elif i%6==0:
                Temp_Saver=Temp_Saver+"&"+fur_result[i]
            else:
                Temp_Saver=Temp_Saver+"&&"+fur_result[i]
        print(Temp_Saver)
        file_name="province/"+str(location)+"&&"+str(Url_Year)+".txt"
        save_in_txt=open(file_name,"w")
        save_in_txt.write(Temp_Saver)
        save_in_txt.close()
        Url_Year+=1

    
if __name__=="__main__":
#     findByProvince()
    findByYear(1)
    print("HelloWorld")

