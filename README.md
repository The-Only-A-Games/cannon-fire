# 🎮 Cannon Fire – Game Design Document

## 📝 Overview
**Cannon Fire** is a simple top-down survival shooter made with **Godot**. The player controls a stationary **cannon** placed at the center of the screen. The goal is to **rotate and shoot** incoming enemies before they reach and destroy the cannon.

---

## 🎯 Game Objective
Survive as long as possible by shooting down all incoming enemies. The cannon must rotate in place and fire projectiles to eliminate enemies before they get too close and explode, dealing damage.

---

## 🎮 Core Gameplay

### Player (Cannon)
- Fixed at the center of the screen.
- Can rotate left or right.
- Shoots bullets in the direction it’s facing.
- Has a health bar (e.g., 100 HP).
- Game ends when cannon health reaches 0.

### Enemies
- Spawn from random edges of the screen.
- Move straight toward the cannon.
- Deal damage by reaching the cannon and exploding.
- Are destroyed by player bullets.

---

## 🎨 Art & Aesthetics
- **Top-down view**.
- Simple 2D graphics (minimalist or pixel art).
- Explosions and hit effects for feedback.
- Background could be space or battlefield-themed.

---

## 🔊 Sound
- Background music (looping).
- Firing sound.
- Explosion sound for enemy deaths.
- Low-health or warning sound.

---

## 🔧 Controls
- **Left/Right Arrow Keys** or **A/D** to rotate cannon.
- **Spacebar** or **Left Mouse Button** to fire.
- Optional: Mouse-based aiming.

---

## 📈 Progression & Difficulty
- Enemies spawn faster and more frequently over time.
- Different enemy types could be added later (e.g., faster ones, tankier ones).
- Score system to track how many enemies destroyed or time survived.

---

## 🛠️ Development Details
- **Engine:** Godot 4.x
- **Language:** GDScript
- **Target Platform:** PC (Windows/Linux/Mac)

---

## 📌 To-Do List (Optional for Devs)
- [ ] Add main menu and game over screen
- [ ] Implement scoring system
- [ ] Add health bar for the cannon
- [ ] Tune spawn rate and difficulty
- [ ] Polish explosion and shooting animations
