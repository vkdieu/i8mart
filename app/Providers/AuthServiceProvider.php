<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use App\Models\User;
use App\Models\Permission;



class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $Permissions = Permission::all();
        $this->registerPolicies();
        
        foreach ($Permissions as  $Permission) {
            Gate::define($Permission->slug, function (User $user) use ($Permission) {
                return $user->hasPermission($Permission->slug); 
                    
               
            });
        }


        //
    }
}
