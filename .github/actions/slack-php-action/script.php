<?php
require_once 'vendor/autoload.php';
Requests::register_autoloader();

$slackToken = $_ENV["SLACK_TOKEN"];
$message = $_ENV["INPUT_MESSAGE"];
$repoName = $_ENV["GITHUB_REPOSITORY"];
$eventName = $_ENV["GITHUB_EVENT_NAME"];
$ref = $_ENV["GITHUB_REF"];
$sha = $_ENV["GITHUB_SHA"];

// var_dump($_ENV);

echo "::debug::Sending a new request to slack\n";

$body = array(
    "blocks" => array(
        0 => array(
            "type" => "section",
            "text" => array(
                "type" => "mrkdwn",
                "text" => $message,
            ) ,
        ) ,
        1 => array(
            "type" => "section",
            "fields" => array(
                0 => array(
                    "type" => "mrkdwn",
                    "text" => "*Repository Name:*\n$repoName",
                ) ,
                1 => array(
                    "type" => "mrkdwn",
                    "text" => "*Event:*\n$eventName",
                ) ,
                2 => array(
                    "type" => "mrkdwn",
                    "text" => "*Ref:*\n$ref",
                ) ,
                3 => array(
                    "type" => "mrkdwn",
                    "text" => "*SHA:*\n$sha",
                ) ,
            ) ,
        ) ,
    ) ,
);

$response = Requests::post("https://hooks.slack.com/services/TPLA3K081/B03GCMFAEBX/$slackToken", array(
    'Content-Type' => 'application/json'
) , json_encode($body));

echo "::group::Slack response\n";
var_dump($response);
echo "::endgroup::\n"

if (!$response->success)
{
    echo "::group::Slack error\n";
    echo $response->body;
    echo "::endgroup::\n"
    exit(1);
}

