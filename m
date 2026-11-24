Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532959;
	b=oq8Lm0rMJePHz/aGp3AIw/plQaSrXulkZFMvJsh9A7DCll15WQE0a1VoJ6wV3Ed4QpoG
	 n+YK4xcKVcVb//rojVAKxULmA3Qq7MGsx4jtQ3NceKtRKJMrHC4x9+Y+/UxL88CvF3M4u
	 aknfx9SOG8zWmXAkYx9chvWtkLWfLPpvM2B3yVv4QGFwJ3m1ffigZvlJsmbG1yHX1ItYA
	 CJC7/1tdxCLcPYr6oj9ao/eiUMhTSFds8ERBDwvnhrKZHCAssMLAtt55T6TGNJ9XczOaL
	 NAMvQVijg4+4MzamF98yI1Xu2GcQOT2qP5Seax7dUMt5MNVJgUK+8M7XgTDNBkkxamQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iVAYs1Y9//2eBIr4MloGLXRD2mrlM2kdoIMhU8BjEJA=;
	b=b/Kcax7uzJ7x9jyQpWVUAduUky3MQffxSUajkJe7X8MrAcMmroB6Xn8O5coSjv9sG+0X
	 lUWxieyJLN17EtrHrZ1ZiQ87rn6VyGSreFpSK9h9FJme7+CoBWHX8zCCXcVnsz7WSj494
	 5zHuphX4a/9tbDDaKPqvscZJlbkVWkxLMItS371b+PmxsvU+zKT+pDjLjWhLj8lscBnNB
	 fdU8ChIlcTJZ6Ek8ib3MO5ZOU9WXIGJ2986/cKsvzqmWIkrwjmOv/E6MBzXymr79LspLQ
	 2T3yf8bInou8SdHEH5oq1AzDCDHMbZ5TWPWUPqqNp8ESqI553FfRBRuadeLzJyrA76Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wS5b7GMx;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A4C606A326
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 15:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9A4C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wS5b7GMx
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c0f0e04628so385604e87.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 07:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795532957; x=1796137757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iVAYs1Y9//2eBIr4MloGLXRD2mrlM2kdoIMhU8BjEJA=;
        b=wS5b7GMx7S3fw5G1R3Y8V/aYJcptr2GMMZsjGiBBg1kyhCMIFU9Iu/kU/TzS63Z+XQ
         xT/0fjzmw13A32kmD7bmOsug5NqBM5A4OcmBHA/J1dZn9ET3u5SjbuPL67vH+m7a0ctg
         s6OvsTIS/rFM29sszDc4P1p2cZuyWcllN3jSvagXHchoPPrD2ffg8DTJS3hV8wuByhJF
         yE5hc2j0WR2kuVdwIaMqd9A+hjgJJ7RXiwZ7TlNR/VrUNX8QuBMSLl1XxrnCT3NalHrP
         7TmnYz9tp9420G1eGp1D+8MMEfW98y6BJLRbHlh7/9ol0aF6k7BRdi1Q07BJu5Q4GyNI
         3Ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532957; x=1796137757;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVAYs1Y9//2eBIr4MloGLXRD2mrlM2kdoIMhU8BjEJA=;
        b=Z2tBrVrXsoNjCdElhKUB60ZlHQO9uuofxI4HC4gGhuG5aQQ4Ttn0JxhfHEvpGgSH6b
         03oEhW0lfWYhR0QikbvqQOUpVj5ii8zFp19p7Uq2xQHwdTi2X3rjM0G89lW92XZ75m+v
         Yx1eHCs3AjUwaNcttsCeoh5vC1kYbeZ2+Jy/eOeDBvUA4FOUTnJUN52MAg3Ib7IPLM5S
         q44nkGmy0c8bf27OyUsWy6lqOe4b71q3S+Ga24VCu6DzXXX3808VmGDB9c/lgJuwXD4K
         P5S5ZLgbQkiJItn8wXJrD2b2Iee4iMVzarTuROt8zxYD1G3NdsdDm267vYvlsUTxTCBk
         J8/A==
