module main

import net.http
import os
  
const api_key = os.getenv("API_KEY")
const api_url = "https://api.openai.com/v1/engines/davinci-codex/completions"

fn main() {
    headers := {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + api_key
    }
    body := {
        "prompt": "What is the capital of France?",
        "temperature": 0.5
    }
    json_body := json.encode(body)
    res := http.post(api_url, headers=headers, body=json_body)
    println(res.body.str())
}
  
