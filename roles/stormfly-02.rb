name "stormfly-02"
description "Master role applied to stormfly-02"

default_attributes(
  :networking => {
    :interfaces => {
      :external_ipv4 => {
        :interface => "em1",
        :role => :external,
        :family => :inet,
        :address => "140.211.167.105",
        :prefix => "28",
        :gateway => "140.211.167.97"
      },
      :external_ipv6 => {
        :interface => "em1",
        :role => :external,
        :family => :inet6,
        :address => "2605:bc80:3010:700::8cde:a769"
      }
    }
  },
  :squid => {
    :cache_mem => "21000 MB",
    :cache_dir => "coss /store/squid/coss-01 128000 block-size=8192 max-size=262144 membufs=80"
  },
  :tilecache => {
    :tile_parent => "corvallis.render.openstreetmap.org",
    :tile_siblings => [
      "ascalon.openstreetmap.org",
      "jakelong.openstreetmap.org",
      "nepomuk.openstreetmap.org",
      "lurien.openstreetmap.org"
    ]
  }
)

run_list(
  "role[osuosl]",
  "role[hp-dl360-g6]",
  "role[geodns]",
  "role[tilecache]"
)
