<?php

/**
 * Created by IntelliJ IDEA.
 * User: chrisstetson
 * Date: 8/4/16
 * Time: 5:17 PM
 */

use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use Symfony\Component\Serializer\Encoder\JsonDecode;



class ContentService
{
    /**
     * @var string
     */
    private $url;

    /**
     * @var string
     */
    private $client;

    /**
     * @var string
     */
    private $content;

    /**
     * backend constructor.
     */
    public function __construct() {
        $this->url = getenv("BACKEND_ENDPOINT_URL") . "/content";
    }

    /**
     * @return string
     */
    public function getContent()
    {
        $this->content = $this->getRequest();
        return $this->content;
    }



    /***************************UTILS***********************?
    /**
     * @return Client
     */
    private function getClient() {
        if ($this->client == null) {
            $this->client = new Client(['base_uri' => $this->url ]);
        }

        return $this->client;
    }

    /**
     *
     * @return string
     */
    private function getRequest() {
        try
        {
            $client = $this->getClient();
            $response = $client->request('GET');

            $body = $response->getBody()->__toString();

            $decoder = new JsonDecode();
            $content = $decoder->decode($body, true);
            return $content;
        }
        catch (RequestException $e)
        {
            echo $e;
        }
    }
}