import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["items"]

  connect() {
    const active = document.querySelectorAll('.check_box');
    if(active[0].checked){
      this.itemsTarget.classList.remove('hidden')
    }

  }

  check() {
    const active = document.querySelectorAll('.check_box');
    this.itemsTarget.classList.toggle('hidden')
  }
}
