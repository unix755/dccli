package main

import (
	"log"

	"github.com/unix755/displayController"
)

var (
	monitors []displayController.CompositeMonitorInfo
)

func init() {
	var err error
	monitors, err = displayController.GetCompositeMonitors()
	if err != nil {
		log.Fatalln(err)
	}
}
