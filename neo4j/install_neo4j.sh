#!/usr/bin/env bash
#!/usr/bin/env bash
echo "************************"
echo "*** Installing Neo4J ***"
echo "************************"

# Add the Neo4J key into the apt package manager:
wget -O - http://debian.neo4j.org/neotechnology.gpg.key | apt-key add -

# Add Neo4J to the Apt sources list:
echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list

# Update the package manager:
apt-get -y update

# Install Neo4J:
apt-get install -y neo4j
