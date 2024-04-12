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
  static targets = ["card", "outsideCard"];

  connect() {
    console.log("You're connected");
    const cards = this.cardTargets
    cards.map((card) => {
      card.hidden = true
    })
    // console.log(this.outsideCardTargets)
    const defaultCard = this.outsideCardTargets.find(date => date.getAttribute("data-book-class-date") === new Date().toISOString().split("T")[0])
    defaultCard.classList.add("background-change")
    defaultCard.scrollIntoView({behaviour: "smooth", inline: "center"})
    console.log(defaultCard)
    console.log(new Date().toISOString().split("T")[0])
  }

  dataSelected(event) {
    const card = event.currentTarget;
    const date = card.getAttribute("data-book-class-date");
    const divs = document.querySelectorAll("#this-target")

    console.log("Selected date:", date);
    console.dir(card)
    divs.forEach(div => div.classList.remove("background-change"))
    card.scrollIntoView({behaviour: "smooth", inline: "center", })
    // Toggle background color or perform other actions as needed
    card.classList.toggle("background-change");
  }
}
