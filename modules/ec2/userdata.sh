#!/bin/bash

cat > index.html <<EOF
<h1>Hello, to EC2 deployment</h1>
EOF

python3 -m http.server ${server_port} &