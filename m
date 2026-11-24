Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522695;
	b=NY7KxPtf51ADU8sz4Rp5p8L/YHxFyMnST/1+I5w6YldOVknQS/HECISLv+XjtDJjRP74
	 yrGO8kaoufDPppcAZK4lJtEvXOJwMjbqb6RZsDzInpIiK3p4RZ6fr4p9uSr6bU/e+/RqM
	 NFJhSgzsFMNCY/IFFSSi40U71hEat6zqTUNQ+i/3lovl1m8a+x0fjE6HeVuTlpKkpX4G1
	 9/YEeouAq1zxdcWhSNMJLWB/FFpkhIXIVXAgWMt2ijv9Zcx4E2TFqZ+W5WVttOJH898Qn
	 5+AW7petGl1eD/wVhlkea2AbpxdJls+jNTjG02VBu4i0PjLee+0H/YTKd4AJ2qoTXfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522695;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=juNGDvow2bSWni56kYLEiOct3N4elvig4X0mMlUwiPI=;
	b=Q88IGCNEdQTvOizZpEd1I22ScyeiCha01Xwe+7t3F5w2ltcPaVRIPjitqyt71QTrY6j2
	 g83kgE1QB1jhK2hW3KPCCzx/mj0DAl0pXAcULURSAatERNoiNkFj5QN19G5jOkGfPtIGc
	 BBsaAnKy8jpyKSuNW4oFyckiXxeOV8FDsslTi/YpialzFTTaGQeD2R96oKZbsNqPlJys9
	 Ap1kjPyBOvmW1LGWhHN+95EmUnNgZpvQU4K2avpsCgWtRyhXBW2TQQ4ySbSVgyWynuMTF
	 tgk4bvfgoaKoxf7p7jSlsS89snbuFSMgslcbcXvY1Bwete0MFC4ETm2veGivBNj6BUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dtDnjrng;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D61606A327;
	Tue, 24 Nov 2026 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dtDnjrng
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7102B1F000C6;
	Tue, 24 Nov 2026 12:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522695;
	bh=juNGDvow2bSWni56kYLEiOct3N4elvig4X0mMlUwiPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dtDnjrnghRHgvDzsE0Z1hW/ssXRotKRlCMDH31E8ygsUHD24qrtTTYLaMvHqEODll
	 aLUbP/lhBkOY8A0u8eP0zBAPYcrxjPY3CMdPvNUnX65a9YfmxMhheokvDHH1Xfpn6t
	 Hk9R3Cxsyg0OhR0xYcrKVI480nCWqur/R6DXGamttY6kz6sRr/L7k3DOWVW5JJt/Db
	 TzAVqLrXIRQEyt52LA7Eu1+zXouH91jKEdIJFEvJ7XXiFePRZsI7zQdjZvidWFSW7g
	 Pn3U9wdNBWN9ZWiJMnAGc1cEL/OaZ7ut2omKOX28UyUYntIxaE8mgblpEzaCMUWg7w
	 9Y1VJoa2D4efg==
Message-ID: <b3adfac5-e9c7-484c-aebd-16c94f41f28f@kernel.org>
Date: Tue, 24 Nov 2026 12:18:09 +0000
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
To: Michael Riesch <michael.riesch@collabora.com>,
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
 <P0DcNxFFqRzTkXdjBWhsf9xcIvjwIClQvC2dMKoQDIZGtFv8g9u78e5FJ7-sp7JxcMPiZROgk9a2niaSZwCztA==@protonmail.internalid>
 <773b5d1b-6679-4f68-b15e-022842f5109a@collabora.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <773b5d1b-6679-4f68-b15e-022842f5109a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/2026 12:01, Michael Riesch wrote:
>>> On 10/24/26 01:20, Anusha Arun Nandi wrote:
>>>> [...]
>>>>> The CSID needs to know the symbol rate - so that it can vote on the
>>>>> appropriate NOC/CamNOC clocks/rails but... does the PHY driver itself
>>>>> need to know that ? It does not, symbol_rate is not required in this
>>>>> struct no more than it is in DPHY.
>>>>>
>>>> Yes agree. I was thinking the same. We would not need the symbol_rate in
>>>> the struct.
>>> How would a timing calculation like in the Rockchip downstream [0] work
>>> then? Can this table be implemented once in a common helper, and the
>>> resulting values are passed via the struct?
>>>
>>> I am new to this spec so please bear with me, but it feels the symbol
>>> rate should be in the struct?!
>> Might be the case alright. We have two approaches we can take. Something
>> like DPHY which populates just about everything in the configuration
>> struct or just add stuff in as needed.
>>
>> Maybe the PHY does need to know the symbol rate.. In our case on qcom we
>> vote for bandwidth in on the CSI decoder side.
>>
>> But maybe there's a use case for the PHY to know that rate..
> Fortunately, that is a kernel space API, so not*that* critical.
> 
> Then I guess we can put the symbol rate in there. If it is unused, there
> is not much damage done, I would say. Plus there is the possibility to
> remove it too, right.
> 
> Just my € 0.02.
> 
> Best regards,
> Michael

An equally valid argument sure.

---
bod
