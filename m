Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823216;
	b=3exI03UQDoGpYaohqlrd1d+k3+rCim8KZWkO44czRj7cIc762vWZVYzwWj/QAOc44hix
	 kuxvS5h2oeQVCv4nXmC8U9QaDG2wYQUwwiFAc9s0nDnQ3GmQZgZqIvWZsn49jhNo8JT6b
	 g9S7iOZA2nDVhiLefjUjiG/Hwy1DsbU3mgd7IxloCHmqBWPEjxwaYVsEWvMAUhuQm6Azq
	 PSGtTGe5pjTbUfaqDkGJX6SkwOJxV/flsVckRB99ZXssYI94lSWqSbaCvsm3aJNsZ2v+U
	 J/r8ZCkmZR5YgvfkqmY4buH/e6gDkbJVisYmxQrxH7O5h5qrEKRZRBu0ZcJ94f+V2DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mS0n0VCms4eHAxEd2Xq6Bm0DUZuN+p1NF5Q118cCuJU=;
	b=RhS98eycWVY1x5aH4DGv3XmFvvF76t+M4oiLQW0f5NDKACnYgE39FlVps1PjURd9jRTz
	 HyGn/iE16Gg7Tu2UYbiN4ZO8jPSv4fu4prQ/0vznoBu51xy5XFjt4kLsPqrP3Lf4do5cR
	 Z4Y/Rn6YjOZFoF06SMse5tfMw4recEPYzFI4uCsEs3fQskGzMAEWPoiXd2Nvrb43euSG2
	 RQHqC8WhNZGtCVBQVBFAUahhqba3hx5CSaP9ujtfw2rs1OZzWJhuId2aQlfvkTw+VW2xV
	 clSbpwc1YtDLgG0a0KO9JcNvrfuGXBR/noT+yMi4ntZ7Ih8vatMgGFXA1e6mT8I8X2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vEimE56H;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E89E606A333
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E89E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vEimE56H
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso10186135e9.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 02:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794823214; x=1795428014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mS0n0VCms4eHAxEd2Xq6Bm0DUZuN+p1NF5Q118cCuJU=;
        b=vEimE56H43Jg55t7HgEB/LzIS/rLakfMKe/pp0cuoCTuDwuPtYYUg4Mtvvh6nja5Fy
         TkNa3lt5+UyT643R4VzR2wBPKBUelTxRkfcWMtdAl8SGUujuqWVA6tHq0H39p98mM51x
         FEOtn3lBVqR+0qtSKDsSc8OGeXZE00fbpoGSJ9KD/Dxw7kCipkV3xlPSUNMOWPqEHJId
         ugUxulcTrtVMfugXrNv3CTh8rSqPfOpaCezGWvAur02ITF6g6iNaNPvDfx1y7ca4sTtW
         KgM8D4NdMsSdEhb95kYQ1VJX8VqLDJupoCQxikYEENQNeQ6qyeLb38svOTc9IwAV6IdP
         Rzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823214; x=1795428014;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mS0n0VCms4eHAxEd2Xq6Bm0DUZuN+p1NF5Q118cCuJU=;
        b=kJLJMAdD9hDU9MrMv1Ilau0e9TRaXwd+oGvO2oVwlqjzIJs4jKa2+4Fj3rctgD77jg
         AOMQD2tKE24aW3Gm1iZ0H/xrERsIuswmvq6JvQ+ysRB5rG6YBtr5haUfMVGtveIlL7we
         cL4JguP0z6JAwwyDanXZP1XhMQN3i2sfkHjRqq1Yk+vv9FGDDGx3qF/vbt4daO+kWciZ
         hUQRqqTLxO7wtQQhuLNIMm5BnihztgSpdzrNfjp/QnICWG1/iwvHiROfq+5DitzPaha0
         qWKqS9CbIM0LwhJnZ9mgIXmRk4LsHi15vBG65Y8wkTjx/nZ/n74VyZTHmWCfgJx6j3yO
         v+yA==
X-Forwarded-Encrypted: i=1; AL+hErERsrj8vFoGDMYhQ44Yr1fR3mcV3/hAFw32ha/jlp6esC8lwGAmj3u59s7cPgleI40NAzFuEi010e+qEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/VxdDdHWm5FlYFy6Fv42tF246IJPyHgGFKh/Ia3s26GAbANa+C
	BwAev3AoOPd2Cm3O8mKtjmwj0gZYgo9ua17FIJXExRLofo+m4HONTocNGbJTIw4dLkA=
X-Gm-Gg: AYBFou3wkcNYAEhgOlXBs7bocjTPldNYbKZamScyGX7T+Ea4NqI6l6sDc++2vKb0e/t
	0Qcx2ULIkcgAX9gVhUlzqJhhvQekPqYsAG+A6cL2ZVw6UVpKzoNqMUaRXaP2QTyyaR7uKj1o0qS
	o4wmCFvMfWG5+RU3A05WEcj4cQDzvAM4QO3DpD3v8di53YEUFd/Ynb8UkuoWzJeh+Vxr8qgqIYJ
	GnfrkXoCiP2rP6m/YDH8h5qjFwfuneLkh4MR4nFb2FevFocmrDIsClrQoUSSrKoqKNjUTyVJwFv
	bDnN1WUPAuFqCcHHVEJsMd9hjPukcO41xWduNX01SApEqPR3pkJCf03M3VTOnD38OvuLfEsrk8y
	IZW/rwMEfv+Wzmjky6mqxhS8PZGFBW1uRRqK4JiMknSCcEgh/LRDYIwbQ+JhTApm9eMxHsVQZZR
	r96/Frbe0CZI+OGKLsJhy1iGwjCPMbeS/e6MQdeKSsn9k/5AD8n2p0ZQ6ODYDk3kklAUfBrTUaT
	p6V6M8tKdKWGmOVlFRvyjZHV90utSJwEFXC9VQFd2riHNl5DsocQBcOk7zmaLE5DIeKWLPKLVdQ
	P2qcciNvemhZZdapa3zX+wV5auAiVFBjce+8cbCn95Sk6PRL5/VXqFG13TJI+ES0JDLH8Xw9mzy
	3OKFm0rqv
X-Received: by 2002:a05:600c:3b16:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb55a6116bmr218070545e9.4.1794823213643;
        Mon, 16 Nov 2026 02:00:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28c882sm375110715e9.6.2026.11.16.02.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:00:13 -0800 (PST)
Message-ID: <c458eba8-553e-4c5d-a280-918bec25b041@linaro.org>
Date: Mon, 16 Nov 2026 11:00:12 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v12 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
To: zhentao.guo@amlogic.com, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 07:26, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
> 
> Add SM_LOAD_VIDEO_FW to the secure monitor command enum
> to allow decoder drivers to load firmware through the meson_sm
> interface.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>   include/linux/firmware/meson/meson_sm.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
> index 3ebc2bd9a976..3b90b49d0552 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -15,6 +15,7 @@ enum {
>   	SM_THERMAL_CALIB_READ,
>   	SM_A1_PWRC_SET,
>   	SM_A1_PWRC_GET,
> +	SM_LOAD_VIDEO_FW,
>   };
>   
>   struct meson_sm_firmware;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
