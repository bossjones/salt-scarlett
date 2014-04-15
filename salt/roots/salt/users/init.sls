pi:
  user.present:
    - fullname: Raspberry Pi
    - shell: /bin/bash
    - home: /home/pi
    - uid: 1001
    - gid: 1001
    - groups:
      - wheel
      - storage
      - games
      - adm
      - sudo
      - pi
