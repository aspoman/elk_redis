/etc/logstash/conf.d/redis_es.conf:
    file.managed:
      - source: salt://files/redis_es.conf
      - mode: 644
      - user: root
      - group: root
      - unless: test -f /etc/logstash/conf.d/redis_es.conf
