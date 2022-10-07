import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  up() {
    window.scroll({
      top: 0,
      left: 0,
      behavior: 'smooth'
    })
  }
}
