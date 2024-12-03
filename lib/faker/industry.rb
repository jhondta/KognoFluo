# frozen_string_literal: true

require 'faker'

module Faker
  class Industry < Faker::Base
    ASSET_CATEGORIES = {
      'Equipos de Bombeo' => {
        types: [
          'Bomba Centrífuga', 'Bomba de Desplazamiento Positivo', 'Bomba Sumergible',
          'Sistema de Bombeo Multietapa', 'Bomba de Vacío', 'Bomba Dosificadora'
        ],
        components: {
          mecanicos: [
            'Impulsor', 'Eje', 'Sello Mecánico', 'Rodamientos', 'Acoplamiento',
            'Empaquetadura', 'Carcasa', 'Difusor', 'Base del Motor'
          ],
          electricos: [
            'Motor Eléctrico', 'Variador de Frecuencia', 'Panel de Control',
            'Sensores de Temperatura', 'Sistema de Protección', 'Cables de Potencia'
          ],
          hidraulicos: [
            'Válvula de Succión', 'Válvula de Descarga', 'Tubería de Succión',
            'Tubería de Descarga', 'Válvula Check', 'Sistema de Cebado'
          ]
        },
        specs: {
          caudal: -> { "#{rand(1..1000)} m³/h" },
          presion: -> { "#{rand(1..50)} bar" },
          potencia: -> { "#{rand(1..500)} kW" },
          velocidad: -> { "#{rand(900..3600)} RPM" }
        }
      },

      'Equipos de Compresión' => {
        types: [
          'Compresor de Tornillo', 'Compresor Centrífugo', 'Compresor Reciprocante',
          'Compresor de Paletas', 'Turbocompresor', 'Compresor Scroll'
        ],
        components: {
          mecanicos: [
            'Tornillos Compresores', 'Pistones', 'Cigüeñal', 'Bielas',
            'Sistema de Lubricación', 'Cojinetes', 'Filtro de Aire'
          ],
          control: [
            'Válvula de Control', 'Presostato', 'Tablero de Control',
            'PLC', 'Sensores de Presión', 'Válvula de Seguridad'
          ],
          refrigeracion: [
            'Intercambiador de Calor', 'Ventilador', 'Radiador',
            'Separador de Aceite', 'Sistema de Enfriamiento'
          ]
        },
        specs: {
          presion_max: -> { "#{rand(5..100)} bar" },
          caudal_aire: -> { "#{rand(10..1000)} CFM" },
          potencia: -> { "#{rand(5..100)} kW" },
          nivel_ruido: -> { "#{rand(65..85)} dB" }
        }
      },

      'Equipos de Proceso Térmico' => {
        types: [
          'Caldera Industrial', 'Intercambiador de Calor', 'Horno Industrial',
          'Torre de Enfriamiento', 'Reactor Térmico', 'Sistema de Vapor'
        ],
        components: {
          combustion: [
            'Quemador', 'Cámara de Combustión', 'Chimenea',
            'Sistema de Ignición', 'Control de Llama'
          ],
          control: [
            'Controlador de Temperatura', 'Válvula de Seguridad', 'Termostato',
            'Presostato', 'Sistema de Monitoreo'
          ],
          mecanicos: [
            'Ventilador de Tiro', 'Bomba de Alimentación', 'Serpentín',
            'Tubos de Fuego', 'Sistema de Purga'
          ]
        },
        specs: {
          temp_max: -> { "#{rand(100..800)} °C" },
          capacidad: -> { "#{rand(100..5000)} kcal/h" },
          consumo: -> { "#{rand(10..100)} kW/h" },
          presion_trabajo: -> { "#{rand(1..16)} bar" }
        }
      },

      'Sistemas de Transporte' => {
        types: [
          'Transportador de Banda', 'Elevador de Cangilones', 'Transportador de Tornillo',
          'Transportador de Rodillos', 'Transportador de Cadena', 'Sistema Neumático'
        ],
        components: {
          mecanicos: [
            'Banda Transportadora', 'Rodillos', 'Poleas', 'Tensor',
            'Estructura de Soporte', 'Tambor Motriz', 'Tambor de Cola'
          ],
          transmision: [
            'Motor Reductor', 'Cadenas', 'Sprockets', 'Chumaceras',
            'Sistema de Transmisión', 'Acoplamientos'
          ],
          control: [
            'Sensor de Velocidad', 'Sensor de Alineamiento', 'Paro de Emergencia',
            'Variador de Velocidad', 'Sistema de Seguridad'
          ]
        },
        specs: {
          capacidad: -> { "#{rand(1..100)} ton/h" },
          velocidad: -> { "#{rand(0.1..2.0).round(1)} m/s" },
          longitud: -> { "#{rand(5..100)} m" },
          ancho: -> { "#{rand(400..2000)} mm" }
        }
      },

      'Sistemas Hidráulicos' => {
        types: [
          'Unidad Hidráulica', 'Sistema de Lubricación', 'Sistema de Refrigeración',
          'Sistema de Filtración', 'Sistema de Presión'
        ],
        components: {
          hidraulicos: [
            'Bomba Hidráulica', 'Válvulas Direccionales', 'Cilindros Hidráulicos',
            'Acumulador', 'Tanque Hidráulico', 'Filtros'
          ],
          control: [
            'Manómetros', 'Sensores de Presión', 'Sensores de Nivel',
            'Termostatos', 'Flujómetros'
          ],
          filtracion: [
            'Filtro de Aceite', 'Filtro de Aire', 'Separador de Agua',
            'Sistema de Venteo', 'Filtro de Retorno'
          ]
        },
        specs: {
          presion_max: -> { "#{rand(50..350)} bar" },
          caudal: -> { "#{rand(10..200)} L/min" },
          capacidad_tanque: -> { "#{rand(100..1000)} L" },
          temp_trabajo: -> { "#{rand(20..80)} °C" }
        }
      },

      'Equipos de Control' => {
        types: [
          'PLC', 'Sistema SCADA', 'Panel de Control', 'Sistema DCS',
          'RTU', 'Sistema de Control Distribuido'
        ],
        components: {
          hardware: [
            'CPU', 'Módulos I/O', 'Fuente de Poder', 'HMI',
            'Backplane', 'Módulos de Comunicación'
          ],
          comunicacion: [
            'Switch Industrial', 'Gateway', 'Convertidor de Protocolo',
            'Router Industrial', 'Fibra Óptica'
          ],
          instrumentacion: [
            'Sensores', 'Transmisores', 'Actuadores',
            'Válvulas de Control', 'Indicadores'
          ]
        },
        specs: {
          procesador: -> { "#{rand(1..4)} GHz" },
          memoria: -> { "#{[ 4, 8, 16, 32, 64 ].sample} GB" },
          puertos: -> { "#{rand(8..48)} puertos" },
          protocolo: -> { [ 'Modbus TCP', 'Profinet', 'EtherNet/IP' ].sample }
        }
      },

      'Equipos Eléctricos' => {
        types: [
          'Transformador de Potencia', 'Centro de Control de Motores',
          'Generador Eléctrico', 'UPS Industrial', 'Tablero de Distribución',
          'Subestación Eléctrica'
        ],
        components: {
          potencia: [
            'Bobinados', 'Núcleo Magnético', 'Bushings',
            'Sistema de Refrigeración', 'Tanque Principal'
          ],
          control: [
            'Relés de Protección', 'Medidores', 'Interruptores',
            'Contactores', 'Sistema de Control'
          ],
          auxiliares: [
            'Banco de Baterías', 'Sistema de Ventilación',
            'Panel de Alarmas', 'Sistema de Monitoreo'
          ]
        },
        specs: {
          potencia: -> { "#{rand(100..10000)} kVA" },
          voltaje: -> { "#{[ 440, 4160, 13200, 34500 ].sample} V" },
          frecuencia: -> { "#{[ 50, 60 ].sample} Hz" },
          fases: -> { "#{[ 1, 3 ].sample} fases" }
        }
      }
    }

    PLANT_TYPES = {
      'Manufactura' => %w[Norte Sur Este Oeste],
      'Proceso' => %w[A B C],
      'Ensamble' => %w[Principal Secundaria],
      'Centro Distribución' => %w[Regional Nacional]
    }

    PLANT_AREAS = {
      'Producción' => %w[Ensamble Empaque Procesos],
      'Almacén' => [ 'Materias Primas', 'Producto Terminado', 'Repuestos' ],
      'Mantenimiento' => %w[Mecánico Eléctrico Instrumentación],
      'Calidad' => [ 'Laboratorio', 'Inspección', 'Control de Procesos' ]
    }

    MANUFACTURERS = [
      { name: 'Siemens', country: 'Alemania', specialties: %w[Control Eléctrico] },
      { name: 'ABB', country: 'Suiza', specialties: %w[Eléctrico Automatización] },
      { name: 'Schneider', country: 'Francia', specialties: %w[Eléctrico Control] },
      { name: 'Allen-Bradley', country: 'USA', specialties: %w[Control Automatización] },
      { name: 'WEG', country: 'Brasil', specialties: %w[Motores Eléctrico] },
      { name: 'KSB', country: 'Alemania', specialties: %w[Bombas Válvulas] },
      { name: 'Grundfos', country: 'Dinamarca', specialties: %w[Bombas Sistemas] },
      { name: 'Sulzer', country: 'Suiza', specialties: %w[Bombas Compresores] },
      { name: 'Atlas Copco', country: 'Suecia', specialties: %w[Compresores Herramientas] },
      { name: 'Endress+Hauser', country: 'Suiza', specialties: %w[Instrumentación Medición] },
      { name: 'Emerson', country: 'USA', specialties: %w[Control Válvulas] },
      { name: 'Yokogawa', country: 'Japón', specialties: %w[Control Instrumentación] }
    ]

    TOOLS = {
      'Medición' => [
        'Multímetro Digital', 'Osciloscopio', 'Termómetro Infrarrojo',
        'Calibrador Digital', 'Medidor de Vibraciones', 'Medidor de Espesores'
      ],
      'Mecánicas' => [
        'Torquímetro', 'Extractor de Rodamientos', 'Alineador Láser',
        'Bomba Hidráulica Manual', 'Prensa Hidráulica', 'Cizalla Mecánica'
      ],
      'Eléctricas' => [
        'Megóhmetro', 'Probador de Rigidez Dieléctrica',
        'Analizador de Redes', 'Cámara Termográfica', 'Localizador de Fallas'
      ],
      'Especiales' => [
        'Detector de Fugas Ultrasónico', 'Balanceadora Dinámica',
        'Analizador de Aceite', 'Equipo de Termografía', 'Medidor de Aislamiento'
      ]
    }

    class << self
      def plant_name
        type = PLANT_TYPES.keys.sample
        identifier = PLANT_TYPES[type].sample
        "#{type} #{identifier}"
      end

      def area_name
        department = PLANT_AREAS.keys.sample
        subarea = PLANT_AREAS[department].sample
        "#{department} - #{subarea}"
      end

      def production_line_name(area_name)
        return "Línea #{('A'..'E').to_a.sample}-#{rand(100..999)}" if area_name.name.include?('Producción')
        return "Almacén #{('1'..'3').to_a.sample}-#{rand(10..99)}" if area_name.name.include?('Almacén')
        "Área #{('1'..'5').to_a.sample}-#{rand(10..99)}"
      end

      def manufacturer_data
        MANUFACTURERS.sample
      end

      def manufacturer
        manufacturer_data[:name]
      end

      def asset_category
        ASSET_CATEGORIES.keys.sample
      end

      def asset_type(category = nil)
        category ||= asset_category
        return unless ASSET_CATEGORIES[category]
        ASSET_CATEGORIES[category][:types].sample
      end

      def asset_name(type)
        "#{manufacturer} #{type.name}-#{rand(1000..9999)}"
      end

      def component(category = nil)
        category ||= asset_category
        return unless ASSET_CATEGORIES[category]

        subsystem = ASSET_CATEGORIES[category][:components].keys.sample
        ASSET_CATEGORIES[category][:components][subsystem].sample
      end

      def tool_type
        TOOLS.keys.sample
      end

      def tool(type = nil)
        type ||= tool_type
        return TOOLS[type].sample if TOOLS[type]
        TOOLS.values.flatten.sample
      end

      def technical_specs(category = nil)
        category ||= asset_category
        return {} unless ASSET_CATEGORIES[category]

        specs = ASSET_CATEGORIES[category][:specs]
        specs.transform_values { |proc| proc.call }
      end

      def failure_mode
        [
          'Desgaste', 'Fatiga', 'Corrosión', 'Sobrecarga', 'Desalineación',
          'Fuga', 'Cortocircuito', 'Vibración Excesiva', 'Sobrecalentamiento',
          'Rotura', 'Obstrucción', 'Falla de Lubricación'
        ].sample
      end

      def maintenance_task
        [
          'Inspección', 'Lubricación', 'Ajuste', 'Reemplazo', 'Calibración',
          'Limpieza', 'Reparación', 'Alineación', 'Balanceo', 'Prueba Funcional',
          'Medición', 'Verificación'
        ].sample
      end

      def measurement_type
        %w[Temperatura Presión Flujo Nivel Vibración Corriente Voltaje Potencia Velocidad Torque pH Conductividad].sample
      end

      def measurement_unit(type = nil)
        type ||= measurement_type
        case type
        when 'Temperatura' then '°C'
        when 'Presión' then 'bar'
        when 'Flujo' then 'm³/h'
        when 'Nivel' then '%'
        when 'Vibración' then 'mm/s'
        when 'Corriente' then 'A'
        when 'Voltaje' then 'V'
        when 'Potencia' then 'kW'
        when 'Velocidad' then 'RPM'
        when 'Torque' then 'N·m'
        when 'pH' then 'pH'
        when 'Conductividad' then 'µS/cm'
        else 'unidad'
        end
      end

      def physical_location(category = nil)
        area = %w[Producción Almacén Mantenimiento].sample
        sector = "Sector #{('A'..'E').to_a.sample}"
        posicion = "Pos-#{rand(1..99)}"

        case category
        when 'Equipos de Control'
          "Sala de Control #{rand(1..3)}, Rack #{rand(1..10)}"
        when 'Equipos Eléctricos'
          "Subestación #{('A'..'E').to_a.sample}, Panel #{rand(1..20)}"
        else
          "#{area}, #{sector}, #{posicion}"
        end
      end

      def maintenance_frequency
        {
          type: %w[Horas Días Semanas Meses Años].sample,
          value: case type
                 when 'Horas' then [ 500, 1000, 2000, 5000 ].sample
                 when 'Días' then [ 1, 7, 15, 30 ].sample
                 when 'Semanas' then [ 1, 2, 4, 8 ].sample
                 when 'Meses' then [ 1, 3, 6, 12 ].sample
                 when 'Años' then [ 1, 2, 5 ].sample
                 else 1
                 end
        }
      end

      def criticality_level
        %w[Bajo Medio Alto Crítico].sample
      end
    end
  end
end
