# Candidate Profile

## Identity
- **Name:** Travis Brown
- **Location:** Glens Falls, NY (home) / Rochester, NY (school at RIT)
- **Phone:** 518-796-8703
- **Email:** browntravis760@gmail.com
- **LinkedIn:** https://www.linkedin.com/in/tbrown5932
- **GitHub:** https://github.com/tmb5932
- **Website:** www.travismbrown.com
- **Languages:** English (native)
- **Citizenship:** U.S. citizen — meets all ITAR/export control requirements
- **Status:** BS/MS Computer Science student at RIT (expected December 2027), currently interning at GE Vernova
- **Degree-level framing:** Combined BS/MS program means Travis can be presented as either "in-progress undergraduate" or "in-progress graduate" when a posting distinguishes the two (dual pay tiers, "master's students only" eligibility lines). Pick whichever framing benefits the application and flag the choice for confirmation — never assume ineligibility just because a posting says "master's only."
- **Constraints:** [TO BE CONFIRMED — commute/relocation preferences for internships]

## Education

| Degree | Period | Institution | Notes |
|--------|--------|-------------|-------|
| Master of Science in Computer Science | 2023–2027 (exp. Dec 2027) | Rochester Institute of Technology, Rochester, NY | GPA: 3.96 |
| Bachelor of Science in Computer Science | 2023–2027 (exp. Dec 2027) | Rochester Institute of Technology, Rochester, NY | Concurrent with MS above |

## Professional Experience

### Embedded Software Intern — GE Vernova (May 2026 – Present)
- Developed embedded firmware in C for STM32F7 microcontrollers, implementing a full I/O subsystem from scratch for industrial radios with support for digital in/out, analog input, PWM output, and edge detection across three configurable I/O ports. **Technical accuracy note:** this I/O subsystem and all other STM32 peripheral work (drivers, EVT peripheral drivers, etc.) was built using STM32 HAL calls, not direct/raw register manipulation. "Register map" only correctly describes the Modbus protocol implementation specifically — Modbus is a register-based protocol (read/write registers to communicate, like an I2C device), so "register map" is accurate there and nowhere else. Never describe the I/O subsystem, drivers, or any non-Modbus work as involving "registers" or being "register-level." **Also:** don't call Modbus (or CANopen) "low-level interfacing." Modbus's register map is a data model an application-layer protocol defines over TCP/serial — it's register-*addressed*, not register-*level hardware access*. SPI, I2C, UART, ADC, PWM are genuine low-level hardware interfaces; CAN itself is a genuine low-level bus. Modbus and CANopen are application-layer protocols on top of those, not low-level themselves — use neutral framing like "protocols and interfaces" instead of "low-level interfaces" when grouping them together.
- Built Modbus TCP and serial/RTU protocol support from scratch for the radio; designed the full register map/application layer shared between both transports (the register map is mostly diagnostic data like temperature and RSSI, plus I/O state — diagnostics is the main focus, not I/O).
- Built MQTT protocol support from scratch, including TLS/MQTTS and MQTT-SN over UDP. **Technical accuracy note:** this MQTT work is all application-layer code — a library (Cyclone) handles the actual low-level network operations underneath it. Never describe MQTT as "low-level" or group it with genuine low-level interfaces (SPI/I2C/UART/ADC/PWM) or with Modbus's register-map work.
- Debugged hardware and firmware issues using Saleae logic analyzer and oscilloscope, iterating on target hardware via J-Link Segger.
- Built a Flask-based web application dashboard monitoring a dynamic industrial radio network, diagnosing and resolving memory leaks to achieve stable multi-day continuous runtime.

### Software QA Automation Intern — Lockheed Martin (May 2025 – August 2025)
- Produced a Python-based automation tool that streamlined static code review, reducing QA review time by 75% (from 20 mins to 5 mins).
- Automated over 60% of manual software validation checks, significantly reducing QA workload and improving team efficiency.
- Built and maintained CI/CD pipelines using GitLab CI, contributing to faster and more reliable testing cycles.

## Club / Extracurricular

### Embedded Software Engineer — RIT Electric Vehicle Team (August 2023 – Present)
College club at Rochester Institute of Technology, Rochester, NY. **This is a student club, not an employer.** Never describe EVT work as "production" firmware/experience, or otherwise imply it was done at a company — frame it accurately as club/project work. In writing that lists skills spanning both a job (GE Vernova) and EVT together (e.g. "production firmware experience with X, Y, Z"), keep EVT-only items (CAN/CANopen) out of the "production" claim — phrase them separately (e.g. "protocol work across CAN/CANopen").

