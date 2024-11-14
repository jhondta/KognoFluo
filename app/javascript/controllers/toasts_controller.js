import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
    connect() {
        setTimeout(() => {
            const dismissButton = this.element.querySelector('[data-dismiss-target]');
            dismissButton?.click();
        }, 5000);
    }
}