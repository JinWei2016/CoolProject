/*
 * �����������������Ƿ�һ��
 * author ����
 */ 
function checkConPswd(oField ,text){//oField��text�����������Ķ���
	if(oField.value!=text.value){  //�ж���������������Ƿ�һ��
        oField.placeholder="������������벻һ��";
    	 return false; 
    }
}