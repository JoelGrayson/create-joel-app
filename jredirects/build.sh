#!/bin/bash

rm -rf compiled-js dist.js
tsc
(
    cd compiled-js
    echo -n 'const redirects=' > ../dist.js
    node main >> ../dist.js
    printf ';\n\nexport default redirects;\n' >> ../dist.js
)
rm -rf compiled-js
