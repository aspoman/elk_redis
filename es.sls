es-install:
    pkg.installed:
      - pkgs:
        - java
      - unless: java -version
    file.managed:
        - name: /etc/yum.repos.d/elasticsearch.repo
        - source: salt://files/elasticsearch.repo
        - mode: 644
        - user: root
        - group: root
    cmd.run:
        - name: rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch&&yum install elasticsearch    -y
        - require:
          - file: /etc/yum.repos.d/elasticsearch.repo 
        - unless: test -d /usr/share/elasticsearch
es-init:
    file.managed:
        - name: /etc/elasticsearch/elasticsearch.yml 
        - source: salt://files/elasticsearch.yml
        - mode: 644
        - user: root
        - group: root
        - template: jinja
        - NODE_NAME: {{ grains['ipv4'][1] }}
        - IP1: 192.168.253.144
        - IP2: 192.168.253.145
        - IP3: 192.168.253.146
        - require:
          - cmd: es-install
    service.running:
      - enable: True
      - name: elasticsearch
      - watch:
        - file: /etc/elasticsearch/elasticsearch.yml
