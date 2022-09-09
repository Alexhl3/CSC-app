import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  dismiss() {
    this.element.classList.add("fadeOut")
    setTimeout(() => {
      this.element.remove();
    }, 700);
  }
}
