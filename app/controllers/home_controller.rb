
require 'mysql2'
class HomeController < ApplicationController
begin
# connect to the MySQL server
client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "sql123", :database => "apexindia_towerems")

rescue Mysql2::Error => e
puts "error"
ensure
# disconnect from server
end
 def show
@hh = "jhjh"
#@towerems= Towerem.all

@towerems1 = Towerem.order(:updated_date).limit(30)

#@tower=Towerem.limit(5000)
client = Mysql2::Client.new(:host => "localhost", :port => "1121", :username => "root", :password => "sql123", :database => "apexindia_towerems")
@towerems = client.query("select DATE_FORMAT(updated_time,'%H:%i:%s') as updated_time,updated_date,vol,cur_ch1,cur_ch2,cur_ch3 from merged_data_tbl order by updated_date asc,updated_time limit 20000")
@voltagearray=[];
@timearray=[];
@curvl1=[];
@curvl2=[];
@curvl3=[];
#@dd=@towerems.all.map { |u| { updated_date: u.updated_date, vol: u.vol } }
#puts @dd
@towerems.each do |tim|
@voltagearray.push(tim['vol'])
@timearray.push(tim['updated_time'])
@curvl1.push(tim['cur_ch1'])
@curvl2.push(tim['cur_ch2'])
@curvl3.push(tim['cur_ch3'])
#puts tim['vol']
end
#puts @voltagearray
#puts @timearray
#puts @merged_data
end
def getlateddata
@lates ="jolly"
render json: { hello: @lates }
end
#merged_data = client.query("SELECT * FROM merged_data_tbls")
#@show_data= merged_data
#if (merged_data.count==0)
#puts "nothing"
#else
#puts "full"
#end
end
