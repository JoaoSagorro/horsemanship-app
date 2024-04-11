import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="book-class"
export default class extends Controller {
  static targets = ["toggle", "card"]

  connect() {
    console.log("You're connected")
    console.log(this.cardTarget)
  }

  booked() {
    console.log("you're booked")
  }

  dataSelected() {
    console.log("Selected")
    this.cardTarget.classList.toggle("background-change")
  }
}
