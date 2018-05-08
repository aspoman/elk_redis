http-install:
    pkg.installed:
      - pkgs:
        - httpd
      - unless: test -d /etc/httpd
http-init:
    service.running:
          - enable: True
          - name: httpd
