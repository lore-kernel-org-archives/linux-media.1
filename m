Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BE6401A07
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227458; cv=none; b=tzk4K1OJYVtIhzWHXmvdiIwd4w30/sN396+HCqhmBJid2wyK15EZ5CFCpQLNP8qAXQIc43IpZlkPOIWfDLtkroKskmJF5aL4ZioUaEVCKJVX2YznibhMY7Amczxy/fjAUfc03u4EDPoS+9pD4SHxt15U2yNdMot8/Cp8uBM3cTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227458; c=relaxed/simple;
	bh=aEBVoNwT6uF5mWOZ7Emr+E8mCDVEkQJrwT8ARnQ+/wM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=u4R+ekt6NZREQ1BizWQupjfnH+SmaPVdoWsIWHD8dX8+cxd4hzzpv6EeorIAtPu8n//BI//cPKOVDdVSRebQr1i2NVVSy4iMZMvwbzr/yn27KVUMtoCe9H4j0DFAqIRmM5Qde2MVCgLZkNcRUZzgtVzCfXrpPYPtPvWLVnmBFww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QP+uuajZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QP+uuajZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954aff6088so30979355e9.3
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 01:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785227455; x=1785832255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5Zspx8VsAZciUPcNSItD/7x4YS9zk9zDIhR00Qm1No=;
        b=QP+uuajZO3BM0EsXXfemJLZksB6JYEEuYsQLJFjPGkb9GYQqbZK9Rd/caIx8tlmtUM
         W/tmluLfWC6+nOTNhsFRB+yHuwLVdVsIQwCkzGsCVotGwU3zJWUtvP9pVydg9XgKYYxs
         3TQpqZ2TTODdNyguMGrYeu00T9wNskRdH1z1hXPrLYD+3dKbZ3LjrwOMGe4+ht7ORmED
         7Z+Iyo92cOk79aJ2o1IQ02/YB+D5Vbx3kVD/W3RDMQfFm+HR9tmSgd1TaDLY3ibXjpsC
         s1pMsYoO2ehqrJLE9KFS3b9oSGRQPVYxa3Tiyd7PY6udUHST1A0RdXjcWIDbwUhwkzPT
         9a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227455; x=1785832255;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5Zspx8VsAZciUPcNSItD/7x4YS9zk9zDIhR00Qm1No=;
        b=AO0EdS4Ytv7v12jrvjXSD70F5Bo6AOFTjZDoofHJECcDXFDgm/N4JMJMbb3r2g7mHJ
         lXnwYkqeNd2lX6ddDIjKKH9qcCp2rkJUC4bAQPH+iKIyPKF8r1hWgorbZnpbrB6fzPmf
         8eDfmdUQ81XbhubcX22zV57IFYpLfvrYjx7/4OUbzlHkFPUAkQzAXcA2P7/uLnX9paVA
         2O4pwxsHUl03ii5dSxEjPq19sD0IRLI5s8EE7FpgkmSDFYvq8Z4dG0mRW5EtbJlAa0+W
         W9X+0tRlUGyfzRLGfp59wkhm+6F1wt9806mkUJ+5UlBoViTyauNbEZ4cnYE2Ox3x8xMb
         gCpw==
X-Forwarded-Encrypted: i=1; AHgh+RqupSU463gTxLybGjlOAbfwgM/k/J/13n476M+kfDYyCg116W5e4/iAXrnbyO/ccFCNWRRDWFotMOyQag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA/4lBa1da6/no01WJ50HDpaF7o43YVMlnusdviP/Y8uO9QqH0
	b+4xiVmvBEL4Bm37U0Jpev4BfXaQ5WMsphasu6u1yYVkGKge9HG1QkhBb7/ErPNEXNexuT6KXRT
	WJfNb
X-Gm-Gg: AR+sD10SJZ2kvPgR3FWijNCg0cEs2iI1+XSE6BriEBs2KYKfsxB/iv1QAhaPdSUYJsA
	0WcdKfy7ZEmVWxmEpt8nA28ehNCpsx820gQcLHoDI55f8bWa75nWr8Hhi8AA5Lezf9lQQqWJeni
	qxu+onmK26wgC6MJ8BA188fBJuRl0r6Jqoe/Dm+iJZ6fDmCmkULrFdDluluAHtbsT1hgmmzeGZb
	aGLPYwxtNVoPDvR47LCN4+fn3pMfoAdT0WHNMeDaALRIol2MW+mn7VuGg4orqJwOthkPabMto43
	LBzgxJDyj6bxf1nn3OsVA/PoCUUtTZs5PTWFgUMZQcUe5iCb5OyrO6g4EsjP4m8o/uXKL1NFPog
	e3S4dHW0uj4zUzj0DfSzjFAtrgGyqwe3DxGH60qTFdCSDmU1o4AhPaAFdM2gEjlDruxPVwa9zzS
	k65cLuZz6J8pMxQ6REPVf9vKBJqfSGG8UW49rgg4yA5oMo5W5eDzk0VE8FR6E7PJe9ICRg
X-Received: by 2002:a05:600c:a46:b0:496:bbce:fd with SMTP id 5b1f17b1804b1-496c642d9bfmr14729095e9.6.1785227455027;
        Tue, 28 Jul 2026 01:30:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211? ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46240c4sm59208655e9.12.2026.07.28.01.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:30:54 -0700 (PDT)
Message-ID: <27c09961-a76b-4c52-8db4-b82379339252@linaro.org>
Date: Tue, 28 Jul 2026 10:30:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 09/15] media: meson-ir-tx: Ensure probe error is
 propagated
To: Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: stable@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1785158244.git.sean@mess.org>
 <45cb104675d7abe96dd3570d54f017bce7063be4.1785158244.git.sean@mess.org>
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
In-Reply-To: <45cb104675d7abe96dd3570d54f017bce7063be4.1785158244.git.sean@mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 15:18, Sean Young wrote:
> devm_clk_get_enabled() may return -EPROBE_DEFER which needs to be
> propagated else the probe will not be deferred, it will fail instead.
> 
> Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
> Signed-off-by: Sean Young <sean@mess.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: stable@vger.kernel.org
> ---
>   drivers/media/rc/meson-ir-tx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
> index abb107d19e8c..174d5135e1bb 100644
> --- a/drivers/media/rc/meson-ir-tx.c
> +++ b/drivers/media/rc/meson-ir-tx.c
> @@ -290,7 +290,7 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
>   
>   	clock = devm_clk_get_enabled(ir->dev, "xtal");
>   	if (IS_ERR(clock))
> -		return -ENODEV;
> +		return PTR_ERR(clock);
>   
>   	*clk_nr = IRB_MOD_XTAL3_CLK;
>   	ir->clk_rate = clk_get_rate(clock) / 3;
> @@ -324,7 +324,7 @@ static int meson_irtx_probe(struct platform_device *pdev)
>   
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)
> -		return -ENODEV;
> +		return irq;
>   
>   	ir->dev = dev;
>   	ir->carrier = MIRTX_DEFAULT_CARRIER;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
