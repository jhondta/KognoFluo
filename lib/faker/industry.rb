# frozen_string_literal: true

module Faker
  class Industry < Faker::Base
    class << self
      def plant_name
        "#{%w[Planta Complejo Centro].sample} #{%w[Norte Sur Este Oeste Central].sample}"
      end

      def area_name
        %w[Producción Empaque Laboratorio Almacén Mantenimiento Calidad
           Ingeniería Proyectos Taller].sample
      end

      def production_line
        "Línea #{%w[A B C 1 2 3].sample}-#{rand(100..999)}"
      end

      def asset_type
        %w[Bomba Motor Compresor Transportador Robot PLC Válvula Sensor Actuador
           Transformador Generador Caldera Horno Reactor Tanque].sample
      end

      def asset_name(asset_type)
        "#{asset_type.name}-#{rand(1000..9999)}"
      end

      def manufacturer
        %w[Siemens ABB Schneider Rockwell Fanuc Honeywell Endress+Hauser
           Yokogawa Omron Mitsubishi].sample
      end

      def failure_mode
        %w[Desgaste Fatiga Corrosión Sobrecarga Desalineación Fuga
           Cortocircuito].sample
      end

      def plan_name_prefix
        %w[Plan Programa Procedimiento ].sample
      end

      def task_name
        %w[Inspección Lubricación Ajuste Reemplazo Calibración Limpieza Reparación].sample
      end

      def measurement_type
        %w[Temperatura Presión Flujo Nivel Vibración Corriente Voltaje Potencia].sample
      end

      def tool
        %w[Llave Destornillador Pinza Martillo Sierra Taladro Pulidora Prensa
           Soldadora Cizalla Torno Fresadora Rectificadora Inyectora Impresora
           Cortadora].sample
      end
    end
  end
end
