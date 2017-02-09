from bottle import route, run, template, static_file, request
import random
import json
import pymysql

connection = pymysql.connect(host = 'sql11.freesqldatabase.com',
                             user = 'sql11157877',
                             password = 'PzbGCtxc2e',
                             db = 'sql11157877',
                             charset = 'utf8',
                             cursorclass = pymysql.cursors.DictCursor)


@route("/", method="GET")
def index():
    return template("adventure.html")



def getUserFromDB(user_name):
  return None

def createANewUser():
  return "1"

def getQuestionFromDB(next_step = 1, adventure_id = 1):
  try:
      with connection.cursor() as cursor:
        sql = "SELECT * FROM sql11157877.question_table AS q LEFT JOIN sql11157877.options_table AS o ON q.question_id = o.question_id WHERE q.question_id = {} AND q.adventure_id = {} ;".format(next_step,adventure_id)
        cursor.execute(sql)
        result = cursor.fetchall()
        return result
  except Exception as e:
    print(repr(e))
  return None



@route("/start", method="POST")
def start():
    user_name = request.POST.get("name")
    current_adv_id = request.POST.get("adventure_id")

    nextStep = 1
    user_id = "1"
    currentUser = getUserFromDB(user_name)
    if currentUser:
      nextStep = currentUser["current_question"]
      user_id = currentUser["user_id"]
    else:
      user_id = createANewUser()
    question_text = "Choose Your Adventure"

    options = [{"option_text":"Adventure 1","id":"1"},{"option_text":"Adventure 1","id":"1"},{"option_text":"Adventure 1","id":"1"},{"option_text":"Adventure 1","id":"1"}]


    return json.dumps({"user": user_id,
                   "adventure": current_adv_id,
                   "current": "1",
                   "text": question_text,
                   "image": "choice.jpg",
                   "options": options
                   })



@route("/story", method="POST")
def story():
    user_name = request.POST.get("name")
    current_adv_id = request.POST.get("adventure")

    nextStep = 1
    user_id = "1"
    currentUser = getUserFromDB(user_name)
    if currentUser:
      nextStep = currentUser["current_question"]
      user_id = currentUser["user_id"]
    else:
      user_id = createANewUser()
    nextQuestion = getQuestionFromDB(nextStep, current_adv_id)
    question_text = nextQuestion[0]["question_text"]
    options = []
    for r in nextQuestion:
      options.append({"option_text":r["option_text"],"id":r["option_id"]})


    return json.dumps({"user": user_id,
                   "adventure": current_adv_id,
                   "current": "1",
                   "text": question_text,
                   "image": "troll.png",
                   "options": options
                   })

@route('/js/<filename:re:.*\.js$>', method='GET')
def javascripts(filename):
    return static_file(filename, root='js')


@route('/css/<filename:re:.*\.css>', method='GET')
def stylesheets(filename):
    return static_file(filename, root='css')


@route('/images/<filename:re:.*\.(jpg|png|gif|ico)>', method='GET')
def images(filename):
    return static_file(filename, root='images')

def main():
    run(host='localhost', port=7000)

if __name__ == '__main__':
    main()

