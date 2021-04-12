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
#               April 1st: Created Template				       #
#		April 3rd: Created Menu order system			       #
#		April 12th: Code finished w/font revisions		       #
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
# Alias and list of Arrays:                                                    #

#declare variables with pricing

#alias

################################################################################
################################################################################
################################################################################
#                               Welcome Screen                                 #

clear

echo "-------------------------------------------------------------------------"
toilet --metal "WING'IN IT"
toilet --metal "w/ Chef"
toilet --metal "Aminata"
echo "-------------------------------------------------------------------------"
sleep 5
clear
echo "Welcome to Wing'In It!"
sleep 2
echo "                      "
echo "Home to the Very Best Chicken in all of Northern Virginia"
sleep 2
echo "                           "
echo "Our Mission is to Deliver the Freshest of Ingredients and Fuse Those With Our Passion For Wings"
sleep 2
echo " "
echo "At Wing'In It, We are All about BIG Portions, Remarkable Flavors, and Crispy Goodness"
sleep 2
echo "                                           "
echo "To Begin the Fresh Eating and Quality Service Expirecne; please proceed to the Login page"
sleep 2
echo " "
echo "And Thank YOU for dining with Us Today!"
clear
#								               #
################################################################################
################################################################################
################################################################################
#                                                                              #
#                            Log-in/User Account Screen                        #

function createUserDetails
{
read -p "Enter FIrst Name >> " firstName
echo "                          "
read -p "Enter Last Name >> " lastName
echo "                    "
read -p "Enter Address >> " address
echo "                       "
read -p "Enter Phone Number >> " phoneNumber
echo "                            "
read -p "Enter Email >> " email
echo "                        "
}
function createUserName
{
read -p "Enter username to create >> " createUsername
echo "                                 "
read -p "Enter password to create >> " createPassword
}


function welcomeMessage
{
echo -e "\nWelcome to Wing'in it"
echo -e "\nWe're here for you ,Order now"
}

function loginMethod
{
echo "--------------------------------------------------------------------"
echo "                            USER LOG IN                             "
echo "--------------------------------------------------------------------"
echo " "
echo -e "Existing Customer -  \tEnter 1"
echo "                      "
echo -e "New Customer - \t\tEnter 2"
echo "                         "
echo -e "Guest - \t\tEnter 3"
echo "                           "
read -p "Select which operation you want to perform to log-in (1-3) >> " option
echo "                           "
echo "You have chosen $option "
}

loginMethod

userName="customer1"
password="pass"

case $option in
1)

while true
do
read -p "Enter Username >> " u
read -p "Enter Password >> " p

if [[ $userName == $u ]] && [[ $password == $p ]]
then
echo "$Username, You're authenticated"
welcomeMessage
break
else 
read -p "Wrong credentials. Do you want change login method!!! Enter Y or N >> " changeLogin
if [[ $changeLogin == "Y" ]]
then
loginMethod
else
echo "Wrong Credetials. Please enter Again"
fi

fi
done
;;
2)
echo -e "\nPlease create a new account with us by filling up the mandatory fields"
createUserDetails
createUserName

echo -e "\nCongratulations!! $createUsername is successfully added"
welcomeMessage
;;
3)
echo -e "\nPlease enter your details as a Guest"
createUserDetails
echo -e "\nGreat! You have entered as a Guest"
welcomeMessage
;;
esac

clear
echo "--------------------------------------------------------------------"
echo "                          PICKUP/DELIVERY                           "
echo "--------------------------------------------------------------------"

echo -e "\nWould you like to pickup or deliver?"

echo -e "\nFor Pickup - \t\t\tEnter 1"
echo -e "\nFor Delivery( $ 5.00) - \tEnter 2"
echo "                           "
read -p "Select which option  you want to perform (1-2) >> " pickupORdelivery
echo "                           "
echo -e "\nYou have chosen: $pickupORdelivery"
deliveryCharges=0


if [[ $pickupORdelivery ==  2  ]]
then
deliveryCharges=5
fi

echo -e "\n\$$deliveryCharges are delivery charges"




################################################################################
################################################################################
#                                                                              #
#                              Place Order Page                                #
clear
echo "--------------------------------------------------------------------"
echo "                          MENU SELECTION                            "
echo "--------------------------------------------------------------------"
echo " "
echo "PLEASE SELECT FROM OUR WIDE VARIETY OF WINGS,SIDES AND SPECIALS"
echo "                                                       "
declare -a wing_size=("Small" "Medium" "Large")
declare -a wing_size_price=("10" "15" "20")
echo "-------------------------------------"
echo "             Wing Sizes:             "
echo "-------------------------------------"
counter=1
for w in ${wing_size[@]}
do 
echo -e "\n$counter.$w \t\tPrice: \$${wing_size_price[$counter-1]} "
((counter++))
done
echo " "
echo "--------------------------------"
echo " "
read -p "Please Select an Option [1-3]: > " wing_size_selection
echo "                                     "
read -p "How many do you need >>" total_wing_quantity
echo "                                   "

