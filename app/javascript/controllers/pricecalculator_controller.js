import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    pricepernight: Number
  }

  static targets = ["start", "end", "total"]

  connect() {
    console.log(this.startTarget)
    console.log(this.endTarget)
    console.log(this.totalTarget)
  }

  update() {
    let start = this.startTarget.value
    let end = this.endTarget.value

    let startDate = new Date(start)
    let endDate = new Date(end)

    let days = Math.floor((endDate - startDate) / (24*3600*1000));
    console.log(days)

    if (days > 0) {
      this.totalTarget.innerHTML = this.pricepernightValue * days
    }
  }

}
