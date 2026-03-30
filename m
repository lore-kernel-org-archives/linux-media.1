Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250493BC66B
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867169; cv=none; b=VLNOvTtoHp7UkVq+fWVAuPots3Q87Nrcj3dHWFBWUdDC4EJSpa9tgJ8ho8yqXO1GLLL9lSG2JML6D7856E2vEPYp9CToGF2TFeSC4ZOTviJlFUoIqNCNnA4pKeKbEQR5bExSjaHgCyZzVD8EN4WKADmsyxc3BfvgYlKX1msxilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867169; c=relaxed/simple;
	bh=Yhx0f5IKrfL2voq4NVHqWSkTdxT4Ya1YHwbFpIGoERM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JbMTY1E4pH95v72CVc4g97uGv2NrTxaPc3H8FIeLJjZV5zrCe0drXLUGBvioU+6Pa6U5rOUIKd+3Gmo/UZ3q9yp0PlNP+mTdZWQLyvKVyWSMDRUUPSzyINrSBbP7Wf2r1kBothkDahzmFUQh/MMZNaEcm1XKCnnFjHuw5Kc3GB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OIShHM02; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OIShHM02"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2b0a62ca7so93386e87.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774867165; x=1775471965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjWd3BKgQaFoYYfVE9rGe8nNVHUMawLjZDnU5IK/ObE=;
        b=OIShHM02C/ZgP3gmBpqyCOhXlqo9zNQu6Timg2DscitXyFv4A25AcOy59rHduPs21J
         m30Ej0lb8v21o6TKkMhaUmqenxCDjQZlqUZ8kdof1o4JNZSxasEyQbw98uZ4PmEFUqR+
         3K0/ohIWeOAJUikNV/ZITvwq8sLpA1ZhhZfHcwt9oyhdIJcRAWhcGHB8l0pJxOeMwxme
         uf+CPNmAV6zJ0dDH3b9xbjiS98/2Ulgs+q8+swiSwhM4qusKUrcyg304GKgWeg5NRi+7
         lG3hQ6VkmgtXMixa+p7Mwe8LIy3OF4oDjPSfLaDvw8e/nxD+ZWTTVVr31z5yNG4b0V+I
         CEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867165; x=1775471965;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kjWd3BKgQaFoYYfVE9rGe8nNVHUMawLjZDnU5IK/ObE=;
        b=Q/9kKZDaXkogJZg/TuUKJEhsCRMUQ/wXj8iVD6EnEOpFEvOb95z95anPisa9KKTDIt
         5DYZh3LBf36YvNavNg9GMF6P91B9tqI9IPuXPo2hB0PmkHr3o9l5pJWVj2E8iBUxG0An
         fH2a1QUy9nSyE/vA0LXyfLiZhmjI60hJMvhnnoyoAKQdXV8dXBqfB5sQSFMtltpakxJg
         fTN1h6as4RFZISgV1bWeDOhBbtWH3TdQkYgcwZ7McDWkBOiVJshqZ8tfuKUu0WS/WoGu
         0LPMY3cucawG5aoMMvwCQ2XaYlY7ECAxovY8BmkwYowaQOkCLZDkcCIzeDgLBr+GfzPv
         d58g==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2Ehx4BRCMWcOyIEzgcfuhQnzwA2lcnzq2htybi6/0uc4lmU3cGhmFPRzfR9CfqP2fIeHY8400WrT3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQP/+5yxemJtXY/7+Ia3B3AP2Mu716CgCStgu5RS0AFRl/1y4o
	sj++qvk4uZ8ttjykmDE+jhTj/F5EUQrEfUPLIovrDKl88xcoVv4eHIaPC03lGgSv6Ac=
X-Gm-Gg: ATEYQzy0Ro4fnH1FW+bBkbIqgROl5aAEjQ7wWXJz53s1CQ9Q4c3sGWsEpRiemjnDNlx
	SjPRjUM/G7F/7sbSBJvnAqu8h+ym1LZKjkNa3cj4vdfGRl9wkyO2crltxgMF51fYuZf7SkUw4YU
	Ebi2MdlSKvKsBUxtFc0s1Rx7tUoq/94Ir/5Bvk34P4dPiq15RC9AQucRns0Cq1rUPUr0aXtr/JG
	awcIrakZWxloQv9ZUHWrRfLb2KFmJYUY0i9mxdx8WbA0Hoa99AMCSqgohL0Pb6QTSRsHnLIoXjQ
	o/Jhb2ut4guEGP5LYDN41UTPUMR1Ir0qlQEognaQVeiPIZYhFW8jANSzg+3JCUte4m+hG3CtZja
	KDjFx+uQaNFLCOknUDpaANgapB/fssrUJv6kdBd9hhj5tFMPUi4EshWCPGUG0RzjEWFCeDOlUZf
	3Ktc2L9BxWlKsRuVMy6uW4rK2JnjKc15oWZU/+duVT3Ywv1g7+nLKkWBeaKlAXIS6Vz+d2mWduN
	1vEuA==
