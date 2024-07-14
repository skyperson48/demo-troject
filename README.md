### Hi everyone 👋

# Telegram Bot - Demo Project

🌱 Welcome to my first Telegram bot project!

https://t.me/skyperson48_bot

## How to Create Your Own Bot ⚡ 

1. **Clone the Repository**
   - Copy this repository to your own GitHub account.

2. **Rename the Bot in the Code**
   - Replace the name `demoTroject` with your own bot name in the code.

3. **Build the Bot**
   - Use the following command to compile the bot:
     ```sh
     go build -ldflags "-X=github.dev/your_depo_name/your_repo_name/cmd.appVersion=v1.0.1"
     ```
     Replace `your_depo_name` with your GitHub account name and `your_repo_name` with your repository name.

4. **Create a New Bot on Telegram**
   - Open Telegram and go to `BotFather`.
   - Execute the command `/newbot` to create a new bot.
   - After creating the bot, you will receive an API token for your bot.

5. **Set the Bot Token**
   - In your terminal, input the following command to read the token:
     ```sh
     read -s TELE_TOKEN
     ```
   - Export the token as an environment variable:
     ```sh
     export TELE_TOKEN
     ```

6. **Start Your Bot**
   - Execute the following command to start your bot:
     ```sh
     ./your_bot_name start
     ```
     Replace `your_bot_name` with the name you used in the code.

Congratulations, your bot is now running!

## Bot Commands

- `/start` - Greets the user with "hello"