selected_wing_size="${wing_size[$wing_size_selection-1]}"
echo "$selected_wing_size ,Great Selection"

echo  "Quantity : $total_wing_quantity"
echo  "Price : ${wing_size_price[$wing_size_selection-1]}"
price_for_selected_wing_size=$(( "$total_wing_quantity * ${wing_size_price[$wing_size_selection-1]}" ))
echo "                                          "
# for selection of protein

declare -a protein_options=("Regular" "DrumOnly" "FlatOnly" "BreadedCauliflower")
declare -a protein_options_price=("0" "0" "0" "0")

echo "--------------------------------"
echo "  B. CHOICE OF PROTEIN:"
echo "--------------------------------"
counter=1
for p in ${protein_options[@]}
do 
echo "$counter.$p        - Price: \$${protein_options_price[$counter-1]} "
((counter++))
done
echo "--------------------------------"
echo "                                "
read -p "Please Select one Option [1-4]: > " protein_options_selection
echo "                                      "

selected_protein="${protein_options[$protein_options_selection-1]}"
echo "$selected_protein, Great Selection"
echo "                                        "
echo "Price : ${protein_options_price[$protein_options_selection-1]}"

price_for_selected_protein="${protein_options_price[$protein_options_selection-1]}" 

#echo "Total Price is $price_for_selected_protein"
echo "                                       "
#for selection of sauce

declare -a sauce_options=("Buffalo" "BBQ" "ThaiCurry" "SpicyGarlic")
declare -a sauce_options_price=("0" "0" "0" "0")
echo "-------------------------------"
echo "      C. CHOICE OF SAUCE:"
echo "-------------------------------"
counter=1

for s in ${sauce_options[@]}
do 
echo "$counter.$s       - Price: \$${sauce_options_price[$counter-1]} "
((counter++))
done
echo "--------------------------------"
read -p "Please Select one Option [1-4]: > " sauce_options_selection
echo "                                      "

selected_sauce="${sauce_options[$sauce_options_selection-1]}"
echo -e "\n$selected_sauce, Great Selection"
echo "                                  "
echo "Price : ${sauce_options_price[$sauce_options_selection-1]}"

#read -p "How many do you need >>" total_wing_quantity

#echo -e "\nQuantity : $total_wing_quantity"
#echo -e "\nPrice : $price_for_selected_sauce"
price_for_selected_sauce="${sauce_options_price[$sauce_options_selection-1]}" 
#echo "Total Price is $price_for_selected_sauce"
echo "                                                  "
# for selection of side

declare -a side_options=("PotatoWedges" "Fries" "ExtraSauce" "Celery" "ExtraCrispyWings" "NoSide")
declare -a side_options_price=("3" "2" "1" "1" "0" "0")

echo "-------------------------------"
echo "      D. CHOICE OF SIDE:"
echo "-------------------------------"
counter=1

for si in ${side_options[@]}
do 
echo "$counter.$si     -  Price: \$${side_options_price[$counter-1]} "
((counter++))
done
echo "--------------------------------"
read -p "Please Select one Option [1-4]: > " side_options_selection
echo "                                     "
read -p "How many do you need >>" total_side_quantity
echo "                                   "

selected_side="${side_options[$side_options_selection-1]}"
echo "$selected_side, Great Selection"

echo  "Quantity : $total_side_quantity"
echo  "Price : ${side_options_price[$side_options_selection-1]}"
price_for_selected_side=$(( "$total_side_quantity * ${side_options_price[$side_options_selection-1]}" ))
echo "                                     "
# for selection of dresssing


declare -a dressing_options=("BluCheese" "Ranch" "NoDressing")
declare -a dressing_options_price=("0" "0" "0")


echo "-------------------------------"
echo "      E. CHOICES OF DRESSING:"
echo "-------------------------------"
counter=1

for d in ${dressing_options[@]}
do 
echo "$counter.$d - Price: \$${dressing_options_price[$counter-1]} "
((counter++))
done
echo "--------------------------------"
read -p "Please Select one Option [1-3]: > " dressing_options_selection
echo "                                      "

selected_dressing="${dressing_options[$dressing_options_selection-1]}"
echo "$selected_dressing , Great Selection"

echo "Price :$price_for_selected_dressing"


price_for_selected_dressing="${dressing_options_price[$dressing_options_selection-1]}" 
echo "                                                 "
# for selection of beverages

declare -a beverage_options=("Soda" "TeaSweet" "JustTea" "H2O")
declare -a beverage_options_price=("2" "2" "2" "2")

echo "-------------------------------"
echo "      F. CHOICE OF BEVERAGE:"
echo "-------------------------------"
counter=1

for b in ${beverage_options[@]}
do 
echo "$counter.$b        - Price: \$${beverage_options_price[$counter-1]} "
((counter++))
done
echo "--------------------------------"
read -p "Please Select one Option [1-4]: >> " beverage_options_selection
echo "                                     "
read -p "How many do you need >>" total_beverage_quantity
echo "                                   "

