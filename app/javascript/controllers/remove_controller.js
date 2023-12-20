import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="remove"
export default class extends Controller {
  connect() {
    console.log("connected")
  }
  remove() {
    this.element.remove()
  }
}
