<?php
namespace app\models;

use Yii;
use yii\base\NotSupportedException;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;
use yii\helpers\ArrayHelper;

class User extends ActiveRecord implements IdentityInterface
{
    const STATUS_DELETED = 0;
    const STATUS_ACTIVE = 10;

    public $password;
    public $confirm_password;
    public $roles;
    public $q;

    public function scenarios()
    {
		$scenarios = parent::scenarios();
        $scenarios['registration'] = ['username','email'];
        return $scenarios;
    }

    public static function tableName()
    {
        return '{{%user}}';
    }

 
    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
        ];
    }

     public function rules()
         {
             return [
                 ['status', 'default', 'value' => self::STATUS_ACTIVE],
                 ['status', 'in', 'range' => [self::STATUS_ACTIVE, self::STATUS_DELETED]],

                 ['username', 'filter', 'filter' => 'trim'],
                 ['username', 'required'],
                ['username', 'unique', 'targetClass' => '\app\models\User', 'message' => 'This username has already been taken.'],
                 ['username', 'string', 'min' => 2, 'max' => 255],

                 ['email', 'filter', 'filter' => 'trim'],
                 ['email', 'email'],
                ['email', 'unique', 'targetClass' => '\app\models\User', 'message' => 'This email address has already been taken.'],

                 ['password', 'required'],
                 ['password', 'string', 'min' => 6],
                 ['confirm_password', 'required'],
                 ['confirm_password', 'string', 'min' => 6],
                 ['confirm_password', 'compare','compareAttribute'=>'password'],

                 [['roles'], 'safe']

             ];
         }


         public function attributeLabels()
         {
             return [
                 'doctor_id' => 'รหัสแพทย์',
                 'fullname' => 'ชื่อ-สกุล',
                 'username' => 'ชื่อเข้าใช้งาน',
                 'password' => 'รหัสผ่าน',
                 'confirm_password' => 'ยืนยันรหัสผ่าน',
             ];
            }
 
    public static function findIdentity($id)
    {
        return static::findOne(['id' => $id, 'status' => self::STATUS_ACTIVE]);
    }

    public static function findIdentityByAccessToken($token, $type = null)
    {
        return static::findOne(['auth_key' => $token->getClaim('uid')]);
    }

    public static function findByUsername($username)
    {
        return static::findOne(['username' => $username, 'status' => self::STATUS_ACTIVE]);
        // return static::findOne(['username' => $username]);
    }

    public static function findByPasswordResetToken($token)
    {
        if (!static::isPasswordResetTokenValid($token)) {
            return null;
        }

        return static::findOne([
            'password_reset_token' => $token,
            'status' => self::STATUS_ACTIVE,
        ]);
    }
    
    public static function isPasswordResetTokenValid($token)
    {
        if (empty($token)) {
            return false;
        }

        $timestamp = (int) substr($token, strrpos($token, '_') + 1);
        $expire = Yii::$app->params['user.passwordResetTokenExpire'];
        return $timestamp + $expire >= time();
    }

    public function getId()
    {
        return $this->getPrimaryKey();
    }

    public function getAuthKey()
    {
        return $this->auth_key;
    }

    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password_hash);
    }

    public function setPassword($password)
    {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }

    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }

    public function generatePasswordResetToken()
    {
        $this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
    }

    public function removePasswordResetToken()
    {
        $this->password_reset_token = null;
    }

    public function getItemStatus(){
      return [
        self::STATUS_ACTIVE => 'Active',
        self::STATUS_DELETED => 'Deleted'
      ];
    }
    public function getStatusName()
    {
      $items = $this->getItemStatus();
      return array_key_exists($this->status, $items) ? $items[$this->status] : '';
    }

    public function getAllRoles(){
      $auth = $auth = Yii::$app->authManager;
      return ArrayHelper::map($auth->getRoles(),'name','name');
    }

    public function getRoleByUser(){
      $auth = Yii::$app->authManager;
      $rolesUser = $auth->getRolesByUser($this->id);
      $roleItems = $this->getAllRoles();
      $roleSelect=[];

      foreach ($roleItems as $key => $roleName) {
        foreach ($rolesUser as $role) {
          if($key==$role->name){
            $roleSelect[$key]=$roleName;
          }
        }
      }
      $this->roles = $roleSelect;
    }

    public function assignment(){
        $auth = Yii::$app->authManager;
        $roleUser = $auth->getRolesByUser($this->id);
        $auth->revokeAll($this->id);
        foreach ($this->roles as $key => $roleName) {
          $auth->assign($auth->getRole($roleName),$this->id);
        }
    }
    public function getIsBlocked()
    {
        return $this->blocked_at != null;
    }
    
    public function block()
    {
        return (bool)$this->updateAttributes([
            'blocked_at' => time(),
            'auth_key'   => \Yii::$app->security->generateRandomString(),
        ]);
    }
}