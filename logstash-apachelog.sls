/etc/logstash/conf.d/apachelog_redis.conf:
    file.managed:
      - source: salt://files/apachelog_redis.conf
      - mode: 644
      - user: root
      - group: root
      - unless: test -f /etc/logstash/conf.d/apachelog_redis.conf
