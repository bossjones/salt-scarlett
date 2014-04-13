pi:
  group.present:
    - gid: 1001
    - system: True
    - addusers:
      - pi

pi:
  user.present:
    - fullname: Raspberry Pi
    - shell: /bin/bash
    - home: /home/pi
    - uid: 1001
    - gid: 1001
    - groups:
      - wheel
      - adm
      - sudo
      - pi
