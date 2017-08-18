from flask import Flask
app = Flask(__name__)

@app.route('/self-test')
def self_test():
    return "I'm alive!"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

