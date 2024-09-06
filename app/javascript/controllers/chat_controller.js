import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chat"
export default class extends Controller {
  static targets = ["messageBox"];
  static values = {other: String}

  connect() {
    // console.log("Oi do controller");
  }

  chatBox() {
    const otherUser = this.otherValue;
    console.log(otherUser.constructor.name);
    console.log(otherUser);
    const tag = document.getElementById("nickHeader");
    tag.innerText = otherUser;
  }
}
