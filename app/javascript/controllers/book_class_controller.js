// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="book-class"
// export default class extends Controller {
//   static targets = ["toggle", "card"]

//   connect() {
//     console.log("You're connected")
//     console.log(this.cardTarget)
//   }

//   booked() {
//     console.log("you're booked")
//   }

//   dataSelected(day) {
//     console.log("Selected")
//     console.log(document.querySelector(".day-card-<%= day.strftime("%d") %>"));
//     console.dir(day)
//     this.cardTarget.classList.toggle("background-change")
//   }
// }


import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="book-class"
export default class extends Controller {
  static targets = ["card"];

  connect() {
    console.log("You're connected");
  }

  dataSelected(event) {
    const card = event.currentTarget;
    const date = card.getAttribute("data-book-class-date");
    const divs = document.querySelectorAll("#this-target")

    console.log("Selected date:", date);
    console.log(card)
    console.log(divs)
    divs.forEach(div => div.classList.remove("background-change"))
    // Toggle background color or perform other actions as needed
    card.classList.toggle("background-change");
  }
}
