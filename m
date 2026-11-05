Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893152;
	b=jIWi3vbTHY1B6FKEPMGaZXIlanJ01SQNDN+Fog/nqh1Jkx3O7ljEBoV2dL9EY17ojtnR
	 WkYu1OauOqllAO5t3ThJwUR4jgx5WjM0Tnxu5c1/24I1Ynxziuxzx6hufiPH43u8yp/Pv
	 IfLzhKCZHLWbcfD47GPX/VVgUyxfCY6GKrCFNkdHApj354bTzpFgfpKjpcYvn/qdaqI3E
	 3Jzbqgho6tfqJg2/FiuEtBxHIiPSmIt6dlWdVBH1pyH0sZA+w7SQXuN6eRtFO94qNSb73
	 fM3bwHmuGEP6kXk3fOmk/uspu0BAaL4V2mSEShXv5qBu0A9f76aC25g7Wehoz33UUlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Z5K5hANiP4hKvDWgB+1UuOsMTO32b8ekKek1eVxjOKw=;
	b=LAz7qfN+QfiBkmxwBDZ1oRG3jBBjQbryDxCcVg2hhfWYdaR6tCDKBJfXUemFFnopX4YM
	 uBPhMHCmbeXk1vYQhTjhKBppPrKT1qV1OLrvKTVCL5zOyfvU3Ph0miQvM8pK/nxvTzgGd
	 HSZveiRg63gsAQwfqE2Mr0pljxGWahEwVYzAcpLPSYFnJY3rCKwwkfrAXHezJUC69EhnU
	 P2AwO43N4hPeGKtFQydkptbv6qx54skXTXNMbM0XjRfO02RBD5i+i/0vNCVF6ptsodR5v
	 y65aJYd/adDrsqZpRmSJxRAkfBmAnM3nBPBbVLS5mJS1ke0NFe4JvOhp558ONYN6xYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="NAJ6/dW1";
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F492606D809
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 15:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F492606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NAJ6/dW1
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be502e1adaso162101e87.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 07:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793893150; x=1794497950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z5K5hANiP4hKvDWgB+1UuOsMTO32b8ekKek1eVxjOKw=;
        b=NAJ6/dW1nNAVv5R+uX3W5IJtd67R+F0lgLEmD9I0ASfgwmXwO68uagcQFee1bXpMzX
         /6K6Wiz1xN7GQobFBDvwjYth98PaWzz2StfLEijXVxgd0ai01lNQduJdItoH0rY7mNOM
         Z4mrBiVTJmVQ1bhYdDEbWXIJ66Owovkmmi0H8qeuN8Y0ZrXJymDGgS7Wt3tFcfVO7Mn/
         ky/qEi9xlbfRbqU2rEMwa0pGjc68SLAfpjgpemuUG99osK0OuczkdeMv5ejwGqCOPivU
         my88SK+ooURsBq+1kLvPZxDAvSnQw302cdQcqHytJ8DqambTc5TMyfuunxoXIS97/8Xs
         RekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893150; x=1794497950;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5K5hANiP4hKvDWgB+1UuOsMTO32b8ekKek1eVxjOKw=;
        b=jt+IoHVV60sLQCeMC/7P0+nAfHyTinYgIjFl09ud1Iv6eyMDJfvuEhzBG1Mcg7SKBD
         BNGDDITLQlYq3/qzs05XXf8PzafxbjvWkFJycZpeQq3nlAzJAqnyB4U6OTR/vOScf2v1
         Jk2bEUeVo7+nWEwzKZaUZeILAX1Ml22hviFfCYaofFl/dku77JiogfhoN574pG4Ilw/j
         AqRpHc/nchrV006iIK2foPCJN6sr7x/aHGtlb4KrwDnobS+klOuet/q1+awDjo67zU5t
         q/OvYhnrc9saNIecqPCa6H80LVLqcYvu3EceXvdLcIekX0IDP3WNnOUHcXiSSyfVzr1v
         HsfA==
X-Forwarded-Encrypted: i=1; AKwUvBzCI+vldsVhGWmbP1qkDjelxtBLHUkywC2lHm7tCeuW2fIWbdJfhmARgIvWUjOp+S+0OY+X3iQMyRJLuw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+YNFZhRWOZDjy+9BZcEsYvEZvIoWrteDU/C0xLlJzIwAjeH2kS
	VhTRMKZrSJeztvZfbMiyM2I0yPbMbpn/I6iF4CiVmfMvpOKIUIXBUnaO5QbjPq6eVIM=
