import { Controller } from "@hotwired/stimulus";
import 'flowbite';

export default class extends Controller {
  static targets = ["content"]

  connect() {
    this.open = false
  }

  toggle() {
    if (this.open) {
      this._hide()
    } else {
      this.show()
    }
  }

  show() {
    this.open = true
    this.contentTarget.classList.remove("hidden")
  }

  _hide() {
    this.open = false
    this.contentTarget.classList.add("hidden")
  }

  hide() {
    if (this.element.contains(event.target) === false && this.open) {
      this._hide()
    }
  }
}
