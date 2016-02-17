require 'green_shoes'
require 'open-uri'
require 'nokogiri'
require 'Mechanize'


def foo
Shoes.app(title: "VTU results",width: 1000,height: 500) do
 flow width: 1000, height:500 do
   flow width: 0.7, height: 0.2 do
    # background rgb(0,157,228)
    end
  # flow width: 0.3, height: 0.2 do
  # end
  # flow width: 1.0,height: 0.8 do
   # flow align: "center"
   background "#F3F".."#F90"
base_url="http://www.fastvturesults.com/result"





	
usn=ask("Enter your USN number:")

base_url='http://results.vtu.ac.in'
agent=Mechanize.new

  

agent.get(base_url)
form1=agent.page.forms[0]
usn_field=form1.fields.first
usn_field.value=usn
agent.submit(form1,form1.buttons.first)
# puts agent.page.css("b").text
# puts agent.page.css("td:nth-child(4)").text
# puts agent.page.css("table+ table tr:nth-child(2) td").text
data=[]
agent.page.at("table+ table tr:nth-child(2) td").search('tr').each do |tr|
  data << tr.search('td').map(&:text)

end
total=0
x="\n"
(2..9).each do |i|
 x=x+"\n\n---------------"+"  |"+data[i][4]+"|  "+data[i][0]+"   "+data[i][1]+"   +   "+data[i][2]+"   =   "+data[i][3]
 
 
 total=total+data[i][3].to_i
 end
 # puts "Total"
# puts total
	# puts x
x=x+"\nTotal\n"+total.to_s
# puts agent.page.css("b").text
# puts 
file1=ask_save_file()
f1=open(file1,"a+")
f1.write(x)
   @note=para "Your USN is"+usn.to_s
      flow width: 0.7, height: 0.2 do
    # background rgb(0,157,228)
    para "made by Shawn"
    end
   @push=button "Get Result" ,align: "center"
   

   @push.click{
 

   	@note.replace "saved to "+file1.to_s
   	 # @note.replace x
    @push.clear
   	@push1=button "Check another USN ",align: "left"
   	@push1.click{
    foo()
   	}}
   
  # end

 end
end 
end
foo()