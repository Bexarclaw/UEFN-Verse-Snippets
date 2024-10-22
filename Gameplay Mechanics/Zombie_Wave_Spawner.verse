using {/Fortnite.com/Devices}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/Diagnostics}
using {/Verse.org/Random}

# Game Controller placed in the level
game_controller := class(creative_device):

    @editable
    var creatureSpawner: creature_spawner_device = creature_spawner_device{}

    @editable
    var itemGranter: item_granter_device = item_granter_device{}

    @editable
    var playerName: string = "ZombieKiller"

    var fiendsEliminated: int = 0
    var fiendsSpawned: int = 0
    var waveSize: int = 1
    var spawnerReady: logic = true

    # Event handler for when fiends are eliminated
    OnFiendsEliminated(result: device_ai_interaction_result):void=
        if spawnerReady:
            # Item Granting Logic
            if agent := result.Source?:
                if GetRandomInt(1, 5) == 1:
                    Print("Granting Bullets")
                    for loopNumber := 1..GetRandomInt(1, 20):
                        Print("Bullet {loopNumber}")
                        itemGranter.SetNextItem(1)
                        itemGranter.GrantItem(agent)
            
            fiendsEliminated += 1
            Print("Fiends Eliminated: {fiendsEliminated}")

            # Validate if fiends amount is correct before next wave
            if fiendsEliminated >= waveSize:
                spawnerReady = false
                spawn{NextWave()}

    # Function to start the next wave
    NextWave():void=
        creatureSpawner.EliminateCreatures()
        Sleep(1.0)
        waveSize += 1
        fiendsEliminated = 0
        fiendsSpawned = 0
        spawnerReady = true
        creatureSpawner.Enable()
        Print("New Wave Approaching {waveSize}")

    # Event handler for when fiends are spawned
    OnFiendsSpawned(spawnedAgent: agent):void=
        fiendsSpawned += 1
        Print("Fiends Spawned: {fiendsSpawned}")

        # Prevent more fiends from spawning
        if fiendsSpawned >= waveSize:
            creatureSpawner.Disable()

    # Runs when the device is started in a running game
    OnBegin():void=
        # Add 1 frame of delay
        Sleep(0.0)
        creatureSpawner.EliminatedEvent.Subscribe(OnFiendsEliminated)
        creatureSpawner.SpawnedEvent.Subscribe(OnFiendsSpawned)
        Print("{playerName}'s score is {fiendsEliminated}")
        # Start the first wave
        creatureSpawner.Enable()