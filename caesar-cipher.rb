def caesar_cipher characters, number

    #converting letters to numerical values 
    characters = characters.bytes

    #changing number values to not exceed 26 (for 26 letters in the alphabet)
    if (number >= 26)  
        factor = (number/26).to_i
        number = number - (factor * 26)
    elsif (number <= -26)
        factor = (-number/26).to_i
        number = number + (factor * 26)
    else
        number = number
    end
    
    new_array = []

    #adding letter values and number to new_array
    i = 0
    while i < characters.length do 
        #cases for numbers going beyond letter values
        if ((characters[i] >= 97) && (characters[i] + number) > 122)
            characters[i] = characters[i] - 26
            new_array.push(characters[i] + number)
        
        elsif ((characters[i] <= 90) && (characters[i] + number) > 90)
            characters[i] = characters[i] - 26
            new_array.push(characters[i] + number)

        elsif ((characters[i] >= 97) && (characters[i] + number) < 97)
            characters[i] = characters[i] + 26
            new_array.push(characters[i] + number)

        elsif ((characters[i] <= 90) && (characters[i] + number) < 65 && (characters[i]) >= 65)
            characters[i] = characters[i] + 26
            new_array.push(characters[i] + number)
        
        #for characters within letter values
        elsif ((characters[i] >= 97) && ((characters[i] + number) <= 122)) 
            new_array.push(characters[i] + number)
        elsif ((characters[i] <= 90) && ((characters[i] + number >= 65)))
            new_array.push(characters[i] + number)
        #for all other values    
        else
            new_array.push(characters[i])
        end 
        i += 1
    end 
     
    final_array = []
    new_array.map{|element| final_array.push(element.chr)}
    final_array = final_array.join
    
    p final_array
end