X-Gm-Gg: AYBFou3k0728fwFmu3QcqKfKK0AZBgEJzP4UNqt7lkvs6ArfPhfUFJGHKO/u7vPNBvE
	v+xZt6P4IyKY8WEFgBic8RbapjLP8rzWLp8/RW5zXoyCrckHSu5/UTyemgc+5P34AzSx9aR9Dlk
	hq/fWNhQSRXn6FXWWzH7eWPRBjmkaR4Iodqo48K9wafW9petjlbeCnlU0lKQfYgNaJHPTOu4r5m
	Rog7M0ik9+dnrXibMTQoH3wyk2LPpJwJd0ueHTAq6BuFHaQqpT9odAB7Dm8OuW+sZybKLXfwjc5
	Z8JHjKCCKkX8oGpT4lDgqvxTajcsYlT8iGC2l4bm1VaKP/9uH/1thNXH1BKvDbb+Gxmfp18V8Ot
	Y8skJayBaToJcqQWU5yKlzod+Ey0305u/FkQv764NoYa1sf8vJXohtPREVzXkJsJrs9FzLkbw2P
	y0p0z+Kdfv0x3K4wP0R/03uLLn7L1eDwwMHq0WGG4Sv1Yat1BJ7adx800wrL/vKD+lhWRMsubQb
	LxNn3PB5l6R8fF28q9Y+SWi8NXT9gx4ppWkJUSF1eUIZAg7x4MvoxiGn6cv/2YXz9xrjlcNCGp5
	gGuArv8nUElbGuc8DOFdc/PL2COa+MNSU+tkn4uIvDGMvsbIqGbNXtTJL750xWsLyE5FoU0FyQI
	JwxqspV9WKrP+j0RuRwulL8JhiMY=
X-Received: by 2002:a05:6512:4041:b0:5bf:a48b:7807 with SMTP id 2adb3069b0e04-5bfd952024bmr6876236e87.1.1793893150208;
        Thu, 05 Nov 2026 07:39:10 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff9a660b0sm485831e87.11.2026.11.05.07.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:39:09 -0800 (PST)
Message-ID: <4d656385-fd3b-426d-b326-b1d20ba1e2d7@linaro.org>
Date: Thu, 5 Nov 2026 17:39:09 +0200
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
 <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
 <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
 <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
 <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/5/26 16:01, Loic Poulain wrote:
> On Thu, Nov 5, 2026 at 2:21 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 05/11/2026 13:04, Loic Poulain wrote:
>>> On Thu, Nov 5, 2026 at 11:45 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 05/11/2026 10:53, Loic Poulain wrote:
>>>>> So some chipsets share the same IP blocks, with some block/phy
>>>>> instances disabled. As a result, we need to decide whether we're
>>>>> numbering based on active instances or on the actual hardware instance
>>>>> index/offset. If we use active-instance numbering, then yes, it should
>>>>> be @2 (CSIPHY4 being the third active instance). Alternatively, if the
>>>>> port numbering is intended to reflect the hardware instance offset,
>>>>> matching the register prop, then @4 would be more appropriate. It also
>>>>> has the advantage of directly identifying the underlying hardware
>>>>> instance, without requiring any additional driver-side mapping. In any
>>>>> case, @3 is incorrect.
>>>>>
>>>>> That said, since the bindings have already been merged in its current
>>>>> form, we'll need to preserve backward compatibility when addressing
>>>>> this.
>>>>
>>>> This is the input port to camss, so how is it called in camss, not the
>>>> csi phy?
>>>
>>> The CSIPHYs are connected to the CAMSS input ports, which can then be
>>> multiplexed and routed to different CSIDs. The mux identifies its PHY
>>> inputs using the hardware PHY IDs, so the CSIPHY4 is identified as the
>>> CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
>>> connected.
>>
>> I could not find that information in Glymur HPG, but maybe I looked
>> wrong. CSID Wrapper lists CSID 0-2, not 0, 1 and 4, but again maybe I am
>> looking at wrong device description/interface...
> 
> Yes, there are three CSIDs (CSID0-2) and two CSID_LITEs
> (CSID_LITE0-1). These blocks select the PHY source to be routed by
> programming their PHY ID (PHY ID = PHY index + 1), as defined by the
> PHY_NUM_SEL field in CSI2_RX_CFG0.
> 
> If the CAMSS port ID matches the PHY index, the port ID can be used
> directly as a routing reference, which keeps the implementation
> straightforward.
> 
> Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
> makes sense. In that case, the driver would simply maintain an
> internal mapping table, for example mapping DT/logical ports { 0, 1, 2
> } to PHY indices { 0, 1, 4 }. As long as we establish and document the
> convention, either approach should work fine.
> 
> Today, the Glymur bindings define DT ports { 0, 1, 3 } to map to PHY
> indices { 0, 1, 4 }. One could argue that this is already an
> established convention, as it is documented in the bindings. However,
> it is somewhat confusing.
> 

I believe it should be fine to have incontiguous port indices, because
there is no need to link unused phys to CAMSS on any particular board,
therefore there will be unavoidable "holes", and this can be set right
in the documentation of CSIPHY to CAMSS connection.

-- 
Best wishes,
Vladimir
