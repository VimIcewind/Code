typedef struct ISO8583
{
	int     bit_flag;           /*域数据类型0 -- string, 1 -- int, 2 -- binary*/
	char    *data_name;         /*域名*/
	int     length;             /*数据域长度*/
	int     length_in_byte;     /*实际长度（如果是变长）*/
	int     variable_flag;      /*是否变长标志0：否 2：2位变长, 3：3位变长*/
	int     datatyp;            /*0 -- string, 1 -- int, 2 -- binary*/
	char    *data;              /*存放具体值*/
	int     attribute;          /*保留*/
} ISO8583;

ISO8583 Tbl8583[128] =
{
	/* FLD 01 */ {0,"BIT MAP,EXTENDED", 8, 0, 0, 2, NULL,0},
	/* FLD 02 */ {0,"PRIMARY ACCOUNT NUMBER", 22, 0, 2, 0, NULL,0},
	/* FLD 03 */ {0,"PROCESSING CODE", 6, 0, 0, 0, NULL,0},
	/* FLD 04 */ {0,"AMOUNT, TRANSACTION", 12, 0, 0, 1, NULL,0},
	/* FLD 05 */ {0,"NO USE", 12, 0, 0, 0, NULL,0},
	/* FLD 06 */ {0,"NO USE", 12, 0, 0, 0, NULL,0},
	/* FLD 07 */ {0,"TRANSACTION DATE AND TIME", 10, 0, 0, 0, NULL,0},
	/* FLD 08 */ {0,"NO USE", 8, 0, 0, 0, NULL,0},
	/* FLD 09 */ {0,"NO USE", 8, 0, 0, 0, NULL,0},
	/* FLD 10 */ {0,"NO USE", 8, 0, 0, 0, NULL,0},
	/* FLD 11 */ {0,"SYSTEM TRACE AUDIT NUMBER", 6, 0, 0, 1, NULL,0},
	/* FLD 12 */ {0,"TIME, LOCAL TRANSACTION", 6, 0, 0, 0, NULL,0},
	/* FLD 13 */ {0,"DATE, LOCAL TRANSACTION", 4, 0, 0, 0, NULL,0},
	/* FLD 14 */ {0,"DATE, EXPIRATION", 4, 0, 0, 0, NULL,0},
	/* FLD 15 */ {0,"DATE, SETTLEMENT", 4, 0, 0, 0, NULL,0},
	/* FLD 16 */ {0,"NO USE", 4, 0, 0, 0, NULL,0},
	/* FLD 17 */ {0,"DATE, CAPTURE", 4, 0, 0, 0, NULL,0},
	/* FLD 18 */ {0,"MERCHANT'S TYPE", 4, 0, 0, 0, NULL,0},
	/* FLD 19 */ {0,"NO USE", 3, 0, 0, 0, NULL,0},
	/* FLD 20 */ {0,"NO USE", 3, 0, 0, 0, NULL,0},
	/* FLD 21 */ {0,"NO USE", 3, 0, 0, 0, NULL,0},
	/* FLD 22 */ {0,"POINT OF SERVICE ENTRY MODE", 3, 0, 0, 0, NULL,0},
	/* FLD 23 */ {0,"NO USE", 3, 0, 0, 0, NULL,0},
	/* FLD 24 */ {0,"NO USE", 3, 0, 0, 0, NULL,0},
	/* FLD 25 */ {0,"POINT OF SERVICE CONDITION CODE", 2, 0, 0, 0, NULL,0},
	/* FLD 26 */ {0,"NO USE", 2, 0, 0, 0, NULL,0},
	/* FLD 27 */ {0,"NO USE", 1, 0, 0, 0, NULL,0},
	/* FLD 28 */ {0,"field27", 6, 0, 0, 0, NULL,0},
	/* FLD 29 */ {0,"NO USE", 8, 0, 1, 0, NULL,0},
	/* FLD 30 */ {0,"NO USE", 8, 0, 1, 0, NULL,0},
	/* FLD 31 */ {0,"NO USE", 8, 0, 1, 0, NULL,0},
	/* FLD 32 */ {0,"ACQUIRER INSTITUTION ID. CODE", 11, 0, 2, 0, NULL,0},
	/* FLD 33 */ {0,"FORWARDING INSTITUTION ID. CODE", 11, 0, 2, 0, NULL,0},
	/* FLD 34 */ {0,"NO USE", 28, 0, 2, 0, NULL,0},
	/* FLD 35 */ {0,"TRACK 2 DATA", 37, 0, 2, 0, NULL,0},
	/* FLD 36 */ {0,"TRACK 3 DATA",104, 0, 3, 0, NULL,0},
	/* FLD 37 */ {0,"RETRIEVAL REFERENCE NUMBER", 12, 0, 0, 0, NULL,0},
	/* FLD 38 */ {0,"AUTH. IDENTIFICATION RESPONSE", 6, 0, 0, 0, NULL,0},
	/* FLD 39 */ {0,"RESPONSE CODE", 2, 0, 0, 0, NULL,0},
	/* FLD 40 */ {0,"NO USE", 3, 0, 0, 0, NULL,0},
	/* FLD 41 */ {0,"CARD ACCEPTOR TERMINAL ID.", 8, 0, 0, 0, NULL,0},
	/* FLD 42 */ {0,"CARD ACCEPTOR IDENTIFICATION CODE", 15, 0, 0, 0, NULL,0},
	/* FLD 43 */ {0,"CARD ACCEPTOR NAME LOCATION", 40, 0, 0, 0, NULL,0},
	/* FLD 44 */ {0,"ADDITIONAL RESPONSE DATA", 25, 0, 2, 0, NULL,0},
	/* FLD 45 */ {0,"NO USE", 76, 0, 2, 0, NULL,0},
	/* FLD 46 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 47 */ {0,"field47", 999, 0, 3, 0, NULL,0},
	/* FLD 48 */ {0,"ADDITIONAL DATA --- PRIVATE", 999, 0, 3, 0, NULL,0},
	/* FLD 49 */ {0,"CURRENCY CODE,TRANSACTION", 3, 0, 0, 0, NULL,0},
	/* FLD 50 */ {0,"CURRENCY CODE,SETTLEMENT", 3, 0, 0, 0, NULL,0},
	/* FLD 51 */ {0,"NO USE", 3, 0, 0, 0, NULL,0},
	/* FLD 52 */ {0,"PERSONAL IDENTIFICATION NUMBER DATA", 8, 0, 0, 2, NULL,0},
	/* FLD 53 */ {0,"SECURITY RELATED CONTROL INformATION", 16, 0, 0, 0, NULL,0},
	/* FLD 54 */ {0,"ADDITIONAL AMOUNTS",120, 0, 3, 0, NULL,0},
	/* FLD 55 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 56 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 57 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 58 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 59 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 60 */ {0,"NO USE", 5, 0, 3, 0, NULL,0},
	/* FLD 61 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 62 */ {0,"NO USE", 11, 0, 3, 0, NULL,0},
	/* FLD 63 */ {0,"NO USE", 11, 0, 3, 0, NULL,0},
	/* FLD 64 */ {0,"MESSAGE AUTHENTICATION CODE FIELD", 8, 0, 0, 2, NULL,0},
	/* FLD 65 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 66 */ {0,"NO USE", 1, 0, 0, 0, NULL,0},
	/* FLD 67 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 68 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 69 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 70 */ {0,"SYSTEM MANAGEMENT INformATION CODE", 3, 0, 0, 0, NULL,0},
	/* FLD 71 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 72 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 73 */ {0,"NO USE", 6, 0, 0, 0, NULL,0},
	/* FLD 74 */ {0,"NUMBER OF CREDITS", 10, 0, 0, 0, NULL,0},
	/* FLD 75 */ {0,"REVERSAL NUMBER OF CREDITS", 10, 0, 0, 0, NULL,0},
	/* FLD 76 */ {0,"NUMBER OF DEBITS", 10, 0, 0, 0, NULL,0},
	/* FLD 77 */ {0,"REVERSAL NUMBER OF DEBITS", 10, 0, 0, 0, NULL,0},
	/* FLD 78 */ {0,"NUMBER OF TRANSFER", 10, 0, 0, 0, NULL,0},
	/* FLD 79 */ {0,"REVERSAL NUMBER OF TRANSFER", 10, 0, 0, 0, NULL,0},
	/* FLD 80 */ {0,"NUMBER OF INQUIRS", 10, 0, 0, 0, NULL,0},
	/* FLD 81 */ {0,"AUTHORIZATION NUMBER", 10, 0, 0, 0, NULL,0},
	/* FLD 82 */ {0,"NO USE", 12, 0, 0, 0, NULL,0},
	/* FLD 83 */ {0,"CREDITS,TRANSCATION FEEAMOUNT", 12, 0, 0, 0, NULL,0},
	/* FLD 84 */ {0,"NO USE", 12, 0, 0, 0, NULL,0},
	/* FLD 85 */ {0,"DEBITS,TRANSCATION FEEAMOUNT", 12, 0, 0, 0, NULL,0},
	/* FLD 86 */ {0,"AMOUNT OF CREDITS", 16, 0, 0, 0, NULL,0},
	/* FLD 87 */ {0,"REVERSAL AMOUNT OF CREDITS", 16, 0, 0, 0, NULL,0},
	/* FLD 88 */ {0,"AMOUNT OF DEBITS", 16, 0, 0, 0, NULL,0},
	/* FLD 89 */ {0,"REVERSAL AMOUNT OF DEBITS", 16, 0, 0, 0, NULL,0},
	/* FLD 90 */ {0,"ORIGINAL DATA ELEMENTS", 42, 0, 0, 0, NULL,0},
	/* FLD 91 */ {0,"FILE UPDATE CODE", 1, 0, 0, 0, NULL,0},
	/* FLD 92 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 93 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 94 */ {0,"SERVICE INDICATOR", 7, 0, 0, 0, NULL,0},
	/* FLD 95 */ {0,"REPLACEMENT AMOUNTS", 42, 0, 0, 0, NULL,0},
	/* FLD 96 */ {0,"NO USE", 8, 0, 0, 0, NULL,0},
	/* FLD 97 */ {0,"AMOUNT OF NET SETTLEMENT", 16, 0, 0, 0, NULL,0},
	/* FLD 98 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 99 */ {0,"SETTLEMENT INSTITUTION ID", 11, 0, 2, 0, NULL,0},
	/* FLD 100 */ {0,"RECVEING INSTITUTION ID", 11, 0, 2, 0, NULL,0},
	/* FLD 101 */ {0,"FILENAME", 17, 0, 2, 0, NULL,0},
	/* FLD 102 */ {0,"ACCOUNT IDENTIFICATION1", 28, 0, 2, 0, NULL,0},
	/* FLD 103 */ {0,"ACCOUNT IDENTIFICATION2", 28, 0, 2, 0, NULL,0},
	/* FLD 104 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 105 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 106 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 107 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 108 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 109 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 110 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 111 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 112 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 113 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 114 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 115 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 116 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 117 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 118 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 119 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 120 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 121 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 122 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 123 */ {0,"NEW PIN DATA", 8, 0, 3, 2, NULL,0},
	/* FLD 124 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 125 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 126 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 127 */ {0,"NO USE", 999, 0, 3, 0, NULL,0},
	/* FLD 128 */ {0,"MESSAGE AUTHENTICATION CODE FIELD", 8, 0, 0, 2, NULL,0},
};


