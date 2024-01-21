from flask import Flask, request, jsonify
from servos import Servos
import threading
import time

servos = Servos()
app = Flask(__name__)

def cook_ramen_thread():
    servos.show_full_demo()
    print("Finished cooking.")

# Endpoint that starts a long-running cook ramen task and responds immediately
@app.route('/cook-ramen', methods=['GET'])
def cook_ramen():
    # Start the long-running task in a separate thread
    thread = threading.Thread(target=cook_ramen_thread)
    thread.start()
    return jsonify({'Status': 'Task started. Cooking in progress.'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
