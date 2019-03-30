#!/bin/bash
echo "Build application Step 3 Import application database"
DEVPASS='q1w2e3r4'
mysql -h localhost -u root -p$DEVPASS localdev < /var/lib/mysql/localdb.sql