#!/bin/bash
################################################################################
#                               ScritTemplate                                  #
#                                                                              #
# Linux Project - "Wing'in It" w/ Chef Aminata                                 #
#                                                                              #
# Authors: Shweta, Bryan, Aminata, Bagrami, Saadeddin                          #
#                                                                              #
# Project Due Dates:                                                           #
#               April 15th, 2021 - Final Script Due                            #
#               April 6th, 2021 - First Script Due                             #
#               April 12th, 2021 - Second Script Due                           #
#               April 13th, 2021 - Final Draft Due                             #
#               April 14th, 2021 - Group Rehersal Day                          #
#                                                                              #
# Changes Made:                                                                #
#               April 1st: Created Template
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
# Insert Index Here                                                            #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#                                                                              #
# Alias:								       #
#									       #
#									       #
#									       #
#                                                                              #
#                                                                              #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#									       #
#				Welcome Screen				       #




echo "Welcome to Wing'In It!"
echo "The best chicken in Northern Virginia"
echo "At Wing'In It, we are all about big portions, remarkable flavors, and crispy goodness"
echo "To begin experiencing fresh eating and quality service, please proceed to the login page"



################################################################################
################################################################################
################################################################################
#                                                                              #
#                            Log-in/User Account Screen                        #

function createuser
{
read -p "Enter FIrst Name >> " firstName
read -p "Enter Last Name >> " lastName
read -p "Enter Address >> " address
read -p "Enter Phone Number >> " phoneNumber
read -p "Enter Email >> " email
}

function createusername
{
read -p "Enter username to create >> " username
read -p "Enter password to create >> " password
}

function welcomeMessage
{
echo "Welcome to  Wing'in it"
echo "We're here for you ,Order now"
}

echo"....USER LOG IN........"
echo "                          "
echo "Existing Customer -  Enter 1"
echo "New Customer - Enter 2"
echo "Guest - Enter 3"
echo "                           "
read -p "Select which operation you want to perform to log in (1-3) >> " option
echo "                           "
echo "You have chosen $option "

#case $option in
#1)
Username=customer1
Password=pass

while true
do
read -p "Enter Username >> " u
read -p "Enter Password >> " p

if [[ $Username == $u ]] && [[ $Password == $p ]]
then
echo "$Username, You're authenticated"
welcomeMessage
break
else 
echo "Wrong credentials. Try again"
fi
done

#2)
echo "Please create a new account with us by filling up the mandatory fields"
createuser
createusername

echo "Congratulations!! $username is successfully added"
welcomeMessage

#3)
echo "Please enter your details as a Guest"
createuser
echo "Great! You have entered as a Guest"
welcomeMessage
#esac

################################################################################
################################################################################
################################################################################
#                                                                              #
#                               Menu Page                                      #




################################################################################
################################################################################
################################################################################
#                                                                              #
#                              Place Order Page                                #




################################################################################
################################################################################
################################################################################
#                                                                              #
#                              Review & Confirm Order                          #




################################################################################
################################################################################
################################################################################
#                                                                              #
#                              Complete Your Order                             #
#			    ---Confirmation Section---                         #



################################################################################
################################################################################
################################################################################
#                                                                              #
#                               Thank you Page                                 #






#                                                                              #
#                                                                              #
#                                                                              #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