X-Received: by 2002:a05:6512:514:b0:5a2:abe0:dada with SMTP id 2adb3069b0e04-5a2abe0e165mr1264088e87.1.1774867165161;
        Mon, 30 Mar 2026 03:39:25 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4294sm1570390e87.8.2026.03.30.03.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:39:24 -0700 (PDT)
Message-ID: <6870033a-a483-401b-97c6-1df5508181b8@linaro.org>
Date: Mon, 30 Mar 2026 13:39:24 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
 <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
 <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
 <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/30/26 12:02, Bryan O'Donoghue wrote:
> On 30/03/2026 08:49, Neil Armstrong wrote:
>> On 3/27/26 18:42, Bryan O'Donoghue wrote:
>>> On 27/03/2026 15:28, Neil Armstrong wrote:
>>>>> To be frankly honest you can make an argument for it either way.
>>>>> However my honestly held position is analysing other upstream
>>>>> implementations connecting to the PHY means we can't make the PHY
>>>>> device a drivers/phy device - it would have to be a V4L2 device and
>>>>> then for me the question is why is that even required ?
>>>>
>>>> This is plain wrong, DT definition is different from software
>>>> implementation, you can do whatever you want if you describe HW
>>>> accurately.
>>>
>>> I'm not sure what point it is you are trying to make here. Are you
>>> trying to say drivers/phy is OK with you but you want an endpoint ? If
>>> so, please just say so.
>>
>> I'm against using the "phys = <>" property in the CAMSS to reference the
>> PHYs, a "PHY" in the classic terminology is tied to a single consumer,
>> and if it can be shared to multiple consumer you must model a mux or
>> whatever in the middle.
> 
> The CSIPHY-to-CSID routing is runtime-configurable and is already
> managed by the media controller framework.
> 
> DT describes static hardware connections. The dynamic mux is a software
> concern, not a hardware description concern.
> 
> 
>> The PHY API as an internal software implementation is probably fine,
>> even if it makes implementation of split mode much much harder and
>> doesn't really solve anything, you can just call init()/poweron()/
>> poweroff()/exit() directly from the CSIPHY media callbacks.
> 
> Great.
> 
>>> I can see an argument for that hence my response to Konrad, I just
>>> don't see why its a Qualcomm specific argument and of course
>>> understood stuff bubbles up in review, we have a public debate and
>>> come to a consensus - that's a good thing.
>>>
>>> However, I'd want wider buy-in and understanding that endpoints in the
>>> PHYs is a more accurate description of the data-flow.
>>
>> It is, and it was designed for that, and extensively used in the media
>> DT representation, so I wonder here you would not use it...
>> In an ideal world, you would add nodes for each CAMSS hw elements and
>> adds port/endpoints links between all nodes to describe the data graph,
>> this would be used to construct the media controller graph, and make it
>> much easier supporting new hardware.
> 
> Yes but be pragmatic Neil. The first step in making the monolith into
> sub-nodes is the CSIPHY.
> 
> Once the CSIPHY is in, we can follow on with adding new nodes that way
> IPE, BPS, ICP, JPEG whatever and also work on implementing the old stuff
> in that new way.
> 
> 
>>
>>>
>>> We've been applying DT bindings aplenty without that so far. So we
>>> would establish new CSI2 PHY bindings should represent the sensor
>>> endpoints.
>>
>> We've been using a dummy representation of CAMM in a single node with
>> only endpoints connecting to the sensors and hiding all the hardware
>> layout in code, it doesn't scale and makes supporting new HW hard.
>> I mean this is common sense, why would we continue to stick to the
>> current CAMSS bindings ???
> 
> We _won't_ I just don't support a big bang integration. Progressive
> changes over a longer timeline make the transition manageable, without
> accepting endless sub-standard stuff in the meantime or holding up all
> new SoC submission unless/until.
> 
> I mean there is a CAMSS meeting which I've been running for nearly a
> year now that both you and Vlad are invited to where we have been
> discussing this for months...

The established process of Linux kernel development is based on email
discussions, the sent changes including CSIPHY dt bindings were plainly
ignored by the maintainer, because it's a NIH material or whatever.

There was a chance to discuss CSIPHY dt bindings changes one year ago,
now it might be not a coincidence that eventually after the series of
updates the new CSIPHY dt bindings will be very close to the once
displayed ones, it took a year, but still this is a good progress IMO.

-- 
Best wishes,
Vladimir
