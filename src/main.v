module main

import net.http
import os
import zztkm.vdotenv
import json

const api_url = "https://api.openai.com/v1/completions"

struct Body {
	prompt string
	temperature f32
	model string
  	max_tokens int
 	top_p int
 	n int
  	stream bool
  	stop string

}

fn main() {
    vdotenv.load("src/.env")

	api_key := os.getenv("API_KEY")

	body := Body{
		model: "text-davinci-003",
		prompt: "Say this is a test",
		max_tokens: 7,
		temperature: 0,
  		top_p: 1,
 	 	n: 1,
  		stream: false,
		stop: "\n"
	}

	mut conf := http.FetchConfig{
		url: api_url
		data: json.encode(body)
		method: .post
	}

	conf.header.add_custom('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36') !
	conf.header.add_custom("Authorization", "Bearer ${api_key}") !
    conf.header.add_custom('Content-Type', 'application/json') !

	mut response := http.fetch(conf) !

    println(response.body)
}