typedef struct
{
	long    sync_counter;
	char    keytype;
} AB8583_Security_Ctrl_Info;

typedef struct
{
	char    length[4];
	struct
	{
		char    account_type[3];
		char    amount_type[3];
		char    currency_code[4];
		double  amount;
	} ledger_balance_amount;

	struct
	{
		char    account_type[3];
		char    amount_type[3];
		char    currency_code[4];
		double  amount;
	} available_balance_amount;
} AB8583_Balance_Amount;

typedef struct
{
	char    encryption_key_used;
	char    mac_key_used;
	char    message_effect;
	char    no_of_unlogged_txns;
} AB8583_Message_Indicator;

typedef struct
{
	char    auth_function_code;
	char    auth_mode;
	char    auth_id_response_code[7];
	char    service_business_code[5];
	char    invoice_number[11];
} AB8583_Auth_Operation_Code;

typedef struct
{
	char    org_message_type[5];
	char    org_system_trace_number[7];
	char    org_transaction_date_time[11];
	char    org_acqr_inst_id_code[12];
	char    ora_forw_inst_id_code[12];
} AB8583_Original_Data_Elements;

typedef struct
{
	double  actual_amount_of_transaction;
	double  actual_amount_of_settlement;
	double  actual_amount_of_transaction_fee;
	double  actual_amount_of_settlement_fee;
} AB8583_Replacement_Amounts;


