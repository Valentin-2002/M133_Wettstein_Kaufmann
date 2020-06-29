<?php

namespace LoginModule;

use Laminas\ServiceManager\Factory\InvokableFactory;



return [
    'controllers' => [
        'factories' => [
            Controller\LoginModuleController::class => InvokableFactory::class,
        ],
    ],

        // The following section is new and should be added to your file:
        'router' => [
            'routes' => [
                'login' => [
                    'type'    => Segment::class,
                    'options' => [
                        'route' => '/login[/:action[/:id]]',
                        'constraints' => [
                            'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            'id'     => '[0-9]+',
                        ],
                        'defaults' => [
                            'controller' => Controller\LoginModuleController::class,
                            'action'     => 'index',
                        ],
                    ],
                ],
            ],
        ],

    'view_manager' => [
        'template_path_stack' => [
            'login' => __DIR__ . '/../view',
        ],
    ],
];