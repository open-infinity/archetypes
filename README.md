archetypes
==========

Open Infinity Archetypes:

Installation instructions:

- Open Infinity Business Application Server 

Clone archetypes to your local disk by:
git clone https://github.com/open-infinity/archetypes

Go to directory:
cd open-infinity-archetype-bas

Install archetype by:
mvn clean install

Create new project with:
mkdir <your-project>
cd <your-project>
mvn archetype:generate -DarchetypeCatalog=local  

choose your Business Application Server archetype where x stands for your local archetype identifier

x: local -> org.openinfinity:open-infinity-bas-archetype (open-infinity-parent-archetype)
