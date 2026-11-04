Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799995;
	b=0pRhXpHH+ppyQVO3/xJuj1rraDUEo+DMqRKkvNSmhjT1xzO7snI6wicflDqoXM791Zcl
	 iwjmIKH/SXIRS+/4/V/AspuP989cZmJqy2nbeHNzX4rEaQ8mco2KwhewsK1PFjbLJsMjP
	 AwLEO400P8miYdu9H+TxXFeunV0KBolWBQ3P+/ef4zsf1kjxu0qoiNeLZSqDX5mD/f4fX
	 Z0kC34rxdDGtw7Sk3zKMzJ1CfQSUHNqciVGF39JgLQpSITKfdD4hvLSuzB9US6dWVX2wg
	 26D67ZWZ/I1s0dhcMg7FaPNtZH7DD3wYZw+Tc333YGgjznXuhhfQSiSzZhRHpBl0BaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EQOuQtMWNcKIk8UAS07t8w97U059WR6PXWD/U5Jt9sA=;
	b=FDx0KFizR0QPZzEBxXBi3XuDBswiFIIoljALNLg0gLzkggZppEL9RHXKZzDpAhy3trT3
	 VXfd++8m0CxX2taI6dqOKCPmsdM+i94FFIBqZ3hchPN9R3xmvbZReb0UvGl4F+wS01fpQ
	 NO2Qqel1+6wT70iJOhgRK7pR0lrLDCYewhSPrrI1s249DqvdGOTOnoAJxfqiE70EfOHPQ
	 kKHtF7eztFD1qm5fJ7/9C4gEyxf4g5d7d81avfIc8pWPJIoml1MOWi7FhCGQblST1Z5Nh
	 4uzG0z/I5gxfGm7/UTLdpPGWD+Cnk1PsOvC2K6xebce0gxf5EtKwvJV6fXu4sS1Tu2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U4DSp+ZT;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4B8606A326
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 13:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C4B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U4DSp+ZT
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c418e215671so104599966b.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 05:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793799993; x=1794404793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQOuQtMWNcKIk8UAS07t8w97U059WR6PXWD/U5Jt9sA=;
        b=U4DSp+ZTutmJdsT23wcbIhCrOmHZ1cv1fxwAxSVyNAkLCULrvFm45DFMbarx4oPpwP
         c/vQfLNzJFVuBUIeqb4PHii3wYKUmhwYL1JJ43W4xnJu8741oP3tv9GfiiON7uljJgBp
         Xgyk6WKR0hyWYBQHY5VW8O8yjLP11iyPYlrJKaGbeCLnFGMneD93uQ2p3vqbxBLp3U1a
         uI9PMq3CHOaXpXVv3WU2j/oZHQBnsh+UP8q57D7YBja93unxN4XpNSniL9AQDlu+KeC6
         /uLMDt5O68XsPydNNnFprXjb80wQdxpIwSXQOvsGNSjG5s5MDdjzFUXxKJGx3EjgaJ+9
         kHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799993; x=1794404793;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQOuQtMWNcKIk8UAS07t8w97U059WR6PXWD/U5Jt9sA=;
        b=YuR/PxG3FE3Gwr0M211/4QCEvR5jY+6x1cdTx2q4XGQLyUPA1sPB31a8629MAOw32B
         nU3HlayBoz4VP25OqKuEG8ObKqbY7DLVpXGrwAZG++4JveEPZbY4asY5q8P/twN8JQg1
         ZGe6F9RBgSIPrZhdKZyQxBkfbxyWJazf91bY/xXLINF5SLnVKH394TcfHrHzKQ2tAsGB
         80AuSFly4J2M1LVgVZLJeOhpYroGG6ah7W5oeM39ARvXEBCsKw7H2Ts2GKxvh6ZR3mfr
         J+7SzR/sEwolEU2GXwHTJk9JxbE03g83fT8nZyXDlnVKiTrUnXBoGreF6sjR3NkJQLfG
         /vyg==
X-Forwarded-Encrypted: i=1; AKwUvByf6Wcf1PG4DE+XsYeAL5FEZbSgz8aSn7IJ3Lqd/nIRzuRGntQwZtUll1tN6Cj1+pUKFtzHEuMfIx6I5A==@vger.kernel.org
X-Gm-Message-State: APuU4Z//GIX2K/gRNSh4cAtNDGeSxw0/nQvO91sCHGt5TmODYa38hz1o
	12o1fBR6hFOBZwpZKMmnr8kC5K47qnbix2UfetPFzx3emDwILlhE4T0qI9Jfv9MaehU=
X-Gm-Gg: AYBFou1alWLue5syGuuTWxRS7bMuC/sOFxYABx8hLKknngFdpAvv0oB6v7SVPTe1Cyg
	P5GuE7SdopiK3Zv0JC4FtGPTGwjsZtBrdL1ZdgT+96oRl/tC6avDY5qy5x05kuXgRmLaZLpyenA
	FyCYX6dAZvY6YKaK70eQ8kgKqofUkVLpccZSS/6vzy4podkx9M1b6Kt3xq0ZxTA1X83lolBUMMJ
	CvWjvKsTGsLQnwEpHEt0YYmx4D4ank/nc4g9POUWfpxHMQMccmrbJuDVr1961zzrkCa8wMc6x3V
	WUUurqhfbaOQUtjAQ1CscmEJ4/EFHdmIJTK+IUCD/VRF4sQenUUx8QIlNYoitlANOSJtKZXuOJH
	maOU247cvHmVVcaY4s6aC32/Aui3lYnU70x/nMIuLaOGT0KK/mEGZg8/VuxvbGw3wIqdhSD40UU
	CX8VFmJ1xmXD2NkwUC/HFK9RtsYAbabgA+azZyp+9X7vO5rfs3/XGyLfToWOStzRcUrry/PJ0BL
	dR5+NAIGr638e9nvQRfK/6Fdmeg+jat/ucCiPMsAPZnKGi5FZaiL0kSV9ainnHue5hfTfE6hqyS
	xwN8uvqCV8ODqCiWuNsPURU+cJ7JUYZg7Sx48ikofA==
X-Received: by 2002:a17:907:2d25:b0:c2e:46d0:b802 with SMTP id a640c23a62f3a-c4ca7ad1bbcmr1367741466b.40.1793799993289;
        Wed, 04 Nov 2026 05:46:33 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e44739csm73557066b.46.2026.11.04.05.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:46:32 -0800 (PST)
Message-ID: <4e7f2f2d-7c2c-4dc0-8488-6ba71f4b886b@linaro.org>
Date: Wed, 4 Nov 2026 13:46:29 +0000
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
Subject: Re: [PATCH] media: qcom: camss: Change CSIPHY device name from "csiX"
 to "csiphyX"
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Frank Li <Frank.Li@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 13:00, Vladimir Zapolskiy wrote:
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index f99eea2ef228..dcc005674d8a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -839,7 +839,7 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
>   	csiphy->id = res->csiphy.id;
>   	csiphy->res = &res->csiphy;
>   
> -	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
> +	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", csiphy->id);
>   
>   	return 0;
>   
> -- 2.53.0

I'm 99% sure this is a change that was made @ Frank Li's behest i.e. 
that csi0 is how most other systems do it (true afair) instead of csiphy0.

---
bod
