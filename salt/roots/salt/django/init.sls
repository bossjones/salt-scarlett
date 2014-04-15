## include:
##     - requirements
##     - postgresql
## 
## /home/vagrant/learning-salt/venv:
##     virtualenv.managed:
##         - no_site_packages: True
##         - runas: vagrant
##         - requirements: salt://django/requirements.txt
##         - require:
##             - pkg: python-dev
##             - pkg: python-virtualenv
##             - pkg: libpq-dev
## 
## create Django project:
##     cmd.run: 
##         - user: vagrant 
##         - name: ". venv/bin/activate && django-admin.py startproject
##       --template=https://github.com/twoscoops/django-twoscoops-project/zipball/master
## --extension=py,rst,html icecream && pip install -Ur
## icecream/requirements/local.txt && python icecream/icecream/manage.py
## syncdb --noinput"
##         - cwd: /home/vagrant/learning-salt/
##         - require:
##             - virtualenv: /home/vagrant/learning-salt/venv
##             - pkg: python-dev
##             - file: pg_hba.conf
## 
## djangouser:
##     postgres_user.present:
##         - name: {{ pillar['dbuser'] }}
##         - password: {{ pillar['dbpassword'] }}
##         - runas: postgres
##         - require:
##             - service: postgresql
## 
## djangodb:
##     postgres_database.present:
##         - name: {{ pillar['dbname'] }}
##         - encoding: UTF8
##         - lc_ctype: en_US.UTF8
##         - lc_collate: en_US.UTF8
##         - template: template0
##         - owner: {{ pillar['dbuser'] }}
##         - runas: postgres
##         - require:
##             - postgres_user: djangouser
## base.py:
##     file.managed:
##         - name: /home/vagrant/learning-salt/icecream/icecream/icecream/settings/base.py
##         - source: salt://django/base.py
##         - template: jinja
##         - require:
##             - postgres_user: djangouser
## 
