<?php

namespace app\controllers;
use sizeg\jwt\Jwt;
use sizeg\jwt\JwtHttpBearerAuth;
use Yii;
use yii\filters\VerbFilter;
use yii\rest\Controller;
use yii\web\Response;
use app\models\User;

class ApiController extends Controller
{

    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['authenticator'] = [
            'class' => JwtHttpBearerAuth::class,
            'optional' => [
                'login',
            ],

        ];
        $behaviors['verbs'] = [
            'class' => VerbFilter::className(),
            'actions' => [
                'login' => ['POST'],
            ],
        ];

        return $behaviors;
    }
    
    public function actionIndex()
    {
        return $this->render('index');
    }
    public function actionLogin()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            $username = $post['username'];
            $password = $post['password'];
            $check = $this->AuthCheck($username,$password);
            return $check;
           
        }

    }
    

    public function actionData()
    {
        return $this->asJson([
            'success' => true,
        ]);
    }

    private function AuthCheck($username,$password){
        
        $user = User::findByUsername($username);
    
            if ($user) {
                if ($user->validatePassword($password)) {
                    return  $this->actionAuth($user->auth_key);
                } else {
                    return [
                        'status' => false,
                        'message' => 'รหัสผ่านม่ถูกต้อง',
                        'data' => null,
                    ];
                }

            } else {
                return [
                    'status' => false,
                    'message' => 'ชื่อผู้ใช้ไม่ถูกต้อง',
                    'data' => null,
                ];
            }
    }

    public function actionAuth($auth_key)
    {
        /** @var Jwt $jwt */
        $jwt = Yii::$app->jwt;
        $signer = $jwt->getSigner('HS256');
        $key = $jwt->getKey();
        $time = time();
        // Adoption for lcobucci/jwt ^4.0 version
        $token = $jwt->getBuilder()
            ->issuedBy('http://example.com')
            ->permittedFor('http://example.org')
            ->identifiedBy('4f1g23a12aa', true)
            ->issuedAt($time)
            ->expiresAt($time + 3600) 
            ->withClaim('uid', $auth_key) // auth_key ใน ตาราง user
            ->getToken($signer, $key); 
        return $this->asJson([
            'status' => true,
            'token' => (string) $token,
        ]);
    }

}