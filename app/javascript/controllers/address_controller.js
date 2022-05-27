import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    'input',
    'url'
  ]

  connect() {
    console.log("Address controller is connected")
  }

  initGoogle() {
    // setup autocomplete
    console.log("Google maps initialised and the controller knows about it")
    console.log(google);
    this.autocomplete = new google.maps.places.Autocomplete(this.inputTarget, {
      fields: ["url"],
      types: ["address"]
    })
    this.autocomplete.addListener('place_changed', this.placeSelected.bind(this))
  }

  placeSelected() {
    // use values from autocomplete
    const place = this.autocomplete.getPlace();
    console.log(place.url)
    this.urlTarget.value = place.url;
  }
}
