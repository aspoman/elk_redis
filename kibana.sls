kibana-install:
    pkg.installed:
        - pkgs:
          - java
        - unless: java -version
    file.managed:
        - name: /etc/yum.repos.d/kibana.repo
        - source: salt://files/kibana.repo
        - mode: 644
        - user: root
        - group: root
    cmd.run:
        - name: rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch && yum install kibana -y
        - require:
          - file: /etc/yum.repos.d/kibana.repo
        - unless: test -d /usr/share/kibana
