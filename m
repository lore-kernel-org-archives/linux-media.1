Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872605;
	b=hDnv1bHiI299wFRk/mtN5h06+3dUtNNt5cIPzux25qlNnAhtZOmm2p54qVPGBuvgBQkO
	 BEE1UDmnRM1wwFGP9E63d+WXyCQwMxqF8DU/DpQMs8q2MrPo/Dm+nknPJoXnNQEmvG07i
	 rkm6o6Q/eZTKyPeH1ZY4RCUtOziXxWuFzuz5AKZfkaWzpLLt7WSXVUh2cfJ+fVJaeTPpz
	 wMN37IM+vdruVe/mV7ZhZsEpEmH5SIbTNrAPTXmNRQGMm+xqrwuOa0CcKUdtB3GXW94rG
	 Ko5U9kN4OLoTY1zj2Eonuj00ACt7ll50hdxDEt/CDrKA5bVhb1p1Z35aajSeRlNE6Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2frlz/ems5IejHKiFsfGGWOinpbQU8f1d97fQ0qUPvQ=;
	b=sbAI82KrOn0ga/+dcI+D1X9b72dSjfHoW1l/VvlWp+apqezwKlX9LkFBrJmEFvv7cXvY
	 t3JlA6cKR09ktChiBXW3xZnSbusdPI4PDvKha3flZUcJNseXuGEt8or3yiz2RgT8hR+ZV
	 spNXBgeto9ECYnLtV6XmOgOO+IksrVOrygFvayT61PPi16mZIJfddJBs3jpHEZJvhj9vl
	 yhH3U2tGqskwHBzMmzp57lllVpG2Tn3awB2eEi2iGXkGNmNdIO+AVZZDfWsyHKgQpf6NT
	 hatUJHvG+ahJJl/Lu4vWJ1y5J/56vvAxWm7LbE/Yv2SVS9QO/7DIE+ukb3XVI75DBPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="iEX+lGE/";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E4A606A32F
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 09:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E4A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iEX+lGE/
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso12846295e9.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 01:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872603; x=1794477403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2frlz/ems5IejHKiFsfGGWOinpbQU8f1d97fQ0qUPvQ=;
        b=iEX+lGE/bIUyOkTKslBRe0Vr9Go2pnoRPTtF4VMJljqH9BHFaC6Lcq0U63Nxwz9730
         KMEubulTOJC60T3skacMuGfKdJCRouE3/yQwChyXueGlZNHbT1RB3h0A19ZvPqfux/+7
         v4ISUE2DjCJfubXmbiVpFBcom6Mo777vsKq1aTySR9bQUNldKuDpdVQOks7fwvN287GW
         GG4+wyuFrXZNUaF1ax7i1FbPaB/2bPABfb2GuY+1OXZO7ZH1xfD697yUYefytNspXdca
         HBer2y/cskrNGHLPtE7LbCUscNHm7biKiU1pHuvMLMiPKi43+yE8rtzNffSpECIHNS4s
         4MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872603; x=1794477403;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2frlz/ems5IejHKiFsfGGWOinpbQU8f1d97fQ0qUPvQ=;
        b=SV9iiiMPRoAA854os84VGLgbiSB5pwk63FTyOKTxmaGTA8myCwxSsO76VjBKlDZIk0
         M/fGrpid4C+INBEI/eiEUmvScJ1F69Y5Ypf5Wu9ewGLJ2JOlPg/YZLKkzq27q7aM1N/c
         Di2Vexs1Gj0JBi1UR3khoIXjLEimIrgFXnCpFsHY9PqKBX1MRPSTGefKQ31CbMC0nINK
         ntMVKjwDfm1vFOgOpvEsdz08cnCZsmm4KO7Ppe2ypdLe5qIPqNyI0smU4tU3jSsiblFx
         ZCR8XzYEtQ0/b7Wd9puVOc6Iw769Jct5dd3GFfykHDrrK64D4VA7OMgY064H1vahUkm/
         IEQg==
X-Forwarded-Encrypted: i=1; AKwUvBxCuvi0L0iLi3qOuS1Qs//E8EQiWsAgx/iGHASLCR7cQ8ZXGmEdCRa1uCDGnHHw/PxEhd5BW8FbHqJOIw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9GLQQ64SjwfFRvjO5mYrCg/p2CjBPtTPF7J1VisjfU9v5u/blz
	jSGw/2af1FESG4vzbdgUPPC2H40wvoFIj8SPmOMzwKn4hyFVSlaaKsBpbSyEPSilx6o=
X-Gm-Gg: AYBFou2fr6v8aCCjY1tz3on0C+7tuKYaN70kiyg3wFqWssKmMZgLNW90+6zS+re3kzt
	U+4ORsDfeo8N81D6zzN6ceSU6qTgOZMYMdHGCNpCD5JmPgLa2yLHYAmAYJrbeMEeukJHPhWZFG3
	/mJyrXfHSQLuhg8gKuwn0TAtVx3TybHf+o2jT0tioe62XDkPdDDHvXrGAZrZ8opD4x6F9XIUUxP
	ySY1tMYrWu4/uME3xlpBJbt5bTbCPbzHLsW7ZjXKEDrQ1Cqc9HIvI5othSmy3AOafCJO3X0JBXr
	xWzJ7w71yNoCZ/n7bMmyssPWZ7D+l+Z3+Hqm3zYGIzw6IkpTr8B1bviO2/4OL+f41AJdwO7TRs/
	2yKMip3lhhIkN2ddH29ODrTlKA+ehQC2623dLfrNebTIrex/1QGxHMunMcnMgpAiNjOR75rNOpr
	sj3BFfUM5XN7B7UTAMLnBwAqSYPRgD0bO++nj/McqsjDUiSn/3hR7xhqAZl/WBrgmcAzV7oZMTZ
	yV3a4P0YQ6zt6Zf8L41LFzJULqe8+vanMLcErP9EP7M4eS0uOQuNlhcbk5IQ3YTW6qniwIPk3AY
	79CoPrX0BTbYpJz8/U28fX3KvxAD/931KchVqurO
X-Received: by 2002:a05:600c:1c06:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4ac121940c8mr531574055e9.0.1793872603069;
        Thu, 05 Nov 2026 01:56:43 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b64809c39csm3908275e9.4.2026.11.05.01.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:56:42 -0800 (PST)
Message-ID: <1a644699-cc69-47fd-b72e-aac320f2d84f@linaro.org>
Date: Thu, 5 Nov 2026 09:56:41 +0000
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8350: Add CAMSS device tree node
To: Vladimir Zapolskiy <vz@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261104234533.3044265-1-vz@kernel.org>
 <20261104234533.3044265-5-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104234533.3044265-5-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 23:45, Vladimir Zapolskiy wrote:
> Add Qualcomm SM8350 CAMSS device tree node to the platform dtsi file.
> 
> The CAMSS input ports will be described along with adding CSIPHY
> device tree nodes, which are connected to them.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Missing ports {}

---
bod
