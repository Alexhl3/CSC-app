import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["items"]

  open() {
    const active = document.querySelectorAll('.active');

    if(this.itemsTarget.classList.contains('active')){
      this.itemsTarget.classList.remove('active')
      this.itemsTarget.classList.toggle('hidden')
    }else if(active.length == 0){
      this.itemsTarget.classList.add('active')
      this.itemsTarget.classList.toggle('hidden')
    }else{
      active[0].classList.remove('active')
      active[0].classList.toggle('hidden')
      this.itemsTarget.classList.add('active')
      this.itemsTarget.classList.toggle('hidden')
    }

  }
}
