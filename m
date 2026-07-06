Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A0C317177
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345079; cv=none; b=pcqylueA9SQQSlNslawP4dyQxT1gqQsRSBJLpclRdul0qGea+tOMcGh9MWiE1vaDB4cY7xQb3rXmlyZqh9BMZItkUR0eiaLXCecKA5h4nvfT7vZaO0F3FWf4VdmWCbDrP66GKmDGbbTzDKftaOtUcY8DYcPiaKS7G2ROGQ9sfBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345079; c=relaxed/simple;
	bh=pQzZVG68wLqA4MOLkstXGFK0Y3+t6u/6Ggjx/nGFUAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+HmDq/SA0cjOpYOuXGzBjsEoJNSR4g9ydEdNz2oPZss2QcS4Ak+ZXuJOmWYXI83paWZveTQ/SxFz+OZ7Hi5dk2gLzUSkSQ87k1ZyzkEPHx/188j2u2VB6YkGsd4oH26Jo5fwb6Bdgv0mVmK9noB/pBe3vwKpAlJA8JWSK5FaxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n+llEDPV; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n+llEDPV"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so5654938a12.3
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 06:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783345076; x=1783949876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5Jq8Dzzgx40KsRam3OqWjyEnrA+cneHoYjGfjryQms=;
        b=n+llEDPVizmi+M1/OWAbMb3MfTOFXarZT7RmGOfdAr8UP8ERv8+1Ztujcff26iAgCk
         OWFlHAMwX0MkWtDJjMu4NEx0kSH1icFzkrFEeVqy4MkX+zut8VBNonqmo5Yryg9zLdw3
         wlDNpLVHGSWTleLGV0xKlSIiNQIR73X1io2FmnCudDxhkrHU1pQFuxZk4FxwzhN9PwvL
         Su71z4zjDw3/2JIejLz7KO0k3Jia/oOyKLr29jAPSZTJfuVhEUnFYFEEIMeK2uMPohoB
         IRGGkTx2Hd1o9+yX86/6zTIs5h9q13S3pqAIsggWIvMfTtSBomZOwPJMB9LisTMjqbuv
         TzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345076; x=1783949876;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5Jq8Dzzgx40KsRam3OqWjyEnrA+cneHoYjGfjryQms=;
        b=ITt1z09ueLB9RlfR3Atf886fwCTGzyy5hbaNlK1e71e4Zlhrl7OGios2iLY/ow/PEX
         GupSg36xyXp+RwvK4hc609BhCW1g2JKqy9x7VF0hvk9YjOxF20SpCQQPh2/SXtmCAZMg
         XVKNTyX6/4Sn0O9LxpKEr6NoKForKQ0SUmbCeyoBGL0Vis8XU3Y0p5BVZAY3lCqT6HB4
         M6Zs0wL0XuylnXNWG4f+3KsdpGElO48MMcd5u5+YZWMdIzWZUcht56qy07Cu2cTNB1M9
         r1xM7k7oke8JFSxZsJHK7GcbRgtc3bL+U5xp5xf833rxaYphDdwYyt2lxaWjuTk6okas
         VvAw==
X-Forwarded-Encrypted: i=1; AHgh+Rrm+6g8ywXIvkJjlGL18tJAOQC++B7Ov1pqNA8RQjsTzql/UVApkiQWiJ+3wFMDP9VrhxaoG6YybtrtTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx02iQ0VokcIjXD8DrmxbxQNoTF8jWj4s0wiZBnIZ39HxTE/3ty
	A02yAQdW9KdzxTkFNpT6ZDN4tad9eI4opVFKP3Xp3qXokpHi/curKODyoaCy5e/g8QQ=
X-Gm-Gg: AfdE7ckCWqirXk1qHYadmH1hKO3yhnv1fl5IRcm71PUmOEthSlWaV76pOqQmCMCvPce
	9mcWxR7S+wSXghoC6CjOgb3S17EUl49CNEa6A+KTBYVO+DIeCxzO82HPGlGrjgF9ajXfp4GawZI
	B7c44B39G1J2O3sb1f37qMJudro3J17PSTC0b1b8NqRgWngq0g41UXRUn/QMBxvJE6qjCdN93li
	5A6XvVZXVrliJCcbHR60UsBVAdqBMY9MjNJZOYDHjnZh4fYuMmgk2yBFwkwdXQ7bno78R91JJUT
	6wRNcX96j3xY+5k+A0p19z/A51BZ3S62rNwViK3Xqd8ZQuUKYFNaT2JHLNAts2RiIDTTzuGeNRs
	8h3oCx2VJ/5mJU1vU+a7peV4KbB3TTC80OsHgHGPfqd0yX02rUAZg58zrEwk605tZjB1m5rGE2R
	KLfVygFYtcZ0qsPt5CBm1eb3fR6Q==
X-Received: by 2002:a17:907:9725:b0:c12:7e24:a76f with SMTP id a640c23a62f3a-c15a67cc186mr40096266b.20.1783345076089;
        Mon, 06 Jul 2026 06:37:56 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12bc53e065sm724560466b.46.2026.07.06.06.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:37:55 -0700 (PDT)
Message-ID: <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
Date: Mon, 6 Jul 2026 14:37:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
>>>
>>> Why? The common power domain and interconnects have already been
>>> described as resources of the parent CAMSS device, there is no need
>>> to duplicate descriptions in every child device tree node of CAMSS.
>>
>> CSID, IFE etc are not parents of the JPEG encoder.
>>
>> The idea is to make all of these peers, eventually. Not particular block
>> owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.
>>
> 
> The statement provides the same information as before, e.g. it's found 
> here:
> 
> https://lore.kernel.org/linux-media/fbc018f5- 
> c025-4747-85f2-53b45b0f0496@nxsw.ie/
> 
>      There's no functional linkage between CAMSS/IFE and JPEG - they are
>      peers within the CAMSS power-island.
> 
> Thus "the CAMSS power-island" exists, and it got its hardware description
> as the CAMSS top device tree node, and TITAN_TOP_GDSC power domain is
> a natural resource of all devices on "CAMSS power-island",

Vlad honestly, TITAN_TOP_GDSC is provided to the CAMSS island - all of 
the nodes within it depend on that and it is _external_ to the block.

There is a CSID MUX on some SOC other than that I'll restate it again, 
I'm not sure why you won't accept it.

There is no dependency between JPEG and IFE, one is _not_ subordinate to 
the other and trying to find ways to invalidate that statement runs 
counter to the facts.

CAMCC provides TITAN_TOP_GDSC external to the CAMSS block, that GDSC 
effectively _is_ the power island.

This debate is going nowhere. Check the downstream you don't need the 
docs titan_top_gdsc is provided by CAMCC.

---
bod
