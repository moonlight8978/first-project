import { ErogesController } from './eroges/eroges.controller';
import { FormController } from './form/form.controller';

import { appState } from './app.state';
import { erogesState} from './eroges/eroges.state';
import { formState } from './form/form.state';

angular
    .module('app', [
        'ui.router',
        'ngMap',
        'angular-loading-bar',
        'ngStorage',
        'ngResource',
        'ui.bootstrap'
    ])
    .config(appState)
    .controller('ErogesController', ErogesController)
    .config(erogesState)
    .controller('FormController', FormController)
    .config(formState);