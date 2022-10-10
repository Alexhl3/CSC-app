import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["items"]
  open() {
    this.itemsTarget.classList.remove('-translate-y-full')
  }

  close() {
    this.itemsTarget.classList.add('-translate-y-full')
  }
}
