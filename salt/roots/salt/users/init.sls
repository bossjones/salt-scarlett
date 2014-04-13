{% for usr in 'pi' %}
{{ usr }}:
  user:
    - present
{% endfor %}

{% for grp in 'pi' %}
{{ grp }}:
  group:
    - present
{% endfor %}

pi:
  user.present:
    - fullname: Raspberry Pi
    - shell: /bin/bash
    - home: /home/pi
    - uid: 2001
    - gid: 2001
    - groups:
      - wheel
      - storage
      - games
