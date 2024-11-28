import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["template", "container"]

    connect() {
        const specs = JSON.parse(this.element.dataset.specs || '{}')
        Object.entries(specs).forEach(([key, value]) => {
            this.addSpecification(key, value)
        })
    }

    add(event) {
        event.preventDefault()
        this.addSpecification()
    }

    remove(event) {
        event.preventDefault()
        event.currentTarget.closest('.spec-item').remove()
    }

    addSpecification(key = '', value = '') {
        const content = this.templateTarget.content.cloneNode(true)
        const inputs = content.querySelectorAll('input')

        inputs[0].value = key
        inputs[1].value = value

        this.containerTarget.appendChild(content)
    }
}
