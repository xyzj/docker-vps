#!/bin/bash

/root/.acme.sh/acme.sh --issue -d v2.xyzjdays.xyz --standalone --ecc --keylength ec-256
/root/.acme.sh/acme.sh --install --ecc  --installcert -d v2.xyzjdays.xyz \
			--cert-file /root/bin/ca/v2.xyzjdays.xyz.cer \
			--key-file /root/bin/ca/v2.xyzjdays.xyz.key \
                        --fullchain-file /root/bin/ca/v2.xyzjdays.xyz.full.cer
# service nginx force-reload
# service nginx restart
