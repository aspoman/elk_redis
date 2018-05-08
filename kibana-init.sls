/etc/kibana/kibana.yml:
    file.managed:
        - source: salt://files/kibana.yml
        - mode: 644
        - user: root
        - group: root
/etc/profile:
    file.append:
        - text:
          - export "PATH=/usr/share/kibana/bin/:$PATH"
