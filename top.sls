base:
  '*':
    - es
    - system-init
    - httpd
    - logstash
  '192.168.253.146':
    - kibana
    - kibana-init
  '192.168.253.145':
    - redis
    - logstash_redis_es
  '192.168.253.14[4,6]':
    - logstash-apachelog
