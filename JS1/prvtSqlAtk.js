/*
  * ��ֹsqlע��
  * ����Ҫ��ע����ı���������
  * onblur="return AntiSqlValid(this)");//��ֹSql�ű�ע��
  *  author ����
  */
 
 function AntiSqlValid(oField )//oFieldΪ�ı������
 {
     re= /select|update|delete|exec|count|'|"|=|;|>|<|%/i;
     if ( re.test(oField.value) )//���������ı����Ƿ���sql�ؼ���
     {
     alert("������Ҫ�ڲ��������������ַ���SQL�ؼ��֣�"); //ע����������
     oField.value = "";
     oField.className="errInfo";
     oField.focus();
     return false;
     }
 }