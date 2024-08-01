# UEFN-Verse-Snippets
This repository contains Unreal Engine Fortnite Verse code snippets that help with various gameplay mechanics involving zombie creatures. These snippets are provided for non-commercial use.

## Features

- Spawning and eliminating waves of zombie creatures: Automatically spawn waves of zombies and handle their elimination.
- Granting items to players upon eliminating zombies: Reward players with items when they eliminate zombies.
- Tracking the number of zombies spawned and eliminated: Keep track of the total number of zombies spawned and eliminated during gameplay.
- Managing the transition between waves: Smoothly transition between different waves of zombies.

## Usage

To use these snippets, simply copy and paste them into your UEFN environment. Make sure to follow any additional instructions provided in the comments within the code files.  Also, understand Epic's verse writing style: https://dev.epicgames.com/documentation/en-us/uefn/verse-code-style-guide-in-unreal-editor-for-fortnite

## Example Code Snippet
Here is an example of how to use the code snippets in your project:

```verse
// Example code for spawning and eliminating waves of zombies

class ZombieWaveManager {
    var int zombiesSpawned = 0
    var int zombiesEliminated = 0

    function SpawnWave(int numberOfZombies) {
        // Code to spawn zombies
        zombiesSpawned += numberOfZombies
        // Logic to handle spawning
    }

    function OnZombieEliminated() {
        // Code to handle zombie elimination
        zombiesEliminated += 1
        // Logic to grant items to players
    }

    function TransitionToNextWave() {
        // Code to manage wave transition
        if (zombiesEliminated == zombiesSpawned) {
            // Logic to start the next wave
        }
    }
}
