// sidebar_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["submenu", "menuItem"]

    connect() {
        const currentPath = window.location.pathname

        // Marca el submenu activo
        const activeSection = currentPath.split('/')[1]
        if (activeSection) {
            const submenu = this.submenuTargets.find(menu =>
                menu.dataset.section === activeSection
            )
            submenu?.classList.remove('hidden')
        }

        // Marca el ítem de menú activo
        this.menuItemTargets.forEach(item => {
            if (item.getAttribute('href') === currentPath) {
                item.classList.add('bg-blue-600', 'text-white')
                item.classList.remove('text-gray-700', 'hover:bg-gray-50')
            }
        })
    }
}