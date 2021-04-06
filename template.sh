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

declare -A size_opt=( ["Small"]=10 ["Medium"]=15 ["Large"]=20 )

#declare -A size_optb=( "Small" "Medium" "Large" )

#declare -A size_prc=( "$10" "$15" "$20" )

#declare -A size_op=( "size_optb" "size_prc" )

declare -A protein_opt=(["Regular"]=0 ["Drum Only"]=0 ["Flat Only"]=0 ["Breaded Cauliflower"]=0)

declare -A sauce_opt=(["Buffalo"]=0 ["BBQ"]=0 ["Thai Curry"]=0 ["Spicy Garlic"]=0)

declare -A side_opt=(["Extra Crispy Wings"]=0 ["Extra Sauce"]=1 ["Potato Wedges"]=3 ["Fries"]=2 ["Celery"]=1 ["No Side"]=0)

declare -A dressing_opt=(["Blu Cheese"]=0 ["Ranch"]=0 ["No Dressing"]=0)

declare -A soda_pik=(["Cola"]=2 ["Tea Sweet"]=2 ["Just Tea"]=2 ["H20"]=2)

#alias

custmr_ordr="$size_of_wing_order $protein_choice $sauce_choice $choice_of_side $choice_of_dressing $choice_of_soda"

order_cost=$(( "$price_for_wing_size" + "$price_of_protein" + "$price_of_sauce" + "$price_for_side" + "$price_for_dressing" + "$price_for_soda" ))

################################################################################
################################################################################
################################################################################


################################################################################
################################################################################
################################################################################
#                                                                              #
#                              Place Order Page                                #

#functions for placing order

#function for size of choice

function what_size_wing

{

price_for_wing_size=""

size_of_wing_order=""

#true_size=false

total_wing_quantity=0

echo -e "\nWhat size Wing Order would you like Today?"
# add
counter=1

for size in "${!size_opt[@]}";
#add $counter and count++
do
	echo -e "\f $counter.Size: $size	Price: \$${size_opt[$size]}";
	((counter++))
#done

read -p "$(echo $'\n>')" wing_size
read -p "How many do you need >>" total_wing_quantity

case $wing_size in
	1) echo "${size_opt[0]} - \$${size_prc[0]}";;
	2) echo "${size_opt[1]} - \$${size_prc[1]}";;
	3) echo "${size_opt[2]} - \$${size_prc[2]}";;
	protein_choice
	break
esac
done

#for w in "${!size_opt[@]}"; do
#	if [[ "$w" == "$wing_size" ]]; then
#for w in "$wing size"; do
#	if [[ "$w" -gt 3 ]]; then
		true_size=true
		size_of_wing_order="$w"
		price_for_wing_size="${size_opt[$w]}"
		size=$(( "${size_opt[$w]} * $total_wing_quantity" ))
              	protein_choice
                break
#	fi
#done

#if [ "$true_size" == "false" ]; then
#	echo "You choose $wing_size"
#	echo "Please Choice A Wing Size, from Small to Large"
#		what_size_wing

#fi

}

#function for choice of protein
function protein_choice

{

protein_choice=""
price_of_protein=""
true_protein=false


echo -e "\nWhat type of Protein would you like to choose for your order Today?"

for protein in "${!protein_opt[@]}";

do
	echo -e "\fProtein: $protein";
done

read -p "$(echo $'\n>')" protein_choice


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

price_of_sauce=""
sauce_choice=""
true_sauce=false

echo -e "\nWhat type of Sauce would you like to choose for the Wings Today?"

for sauce in "${!sauce_opt[@]}";
do
	echo -e "\fSauce: $sauce";	#to add price delete this comment and ;  Price: \$${sauce_opt[$sauce]}";
done

read -p "$(echo $'\n>')" sauce_choice

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
    echo "Please Choose from one of our award winning flavors!"
    wing_sauce
fi

}

# function for special requests and sides

function side_choice_opt

