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
size_array=( "Small" "Medium" "Large" )

sauce_array=( "Buffalo" "BBQ" "Thai Curry" "Spicy Garlic" )

protein_array=( "Regular" "Drum Only" "Flat Only" "Breaded Cauliflower" )

side_array=( "Extra Crispy Wings" "Extra Sauce" "Potato Wedges" "Fries" "Celery" "No Side" )

dressing_array=( "Blu Cheese" "Ranch" "No Dressing" )

soda_array=( "Cola" "Tea Sweet" "Just Tea" "H20" )

#declare variables with pricing

declare -A size_opt=(["Small"]=10 ["Medium"]=15 ["Large"]=20)

declare -A protein_opt=(["Regular"]=0 ["Drum Only"]=0 ["Flat Only"]=0 ["Breaded Cauliflower"]=0)

declare -A sauce_opt=(["Buffalo"]=0 ["BBQ"]=0 ["Thai Curry"]=0 ["Spicy Garlic"]=0)

declare -A side_opt=(["Extra Crispy Wings"]=0 ["Extra Sauce"]=1 ["Potato Wedges"]=3 ["Fries"]=2 ["Celery"]=1 ["No Side"]=0)

declare -A dressing_opt=(["Blu Cheese"]=0 ["Ranch"]=0 ["No Dressing"]=0)

declare -A soda_pik=(["Cola"]=2 ["Tea Sweet"]=2 ["Just Tea"]=2 ["H20"]=2)

#alias

custmr_ordr="$size_of_wing_order $protein_choice $sauce_choice $choice_of_side $choice_of_dressing $choice_of_soda"

order_cost=$(( "$price_for_wing_size" + "price_of_protein" + "$price_of_sauce" + "price_of_sauce" + "price_for_side" + "price_for_dressing" + "price_for_soda" ))

################################################################################
################################################################################
################################################################################
#                                                                              #
#                               Welcome Screen                                 #




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


#functions for placing order

#function for size of choice

function what_size_wing

{

#keeps the price

price_for_wing_size=""

size_of_wing_order=""

true_size=false

echo -e "\nWhat size Wing Order would you like Today?"
# changed the ! -> #size_opt
for size in "${!size_opt[@]}";
do
	echo -e "\fSize: $size	Price: \$${size_opt[$size]}";
done

read -p "$(echo $'\n>')" wing_size

#loop sizes
for w in "${!size_opt[@]}"; do
	if [[ "$w" == "$wing_size" ]]; then
		true_size=true
		size_of_wing_order="$w"
		price_for_wing_size="${size_opt[$w]}"
              	protein_choice
                break
	fi
done

if [ "$true_size" == "false" ]; then
	echo "You choose $wing_size"
	echo "Please Choice A Wing Size, from Small to Large"
		what_size_wing

fi

}

#function for choice of protein
function protein_choice

{

#prices
protein_choice=""
price_of_protein=""
true_protein=false

echo -e "\nWhat type of Protein would you like to choose for your order Today?"

#loops
for protein in "${!protein_opt[@]}";

do
	echo -e "\fProtein: $protein";
done

read -p "$(echo $'\n>')" protein_choice

#loop protein
for w in "${!protein_opt[@]}"; do
	if [[ "$w" == "$protein_choice" ]]; then
		true_protein=true
		protein_choice="$w"
                price_of_protein="${protein_opt[$w]}"
		wing_sauce
		break
        fi
done 

echo -e "You have chosen $protein_choice"

if [ "$true_protein" == "false" ]; then
	echo "You choose $protein_choice"
	echo "Please Choose a Protein, We have a varieity of choices to choose from."
		protein_choice
fi

}

#function for wing sauce choice

function wing_sauce

{

#prices
price_of_sauce=""
sauce_choice=""
true_sauce=false

echo -e "\nWhat type of Sauce would you like to choose for the Wings Today?"

#loops
for sauce in "${!sauce_opt[@]}";
do
	echo -e "\fSauce: $sauce";	#to add price delete this comment and ;  Price: \$${sauce_opt[$sauce]}";
done

read -p "$(echo $'\n>')" sauce_choice

#loop sauces
for w in "${!sauce_opt[@]}"; do
	if [[ "$w" == "$sauce_choice" ]]; then
		true_sauce=true
		sauce_choice="$w"
                price_of_sauce="${sauce_opt[$w]}"
		side_choice_opt
		break
        fi
done

if [ "$true_sauce" == "false" ]; then
    echo "You choose $sauce_choice"
    echo "Please Choice from one of our award winning flavors!"
    wing_sauce
fi

}

