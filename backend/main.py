import os
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore 
from flask import Flask
from flask import jsonify

app = Flask(__name__)

firebase_admin.initialize_app()
db = firestore.client()
ref = db.collection(u'WebsiteData').document('ViewingData')

@app.route("/", methods=['POST'])
def view_count():
    ref.update({'ViewCount': firestore.Increment(1)})
    viewcount = ref.get().to_dict()['ViewCount']
    response = jsonify({'ViewCount': viewcount})
    print("Returning: ", response)
    return response

if __name__ == "__main__":
    app.run(debug=False, host="0.0.0.0", port=os.environ.get("PORT", 8080))