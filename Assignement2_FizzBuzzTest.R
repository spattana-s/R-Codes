##################################################
#  Course     : Social Network Analysis BIA658-WS 
#  Assignment : HW2 
#  First Name : Sanjay Kumar
#  Last Name  : Pattanayak
#  Id			    : 10431486
#  Date       : 09/12/2018
#  Comments   : Steps are explained below
##################################################

# Clears the Environment
rm(list=ls())

# s is a vector of numbers from 1 to 100
s<-seq(from=1,to=100,by=1)

# Prints s i.e list of 1 to 100
s

# Loop to check the number and print as per the question

#Program in R that prints the numbers from 1 to 100. 
#But for multiples of three print "Fizz" instead of the number 
#and for the multiples of five print "Buzz". For numbers which
#are multiples of both three and five print "FizzBuzz".

for (i in s){
  if (i%%3==0 & i%%5==0){
    print ('FizzBuzz')
  }
  else if (i%%3==0){
    print('Fizz')
  }
  else if (i%%5==0){
    print('Buzz')
  }
  else {
    print(i)
  }
}


######The End########
######Thank You######