{

price_for_side=""

choice_of_side=""

true_side=false
echo -e "\nWhat Side Order would you like Today?"

for side in "${!side_opt[@]}";
do
        echo -e "\fSide: $side	Price: \$${side_opt[$side]}";
done

read -p "$(echo $'\n>')" side_choice
read -p "How many do you need >>" total_side_quantity

for w in "${!side_opt[@]}"; do
        if [[ "$w" == "$side_choice" ]]; then
		true_side=true
                side_choice_order="$w"
                price_for_side=$(( "${side_opt[$w]}" * $total_side_quantity ))
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

price_for_dressing=""

choice_of_dressing=""

true_dressing=false

echo -e "\nWhat Dressing would you like for your wings to swim in Today?"

for dressing in "${!dressing_opt[@]}";do
	echo -e "\fDressing: $dressing"	# to add ->  Price: \$${dressing_opt[$dressing]}";
done

read -p "$(echo $'\n>')" dressing_choice

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

price_for_soda=""

choice_of_soda=""
total_soda_quantity=0

true_soda=false

echo -e "\nWhat Soda would you like Today?"

for soda in "${!soda_pik[@]}";do
	echo -e "\fSoda: $soda	Price: \$${soda_pik[$soda]}";
done


read -p "$(echo $'\n>')" soda_choice


read -p "How many do you need >>" total_soda_quantity

for w in "${!soda_pik[@]}"; do
        if [[ "$w" == "$soda_choice" ]]; then
                true_soda=true
                soda_choice_order="$w"
                price_for_soda=$(( "${soda_pik[$w]}" * $total_soda_quantity ))

               # what_size_wing
break
        fi
done

if [ "$true_soda" == "false" ]; then
	echo "You choose $soda_choice"
	echo "Please Pick a refreshing soda of choice..."
		soda_choice_opt

fi

#what_size_wing 
}

what_size_wing #loops it back to the begining, must add the next part for it to link up just right

################################################################################
################################################################################
################################################################################
#                                                                              #
#                              Review & Confirm Order                          #

custmr_ordr="$size_of_wing_order $protein_choice $sauce_choice $side_choice_order $dressing_choice_order $soda_choice_order"

order_cost=$(( "$price_for_wing_size" + "$price_of_protein" + "$price_of_sauce" + "$price_for_side" + "$price_for_dressing" + "$price_for_soda" + "$deliveryCharges"))

echo  "------------------ORDER SUMMARY-----------------"
echo  "FOR YOUR ORDER TODAY YOU HAVE CHOSEN: "
echo  "Size of Wing - $size_of_wing_order with $total_wing_quantity quantity of wing"
echo  "Choice of Protein - $protein_choice"
echo  "Choice of Sauce - $sauce_choice"
echo  "choice of Side  - $side_choice_order"
echo  "Choice of Dressing - $dressing_choice_order"
echo  "Choice of Soda - $soda_choice_order"

read -p "Is this your Order? echo Yes/No >> " confirm_order
if [[ "$confirm_order" == "y" ]]
then
echo "My Pleasure, Please proceed for checkout"
fi


################################################################################
################################################################################
################################################################################
#                                                                              #
#                              Complete Your Order                             #
#                           ---Confirmation Section---                         #
echo "Would you like to pay by cash or Card?"

echo "For Cash -  Enter 1"
echo "For Card - Enter 2"
echo "                           "
read -p "Select which option  you want to perform (1-2) >> "  cashORcard
echo "                           "
echo "You have chosen $cashORcard"


if [[ $cashORcard ==  2  ]]
then
read -p "Enter your card number >> " cardNumber
read -p "Enter Expiration date of the card >> " expireDate
read -p "Enter cvv number >> " cvvNum
echo "Your Payment information is stored and being verified"
echo "Great! Your card has been verified.Please proceed with Total Payment"
fi

total_tax=$(( $order_cost * 8/100 ))
total=$(( $order_cost  + $deliveryCharges + $total_tax ))

echo "$protein_choice  $size_of_wing  $total_wing_quantity  -- $price_for_wing_size"
echo "$side _choice_order             $total_side_quantity  -- $price_for_side" 
echo "$sauce_choice                                         -- $price_of_sauce"
echo "$dressing_choice_order                                -- $price_for_dressing"
echo "$soda_choice_order              $total_soda_quantity  -- $price_for_soda"
echo "Delvery Charges                                     -- $deliveryCharges"
echo "Tax                                                   -- $total_tax"
echo "                                                       -------------------"
echo "TOTAL                                                    $total"
echo "                                                       -------------------" 



echo "My Pleasure, let me get that sent to the kitchen right away"
echo "Your order will be ready in 20mins"
echo "You will receive a confirmation email address you provided at registration"
echo "You can always call our customer service center at 77777777"


################################################################################
######### I#######################################################################
################################################################################
#                                                                              #
#                               Thank you Page                                 #
echo "Thank you for your purchase"
echo "                             "
echo "Here at WingIn It, we value each and every customer"
echo "                                 "
echo "For more than 25 years, our company has been focused on providing the best-ever fried chicken experience, along with attentive service to valued customers"
echo "                                     "
echo "We appreciate having you as a customer and look forward to serving you again "
echo "                                                                      "
echo "---------------------------------------------------------------------------------------------------------"
figlet THANK YOU, PLEASE VISIT AGAIN
echo "---------------------------------------------------------------------------------------------------------"
