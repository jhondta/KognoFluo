import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
    static targets = ["select"]
    static values = {
        baseUrl: String,
        param: String
    }

    connect() {
        this.selectTargets.forEach(select => {
            if (select.id === "") {
                select.id = Math.random().toString(36)
            }
        })
    }

    async update(event) {
        const currentSelect = event.target
        const selectedId = currentSelect.value

        const childSelectId = currentSelect.dataset.selectChildId
        if (!childSelectId) return

        const childSelect = this.selectTargets.find(s => s.id === childSelectId)
        if (!childSelect) return

        this.disableChain(childSelect)

        if (!selectedId) {
            this.resetChain(childSelect)
            return
        }

        const childUrl = childSelect.dataset.selectUrl
        if (!childUrl) return

        const url = childUrl.replace(':parentId', selectedId)

        let params = new URLSearchParams()
        params.append(this.paramValue, selectedId)
        params.append("target", childSelect.id)
        // Enviamos el placeholder al servidor si lo necesitamos
        if (childSelect.dataset.selectPlaceholder) {
            params.append("placeholder", childSelect.dataset.selectPlaceholder)
        }
        // Enviamos si queremos mantener el placeholder
        params.append("keep_placeholder", childSelect.dataset.selectKeepPlaceholder === 'true')

        try {
            const response = await get(`${url}?${params}`, {
                responseKind: "turbo-stream"
            })

            // Si queremos manejar el placeholder desde el frontend:
            if (childSelect.dataset.selectKeepPlaceholder === 'true') {
                const placeholder = childSelect.dataset.selectPlaceholder || 'Seleccione una opción...'
                const placeholderOption = `<option value="">${placeholder}</option>`
                // Aseguramos que el placeholder esté al inicio
                if (!childSelect.querySelector('option[value=""]')) {
                    childSelect.insertAdjacentHTML('afterbegin', placeholderOption)
                }
            }

            childSelect.disabled = false
        } catch (error) {
            console.error("Error updating select:", error)
            this.resetChain(childSelect)
        }
    }

    disableChain(select) {
        let current = select
        while (current) {
            current.disabled = true
            const nextId = current.dataset.selectChildId
            current = nextId ? this.selectTargets.find(s => s.id === nextId) : null
        }
    }

    resetChain(select) {
        let current = select
        while (current) {
            const placeholder = current.dataset.selectPlaceholder || 'Seleccione una opción...'
            current.innerHTML = `<option value="">${placeholder}</option>`
            current.disabled = true
            const nextId = current.dataset.selectChildId
            current = nextId ? this.selectTargets.find(s => s.id === nextId) : null
        }
    }
}
