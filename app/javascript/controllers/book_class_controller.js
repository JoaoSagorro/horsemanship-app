import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="book-class"
export default class extends Controller {
  static targets = ["toggle"]

  connect() {
    console.log("You're connected")
  }

  booked() {
    console.log("you're booked")
    
  }
}