selected_beverage="${beverage_options[$beverage_options_selection-1]}"
echo "$selected_beevrage, Great Selection"

echo  "Quantity : $total_beverage_quantity"
echo  "Price : ${beverage_options_price[$beverage_options_selection-1]}"
price_for_selected_beverage=$(( "$total_beverage_quantity * ${beverage_options_price[$beverage_options_selection-1]}" ))
echo "                                               "

clear
################################################################################
################################################################################
################################################################################
#                                                                              #
#                              Review & Confirm Order                          #



echo "-------------------------------------------------------------------------"
echo "                              ORDER SUMMARY                              "
echo "-------------------------------------------------------------------------"
echo  "FOR YOUR ORDER TODAY YOU HAVE CHOSEN: "
echo  "Size of Wing                   - $selected_wing_size with $total_wing_quantity quantity of wing"
echo  "Choice of Protein              - $selected_protein"
echo  "Choice of Sauce                - $selected_sauce"
echo  "choice of Side                 - $selected_side  with $total_side_quantity"
echo  "Choice of Dressing             - $selected_dressing"
echo  "Choice of Beverage             - $selected_beverage with $total_beverage_quantity quantity of beverage"

echo "                                   " 
read -p "Is this your Order? echo Yes/No >> " confirm_order
if [[ "$confirm_order" == "y" ]]
then
echo "My Pleasure, Please proceed for checkout"
fi
echo "                                          "
sleep 3
clear

################################################################################
################################################################################
################################################################################
#                                                                              #
#                              Complete Your Order                             #
#                           ---Confirmation Section---                         #

echo "-------------------------------------------------------------------------"
echo "                                CHECKOUT                                 "
echo "-------------------------------------------------------------------------"

echo "Would you like to pay by cash or Card?"

echo "For Cash -  Enter 1"
echo "For Card -  Enter 2"
echo "                           "
read -p "Select which option you want to perform (1-2) >> "  cashORcard
echo "                           "
echo "You have chosen $cashORcard"


if [[ $cashORcard ==  2  ]]
then
read -p "Enter your card number >> " cardNumber
read -p "Enter Expiration date of the card >> " expireDate
read -p "Enter cvv number >> " cvvNum
echo -e "\nYour Payment information is stored and being verified"
echo -e "\nGreat! Your card has been verified.Please proceed with Total Payment"
fi
echo "                                                 "

order_cost=$(( $price_for_selected_wing_size + $price_for_selected_protein + $price_for_selected_side + $price_of_selected_sauce + $price_for_selected_dressing + $price_for_selected_beverage ))

total_tax=$(( $order_cost * 8/100 ))
total=$(( $order_cost  + $deliveryCharges + $total_tax ))

clear

echo "------------------------------------------------------------------------"
echo "                                INVOICE AMOUNT                          "
echo "------------------------------------------------------------------------"

echo "                                                        "
echo "$selected_wing_size                       -$total_wing_quantity            --$price_for_selected_wing_size"
echo "$selected_protein                                                          --$price_for_selected_protein"
echo "$selected_sauce                                                            --$price_for_selected_side" 
echo "$selected_side                             -$total_side_quantity           --$price_for_selected_sauce"
echo "$selected_dressing                                                         --$price_for_selected_dressing"
echo "$selected_beverage                         - $total_beverage_quantity      --$price_for_selected_beverage"
echo "Delvery Charges                                                            --$deliveryCharges"
echo "Tax at 0.08%                                                               --$total_tax"
echo "                                                                        -----------------------------------"
echo "TOTAL                                                                                $total"
echo "                                                                        -----------------------------------" 

sleep 10

echo "------------------------------------------------------------------------"
echo "	                             ORDER CONFIRMATION                       "
echo "------------------------------------------------------------------------"
echo -e "\nMy Pleasure, let me get that sent to the kitchen right away"
echo -e "\nYour order will be ready in 20mins"
echo -e "\nYou will receive an order confirmation in the email address you provided at registration"
echo -e "\nAs a show of our appreciation, we're giving you 10% OFF of your next order"
echo -e "\nIf you ever have any questions, concerns, or would like to rate our service"
echo -e "\nPlease feel free to contact our customer service center any time at 555-777-7777"
echo "                                               "

sleep 5
clear

################################################################################
################################################################################
################################################################################
#                                                                              #
#                               Thank you Page                                 #


echo "-------------------------------------------------------------------------"
echo "                                  THANK YOU                              "
echo "-------------------------------------------------------------------------"

echo "Thank you for your purchase"
echo "                             "
echo "Here at WingIn It, we value each and every customer"
echo "                                 "
echo "For more than 25 years,our company has been focused on providing the best-ever fried chicken experience, along with attentive service to valued customers"
echo "                                     "
echo "We appreciate having you as a customer and look forward to serving you again "
echo "                                                                      "
echo "---------------------------------------------------------------------------------------------------------"
figlet THANK YOU, PLEASE VISIT AGAIN
echo "---------------------------------------------------------------------------------------------------------"
