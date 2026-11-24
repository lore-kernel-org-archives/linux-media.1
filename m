Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795521704;
	b=Q/isUAl1pKvxZGONUZsHIP+Hv0v9doqm5pobo/KmLVckju43pvyF8Rhj/d0/6taYoaU5
	 eBCvoeEPskWWy4/D9gGHRXaUaGaG+t/wAkDtsoU+6iNgmofZ3uQIv3//18/q7150O+hmr
	 gyZBCKSZn6gDHD6r8ABpRoy3vSj1KeLpoqJK16hdFqpD5fx+N/WWG6gq/gE/qVwJptN8S
	 FPbP5pPWmGsDUppYD3jqPerqnk8fLXdYurTYl0PrXqkXj5PoA+7pxhmf/naKj+4cpbkvD
	 W0OLXVib4zqnzXSo98Epn6h0OT01y17xUX38fvZ+X9Xa7Mm/sMesdfohbOADPHZELMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521704;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=B2aLh1Rb7EeAQdgB6X2lj4SKSG58JQu7NcueyZ/8jZk=;
	b=07NVOnUez/fP/0e7lFZRdZxIvtHt7SDLui4St6QhMksUpesMFdlM/TLi/EX+9tR34mwc
	 PcqY50cbRNae9qYDXjVA9Q/eF/WV0a9brKG+E5fkmQ15z4SKihp6L/XZBuwu1OkwkQsgv
	 /owS5URyJHz98ibcSe7CerDMh6VRAVUMfHZRJtU4iPoc5nt284NUyMzV08HDZ8MuWpEas
	 Dtb/gSYpHbec65Mt1q0TkMZyBLdMWxSyIbV9OUVHuVcIQKrXAfsjVEhBYmBvxNMO4m5RK
	 Zl20tL2YDExUaxs81rs1eTc3NigYcDCCo7pLpuxv15bLncWLvZ758mxRHH9qlfYfCWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=YjSMzvp4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEA3606A321;
	Tue, 24 Nov 2026 12:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFEA3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=YjSMzvp4
ARC-Seal: i=1; a=rsa-sha256; t=1795521679; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pl+ihXuwYyUvtfSLd1N1Pbi3CQTgNWTthvC04yrOaz++2wfYYtJWTtKApPl+11KRmqT82ZVsVWYf+B/3FLjNyvFVmkWjoJLh2uVfjcSApyb/Sn/hMr+V3G6d065cU91XK93Z6REbc/GelW8uvN2UqnONHOX4bYcx0grBtKbum9Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795521679; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=B2aLh1Rb7EeAQdgB6X2lj4SKSG58JQu7NcueyZ/8jZk=; 
	b=C9J7nEPPlm8RvIJastMZzoNxIfdFtPC1S1tryIq1ipsyj0JH4ktUL1rWJ9CjITyWHRmo2nvA6Baf9KWg/dblKEafxAb9mXVtU6bo5PD68vYKJKbQU/g6IJmXLwWhPRng/nRlNKKUGbSP1AqpEERJLGVHsMce2fjbNRs6Swea3HU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=YjSMzvp4ePpoQaOaxcLPjJ9Q5rgzP3v4D9r53X8EDK28J+aL4CTC2B8FFP0337/gTBria6q1Yv9sA18U67IosMMlj/NUKGXdb2xxz2hR+Z+C7SiF9NkSEODJfkrf/ozsOmNolzlzshgU11/b3kENSJY9+PDY7S9CmfU7UXdblck=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=B2aLh1Rb7EeAQdgB6X2lj4SKSG58JQu7NcueyZ/8jZk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795521671464907.5657925737316;
	Tue, 24 Nov 2026 04:01:11 -0800 (PST)
Message-ID: <773b5d1b-6679-4f68-b15e-022842f5109a@collabora.com>
Date: Tue, 24 Nov 2026 13:01:05 +0100
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
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Bryan O'Donoghue <bod@kernel.org>,
 Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
 loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com,
 akapatra@quicinc.com, linux-media@vger.kernel.org,
 krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
 konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
 alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
 <e3d322a0-43d5-4369-bd09-128152f4b233@linaro.org>
 <8741d667-efdd-4e3f-a1b2-2f04255d7c7d@oss.qualcomm.com>
 <3Qy0nxBJKeIHC6U9JocO-BGMDL8rLOkC_xTz4kT1GKMFKf86iv9Jhty6HHNLjO2CNSn6ZjK3G8TAXKLwckkhVg==@protonmail.internalid>
 <e579e40b-9ee7-48ba-92b7-78f9dfffbeb8@collabora.com>
 <fab551bc-5cd8-4ab0-b97b-f808027506ad@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <fab551bc-5cd8-4ab0-b97b-f808027506ad@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Bryan,

On 11/24/26 12:51, Bryan O'Donoghue wrote:
> On 24/11/2026 10:13, Michael Riesch wrote:
>> Hi Anusha, hi Bryan,
>>
>> Thanks for your work. I am working on CSI C-PHY support for the Rockchip
>> RK3588 MIPI D-PHY/C-PHY Combo PHY and would love to see this landing in
>> mainline.
>>
>> On 10/24/26 01:20, Anusha Arun Nandi wrote:
>>> [...]
>>>> The CSID needs to know the symbol rate - so that it can vote on the
>>>> appropriate NOC/CamNOC clocks/rails but... does the PHY driver itself
>>>> need to know that ? It does not, symbol_rate is not required in this
>>>> struct no more than it is in DPHY.
>>>>
>>> Yes agree. I was thinking the same. We would not need the symbol_rate in
>>> the struct.
>>
>> How would a timing calculation like in the Rockchip downstream [0] work
>> then? Can this table be implemented once in a common helper, and the
>> resulting values are passed via the struct?
>>
>> I am new to this spec so please bear with me, but it feels the symbol
>> rate should be in the struct?!
> 
> Might be the case alright. We have two approaches we can take. Something
> like DPHY which populates just about everything in the configuration
> struct or just add stuff in as needed.
> 
> Maybe the PHY does need to know the symbol rate.. In our case on qcom we
> vote for bandwidth in on the CSI decoder side.
> 
> But maybe there's a use case for the PHY to know that rate..

Fortunately, that is a kernel space API, so not *that* critical.

Then I guess we can put the symbol rate in there. If it is unused, there
is not much damage done, I would say. Plus there is the possibility to
remove it too, right.

Just my € 0.02.

Best regards,
Michael

> 
> ---
> bod

