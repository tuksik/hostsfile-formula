# populate /etc/hosts with names and IP entries from your salt cluster
# the minion id has to be the fqdn for this to work

{%- set fqdn = grains['id'] %}

{%- set addrs = grains['external_ip'] %}

{%- if addrs is defined %}

{{ fqdn }}-host-entry:
  host.present:
    - ip: {{ addrs }}
    - names:
      - {{ fqdn }}

{% endif %}

