(function () {
    'use strict';

    angular
        .module('app')
        .factory('SocialLogin', SocialLogin);

    SocialLogin.$inject = ['$http', 'Auth', 'Principal', 'SERVER'];

    function SocialLogin($http, Auth, Principal, server) {
        const LOGIN_URL = server.login;
        
        let service = {
            google: google,
            isGoogleSignedIn: isGoogleSignedIn,
            isFacebookSignedIn: isFacebookSignedIn,
            facebook: facebook,
        };

        return service;
        
        function isGoogleSignedIn() {
            return auth2.isSignedIn.get();
        }

        function google() {
            let p = new Promise(handler);
            
            async function handler(resolve, reject) {
                let auth_code;
                
                try {
                    auth_code = await auth2.grantOfflineAccess();
                } catch (e) {
                    reject(e);
                    console.log(e);
                    return;
                }
                
                try {
                    await loginToServer({
                        provider: 'google',
                        auth_code
                    });
                    resolve(1);
                } catch (e) {
                    console.log(e);
                    reject(e.data);
                }
            }
            
            return p;
        }
        
        function isFacebookSignedIn() {
            return ;
        }
        
        async function facebook() {
            let p = new Promise(handler);
            
            function handler(resolve, reject) {
                FB.getLoginStatus(async (response) => {
                    if (response.status  !== 'connected') {
                        FB.login((res) => {
                            callback(res)
                                .then(
                                    () => {
                                        resolve(1);
                                        return;
                                    },
                                    (error) => {
                                        reject(error);
                                        return;
                                    }
                                );
                        });
                    } else {
                        try {
                            await callback(response);
                            resolve(1);
                        } catch (e) {
                            reject(e);
                        }
                    }
                });
            }
            
            return p;
            
            async function callback(response) {
                try {
                    await loginToServer({
                        provider: 'facebook',
                        auth_code: { 
                            access_token: response.authResponse.accessToken,
                            expiresIn: response.authResponse.expiresIn,
                        }
                    });
                    return 1;
                } catch (e) {
                    throw new Error(e);
                }
            }
        }
        
        async function loginToServer({ provider, auth_code }) {
            let credentials;
            switch (provider) {
            case 'google':
            case 'facebook':
            case 'twitter':
                try {
                    credentials = await $http.post(
                        `${LOGIN_URL}/${provider}`, auth_code);
                    auth(credentials);
                    return 1;
                } catch (e) {
                    throw new Error(e.data);
                }
                break;
            default:
                throw new Error('Provider is not match');
            }
            
            function auth(response) {
                const session = {
                    user: response.data,
                    token: response.headers('x-token'),
                };
                Auth.storeSession(session);
                Principal.authenticate();
            }
        }
    }
})();
