#encoding:UTF-8
import re
import urllib.request
import http.cookiejar

Url_Tab=""
Url_Wl=""
Url_Local=11
Url_Provid=""
Url_Batch=""
Url_Year=2008
Url_Prefix="http://kaoshi.edu.sina.com.cn/college/scorelist?"

usr_agent='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36'
headers={'User-Agent':usr_agent}


Temp_Saver=""

def findByStuProvince():
    location=27;
    while(location<33):
        findByYear(location)
        location+=1
        
        
def findByYear(location):
    global Url_Tab,Url_Wl,Url_Batch,Url_Year,Url_Prefix,Temp_Saver,headers
    Url_Year=2008
    while(Url_Year<=2015):
        my_cookie=http.cookiejar.CookieJar()
        my_handler=urllib.request.HTTPCookieProcessor(my_cookie)
        my_openner=urllib.request.build_opener(my_handler)
        URL=Url_Prefix+"tab="+Url_Tab+"&wl="+Url_Wl+"&local="+str(location)+"&provid=&batch="+Url_Batch+"&syear="+str(Url_Year)
        headers['Referer']=URL
        raw_request=urllib.request.Request(URL,None,headers)
        raw_response=my_openner.open(raw_request)
        raw_data=raw_response.read()
        raw_data=raw_data.decode('UTF-8')
        page_pattern='totalPage=\'(.+?)\''
        page_result=re.findall(page_pattern, raw_data)
        totalpage=int(page_result[0])
        page_num=1
        Temp_Saver=""
        while (page_num<=totalpage):
            update_Url=URL+"&page="+str(page_num)
            headers['Referer']=update_Url
            fur_request=urllib.request.Request(update_Url,None,headers)
            fur_response=my_openner.open(fur_request)
            data=fur_response.read()
            data=data.decode('UTF-8')
            raw_pattern='<tr class="tbl2tbody">(.*?)</tr>'
            raw_result=re.findall(raw_pattern, data, re.S)
            raw_result=str(raw_result)
            school_name_pattern='\'>(.*?)</a>'
            school_name=re.findall(school_name_pattern, raw_result)
            school_info_pattern='<td>(.*?)</td>'
            school_info=re.findall(school_info_pattern,raw_result)  
            i=0
            while(i<len(school_info)):         
                if school_name[int(i/7)]=="":
                    if i+7<len(school_info):
                        i+=7
                        continue
                    else:
                        break
                if (school_info[int(i/7)*7]=="" or school_info[int(i/7)*7+1]=="" or school_info[int(i/7)*7+2]=="" or school_info[int(i/7)*7+3]=="" or school_info[int(i/7)*7+4]=="" or school_info[int(i/7)*7+5]==""):
                    print(str(i)+"??"+school_name[int(i/7)]+"xx"+school_info[int(i/7)*7+2]+"##"+school_info[int(i/7)*7+3]+"xx"+str(page_num))
                    if i+7<len(school_info):
                        i+=7
                        continue
                    else:
                        break
                if (i+1)%7==0 and i!=0:
                    Temp_Saver+="&\n"
                elif i%7==0:
                    index=int(i/7)
                    Temp_Saver=Temp_Saver+"&"+school_name[index]+"&&"+school_info[i]
                else:
                    Temp_Saver=Temp_Saver+"&&"+school_info[i]
                i+=1              
            page_num+=1
        file_name="school/"+str(location)+"&&"+str(Url_Year)+".txt"
        save_in_txt=open(file_name,"w")
        save_in_txt.write(Temp_Saver)
        save_in_txt.close()         
        print("Location:"+str(location)+" Year:"+str(Url_Year)+" completed!")
        Url_Year+=1

    
if __name__=="__main__":
    findByStuProvince()
    print("HelloWorld")