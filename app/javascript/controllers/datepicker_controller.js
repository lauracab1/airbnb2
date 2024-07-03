import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
    static values = {
      date: Array
    }

  connect() {
    console.log(this.dateValue)
    flatpickr(this.element, {
      dateFormat: "Y-m-d",
      disable: this.dateValue
  })
  }
}
