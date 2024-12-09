// app/javascript/controllers/schedule_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["technicians", "technicianTemplate"]

    connect() {
        this.index = this.techniciansTarget.children.length
    }

    addTechnician(event) {
        event.preventDefault()
        const content = this.technicianTemplateTarget.innerHTML
            .replace(/NEW_RECORD/g, new Date().getTime().toString())
        this.techniciansTarget.insertAdjacentHTML('beforeend', content)
    }

    removeTechnician(event) {
        const wrapper = event.target.closest('.grid')
        const destroyInput = wrapper.querySelector('input[name*="_destroy"]')

        if (destroyInput) {
            destroyInput.value = "1"
            wrapper.style.display = 'none'
        } else {
            wrapper.remove()
        }
    }

    updateFrequencyValue() {
        // Lógica para actualizar/validar frequency_value según frequency_type
    }
}
