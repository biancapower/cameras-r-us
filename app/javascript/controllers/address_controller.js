import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    'input',
    'url'
  ]

  connect() {
    console.log("Address controller is connected")

    // google maps data is loaded asyncronously
    //    sometimes after controller is created (due to turbolinks)
    // ensures initGoogle runs regardless
    if (window.google && window.google.maps) {
      this.initGoogle();
    }
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

  addressChanged() {
    console.log("address field changed")
    // if address has changed, delete maps_url
    this.urlTarget.value = '';
  }
}
