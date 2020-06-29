<?php

namespace Controller\LoginController;

use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;

class LoginController extends AbstractActionController
{

    private $table;

    public function __construct(UserTable $table)
    {
        $this->table = $table;
    }

    public function indexAction()
    {
        return new ViewModel();
    }

    public function loginAction()
    {
    }

}