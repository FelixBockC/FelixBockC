#!/usr/bin/ruby
# CIT 383
# Lab <Lab10 and 002m>
# <Bock-Cubillo>, <Felix>
require 'date';
#Methods

#////////////////////////////////////////////////////////////////////////////
def getMonth()
puts ("Enter a number representing a Month: (1-12) ");
   numMonth = gets().to_i();
   monthRange = (1..12).include?(numMonth);
   
   if(monthRange)
     return numMonth;
   else
       puts("You enterd a incorrect range");
        while(!monthRange)
         puts ("Enter a number representing a Month: (1-12) ");
         numMonth = gets().to_i();
          monthRange = (1..12).include?(numMonth);
         end
   end
end


def getYear()
puts ("Enter a number representing a Year: (0-9999) ");
   numYear = gets().to_i();
   yearRange = (0..9999).include?(numYear);
   
   if(yearRange)
     return numYear;
   else
       puts("You enterd a incorrect range");
        while(!yearRange)
         puts ("Enter a number representing a Year: (0-9999) ");
         numYear = gets().to_i();
          yearRange = (1..12).include?(numYear);
         end
   end
end


def printMonth(month,year)
#makes day for the start of the month.

#makes date baced on paramaters
  startDay = Date.new(year, month,1);
#next month from given date
   nextMonth = startDay.next_month();
 #last day in month in paramater
   lastDayCur = nextMonth.prev_day();

	#output header 
	puts("Calander for #{startDay.strftime("%B, %Y")}");
	puts("");
	puts(" Sun  Mon  Tue  Wed  Thu  Fri  Sat");
	# making an array with length 7 and  default space
	days = Array.new(7, "  ");   
	
	#loop
	(startDay..lastDayCur).each do |day|
	   #pos in array
	   numRep = day.strftime("%w");
	   numRep = numRep.to_i();
	  
	   days[numRep] = day.strftime("%d");
         realDay = day.strftime("%d");
	    if  numRep == 6 || realDay == lastDayCur.strftime("%d")
		    days.each do |x|
				print("  #{x} ");
			end
		     puts(" ");
		   
			days = Array.new(7, "  ");   

		end
	end
     
	

end
#//////////////////////////////////////////////////////////////////////////////
#Main code

numM = getMonth();
numY = getYear();
printMonth(numM, numY);