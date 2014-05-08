python-setuptools:
  pkg:
    - installed

easyinstall-pip:
  cmd.run:
    - name: easy_install pip
    - unless: which pip
    - require:
      - pkg: python-setuptools
    - require_in:
      - pip: pip

pip:
  pip:
    - installed
    - require:
      - cmd: easyinstall-pip

distribute:
  pip:
    - installed
    - upgrade: True
    - require:
      - pip: pip
