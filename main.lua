
    local NormalFont = love.graphics.newFont(14)
    local BigFont = love.graphics.newFont(20)

function love.load()
    choices = {"pierre", "feuille", "ciseaux"}
    user_choice = ""
    computer_choice = ""
    result = ""
    user_score = 0
    computer_score = 0
    mancheTOwin = 5
end

function love.draw()
	love.graphics.setFont(NormalFont)
    love.graphics.setColor(255, 255, 255)
    love.graphics.printf("Appuie sur : Pierre, Feuille ou Ciseau", 100, 50, 500, "center")
    love.graphics.print("Tu a choisi : " .. user_choice, 100, 120)
    love.graphics.print("J'ai choisi : " .. computer_choice, 100, 140)
    love.graphics.print(result, 100, 160)
    love.graphics.print("Score : Vous - " .. user_score .. " | Ordinateur - " .. computer_score, 100, 200)
    if computer_score >=mancheTOwin or user_score >=mancheTOwin then
		if computer_score >=mancheTOwin then
			gagnant = "J'ai "
		else
			gagnant = "Tu a "
		end
		love.graphics.setFont(BigFont)
		love.graphics.print( gagnant .. "gagné ! ",100,240)
		love.graphics.print("Appuie sur R pour recommencer.", 100, 270)
	end
end

function love.keypressed(key)
    if key == "p" or key == "f" or key == "c" then
        if user_score < mancheTOwin and computer_score < mancheTOwin then
            if key == "p" then
                user_choice = "pierre"
                computer_choice = choices[math.random(1, 3)]
                determine_winner()
            elseif key == "f" then
                user_choice = "feuille"
                computer_choice = choices[math.random(1, 3)]
                determine_winner()
            elseif key == "c" then
                user_choice = "ciseaux"
                computer_choice = choices[math.random(1, 3)]
                determine_winner()
            end
        end
    elseif key == "r" then
		user_choice = ""
		computer_choice = ""
		result = ""
		user_score = 0
		computer_score = 0
	end
end

function determine_winner()
    if user_choice == computer_choice then
        result = "Égalité!"
    elseif (user_choice == "pierre" and computer_choice == "ciseaux") or
           (user_choice == "feuille" and computer_choice == "pierre") or
           (user_choice == "ciseaux" and computer_choice == "feuille") then
        result = "Tu as gagné cette manche !"
        user_score = user_score + 1
    else
        result = "J'ai gagné cette manche !"
        computer_score = computer_score + 1
    end
end