X-Forwarded-Encrypted: i=1; AL+hErFGVP5W9sqcUu0OKmsBfIgeHqj+4VKKSgeOtN5w8nJXafUw5O4JdYLvWZ3j6UFTcM/9EuV8CoBKkLxXzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+wVoc1oqGDAW5s821k5LVy3QvP/agAJ3lA6CU8rvRusdPNwdKg
	Ih4Khq4bNIN1oXv1lDsWZ7sZRpwrdAp1iGWL1g/3xlF7UPQd6FIEUOoIFAT2pe+wdCQ=
X-Gm-Gg: AZFdTZduD7wsqgdEP43GI5ZA39hqP+CTFqXrPhqClvdMVDVDCTELCe1195Sylu9cZsK
	xU3nRHnIdJ58abmn33gI04GI5LuwaELN5V7izBQdNh9dz1ZDJF/wK+hP9P37k+nr4YNS6RppUJ+
	9MLJhKzpbfqub7saLy2hdPE2iT5gzUNXIEQdx+hIMsIwmxhzM2Ma4ra9QN+WwkoXLOqz0C4HI8d
	KMt6MQiT5FLkLbMMJhiu6uYWMtLPhmYPUMZ+YuMf8qyNTmu5eRbsp9Ql9A/+4J/I2/oXQ5rGdvE
	QNXol81yOjVV1WdpV2Pz5KOP8SjM/NhPznWLZYHs5JwT8iO1SDdqivJDc9gHsDb2b4z3h3HhVRT
	fXQ9HMXIkCh3M3z8MROqTGMTCnbaAeEIyMUy8mOO5yrPpIm0g6rDe6gOgMOPwYQZCL50H3GF2HU
	iW7chGEHq4ZDBHHU5S5IY2WbwRPf4MTdv1xRInm1vWcZwvC+3YFqbHRjleIVKN+MB2Egl1WZe2l
	Gm00tiFsWZ1hNZysmW5f5vJesbbO1ZbXezda9K4VkjQMJIubiynhtg7hSpqHefuyPBBduvnL6kE
	uLphk1Eb1DUI/dS9QxDztuf96Ynq7F0AD29t/c3MQTEYXzGQYFN/MtISFFi1yAz7nG7ummVly0H
	b5R/AbQqXv8gN3bjIHERUo2trmqOI
X-Received: by 2002:a05:6512:1048:b0:5c1:4e17:1ed6 with SMTP id 2adb3069b0e04-5c1bc80fd9cmr4476151e87.6.1795532956873;
        Tue, 24 Nov 2026 07:09:16 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd017803sm3787723e87.38.2026.11.24.07.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 07:09:16 -0800 (PST)
Message-ID: <6714ffb8-0739-4821-aea7-17512def8de4@linaro.org>
Date: Tue, 24 Nov 2026 17:09:12 +0200
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
Subject: Re: [PATCH 1/2] media: qcom: camss: x1e80100: Use the lite clocks for
 the lite CSIDs
To: Jesse Casco <jesse.casco@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Allan Siriani <allan@fatecpompeia.edu.br>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <cover.1795196107.git.jesse.casco@gmail.com>
 <bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 19:40, Jesse Casco wrote:
> The X1E80100 CSID_LITE0 and CSID_LITE1 resources list the full CSID
> clocks, "csid" and "csid_csiphy_rx", instead of "vfe_lite_csid" and
> "vfe_lite_cphy_rx", which the binding provides for them. The lite CSIDs
> then run with their own CSI-2 receiver unclocked: their registers can be
> read and they raise the reset interrupt, but they never report RX, RDI
> or buffer-done interrupts, so no frame arrives.
> 
> Use the lite clocks, with the vfe_lite_csid rates the IFE_LITE entries
> already use.
> 
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Jesse Casco <jesse.casco@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
