#!/bin/bash
################################################################################
#                               ScritTemplate                                  #
#                                                                              #
# Linux Project - "Wing'in It" w/ Chef Shweta                                  #
#                                                                              #
# Authors: Shweta, Bryan, Bagrami, Saadeddin                                   #
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
toilet --metal "Shweta"
echo "-------------------------------------------------------------------------"
sleep 1
clear
echo "Welcome to Wing'In It!"
sleep 1
echo "                      "
echo "Home to the Very Best Chicken in all of Northern Virginia."
sleep 1
echo "                           "
echo "Our Mission is to Deliver the Freshest of Ingredients and Fuse Those With Our Passion For Wings."
sleep 1
echo " "
echo "At Wing'In It, We are All about BIG Portions, Remarkable Flavors, and Crispy Goodness."
sleep 1
echo "                                           "
echo "To Begin the Fresh Eating and Quality Service Expirecne; please proceed to the Login page."
sleep 1
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

while true
do

case $option in
1)

read -p "Enter Username >> " u
read -p "Enter Password >> " p

if [[ $userName == $u ]] && [[ $password == $p ]]
then
echo "$Username, You're authenticated"
welcomeMessage
break
else 
read -p "Wrong credentials. Do you want change login method!!! Enter Y or N >> " changeLogin
if [[ $changeLogin == "y" ]]
then
loginMethod
else
echo "Wrong Credetials. Please enter Again"
fi

fi
;;
2)
echo -e "\nPlease create a new account with us by filling up the mandatory fields"
createUserDetails
createUserName

echo -e "\nCongratulations!! $createUsername is successfully added"
welcomeMessage
break
;;
3)
echo -e "\nPlease enter your details as a Guest"
createUserDetails
echo -e "\nGreat! You have entered as a Guest"
welcomeMessage
break
;;
esac
done

sleep 3
clear
echo "--------------------------------------------------------------------"
echo "                          PICKUP/DELIVERY                           "
echo "--------------------------------------------------------------------"

echo -e "\nWould you like Pick-UP or Delivery Today?"

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
echo "  PLEASE SELECT FROM OUR WIDE VARIETY OF WINGS, SIDES AND SPECIALS  "
echo " "
echo "  WE HAVE A VARIETY TO SELECT FROM:                                 "
echo "  "
echo "  From Small to Large Sizes					  "
echo "	"
echo "  The amount of wings comes in 10, 15, to 20 in the large		  "
echo " "
echo "  Then you can choose your pick of protein			  "
echo " "
echo "  You can pick from Regular, Drum_Only Flat_Only,	and		  "
echo "  yes, we even have vegan options with Breaded_Cauliflower wings!   "
echo " "
echo "  You will also have a pick of one of our awesome sides,beverages,  "
echo "  and house made dressings.					  "
echo " "
echo " Enjoy!								  "
#                                              _
#                                   .-.  .--''` )
#                                _ |  |/`   .-'`
#                               ( `\      /`
#                               _)   _.  -'._
#                             /`  .'     .-.-;
#                             `).'      /  \  \
#                            (`,        \_o/_o/__
#                             /           .-''`  ``'-.
#                             {         /` ,___.--''`
#                             {   ;     '-. \ \
#           _   _             {   |'-....-`'.\_\
#          / './ '.           \   \          `"`
#       _  \   \  |            \   \
#      ( '-.J     \_..----.._ __)   `\--..__
#     .-`                    `        `\    ''--...--.
#    (_,.--""`/`         .-             `\       .__ _)
#            |          (                 }    .__ _)
#            \_,         '.               }_  - _.'
#              \_,         '.            } `'--'
#                  '._.     ,_)          /
#                     |    /           .'
#                      \   |    _   .-'
#                       \__/;--.||-'
#                        _||   _||__   __
#                 _ __.-` "`)(` `"  ```._)
#                (_`,-   ,-'  `''-.   '-._)
#               (  (    /          '.__.'
#                `"`'--'
#
sleep 1
clear

declare -a wing_size=("Small" "Medium" "Large")
declare -a wing_size_price=("10" "15" "20")
echo "-------------------------------------"
echo "             Wing Sizes              "
echo "-------------------------------------"
counter=1
for w in ${wing_size[@]}
do 
echo -e "\n$counter.$w \t\tPrice: \$${wing_size_price[$counter-1]} "
((counter++))
done
echo " "
echo "-------------------------------------"
echo " "
read -p "Please Select an Option [1-3]: > " wing_size_selection
echo "                                     "
read -p "How many do you need >>" total_wing_quantity
echo "                                   "

selected_wing_size="${wing_size[$wing_size_selection-1]}"
echo "Your Choice was a size $selected_wing_size order."
echo " "
echo  "Quantity : $total_wing_quantity"
echo " "
echo  "Price : \$${wing_size_price[$wing_size_selection-1]}"
price_for_selected_wing_size=$(( "$total_wing_quantity * ${wing_size_price[$wing_size_selection-1]}" ))
echo "                                          "
sleep 3
clear

