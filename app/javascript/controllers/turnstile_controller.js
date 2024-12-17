import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { siteKey: String }

  connect() {
    this.id = turnstile.render(this.element, {sitekey: this.siteKeyValue})
  }

  disconnect() {
    turnstile.remove(this.id)
  }
}
