import appModule from './app.module';

import ErogesController from './eroges/eroges.controller';
import FormController from './form/form.controller';

import appState from './app.state';
import erogesState from './eroges/eroges.state';
import formState from './form/form.state';

appModule
    .controller('ErogesController', ErogesController)
    .controller('FormController', FormController);

appModule
    .config(appState)
	.config(erogesState)
	.config(formState);
    