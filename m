Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799166;
	b=W9/FkSr1oLZwxXak8MFibmX+kbt2yC38LWs0slv4xnKFNjQkv7fUQyceBAuf77EUv6ms
	 Sdhbu/xm6RU8RuM0lUx8e3OvNNzvTXCxnCUO8EGdS4FsKD+duBMIx+BaLuRLN2mExFSre
	 uiwBwqTPAkqjOUWIp3JHW0pzBiVYL1POCRT+J27uu7Xa9r0iaFVFl9nrOHBw4VFdMkWWH
	 EZ9wGIoJMlqQO2bGM7kjH7Z7GRTV8kdP1WhKCCQvGIf1QQ+Qsj8HV/1jx3iB3V4H6EL86
	 sK5HJcixmYHHYObTz84EbtE4DPIdYcQCpNf5dYfS5tVwvcWh8l/pHp0g5i1+bX/7ngQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=92lzHe2SuysJxjMObHKi6jyjX87rS8UJuwbgz4FDZbc=;
	b=hJ74Mye9xNBfpsRhxjC61VnrrLw3k0/QJ9/3UhGTB/P7N8DarUFp5yUpM5QZ9XiqZoyI
	 OiKiFfmrfQTEsRiRUXDMZBQILdRA5p3DJSLjhXU+5BPHN3Q7oQKqYpcdFanN7XuI69BPB
	 KaWqguLJrf7s2mHrEDL7L8myCJL+ggyeA7cpw5BLQpGI1Jmb/dScT2dgbGVuTpY19vxe8
	 cldz3hLZCENoDbLuXr20NEDWhCHLXdy1xUpxZ8Qc7SW8b7MKWz9lI8Ff+JGSNi3tOLxnb
	 5whPN8bkZuITyO8T0vnQJLYrRH8p0SU+O6aUq8mK/+LbfZAme0P+IYcuV/LrXXibO0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="A5Hr/Grc";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D987606D806
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 13:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D987606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A5Hr/Grc
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a215e64962so6919075e9.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 05:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793799158; x=1794403958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=92lzHe2SuysJxjMObHKi6jyjX87rS8UJuwbgz4FDZbc=;
        b=A5Hr/Grca4g1tu2xiDFXWfMDdZQA55aeOJgwSaJ6U5ZxxQ5n9iJlSwGAZv7GOgnnwu
         6CaKYBsHH2aGLoT9Hz2eKilnRw1+Jps+DZQu0aqUKgr89Yxs4MviaH1ZyBd77Cr97Ygq
         JpGOeHwgNEZHdRo+fB+UTQpUeGl78R5somkITXNM+lHduml1m66zB+84vqPHSVEdNWaw
         RfzPO5RUiOwUckkH6oB6oxXSX+g/6cnkPjUHUb9mmO8lAByOUXv8XsRdgC7KZneB4Hez
         kUfQipZwPz5JrwtXR3A3iHvGRT+lm9E7LZKVxf4/Fyr1SbfdTgmEZoz7k3HlkVrXMK9g
         BjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799158; x=1794403958;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92lzHe2SuysJxjMObHKi6jyjX87rS8UJuwbgz4FDZbc=;
        b=msBDlIFs6L2yl0JLACkaCHNfe8E8I3sppOL8en003naWkHXBROVlyxayp7WlM16owt
         ITlOghcKZAgNw9QYorzn03dz9Y23tYMQycDKPDz/cbVRJtWKF6/IDYYflBQqnZIficsf
         4VgCPzbp10AEUZdaGIJRIXChRure5uplQh/7HGqzoOIsAjpgbPiNnoM8/gMQY0xa1ghq
         hSyRkzgBkwlvlJW/jS/s7X9qawWYKoyGagNw8IiFYK7YxAkO5VUkv6SArhOOMjyRBoRj
         mmFL0+ddQmPpQikNm8u0cieGG5QcjcrP1Rsv0X2+jRM1tu595X1a+d9tgsM/Q6B1m31F
         nAag==
X-Forwarded-Encrypted: i=1; AKwUvByU2AbgxP17xoTtPnBFa06etckmxkHke0C7LLgPPcXMlhBCnnt4MGDCz3/jRlwAG2dq+80ae8gy8NtHMg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3/SQz2wlh5ZeAgAdy0s3WihrEsxF9/P58He1OE/ku0IwkaGIx
	W3UOWDGzxjhCdxVYqrRqYYzovVqQTuDOwAaCcP7h8Nu0aX6wfulKyV9OmW+slgsSMEE=
