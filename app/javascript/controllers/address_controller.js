import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    'input',
    'url'
  ]

  connect() {
    // google maps data is loaded asyncronously
    //    sometimes after controller is created (due to turbolinks)
    //    this code ensures initGoogle runs regardless

    // "window.google.maps" is what we need to exist, but an error is thrown if it is absent
    //    checking for "window.google" first prevents this error
    if (window.google && window.google.maps) {
      this.initGoogle();
    }
  }

  initGoogle() {
    // set up autocomplete
    this.autocomplete = new google.maps.places.Autocomplete(this.inputTarget, {
      fields: ["url"],
      types: ["address"]
    })
    this.autocomplete.addListener('place_changed', this.placeSelected.bind(this))
  }

  placeSelected() {
    // use values from autocomplete
    const place = this.autocomplete.getPlace();
    this.urlTarget.value = place.url;
  }

  addressChanged() {
    // if address has changed, replace maps_url with empty string
    // this prevents update of retailer record with an invalid address
    // works in conjunction with retailer model validation of maps_url presence
    this.urlTarget.value = '';
  }
}