typedef struct
{
	char    message_type[5];
	/***
	  MESSAGE_TYPE_IDENTIFICATION N4
	  0100 授权类请求消息(授权,撤消授权,余额查询)
	  0110 授权类应答消息(授权,撤消授权,余额查询)
	  0200 金融类请求消息(取款,存款,消费,退款)
	  0210 金融类应答消息(取款,存款,消费,退款)
	  0420 冲正类报告消息(取款,存款,消费,退款,授权)
	  0430 冲正类应答消息(取款,存款,消费,退款,授权)
	  0524 对帐类报告消息(ATM结算对帐,POS结算对帐)
	  0534 对帐类应答消息(ATM结算对帐,POS结算对帐)
	  0800 网络业务管理类请求消息(重置密钥)
	  0810 网络业务管理类应答消息(重置密钥)
	  0820 网络业务管理类报告消息(状态设置,广播通知,申请重置密钥)
	  0830 网络业务管理类应答消息(状态设置,广播通知,申请重置密钥)
	 ****/

	char    primary_account_number[20];
	/* 2 PRIMARY_ACCOUNT_NUMBER N...19(LLVAR) */
	char    processing_code[7];
	/* 3 PROCESSING_CODE N6 */
	double  amount_of_transactions;
	/* 4 AMOUNT_OF_TRANSACTIONS N12 */
	double  amount_of_settlement;
	/* 5 AMOUNT_OF_SETTLEMENT N12 */
	char    transmission_date_and_time[11];
	/* 7 TRANSMISSION_DATE_AND_TIME N10 */
	long    system_trace_audit_number;
	/* 11 SYSTEM_TRACE_AUDIT_NUMBER N6 */
	char    time_of_local_transaction[7];
	/* 12 TIME_OF_LOCAL_TRANSACTION N6 */
	char    date_of_local_transaction[5];
	/* 13 DATE_OF_LOCAL_TRANSACTION N4 */
	char    date_of_settlement[5];
	/* 15 DATE_OF_SETTLEMENT N4 */
	char    date_of_capture[5];
	/* 17 DATE_OF_CAPTURE N4 */
	char    business_type[4];
	/* 18 BUSINESS_TYPE AN3 */
	char    point_of_service_entry_mode[4];
	/* 22 POINT_OF_SERVICE_ENTRY_MODE N3 */
	char    point_of_service_PIN_capture_code[3];
	/* 26 POINT_OF_SERVICE_PIN_CAPTURE_CODE N2 */
	double  fee_of_transaction;
	/* 28 FEE_OF_TRANSACTION N8 */
	double  fee_of_settlement;
	/* 29 FEE_OF_SETTLEMENT X+N8 */
	char    acquiring_institution_id_code[12];
	/* 32 ACQUIRING_INSTITUTION_IDENTIFICATION_CODE N..11(LLVAR) */
	char    forwarding_institution_id_code[12];
	/* 33 FORWARDING_INSTITUTION_IDENTIFICATION_CODE N..11(LLVAR) */
	char    track_2_data[38];
	/* 35 TRACK_2_DATA Z...37(LLVAR) */
	char    track_3_data[105];
	/* 36 TRACK_3_DATA Z...104(LLLVAR) */
	long    retrieval_reference_number;
	/* 37 RETRIEVAL_REFERENCE_NUMBER AN12 */
	char    auth_id_response[7];
	/* 38 AUTHORIZATION_IDENTIFICATION_RESPONSE AN6 */
	char    response_code[3];
	/* 39 RESPONSE_CODE AN2 */
	char    card_acceptor_terminal_id[9];
	/* 41 CARD_ACCEPTOR_TERMINAL_IDENTIFICATION ANS8
	   前两位的定义如下:
	   51 ATM终端
	   52 银行POS
	   53 商户POS */
	char    card_acceptor_id_code[16];
	/* 42 CARD_ACCEPTOR_IDENTIFICATION_CODE ANS15 */
	char    card_acceptor_name_location[41];
	/* 43 CARD_ACCEPTOR_NAME_LOCATION ANS40  */
	char    additional_response_data[26];
	/* 44 ADDITIONAL_RESPONSE_DATA ANS..25(LLVAR) */
	char    broadcasted_message[1000];
	/* 48 BROADCASTED_MESSAGE ANS...999 */
	char    currency_code_of_transaction[4];
	/* 49 CURRENCY_CODE_OF_TRANSACTION AN3 */
	char    currency_code_of_settlement[4];
	/* 50 CURRENCY_CODE_OF_SETTLEMENT AN3 */
	char    PIN[8];
	/* 52 PIN_DATA B64 */
	AB8583_Security_Ctrl_Info   security_ctrl_info;
	/* 53 SECURITY_RELATED_CONTROL_INformATION N16
	   SYNC_COUNTER N8
	   密钥同步计数器
	   RESERVED N7
	   KEY_TYPE N1
	   1 用于交换中心和成员行机构之间的PIN加密解密
	   2 用于交换中心和成员行机构之间的MAC计算
	   3 用于成员行和终端之间的PIN加密解密 */
	AB8583_Balance_Amount   balance_amount;
	/* 54 BALANCE_AMOUNT AN43
	   LENGTH N3(040)
	   LEDGER_BALANCE_AMOUNT
	   ACCOUNT_TYPE N2(CC=30,SC=10)
	   AMOUNT_TYPE N2(01)
	   CURRENCY_CODE AN3(156)
	   AMOUNT X+N12
	   AVAILABLE_BALANCE_AMOUNT
	   ACCOUNT_TYPE N2(CC=30,SC=10)
	   AMOUNT_TYPE N2(01)
	   CURRENCY_CODE AN3(156)
	   AMOUNT X+N12 */
	char    second_account_number[20];
	/* 55 SECOND_ACCOUNT_NUMBER N...19(LLVAR) */
	AB8583_Message_Indicator    message_indicator;
	/* 60 MESSAGE_INDICATOR N...005(LLLVAR)
	   ENCRYPTION_KEY_USED N1
	   PIN加密/解密所使用的密钥标识,定义如下:
	   0 不加密
	   1 旧密钥
	   2 新密钥
	   MAC_KEY_USED N1
	   0 不加密
	   1 旧密钥
	   2 新密钥
	   MESSAGE_EFFECT N1
	   0 消息用于生产环境
	   1 消息用于测试环境
	   2 ATM取款交易对帐标志
	   3 保留
	   4 银行POS取款交易对帐标志
	   5 银行POS存款交易对帐标志
	   6 商用POS消费交易对帐标志
	   7 商用POS退款交易对帐标志
	   NO_OF_UNLOGGED_TXNS N2 */
	AB8583_Auth_Operation_Code  auth_operation_code;
	/* 61 AUTHORIZATION_OPERATION_CODE N...022(LLLVAR)
	   AUTHORIZATION_FUNCTION_CODE N1
	   0 授权
	   1 撤消授权
	   2 消费
	   3 退款
	   4 取款
	   5 查询
	   AUTHORIZATION_MODE N1
	   0 不需授权
	   1 需授权
	   AUTH_ID_RESPONSE_CODE N6
	   SERVICE_BUSINESS_CODE N4
	   INVOICE_NUMBER N10 */
	char    authorizing_agent_institution_id_code[12];
	/* 62 AUTHORIZING_AGENT_INSTITUTION_IDENTIFICATION_CODE N...011(LLLVAR) */
	char    destination_institution_id_code[12];
	/* 63 DESTINATION_INSTITUTION_IDENTIFICATION_CODE N...011(LLLVAR)
	   64 */
	char    settlement_code;
	/* 66 SETTLEMENT_CODE N1 */
	char    network_management_information_code[4];
	/* 70 NETWORK_MANAGEMENT_INformATION_CODE N3 */
	char    date_of_action[7];
	/* 73 DATE_OF_ACTION N6 */
	long    number_of_credits;
	/* 74 NUMBER_OF_CREDITS N10 */
	long    reversal_number_of_credits;
	/* 75 REVERSAL_NUMBER_OF_CREDITS N10 */
	long    number_of_debits;
	/* 76 NUMBER_OF_DEBITS N10 */
	long    revsersal_number_of_debits;
	/* 77 REVERSAL_NUMBER_OF_DEBITS N10 */
	long    number_of_transfer;
	/* 78 NUMBER_OF_TRANSFER N10 */
	long    reversal_number_of_transfer;
	/* 79 REVERSAL_NUMBER_OF_TRANSFER N10 */
	long    number_of_inquiries;
	/* 80 NUMBER_OF_INQUIRIES N10 */
	double  processing_fee_amount_of_credits;
	/* 82 PROCESSING_FEE_AMOUNT_OF_CREDITS N12 */
	double  processing_fee_amount_of_debits;
	/* 84 PROCESSING_FEE_AMOUNT_OF_DEBITS N12 */
	double  amount_of_credits;
	/* 86 AMOUNT_OF_CREDITS N16 */
	double  reversal_amount_of_credits;
	/* 87 REVERSAL_AMOUNT_OF_CREDITS N16 */
	double  amount_of_debits;
	/* 88 AMOUNT_OF_DEBITS N16 */
	double  reversal_amount_of_debits;
	/* 89 REVERSAL_AMOUNT_OF_DEBITS N16 */
	AB8583_Original_Data_Elements   original_data_elements;
	/* 90 ORIGINAL_DATA_ELEMENTS N42
	   冲正交易所用的原始数据记录,内容如下:
	   ORIGINAL_DATA_ELEMENTS
	   ORG_MESSAGE_TYPE N4
	   ORG_SYSTEM_TRACE_NUMBER N6
	   ORG_TRANSACTION_DATA_TIME N10
	   ORG_ACQR_INST_ID_CODE N11
	   ORG_FORW_INST_ID_CODE N11 */
	AB8583_Replacement_Amounts  replacement_amounts;
	/* 95 REPLACEMENT_AMOUNTS AN42 */
	char    message_securty_code[8];
	/* 96 MESSAGE_SECURTY_CODE B64 */
	doublea mount_of_net_settlement;
	/* 97 AMOUNT_OF_NET_SETTLEMENT X+N16  */
	char    settlement_institution_id_code[12];
	/* 99 SETTLEMENT_INSTITUTION_IDENTIFICATION_CODE N...11(LLVAR) */
	char    receiveing_institution_id_code[12];
	/* 100 RECEIVEING_INSTITUTION_IDENTIFICATION_CODE N...11(LLVAR) */
	char    sender_institution_id_code[12];
	/* 120 SENDER_INSTITUTION_IDENTIFICATION_CODE N...11(LLVAR) */
	long    sender_reference_number;
	/* 121 SENDER_REFERENCE_NUMBER AN12 */
	char    MAC[8];
	/* 128 MESSAGE_AUTHENTICATION_CODE B64 */
}

