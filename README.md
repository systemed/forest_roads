A stylesheet for generating tiles using Mapnik and Kosmtik/Tilemill from US Forest Service data.

Importing
=========

First download the data from http://data.fs.usda.gov/geodata/edw/datasets.php. You want the National Forest System Roads shapefile which is currently at http://data.fs.usda.gov/geodata/edw/edw_resources/shp/S_USA.RoadCore_FS.zip.

Then import it into a Postgres database, changing the database name and username accordingly:

    shp2pgsql -I -W LATIN1 S_USA.RoadCore_FS.shp forest_roads | psql -d forest_roads -q -U richard
    shp2pgsql -I -W LATIN1 S_USA.AdministrativeForest/S_USA.AdministrativeForest.shp forest_boundaries | psql -d forest_roads -q -U richard
    shp2pgsql -I -W LATIN1 S_USA.RecFacility_X.shp forest_recreation | psql -d forest_roads -q -U richard

Set the projection:
    
    select updategeometrysrid('forest_roads','geom',4326);
    select updategeometrysrid('forest_boundaries','geom',4326);
    select updategeometrysrid('forest_recreation','geom',4326);

Then fire up Kosmtik.
