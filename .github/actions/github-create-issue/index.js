import * as core from '@actions/core';
import * as github from '@actions/github';

try {
  const token = core.getInput('github-token');
  const title = core.getInput('title');
  const body = core.getInput('body');
  const assignees = core.getMultilineInput('assignees');

  const octokit = github.getOctokit(token);
  const response = await octokit.rest.issues.create({
    ...github.context.repo,
    title,
    body,
    assignees,
  });
  core.setOutput('issue', JSON.stringify(response.data));
} catch (error) {
  core.setFailed(error.message);
}
