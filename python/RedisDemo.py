#coding:utf-8
import redis
#lredis-server保持开启状态 如果在客户端设置了密码 添加password=密码即可
pool = redis.ConnectionPool(host='127.0.0.1', port=6379, db=0)
r=redis.StrictRedis(connection_pool=pool)
#字符串
r.set('test','aaa')
print r.get('test');
#列表
#注意python、lrange两个range的范围
x=0
for x in range(0,11):
	r.lpush('list',x)
	x=x+1
print r.lrange('list','0','10')
#雜湊
dict_hash={'name':'tang','password':'tang_passwd'}
r.hmset ('hash_test',dict_hash)
print r.hgetall('hash_test')
#集合
r.sadd('set_test','aaa','bbb')
r.sadd('set_test','ccc')
r.sadd('set_test','ddd')
print r.smembers('set_test')
