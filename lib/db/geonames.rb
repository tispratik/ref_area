module Db
  class Geonames
    
    @@countries = {}
    @@regions = {}
    @@cities = {}
    
    @@countries_file = {}
    @@regions_file = {}
    @@cities_file = {}
    
    def initialize(options = {})
      @@countries_file = options[:countries]
      @@regions_file = options[:regions]
      @@cities_file = options[:cities]
    end
    
    def import
      import_countries(File.open(@@countries_file))
      puts "There are now #{Country.count} Countries in the system."
      
      import_regions(File.open(@@regions_file))
      puts "There are now #{Region.count} Regions in the system."
      
      import_cities(File.open(@@cities_file))
      puts "There are now #{City.count} Cities in the system."
    end
    
    ##
    # import_countries
    # [0] iso alpha2
    # [1] iso alpha3
    # [2] iso numeric
    # [3] fips code
    # [4] name
    # [5] capital
    # [6] areaInSqKm
    # [7] population
    # [8] continent
    # [9] top level domain
    # [10] Currency code
    # [11] Currency name
    # [12] Phone
    # [13] Postal Code Format
    # [14] Postal Code Regex
    # [15] Languages
    # [16] Geoname id
    # [17] Neighbours
    # [18] Equivalent Fips Code
    #
    def import_countries(file)
      Country.transaction do
        while (line = file.gets)
          next if line.match(/^#/)
          line = line.split(/\t/)
          
          c = Country.create(
            :iso2 => line[0], :iso3 => line[1], :ison => line[2],
            :name => line[4], :capital => line[5], :area => line[6],
            :continent => line[8], :currency_code => line[10], :currency_name => line[11],
            :phone => line[12], :geoname_id => line[16]
          )
          @@countries[line[0]] = c.id
        end
      end
    end
    
    def import_regions(file)
      Region.transaction do
        while (row = file.gets)
          row = row.split(/\t/)
          region = Region.create(:country_id => @@countries[(row[0].split("."))[0]], :name => row[1])
          @@regions[(row[0].split("."))[1]] = region.id
        end
      end
    end
    
    ##
    # import_cities Schema (same for 1000, 5000 and 15000+ cities)
    # ---------------------------------------------------------------------------------------
    # [0] geonameid         : integer id of record in geonames database
    # [1] name              : name of geographical point (utf8) varchar(200)
    # [2] asciiname         : name of geographical point in plain ascii characters, varchar(200)
    # [3] alternatenames    : alternatenames, comma separated varchar(4000)
    # [4] latitude          : latitude in decimal degrees (wgs84)
    # [5] longitude         : longitude in decimal degrees (wgs84)
    # [6] feature class     : see http://www.geonames.org/export/codes.html, char(1)
    # [7] feature code      : see http://www.geonames.org/export/codes.html, varchar(10)
    # [8] country code      : ISO-3166 2-letter country code, 2 characters
    # [9] cc2               : alternate country codes, comma separated, ISO-3166 2-letter country code, 60 characters
    # [10] admin1 code       : fipscode (subject to change to iso code), isocode for the us and ch, see file admin1Codes.txt for display names of this code; varchar(20)
    # [11] admin2 code       : code for the second administrative division, a county in the US, see file admin2Codes.txt; varchar(80)
    # [12] admin3 code       : code for third level administrative division, varchar(20)
    # [13] admin4 code       : code for fourth level administrative division, varchar(20)
    # [14] population        : integer
    # [15] elevation         : in meters, integer
    # [16] gtopo30           : average elevation of 30'x30' (ca 900mx900m) area in meters, integer
    # [17] timezone          : the timezone id (see file timeZone.txt)
    # [18] modification date : date of last modification in yyyy-MM-dd format
    #
    def import_cities(file)
      City.transaction do
        while (row = file.gets)
          row = row.split(/\t/)
          
          city = City.create(
            :geoname_id => row[0], :country_id => @@countries[row[8]], :region_id => @@regions[row[10]],
            :name => row[1], :name_ascii => row[2], :lat => row[4], :lng => row[5],
            :time_zone => row[17]
          )
        end
      end
    end
  end
end