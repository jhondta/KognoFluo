# frozen_string_literal: true

module Faker
  class Industry < Faker::Base
    class << self
      def plant_name
        "#{[ 'Planta', 'Complejo', 'Centro' ].sample} #{[ 'Norte', 'Sur', 'Este', 'Oeste', 'Central' ].sample}"
      end

      def area_name
        [ 'Producción', 'Empaque', 'Almacén', 'Control de Calidad', 'Mantenimiento', 'Servicios' ].sample
      end

      def production_line
        "Línea #{[ 'A', 'B', 'C', '1', '2', '3' ].sample}-#{rand(100..999)}"
      end

      def asset_type
        [ 'Bomba', 'Motor', 'Compresor', 'Transportador', 'Robot', 'PLC', 'Válvula', 'Sensor' ].sample
      end

      def asset_name
        prefix = [ 'EQ', 'MAQ', 'INST', 'TOOL' ].sample
        "#{prefix}-#{rand(1000..9999)}"
      end

      def manufacturer
        [ 'Siemens', 'ABB', 'Schneider', 'Rockwell', 'Fanuc', 'Honeywell', 'Endress+Hauser' ].sample
      end

      def maintenance_type
        [ 'Preventivo', 'Correctivo', 'Predictivo', 'Basado en Condición', 'Overhaul' ].sample
      end

      def failure_mode
        [ 'Desgaste', 'Fatiga', 'Corrosión', 'Sobrecarga', 'Desalineación', 'Fuga', 'Cortocircuito' ].sample
      end

      def criticality
        [ 'Alta', 'Media', 'Baja' ].sample
      end

      def status
        [ 'Operativo', 'En Mantenimiento', 'Detenido', 'En Reparación', 'Fuera de Servicio' ].sample
      end
    end
  end
end
