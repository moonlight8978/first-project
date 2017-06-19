import appModule from './app.module';

import { NovelService } from './resources/novel.service';

import { appState } from './app.state';

appModule;

appModule
  .factory('NovelService', NovelService);

appModule
	.config(appState);
