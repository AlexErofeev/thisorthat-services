from flask import Flask, request, abort
from spellcheck import autocorrect_text
app = Flask(__name__)

@app.route('/self-test')
def self_test():
    return "I'm alive!"


@app.route('/autocorrect', methods=['GET', 'POST'])
def autocorrect():
    sentence = request.form.get('sentence')
    if sentence == None:
        abort(400)
    return autocorrect_text(sentence)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

