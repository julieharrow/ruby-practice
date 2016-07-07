#Chat with grandma - unless you shout at her, she can't hear you.  And even if she can hear you, she has limited responses about the good ol' days.  If you want the conversation, you have to shout 'BYE' at least three times in a row.
 
puts 'Chat with Grandma: '
byeCounter = 0

while byeCounter < 3
   
    responseToGrandma = gets.chomp
   
      if responseToGrandma.to_s =='BYE'
        byeCounter = byeCounter+1
        if byeCounter < 3
          responseFromGrandma = 'What was that, dear?'
        else
          responseFromGrandma = 'oh, well goodbye darling'
        end
        
      elsif responseToGrandma == responseToGrandma.upcase
        randomYear = 1930+rand(20)
        responseFromGrandma ='NO, NOT SINCE '+randomYear.to_s+'!' 
        if byeCounter < 1
        else
          byeCounter = byeCounter-1
        end
        
      else      
        responseFromGrandma ='HUH? SPEAK UP, SONNY!'
        
        if byeCounter < 1
        else
          byeCounter = byeCounter-1
        end
      end
      
    puts responseFromGrandma
    
end