**Real-Time Vehicle Control Unit (VCU)** (October 2025 – Present)
- Engineered embedded firmware in C++ for a custom-designed PCB serving as the central VCU for an electric motorcycle.
- Established CAN and CANopen communication between the VCU, motor controller, power subsystem, battery management, and more.
- Built board-level fault handling, drive-by-wire control, and system health monitoring on an STM32F446 managing dual CAN buses across powertrain and accessory networks.
- Designed CAN message formats and CANopen object dictionary; integrated a Simulink-generated 300 Hz state machine within ThreadX RTOS to meet hard real-time motor controller timing. **Authorship note:** the electrical engineers on the team build the Simulink model itself; Travis integrates the model they provide into the firmware. Never word this as if Travis authored/designed the Simulink model himself — "integrated" or "using their model" is accurate, "designed the Simulink model" or similar authorship claims are not.

**STM32 F4 Peripheral Support** (December 2023 – November 2024)
- Implemented driver support for PWM, ADC, SPI, and timers on the STM32F4 microcontroller family, working with the STM32 HAL.
- Leveraged STM32 CubeMX and CubeIDE to streamline configuration and integration with EVT's hardware-agnostic API.
- Applied microcontroller datasheets and reference manuals to develop reliable, reusable peripheral drivers.

## Independent Projects

- **Autonomous Fixed-Wing Flight Controller** (In Progress): Building a custom flight controller, both PCB and firmware, for a fixed-wing RC plane around an ESP32-S3, running in-line between a **standard off-the-shelf RC receiver** (not homemade) and the servos/ESCs so it can take over from the pilot. Implements PID-based roll/pitch stabilization and a waypoint-following outer loop (heading PID cascaded into the roll-attitude loop), validated through an **80-scenario SITL regression suite** (clean step responses, noise-robustness sweeps, waypoint-mission edge cases) ahead of flight testing — this grew from an earlier 32-scenario suite; the already-submitted SpaceX application intentionally still cites "32 GPS approach scenarios" as a historical snapshot, don't correct that specific text. Onboard primary/backup IMU redundancy and a barometer (SPI), plus microSD logging; external sensor support for GPS/compass, an airspeed sensor, and LIDAR (as of 2026-09-24 these are all still placeholder — either no real sensor in hand yet, or no software driver written yet). Built a setup-mode captive WiFi portal for field calibration of servo/ESC ranges, PID gains, airframe mixing mode, and GPS mission planning. Roadmap: (1) altitude hold, (2) automatic takeoff and landing, (3) stretch goal — two autonomous fixed-wing drones coordinating in formation with inter-drone position awareness. Status: **first test flight completed October 3, 2026** — manual mode (RC passthrough) only, no autonomous (PID stabilization/waypoint) testing yet. The flight surfaced an RF issue (signal dropping / intermittent mishaps), currently being debugged before further flight testing continues. Two early-stage sub-projects live in the same repo but aren't resume-worthy yet: a second "mission board" PCB (just started) and a UWB radio board (not yet integrated into firmware).

- **Handheld Chip-8 Emulator Console** (June 2025 – December 2025): Developed a Chip-8 emulator in Rust for a Raspberry Pi with display, input, and sound over GPIO and SPI. Fabricated a 4x4 matrix keypad PCB in KiCad (schematic, layout, hand-soldered). Created a custom SPI display driver for an SSD1309 OLED screen.

## Technical Skills

### Programming & Firmware
- **C** (primary): Embedded firmware, bare-metal and HAL-based development, memory management
- **C++** (primary): Embedded firmware, RTOS integration, real-time systems
- **Python**: Automation tooling, Flask web apps, scripting
- **Rust**: Systems programming, embedded targets (Raspberry Pi, GPIO/SPI)
- **Other:** Java, JavaScript, SQL, MIPS Assembly (academic / supporting)

### Embedded & Hardware
- **Microcontrollers:** STM32 (F4/F7/F446), ESP32
- **RTOS:** ThreadX
- **Protocols:** CAN, CANopen, SPI, I2C, UART, PWM, ADC
- **Debug tools:** OpenOCD, J-Link Segger, Saleae logic analyzer, oscilloscope
- **Hardware design:** KiCad (PCB schematic and layout, hand-soldering)

### Tools & Environments
- Git, GitHub, GitLab, GitLab CI/CD
- Linux, macOS
- STM32 CubeMX, CubeIDE, Simulink (integration)
- Flask

### Database
- PostgreSQL

## Publications
None.

## Awards
None recorded.

## References
Available upon request.
