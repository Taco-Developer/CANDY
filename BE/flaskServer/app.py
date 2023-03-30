from flask import Flask  # 서버 구현을 위한 Flask 객체 import
from flask_restx import Api, Resource  # Api 구현을 위한 Api 객체 import
from apscheduler.schedulers.background import BackgroundScheduler
import model
app = Flask(__name__)  # Flask 객체 선언, 파라미터로 어플리케이션 패키지의 이름을 넣어줌.
api = Api(app)  # Flask 객체에 Api 객체 등록
schedule = BackgroundScheduler(daemon=True, timezone='Asia/Seoul')

def recommend_and_schedule():
    model.recommend_flow()
    print("오늘의 스케줄링 끝!")

def make_log():
    print("5초마다 확인! ")

schedule.add_job(recommend_and_schedule, 'cron', week='1-53', day_of_week='0-6', hour='4')
schedule.add_job(make_log, 'cron', week='1-53', day_of_week='0-6', second='5,15,25')

schedule.start()

@api.route('/hello')  # 데코레이터 이용, '/hello' 경로에 클래스 등록
class HelloWorld(Resource):
    def get(self):  # GET 요청시 리턴 값에 해당 하는 dict를 JSON 형태로 반환
        return {"hello": "world!"}

@api.route('/reccomand')
class ReccomandBeer(Resource):
    def put(self):
        return {"hello": "world!"}


if __name__ == "__main__":
    app.run(debug=False,use_reloader=False, host='0.0.0.0', port=90)