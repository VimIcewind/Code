varbase64EncodeChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
varbase64DecodeChars=newArray(
        -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
        -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
        -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,62,-1,-1,-1,63,
        52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-1,-1,-1,
        -1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,
        15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,
        -1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,
        41,42,43,44,45,46,47,48,49,50,51,-1,-1,-1,-1,-1);
functionbase64encode(str)
{
    varreturnVal,i,len;
    varc1,c2,c3;
    len=str.length;
    i=0;
    returnVal="";
    while(i<len)
    {
        c1=str.charCodeAt(i++)&0xff;
        if(i==len)
        {
            returnVal+=base64EncodeChars.charAt(c1>>2);
            returnVal+=base64EncodeChars.charAt((c1&0x3)<<4);
            returnVal+="==";
            break;
        }
        c2=str.charCodeAt(i++);
        if(i==len)
        {
            returnVal+=base64EncodeChars.charAt(c1>>2);
            returnVal+=base64EncodeChars.charAt(((c1&0x3)<<4)|((c2&0xF0)>>4));
            returnVal+=base64EncodeChars.charAt((c2&0xF)<<2);
            returnVal+="=";
            break;
        }
        c3=str.charCodeAt(i++);
        returnVal+=base64EncodeChars.charAt(c1>>2);
        returnVal+=base64EncodeChars.charAt(((c1&0x3)<<4)|((c2&0xF0)>>4));
        returnVal+=base64EncodeChars.charAt(((c2&0xF)<<2)|((c3&0xC0)>>6));
        returnVal+=base64EncodeChars.charAt(c3&0x3F);
    }
    returnreturnVal;
}
functionbase64decode(str)
{
    varc1,c2,c3,c4;
    vari,len,returnVal;
    len=str.length;
    i=0;
    returnVal="";
    while(i<len)
    {
        /*c1*/
        do
        {
            c1=base64DecodeChars[str.charCodeAt(i++)&0xff];
        }while(i<len&&c1==-1);
        if(c1==-1)
            break;
        /*c2*/
        do
        {
            c2=base64DecodeChars[str.charCodeAt(i++)&0xff];
        }while(i<len&&c2==-1);
        if(c2==-1)
            break;
        returnVal+=String.fromCharCode((c1<<2)|((c2&0x30)>>4));
        /*c3*/
        do
        {
            c3=str.charCodeAt(i++)&0xff;
            if(c3==61)
                returnreturnVal;
            c3=base64DecodeChars[c3];
        }while(i<len&&c3==-1);
        if(c3==-1)
            break;
        returnVal+=String.fromCharCode(((c2&0XF)<<4)|((c3&0x3C)>>2));
        /*c4*/
        do
        {
            c4=str.charCodeAt(i++)&0xff;
            if(c4==61)
                returnreturnVal;
            c4=base64DecodeChars[c4];
        }while(i<len&&c4==-1);
        if(c4==-1)
            break;
        returnVal+=String.fromCharCode(((c3&0x03)<<6)|c4);
    }
    returnreturnVal;
}
AS3版的Base64
packagecrypto{
    importflash.utils.ByteArray;
    publicclassBase64{
        privatestaticconstBASE64_CHARS:String="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
        publicstaticfunctionencode(data:String):String{
            //ConvertstringtoByteArray
            varbytes:ByteArray=newByteArray();
            bytes.writeUTFBytes(data);
            //ReturnencodedByteArray
            returnencodeByteArray(bytes);
        }
        publicstaticfunctionencodeByteArray(data:ByteArray):String{
            //Initialiseoutput
            varoutput:String="";
            //Createdataandoutputbuffers
            vardataBuffer:Array;
            varoutputBuffer:Array=newArray(4);
            //RewindByteArray
            data.position=0;
            //whiletherearestillbytestobeprocessed
            while(data.bytesAvailable>0){
                //Createnewdatabufferandpopulatenext3bytesfromdata
                dataBuffer=newArray();
                for(vari:uint=0;i<3&&data.bytesAvailable>0;i++){
                    dataBuffer=data.readUnsignedByte();
                }
                //ConverttodatabufferBase64characterpositionsand
                //storeinoutputbuffer
                outputBuffer[0]=(dataBuffer[0]&0xfc)>>2;
                outputBuffer[1]=((dataBuffer[0]&0x03)<<4)|((dataBuffer[1])>>4);
                outputBuffer[2]=((dataBuffer[1]&0x0f)<<2)|((dataBuffer[2])>>6);
                outputBuffer[3]=dataBuffer[2]&0x3f;
                //Ifdatabufferwasshort(i.enot3characters)thenset
                //endcharacterindexesindatabuffertoindexof'='symbol.
                //ThisisnecessarybecauseBase64dataisalwaysamultipleof
                //4bytesandisbasseswith'='symbols.
                for(varj:uint=dataBuffer.length;j<3;j++){
                    outputBuffer[j+1]=64;
                }
                //LoopthroughoutputbufferandaddBase64charactersto
                //encodeddatastringforeachcharacter.
                for(vark:uint=0;k<outputBuffer.length;k++){
                    output+=BASE64_CHARS.charAt(outputBuffer[k]);
                }
            }
            //Returnencodeddata
            returnoutput;
        }
        publicstaticfunctiondecode(data:String):String{
            //DecodedatatoByteArray
            varbytes:ByteArray=decodeToByteArray(data);
            //Converttostringandreturn
            returnbytes.readUTFBytes(bytes.length);
        }
        publicstaticfunctiondecodeToByteArray(data:String):ByteArray{
            //InitialiseoutputByteArrayfordecodeddata
            varoutput:ByteArray=newByteArray();
            //Createdataandoutputbuffers
            vardataBuffer:Array=newArray(4);
            varoutputBuffer:Array=newArray(3);
            //Whiletherearedatabyteslefttobeprocessed
            for(vari:uint=0;i<data.length;i+=4){
                //PopulatedatabufferwithpositionofBase64charactersfor
                //next4bytesfromencodeddata
                for(varj:uint=0;j<4&&i+j<data.length;j++){
                    dataBuffer[j]=BASE64_CHARS.indexOf(data.charAt(i+j));
                }
                //Decodedatabufferbackintobytes
                outputBuffer[0]=(dataBuffer[0]<<2)+((dataBuffer[1]&0x30)>>4);
                outputBuffer[1]=((dataBuffer[1]&0x0f)<<4)+((dataBuffer[2]&0x3c)>>2);
                outputBuffer[2]=((dataBuffer[2]&0x03)<<6)+dataBuffer[3];
                //Addallnon-paddedbytesinoutputbuffertodecodeddata
                for(vark:uint=0;k<outputBuffer.length;k++){
                    if(dataBuffer[k+1]==64)break;
                    output.writeByte(outputBuffer[k]);
                }
            }
            //RewinddecodeddataByteArray
            output.position=0;
            //Returndecodeddata
            returnoutput;
        }
        publicfunctionBase64(){
            thrownewError("Base64classisstaticcontaineronly");
        }
    }
}
