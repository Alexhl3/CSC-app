import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["items"]

  open() {
    this.itemsTarget.classList.toggle('hidden')
  }
}