# function for special requests and sides

function side_choice_opt

{

#stores the price
price_for_side=""

choice_of_side=""

true_side=false

echo -e "\nWhat Side Order would you like Today?"

for side in "${!side_opt[@]}";
do
        echo -e "\fSide: $side	Price: \$${side_opt[$side]}";
done

read -p "$(echo $'\n>')" side_choice

#loop sizes
for w in "${!side_opt[@]}"; do
        if [[ "$w" == "$side_choice" ]]; then
		true_side=true
                side_choice_order="$w"
                price_for_side="${side_opt[$w]}"
                dressing_choice_opt
                break
	fi
done

if [ "$true_side" == "false" ]; then
	echo "You choose $side_choice"
	echo "Please Pick a Side, only if you want."
		side_choice_opt

fi

}

# function for choice of Dressing

function dressing_choice_opt

{

#stores the price
price_for_dressing=""

choice_of_dressing=""

true_dressing=false

echo -e "\nWhat Dressing would you like for your wings to swim in Today?"

for dressing in "${!dressing_opt[@]}";do
	echo -e "\fDressing: $dressing"	# to add ->  Price: \$${dressing_opt[$dressing]}";
done

read -p "$(echo $'\n>')" dressing_choice

#loop dress
for w in "${!dressing_opt[@]}"; do
        if [[ "$w" == "$dressing_choice" ]]; then
                true_dressing=true
                dressing_choice_order="$w"
                price_for_dressing="${dressing_opt[$w]}"
                soda_choice_opt
                break
        fi
done

if [ "$true_dressing" == "false" ]; then
	echo "You choose $dressing_choice"
	echo "Please Pick a Dressing, only if you want."
		dressing_choice_opt

fi

}

# function for choice of drink

function soda_choice_opt

{

#stores the price
price_for_soda=""

choice_of_soda=""

true_soda=false

echo -e "\nWhat Soda would you like Today?"

for soda in "${!soda_pik[@]}";do
	echo -e "\fSoda: $soda	Price: \$${soda_pik[$soda]}";
done

read -p "$(echo $'\n>')" soda_choice

#loop soda
for w in "${!soda_pik[@]}"; do
        if [[ "$w" == "$soda_choice" ]]; then
                true_soda=true
                soda_choice_order="$w"
                price_for_soda="${soda_pik[$w]}"
                what_size_wing
                break
        fi
done

if [ "$true_soda" == "false" ]; then
	echo "You choose $soda_choice"
	echo "Please Pick a refreshing soda of choice..."
		soda_choice_opt

fi

what_size_wing 
}

what_size_wing #loops it back to the begining, must add the next part for it to link up just right

################################################################################
################################################################################
################################################################################
#                                                                              #
#                              Review & Confirm Order                          #
#function cart

#{

#echo -e "For your order Today you have selected: \$$custmr_ordr for a total of... \$$order_cost"

#read -p "Is this your Order?:$(echo ""Yes/No" $'\n>')"" custmr_ordr

#if [[ "$custmr_ordr" == "true" ]] && [[ "$order_cost" == "True"  ]]; then 
#        echo "My Pleasure, let me get that sent to the kitchen right away"

#fi

#}

################################################################################
################################################################################
################################################################################
#                                                                              #
#                              Complete Your Order                             #
#                           ---Confirmation Section---                         #



################################################################################
################################################################################
################################################################################
#                                                                              #
#                               Thank you Page                                 #

echo "Thank you for your purchase!"
echo "Here at Wing'In It, we value each and every customer"
echo "For more than 25 years, our company has been focused on providing the best-ever fried chicken experience, along with attentive service to valued customers."
echo "We appreciate having you as a customer and look forward to serving you again"

  


#                                                                              #
#                                                                              #
#                                                                              #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