# for selection of protein

declare -a protein_options=("Regular" "Drum_Only" "Flat_Only" "Breaded_Cauliflower")
declare -a protein_options_price=("0" "0" "0" "0")

echo "------------------------------------------"
echo "          CHOICE OF PROTEIN               "
echo "------------------------------------------"
counter=1
for p in ${protein_options[@]}
do 
echo -e "\n$counter.$p" # not needed ==>  \t\tPrice: \$${protein_options_price[$counter-1]} "
((counter++))
done
echo " "
echo "------------------------------------------"
echo "                                "
read -p "Please Select an Option [1-4]: > " protein_options_selection
echo "                                      "

selected_protein="${protein_options[$protein_options_selection-1]}"
echo "Your Choice of Protein is $selected_protein"
echo "                                        "
#echo "Price : ${protein_options_price[$protein_options_selection-1]}"

price_for_selected_protein="${protein_options_price[$protein_options_selection-1]}" 

#echo "Total Price is $price_for_selected_protein"
echo "                                       "

sleep 3
clear

#for selection of sauce

declare -a sauce_options=("Buffalo" "BBQ" "ThaiCurry" "SpicyGarlic")
declare -a sauce_options_price=("0" "0" "0" "0")

echo "------------------------------------------"
echo "            CHOICE OF SAUCE               "
echo "------------------------------------------"
counter=1

for s in ${sauce_options[@]}
do 
echo -e "\n$counter.$s" # again not needed no price \t\tPrice: \$${sauce_options_price[$counter-1]} "
((counter++))
done
echo " "
echo "------------------------------------------"
read -p "Please Select an Option [1-4]: > " sauce_options_selection
echo "                                      "
selected_sauce="${sauce_options[$sauce_options_selection-1]}"
echo "Your Choice of Sauce is $selected_sauce"
echo "                                  "
#echo "Price : ${sauce_options_price[$sauce_options_selection-1]}"

#read -p "How many do you need >>" total_wing_quantity

#echo -e "\nQuantity : $total_wing_quantity"
#echo -e "\nPrice : $price_for_selected_sauce"
price_for_selected_sauce="${sauce_options_price[$sauce_options_selection-1]}" 
#echo "Total Price is $price_for_selected_sauce"
#echo "                                                  "

sleep 3
clear

# for selection of side

declare -a side_options=("PotatoWedges" "Fries" "Extra_Sauce" "Celery" "Extra_Wings" "No_Side")
declare -a side_options_price=("3" "2" "1" "1" "3" "0")

echo "------------------------------------------"
echo "            CHOICE OF SIDE                "
echo "------------------------------------------"
counter=1

for si in ${side_options[@]}
do 
echo -e "\n$counter.$si \t\t\tPrice: \$${side_options_price[$counter-1]} "
((counter++))
done
echo " "
echo "------------------------------------------"
read -p "Please Select an Option [1-4]: > " side_options_selection
echo "                                     "
read -p "How many do you need >>" total_side_quantity
echo "                                   "

selected_side="${side_options[$side_options_selection-1]}"
echo "You picked our $selected_side side today."
echo " "
echo  "Quantity : $total_side_quantity"
echo " "
echo  "Price : \$${side_options_price[$side_options_selection-1]}"
price_for_selected_side=$(( "$total_side_quantity * ${side_options_price[$side_options_selection-1]}" ))
echo "                                     "

sleep 3
clear

# for selection of dresssing


declare -a dressing_options=("Blu_Cheese" "Ranch" "No_Dressing")
declare -a dressing_options_price=("0" "0" "0")


echo "------------------------------------------"
echo "          CHOICES OF DRESSING             "
echo "------------------------------------------"
counter=1

for d in ${dressing_options[@]}
do 
echo -e "\n$counter.$d" # no price \t\tPrice: \$${dressing_options_price[$counter-1]} "
((counter++))
done
echo " "
echo "------------------------------------------"
read -p "Please Select an Option [1-3]: > " dressing_options_selection
echo "                                      "

selected_dressing="${dressing_options[$dressing_options_selection-1]}"

echo "Your Choice was $selected_dressing"
echo " "
#echo "Price :$price_for_selected_dressing"


price_for_selected_dressing="${dressing_options_price[$dressing_options_selection-1]}" 
#echo "                                                 "

sleep 3
clear

# for selection of beverages

declare -a beverage_options=("Soda" "SweetTea" "NormalTea" "H2O")
declare -a beverage_options_price=("2" "3" "2" "1")

echo "------------------------------------------"
echo "          CHOICE OF BEVERAGE              "
echo "------------------------------------------"
counter=1

for b in ${beverage_options[@]}
do 
echo -e "\n$counter.$b \t\t\tPrice: \$${beverage_options_price[$counter-1]} "
((counter++))
done
echo " "
echo "-----------------------------------------"
read -p "Please Select an Option [1-4]: >> " beverage_options_selection
echo "                                     "
read -p "How many do you need >>" total_beverage_quantity
echo "                                   "

