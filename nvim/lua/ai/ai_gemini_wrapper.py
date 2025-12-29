#!/usr/bin/env python3
import os, json, urllib.request, sys

def chat(prompt):
    messages = [{"role":"user","content":prompt}]
    data = json.dumps({
        "model": "gemini-3-flash-preview",
        "messages": messages
    }).encode()

    headers = {
        "Authorization": f"Bearer {os.environ['GEMINI_API_KEY']}",
        "Content-Type": "application/json"
    }

    proxy = os.environ.get("https_proxy") or os.environ.get("HTTPS_PROXY")
    proxy_handler = urllib.request.ProxyHandler({"https": proxy}) if proxy else None
    opener = urllib.request.build_opener(proxy_handler) if proxy_handler else urllib.request.build_opener()

    req = urllib.request.Request(
        url="https://gcli.ggchan.dev/v1/chat/completions",
        data=data,
        headers=headers,
        method="POST"
    )

    with opener.open(req, timeout=30) as resp:
        r = json.loads(resp.read())
        print(r["choices"][0]["message"]["content"])

if __name__ == "__main__":
    chat(" ".join(sys.argv[1:]))
