Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515248;
	b=a3yKhGhQI7+gNZJZynJiMzZsIvdTUDzu5TDYrGYO/bpFNbQAkDGNK+FRvCHre52RuRDu
	 GEf/uciWf1H50noDAbvUk4rq3fX/2tyUFYSOGRNZGMci+pGOug7Tb5oD6ZSReONH5RHyN
	 RkU8UerfTUvdUlhkYnVAtYpfjzXeTxijDOXVjb5ptgrzrfAU28mXR5GmFtKOoCBdEncaG
	 H+cjPi6iwBKqVaa1paF08M0Z9zHNTE7BwsATS4kNUel6DUzvrQiuXckUg1fpZdtY5652N
	 vBRpvu4HwTmGYN1z3dRKIIyH6KPU4VqM9/ZFZ6J5xBrpJVrwFP6sdRDgvmEc3SeURvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515248;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=ggxALf/+oSv7/fUQNTwY+wOuX1VfxeKtlz/EiD0e6sY=;
	b=Wx167FENbrnNKlEi0fZ5BynkRvBgKhtJsPlocGjWcpQ6mvb+5T7SoCN914Gw+ZfEsyVn
	 FAHRx4nSx+YwwIby3V+rL9yFlLTzMFqzSYct14k++dguAHmnc+uf5/FzymiIHB8ot5C87
	 ajFPRfq2LU2fQOZnuI1t6dqsrXqdYJNyuuHdthvd1g/0WlOT0HnSMPHISuPRXJQJrMraJ
	 tXcUXXL8mPnEw3nSALJyQR6ckR4GSzYdftcA9FxpKZ+U/Zcms9iRTTfZeWGvmrKGMCK1n
	 bxi8h4Twpbja9dhqsebssVh2oQq6PG0jadmjZPGooJI4ja+7br8FTJgAliDf8z8gQEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=hgQKAl8L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B765D606A332;
	Tue, 24 Nov 2026 10:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B765D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=hgQKAl8L
ARC-Seal: i=1; a=rsa-sha256; t=1795515220; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C60D8F8WXN8UDjHKqr6llsekioU+KLgeLrzDyPom6k7c1gvWNOzoO3/3O8txC2crEIPXv+N+MAI5CyDInL3JEK5zJAXL3sa9tG5JUCfs7vngKOylZxy34Ht1el3Zv4U6aDB6SLGpYr3UrWsnGCsvL/IKvSkrPqGce+pA+472Blo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795515220; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ggxALf/+oSv7/fUQNTwY+wOuX1VfxeKtlz/EiD0e6sY=; 
	b=AuJLV0+spDVt5VkLRGVqmCrA6EqEML/MlPzJAPv8BeGFi5Zw1KwHEazcdhYTTpMyi32GrCzmlYgR1GEZJ1gTmF4T/MwR2AEMSSRXdSlTziSvgsCxE/Kmf6CKWMciVgQqXqq9RNKnR4OWTT1lECu4JmTmmZq2J+nY3R0tVFyoB/w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=hgQKAl8LTEx6YhT91goAVPs9yeYvUAj1FBJfHy5Da+QU+ea/LtMOg8etyjrNlBDOl/s8GCPtzEozW/7hS9/UsjrDxva1kGU20TunS35szgzpvvehXwY8U/TyUj6xuO4cxnvRchtZEtV+nVckm43Ts5CcNzrNLuJioBtPxg0VfA4=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=ggxALf/+oSv7/fUQNTwY+wOuX1VfxeKtlz/EiD0e6sY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795515217649395.0528793702906;
	Tue, 24 Nov 2026 02:13:37 -0800 (PST)
Message-ID: <e579e40b-9ee7-48ba-92b7-78f9dfffbeb8@collabora.com>
Date: Tue, 24 Nov 2026 11:13:31 +0100
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
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org
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
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <8741d667-efdd-4e3f-a1b2-2f04255d7c7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Anusha, hi Bryan,

Thanks for your work. I am working on CSI C-PHY support for the Rockchip
RK3588 MIPI D-PHY/C-PHY Combo PHY and would love to see this landing in
mainline.

On 10/24/26 01:20, Anusha Arun Nandi wrote:
> [...]
>> The CSID needs to know the symbol rate - so that it can vote on the
>> appropriate NOC/CamNOC clocks/rails but... does the PHY driver itself
>> need to know that ? It does not, symbol_rate is not required in this
>> struct no more than it is in DPHY.
>>
> Yes agree. I was thinking the same. We would not need the symbol_rate in
> the struct.

How would a timing calculation like in the Rockchip downstream [0] work
then? Can this table be implemented once in a common helper, and the
resulting values are passed via the struct?

I am new to this spec so please bear with me, but it feels the symbol
rate should be in the struct?!

>> Sample principle.
>>
>> So _really_ thinking about this I suggest
>>
>> - Following the DPHY example
>> - Including all of the CPHY specific timings
>>   The ones you posted, plus the few I found missing
>>   Any other relevant CPHY timings we may have missed
>> - Include the helper functions in drivers/phy/phy-core-mipi-cphy.c
>>   IMO we should use defines not hard-coded constants for the
>>   specification of the timings here, unlike the DPHY code
>>
> These comments will be addressed in the next version.

Is there any ETA on that? (Just thinking about whether I should test
base on top of this version or wait for the next one).

Thanks and best regards,
Michael

[0]
https://github.com/rockchip-linux/kernel/blob/77168c8d5ab82399f65a80e9f807b50ba37cf483/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c#L237