selected_beverage="${beverage_options[$beverage_options_selection-1]}"
echo "Your Refresher you picked is $selected_beverage"
echo " "
echo  "Quantity : $total_beverage_quantity"
echo " "
echo  "Price : \$${beverage_options_price[$beverage_options_selection-1]}"
price_for_selected_beverage=$(( "$total_beverage_quantity * ${beverage_options_price[$beverage_options_selection-1]}" ))
echo "                                               "

sleep 3
clear

################################################################################
################################################################################
################################################################################
#                                                                              #
#                              Review & Confirm Order                          #



echo "-------------------------------------------------------------------------"
echo "                              ORDER SUMMARY                              "
echo "-------------------------------------------------------------------------"
echo " "
echo  "FOR YOUR ORDER TODAY YOU HAVE CHOSEN: "
echo  "Size of Wing                   - $selected_wing_size with $total_wing_quantity quantity of wing"
echo  "Choice of Protein              - $selected_protein"
echo  "Choice of Sauce                - $selected_sauce"
echo  "choice of Side                 - $selected_side  with $total_side_quantity"
echo  "Choice of Dressing             - $selected_dressing"
echo  "Choice of Beverage             - $selected_beverage with $total_beverage_quantity quantity of beverage"

echo "                                   " 
read -p "Is this your Order? Yes/No >> " confirm_order
if [[ "$confirm_order" == "y" ]]
then
echo "My Pleasure, Please proceed to checkout"
fi
echo "Please Wait, Adding Items to Your Cart...                                            "
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
echo " "
echo "For Cash -  Enter 1"
echo " "
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

echo "---------------------------------------------------------------------------------------------------"
echo "                                       INVOICE AMOUNT                                              "
echo "---------------------------------------------------------------------------------------------------"

echo "                                                       						 "

printf "%*s\n" 90 "Size:    $selected_wing_size    QTY:$total_wing_quantity             \$$price_for_selected_wing_size"
printf "%*s\n" 90 "$selected_protein                 "
printf "%*s\n" 90 "$selected_sauce               "
printf "%*s\n" 90 "$selected_dressing               "
printf "%*s\n" 90 "$selected_side    QTY:$total_side_quantity          \$$price_for_selected_side"
printf "%*s\n" 90 "$selected_beverage    QTY:$total_beverage_quantity         \$$price_for_selected_beverage"
printf "%*s\n" 90 "Delvery Charges:     \$$deliveryCharges"
printf "%*s\n" 90 "Tax at 0.08%:     \$$total_tax"

#echo -e "Size:$selected_wing_size \tQTY:$total_wing_quantity \t\t\$$price_for_selected_wing_size"
#echo "$selected_protein                                                                                  "
#echo "$selected_sauce                                                          				 "
#echo -e "$selected_side	\tQTY:$total_side_quantity \t\t\$$price_for_selected_side"
#echo "$selected_dressing                                                   				 "
#echo -e "$selected_beverage \tQTY:$total_beverage_quantity \t\t\$$price_for_selected_beverage"
#echo -e "Delvery Charges \t\t\t\$$deliveryCharges"
#echo -e "Tax at 0.08% \t\t\t\$$total_tax"
echo "                                                                -----------------------------------"
echo "                                                                TOTAL:   	        \$$total"
echo "                                                                -----------------------------------" 

sleep 5

echo "------------------------------------------------------------------------"
echo "	                             ORDER CONFIRMATION                       "
echo "------------------------------------------------------------------------"
echo -e "\nMy Pleasure, let me get your order sent to the kitchen right away"
echo " "
echo "Sending..."
sleep 3
echo "Gathering Time Request from Kitchen..."
sleep 3
echo "..."
sleep 3
echo "......"
sleep 3
echo "........."
sleep 3
echo "............"
sleep 3
echo -e "\nYour order has been confirmed and it will be ready in 20 minutes!"
sleep 5
clear
echo -e "\nYou will receive an order confirmation in the email address you provided at registration."
echo " "
echo -e "\nAs a show of our appreciation, we're giving you 10% OFF of your next order."
echo " "
echo -e "\nIf you ever have any questions, concerns, or would like to rate our service."
echo " "
echo -e "\nPlease feel free to contact us at any time @ 571-245-4647."
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
echo "   "
echo "Thank you for your purchase."
echo "                             "
sleep 2
echo "Here at WingIn It, we value each and every customer."
echo "                                 "
sleep 2
echo "For more than 25 years,our company has been focused on providing the best-ever fried chicken experience, along with attentive service to valued customers."
echo "                                     "
sleep 2
echo "We appreciate having you as a customer and look forward to serving you again."
echo "                                                                      "
sleep 2
clear
figlet THANK YOU , KEEP WING'IN WITH US
