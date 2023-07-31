import { Controller } from "@hotwired/stimulus"
import { Sortable } from "@shopify/draggable"

// Connects to data-controller="draggable"
export default class extends Controller {
  static targets = ["column", "item"]
  initialize (){
  }
  connect() {
    if(this.hasItemTarget){
      this.itemTargets.forEach(element => {
        element.setAttribute('style', 'z-index: 1000;')
      })
      const sortable = new Sortable(this.columnTargets, {
        draggable:'li'
      })
      sortable.on('sortable:stop', function(event) {
        let url = event.dragEvent.source.getAttribute('data-url')
        let col = event.newContainer.getAttribute('data-id')
        let data = {item: { column_id: col } }
        let token = document.head.querySelector("meta[name='csrf-token']").getAttribute('content')
        fetch(url, {
          method: 'PUT',
          credentials: "same-origin",
          headers: {
            "X-CSRF-Token": token,
            "Content-type": "application/json;"
          },
          body: JSON.stringify(data)
        })
      })
    }
  }
  disconnect(){

  }
}
