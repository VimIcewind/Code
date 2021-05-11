#include <stdlib.h>
#include <stdio.h>
#include <mysql.h>

int main()
{
	MYSQL *conn_ptr;
	MYSQL_RES *res_ptr;
	MYSQL_ROW sqlrow;
	MYSQL_FIELD *fd;
	int res, i, j;

	conn_ptr = mysql_init(NULL);
	if (!conn_ptr) {
		printf("mysql_init failed\n");
		return EXIT_FAILURE;
	}
	conn_ptr = mysql_real_connect(conn_ptr, "localhost", "root", "root", "student", 0, NULL, 0);
	if (conn_ptr) {
		res = mysql_query(conn_ptr, "insert into information values(2,'Ann','555','sd')");   //可以把insert语句替换成delete或者update语句，都一样的
		// res = mysql_query(conn_ptr, "update information set address = 'ShanDong' where name = 'Ann'");
		// res = mysql_query(conn_ptr, "delete from information where name = 'Ann'");
		if (!res) {	//输出受影响的行数
			printf("Query OK, %lu row affected\n", (unsigned long)mysql_affected_rows(conn_ptr));
		} else {	//打印出错误代码及详细信息
			fprintf(stderr, "Error %d: %sn", mysql_errno(conn_ptr), mysql_error(conn_ptr));
		}

		res = mysql_query(conn_ptr, "select id, name, serial, address from information");	//查询语句
		if (res) {
			printf("SELECT error:%s\n", mysql_error(conn_ptr));
		} else {
			res_ptr = mysql_store_result(conn_ptr);	//取出结果集
			if (res_ptr) {
				printf("%lu Rows\n", (unsigned long)mysql_num_rows(res_ptr));
				j = mysql_num_fields(res_ptr);
				while ((sqlrow = mysql_fetch_row(res_ptr))) {	//依次取出记录
					for (i = 0; i < j; i++)
						printf("%s\t", sqlrow[i]);	//输出
					printf("\n");
				}
				if (mysql_errno(conn_ptr)) {
					fprintf(stderr, "Retrive error:s\n", mysql_error(conn_ptr));
				}
			}
			mysql_free_result(res_ptr);
		}
	} else {
		printf("Connection failed\n");
	}
	mysql_close(conn_ptr);
	return EXIT_SUCCESS;
}
