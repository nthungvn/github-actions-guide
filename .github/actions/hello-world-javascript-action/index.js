const core = require('@actions/core');
const github = require('@actions/github');

try {
  core.debug('Debug message');
  core.info('Info message');
  core.warning('Warning message');
  core.error('Error message');

  const nameToGreet = core.getInput('who-to-greet');
  core.setSecret(nameToGreet);

  console.log(`Hello ${nameToGreet}`);
  const time = new Date().toTimeString();

  core.setOutput('time', time);
  const payload = JSON.stringify(github.context.payload, undefined, 2);

  core.startGroup('The event payload');
  console.log(`The event payload: ${payload}`);
  core.endGroup();

  core.exportVariable('INPUT_NAME', nameToGreet);
} catch (error) {
  core.setFailed(error.message);
}
