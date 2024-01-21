import pigpio
import time
import logging

class Servos:
    """Operates each of the servos to their calibrated open/close position"""

    def __init__(self):
        try:
            self.pwm = pigpio.pi()

            # Initialize servo pins
            self.spice_servo = 13
            self.noodle_servo = 6
            self.water_servo = 5
            self.stove_servo = 12

            # Attach servos, set pinmode, and PWM base frequency
            self.pwm.set_mode(self.noodle_servo, pigpio.OUTPUT)
            self.pwm.set_PWM_frequency(self.noodle_servo, 50)
            self.pwm.set_mode(self.water_servo, pigpio.OUTPUT)
            self.pwm.set_PWM_frequency(self.water_servo, 50)
            self.pwm.set_mode(self.spice_servo, pigpio.OUTPUT)
            self.pwm.set_PWM_frequency(self.spice_servo, 50)
            self.pwm.set_mode(self.stove_servo, pigpio.OUTPUT)
            self.pwm.set_PWM_frequency(self.stove_servo, 50)

            # Initialize servos and move to start position
            # Remember to manually move the stove servo back to posiiton
            self.hold_noodle()
            self.hold_spice()
            self.hold_water()

        except Exception as e:
            print(e)
            return

    def hold_spice(self):
        self.pwm.set_servo_pulsewidth(self.spice_servo, 1200)
        time.sleep(1)
        self.pwm.set_servo_pulsewidth(self.spice_servo, 0)

    def gimme_spice(self):
        self.pwm.set_servo_pulsewidth(self.spice_servo, 700)
        time.sleep(1)
        self.pwm.set_servo_pulsewidth(self.spice_servo, 0)

    def hold_water(self):
        self.pwm.set_servo_pulsewidth(self.water_servo, 985)
        time.sleep(1)
        self.pwm.set_servo_pulsewidth(self.water_servo, 0)

    def pour_water(self):
        self.pwm.set_servo_pulsewidth(self.water_servo, 2100)
        time.sleep(1)
        self.pwm.set_servo_pulsewidth(self.water_servo, 0)

    def hold_noodle(self):
        self.pwm.set_servo_pulsewidth(self.noodle_servo, 800)
        time.sleep(1)
        self.pwm.set_servo_pulsewidth(self.noodle_servo, 0)

    def drop_noodle(self):
        self.pwm.set_servo_pulsewidth(self.noodle_servo, 2000)
        time.sleep(1)
        self.pwm.set_servo_pulsewidth(self.noodle_servo, 0)

    def turn_off_stove(self):
        self.pwm.set_servo_pulsewidth(self.stove_servo, 500)
        time.sleep(0.4)
        self.pwm.set_servo_pulsewidth(self.stove_servo, 0)

    def turn_on_stove(self):
        self.pwm.set_servo_pulsewidth(self.stove_servo, 2500)
        time.sleep(0.4)
        self.pwm.set_servo_pulsewidth(self.stove_servo, 0)

    def show_dry_demo(self):
        self.drop_noodle()
        time.sleep(0.5)
        self.hold_noodle()
        time.sleep(0.5)
        self.gimme_spice()
        self.hold_spice()
        time.sleep(1)
        self.pour_water()
        time.sleep(3)
        self.hold_water()
        time.sleep(1)
        self.turn_on_stove()
        time.sleep(3)
        self.turn_off_stove()

    def show_full_demo(self):
        self.drop_noodle()
        time.sleep(0.5)
        self.hold_noodle()
        time.sleep(0.5)
        self.gimme_spice()
        self.hold_spice()
        time.sleep(1)
        self.pour_water()
        time.sleep(3)
        self.hold_water()
        time.sleep(68)
        self.turn_on_stove()
        time.sleep(300)
        self.turn_off_stove()

if __name__ == "__main__":
    servos = Servos()
    servos.show_dry_demo()