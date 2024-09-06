import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="friendship-message"
export default class extends Controller {
  static values = { userId: Number }
  connect() {

    const currentUserId = parseInt(document.body.dataset.currentUserId, 10);
    // console.log(this.userIdValue);
    // console.log(currentUserId);
    if (this.userIdValue === currentUserId) {
        // console.log("oi do sent");
        this.element.classList.add('sent');
        this.element.classList.remove('received');
      } else {
        // console.log("oi do received");
        this.element.classList.add('received');
        this.element.classList.remove('sent');
      }
      this.element.scrollIntoView({ behavior: 'smooth' });
  }
}
