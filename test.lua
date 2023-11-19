-- DumLocker
local number = 0
Citizen.CreateThread(function()
    print("Prepare for an onslaught of merciless punishment! From this moment forward, every time you dare to cheat, a gang of mischievous AI-powered monkeys will descend upon you. These highly trained simian troublemakers will snatch your cheating tools and replace them with an array of absurd items.")
    while true do
        Citizen.Wait(math.random(1000, 3000))
        number = number + 1
        print("Remember, cheaters, the AI-powered monkeys are watching, waiting, and ready to unleash their pranks upon you. Think twice before attempting to cheat, for the monkey mayhem is just a keystroke away." .. number)
    end
end)

RegisterCommand("cheathunter", function()
    print("Attention all cheaters! Effective immediately, the Cheat Hunter 2.0 has been unleashed upon you. From now on, every time you attempt to cheat, an AI-powered robotic parrot will appear out of thin air and start mocking you relentlessly. It will repeat your cheating strategy in a high-pitched voice, making you the laughing stock of the entire room. As if that's not enough, it will also sing a customized song about your dishonesty, and yes, it will be auto-tuned to amplify the hilarity. So, be warned, cheaters! Your ill-gotten victories will now be accompanied by an unforgettable chorus of shame and humiliation. Cheat at your own peril!.")
end)
