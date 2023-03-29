from flask import Flask  # 서버 구현을 위한 Flask 객체 import
from flask_restx import Api, Resource  # Api 구현을 위한 Api 객체 import
from apscheduler.schedulers.background import BackgroundScheduler
app = Flask(__name__)  # Flask 객체 선언, 파라미터로 어플리케이션 패키지의 이름을 넣어줌.
api = Api(app)  # Flask 객체에 Api 객체 등록
schedule = BackgroundScheduler(daemon=True, timezone='Asia/Seoul') 
# @schedule.scheduled_job('cron', hour='12', minute='30', id='test_2')
@schedule.scheduled_job('cron', minute='1', id='test_2')
def scheduler(): 

    # 출력할 문구 
    print("Scheduler is alive!") 
    
# timezone을 설정해두지 않으면 경고문구가 뜰 수 있다! 
# BackgroundScheduler을 통해 schedule 인스턴스를 생성한다. 
    
# 추가하고 싶은 작업을 add_job 매서드를 통해 설정한다. 
# schedule.add_job(scheduler, 'cron', week='1-53', day_of_week='0-6',minute='1') 
    
# 스케줄을 start()로 호출한다 
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
    app.run(debug=True, host='0.0.0.0', port=90)