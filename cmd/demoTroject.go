/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"
	"log"
	"os"
	"time"

	"github.com/spf13/cobra"
	telebot "gopkg.in/telebot.v3"
)

var (
	// TeleToken bot
	TeleToken = os.Getenv("TELE_TOKEN")
)

// demoTrojectCmd represents the demoTroject command
var demoTrojectCmd = &cobra.Command{
	Use:   "demoTroject",
	Aliases: []string{"start"},
	Short: "A brief description of your command",
	Long: `A longer description that spans multiple lines and likely contains examples
and usage of using your command. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
	Run: func(cmd *cobra.Command, args []string) {

		fmt.Println("demoTroject %s started", appVersion)
		demoTroject, err := telebot.NewBot(telebot.Settings{
			URL:    "",
			Token:  TeleToken,
			Poller: &telebot.LongPoller{Timeout: 10 * time.Second},
		})

		if err != nil {
			log.Fatalf("Please check TELE_TOKEN env variable. %s", err)
			return
		}

		demoTroject.Handle(telebot.OnText, func(c telebot.Context) error {

			log.Println(c.Message().Payload, c.Text())
			payload := c.Message().Payload

			switch payload {
				case "hello":
					err = c.Send(fmt.Sprintf("Hello I'm DemoTroject bot %s!", appVersion))
				
			}

			return err
		})

		demoTroject.Start()

	},
}

func init() {
	rootCmd.AddCommand(demoTrojectCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// demoTrojectCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// demoTrojectCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
