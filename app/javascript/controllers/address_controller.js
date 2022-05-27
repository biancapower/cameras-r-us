import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    'input'
  ]
  
  connect() {
    console.log("Address controller is connected")
  }

  initGoogle() {
    // setup autocomplete
    console.log("Google maps initialised and the controller knows about it")
    console.log(google);
    new google.maps.places.Autocomplete(this.inputTarget)
  }
}
