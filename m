Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823224;
	b=yOBrCIQ2JHpnkjug8/iJ/6GK3r7e3CyadDwPMVKekfbxiVs+dqjMyyvjSeHyLLV/Gdv2
	 hPet67EI7WoiqSnE5MveajsN6q8/ec1VyP8wmgqikZvdrUtr46CNkTYKNrBeSs0BmzcQj
	 PAkocrT8mRZ3XoT6qn4BDzwHJqInWHMUM6GFatnoNnGwxRPAfj1UIDhAp87Oyz/UA1Hbk
	 ntPNxIc+wTfM3ujP42Uzfk+tpy3aLxeQLoYkM7Jh2u1/ukh4Oax+7KCjnjyFVfBE5F/yy
	 UPziTsRbuDOl0I7ySGQeqa8br9L6ih2zGMPjfu0mBM404uqJzlvVUkRYzNWzJ2SRdRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=;
	b=qYBrlYVOYOyjiyN1mE2JvWm2fwit5QCvzMHybu1PEz6sRpWmqdltDsQyJ3O0ipBCs3ti
	 jRDama0szc5FC+SFuPm64vhxhCG0LNEt4EakSFXxZ7MOZGoGdR8abwUYRfBgPmfCl0W3S
	 UFvU4ipzIf4GatxiKKvByK3AtYOJvo4wSNJNM3u3GlBVkWckatOJ4WrbX8fL3PP+YmEZa
	 9Mn4LuZml5MaoOX6RfeqlhoOMVGXrYCzCk+JVsO+q7rA0bfgzx0uyGb3t0BQdOnJt0lr7
	 HFSRoc+pb9AdaYLGT/H1+/NrTfirESeXceWV+Ep6GqKszzQxEaOgZSajwIOEzZCoPpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QPTiA5Jt;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC20606A32A
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC20606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QPTiA5Jt
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so36117255e9.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 02:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794823222; x=1795428022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=;
        b=QPTiA5JtYMrbsMl0z8iJz6Z1kuNtOsLW8HHjgERJXiH0wb+LeyunHKf9R9M2HNk2II
         ikL42CGjtFQ4HGfxK4hv4TxHo9NIb0nOLjwT5EBK3NtTEdDmoyjzSOPFMXbm+/UCMVkT
         QCdxmRISD1pOOzkwFv8CzKsRJJ1Z2wBB+AtfFTu3Jtfr3dLv1RpB4rkc9schgefJ3Xrj
         +dlu9mwwMZUdyrtRogYv6qxhwLFuuCLyzb6kMTiOkdQ1uPH850eMPDut72jt+NXSzWuN
         /ab4+oBXb3+cgDHO3gIZ5eEfZeSJ398PLzQsPYaw9lnFGMCfxT4xxDn/9zx9NncIFGCa
         UwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823222; x=1795428022;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=;
        b=t659XPx6aGfAgQYE9ps4F8UyZqUnXwrnUaO22TXn7dOhB63fyox7OoJy5zrZrQKYAx
         9Wv1RNf/ZhL60V0dUUig6CaTprFm8Vd7E6jMU75b3Z3/GydtbADPhE9U4eHUiHuo8ub1
         HYVVPHXMdPvIdXszHQdgWFwpjeYR6gC6NXGR4s2fE0tFBjZSNyOqSo/e1Bf8SvpfmhOm
         kAb2YDkEQRxfzefNtTC0Gm0TBBCt1i6dsCMOlrzW6LtDQqkeWLMd/xY16UC+/YHwpfnL
         JknLx2MQlJ4zYKIpVDIRGWLx+v/2MRLdlzb/N7z2bocLlOQ3rzyMFrBis6GjYAyu4tPm
         6DLw==
X-Forwarded-Encrypted: i=1; AL+hErGPxlvuu5Snc8EH9uyUJAFcbneq7hiklIf+J/OsJFhKt5pZj0LtDikvNuwdzQ7ppvuo2i8QrVGxbgyX3Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/NLk70SSjyMKNXWUgyPc4BvDP3URtgYfqSVLawogKHEWINAxWe
	7FQVpV4BMFTpTbTs5vrin8fhaJdfeXg6OWyYXq9bUYGbIUGOthRxrz4sQmpkjTxRtFM=
X-Gm-Gg: AYBFou13cBPmv0spi22EFLsRPzZSRth0SJKpARoqOEUsrm6SIPMHKOe9JtJLjmpjTo8
	FN43osrf1H8l0gYS5OFc+ogPHCVkZDxg0Xgu0AkCPTfvRXGO649w0LyCfuqVD/LUKtNVM79sDws
	AKylMCGOIIcZDMGTL5oyt7mUCqX5+b4q54LgcUCETl2BHghAyXDvXBDnTMApaOiJedjpzPOrHQA
	WjwOPh/b4gf67XpJ0gkM6EyrbSc7h+grVe7nYM3R2C8rB4xiwpmoaQnWGWage/Tz2JxxcegEj1T
	pM9VQVdaC0/8+qoXmjvPbvhNvSFHcJrNFRWpl6lzIZX+0uRU9vcu9BHMU3xwla6fsiLQBm1uR/9
	cGe6KHFKaXQ7uO05cy2E9C2PxQ3A03AB0rwJp8CW9pImop1bTC0UlXF9XrWBcRHs80WhtpGAHGp
	S2WxEjQ2xxIQcLaUYH30qQYFsI5AOzVxFrX1/5+6hljKpLWu51DUGk24/vwyovSeSqnkZT/24qZ
	HHeHaFG93eyrgkmMUvdIqmDAlJzD5Yf25uw8NUavuMMi2nHJHtypKOnKqj/QT/5ie6uYGvOHjDS
	Zyf6zEpFx1IkTUAAMVRTCLAWkuTgYsVpgofuOtOvHzmtW6/FMW9KSlMSOTZrhzu6TCd609fvNwl
	iGVXkHSqT
X-Received: by 2002:a05:600c:a012:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb55a907cfmr204744635e9.31.1794823221901;
        Mon, 16 Nov 2026 02:00:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae4414sm282702355e9.9.2026.11.16.02.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:00:21 -0800 (PST)
Message-ID: <0498194e-6428-4424-82b6-c6e52ba25adb@linaro.org>
Date: Mon, 16 Nov 2026 11:00:20 +0100
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
Subject: Re: [PATCH v12 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
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
 <20261022-b4-s4-vdec-upstream-v12-2-616240978792@amlogic.com>
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
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-2-616240978792@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 07:27, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
> 
> Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
> table to load video firmware.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>   drivers/firmware/meson/meson_sm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index ab9751a59b55..887caa5c625d 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip = {
>   		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
>   		CMD(SM_A1_PWRC_SET,		0x82000093),
>   		CMD(SM_A1_PWRC_GET,		0x82000095),
> +		CMD(SM_LOAD_VIDEO_FW,		0xb200000f),
>   		{ /* sentinel */ },
>   	},
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