X-Gm-Gg: AYBFou08Xpf6TzwtXD82XRljA1GdnRMsVMnL5oxlaegl5QTVek6j9gRlEOPpq2r/2zV
	DbWj3vUSrApa+XcTvWpc1p0A0stQzFRGtYO6BA/U7gHbD+ctf9FVCPUeuTxDKsanmFqNFbT7ak8
	Gi1BdXz/GxDTDVsEjyZ1eeUGqYWP+ghLhrjUv6+nhdd68QWCA10bSsvQwiKO93iwRelbOTnQb6N
	tircIJhLcqFZ0pLfGLbGfXRkMK1kCAhEhe7TxNM0ISWV+6EgdbZ/qnZ6c7HrDwA0OkRuyMbz1+f
	A61DivPuzuWvPQGEDKn6/FUYxIxvBs4QYBaxXcoaxPBudS8LKbJEnsftn6KbVwt2k6jkpFprpVV
	fDTVcy6q3zsKJFHc7KUd68XrmrG0iiK89uAR2EOkF6porfrg+H0f3zgGhADVPwaW0wQgB0+WuJt
	2xiNGHK46i72aIP+RuTXceZKOU8ML1zGQ15p8w9SncIqJYValz++LwkQUd1Wi7zofsiyfOW/Cf7
	tphRB+cxUdHGi4chjberJlJ/ednz+hioBoFb9RGGu0NEuYZHTzpyc41YrciQDvC9qlvLnGQkH0l
	O3QWdwk9tONl/wojN4fByjyLyjUA65XXbl/vjWIa6A==
X-Received: by 2002:a05:600c:4f0f:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4ac17b2cde9mr422203535e9.7.1793799158430;
        Wed, 04 Nov 2026 05:32:38 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda203b6sm3825694f8f.48.2026.11.04.05.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:32:37 -0800 (PST)
Message-ID: <4ebc023d-38fa-42e8-b89c-8febbcb0d7f8@linaro.org>
Date: Wed, 4 Nov 2026 13:32:36 +0000
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
Subject: Re: [PATCH v3] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
To: Shuai Liu <847807867@qq.com>, linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
 manivannan.sadhasivam@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <aa7b58df-a7df-4d33-b2a5-9cc760dd9ed5@linaro.org>
 <tencent_C589954C94BAFF49A7B030C93F367DE1620A@qq.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <tencent_C589954C94BAFF49A7B030C93F367DE1620A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 01:11, Shuai Liu wrote:
> Commit 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API
> devices") added a call to phy_mipi_dphy_get_default_config_for_hsclk()
> in camss-csiphy.c but did not select GENERIC_PHY_MIPI_DPHY, the
> invisible bool gating phy-core-mipi-dphy.c where that helper lives.
> 
> With CONFIG_VIDEO_QCOM_CAMSS=y and no other driver pulling in
> GENERIC_PHY_MIPI_DPHY, the build fails at link time:
> 
>    camss-csiphy.c:(.text+0x51d): undefined reference to
>    `phy_mipi_dphy_get_default_config_for_hsclk'
> 
> Select GENERIC_PHY_MIPI_DPHY and drop the explicit "select GENERIC_PHY",
> which is redundant as GENERIC_PHY_MIPI_DPHY selects GENERIC_PHY
> transitively (drivers/phy/Kconfig). This matches the other MIPI D-PHY
> consumers such as rkisp1, mali-c55 and sun6i-mipi-csi2.
> 
> Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices")
> Signed-off-by: Shuai Liu <847807867@qq.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes in v3:
>   - collect Reviewed-by tag
> 
> Changes in v2:
>   - drop the redundant "select GENERIC_PHY", as suggested by Loic
>     Poulain; GENERIC_PHY_MIPI_DPHY selects it transitively
> ---
>   drivers/media/platform/qcom/camss/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
> index b51745c942c9..e0cef2cdd0a1 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,5 +7,5 @@ config VIDEO_QCOM_CAMSS
>   	select VIDEO_V4L2_SUBDEV_API
>   	select VIDEOBUF2_DMA_SG
>   	select V4L2_FWNODE
> -	select GENERIC_PHY
> +	select GENERIC_PHY_MIPI_DPHY
>   	imply PHY_QCOM_MIPI_CSI2
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
