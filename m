Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBA53FFFA7
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383809; cv=none; b=lbz/h1t/DrcI0P242UIUyMROl8ZzQ7YZM3QohGBCTKpIxd+B3MR4AJ7iW3xVx0I/Ueqe0BSUOKSK4B4zXP4Cdi/zlWV5SuUHJ2iA1QICiZenQUg59GPnorbELhcZn3f/5hMAh/VELKQHyAAnkJtwK5Ays9VxUqCK0WPPbmohYzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383809; c=relaxed/simple;
	bh=u1qAW3Ps1/ms8o++TePT35PSy+z+WCTmNWWT04eGCYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ig4oDPzZ1q9ITu7e52HPgRbywiYqvY//iIszQaxwRXaTkd/A+wsip+4boycSgLTNKMrtnXRV20KpsilUBhOA6GNUEDjahRv4cK+E8kgdWng28aIJJisg05VkeseSOJ234PfRj4wgRmtnw7oVAX0p2NOIY4LFEdCM0NQMgjlIFPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CWtlnWt6; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CWtlnWt6"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2946aa0d5aso425569966b.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 04:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789383804; x=1789988604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xbly740beuemqSo1bscqb84tM6a/tiFHYniiF7SfuVo=;
        b=CWtlnWt6Qku9A9q3PNgFGVZh+ZU7ZXvrRhbL3zGB0800GBNgFym4YOqSojWLPf0AaH
         gOw085NF6u4mvqhmaFck4d6YTk4nxD3MQpGQQKot9P6JBydO0fRnCb4QOek4ixRdil9h
         hYStXCExp0DvicagVWG2psuqoUHAL6KuJoKs3SXBsQySKUBZnAjIhC5XW92VwI4/LtHF
         K5uUPVgQTE8QLErJgEu5S/5hyHk6vviSkbBEzapzZIGaTYod21oMxOnVAY0XF6YyIvlx
         nKyAZkmMQ5z+ZQs7hFEg4dXuxsYpLz4e3ukDXDFLZZxN9KeiSKBqo+BGqmZYZtFtE479
         5PBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383804; x=1789988604;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xbly740beuemqSo1bscqb84tM6a/tiFHYniiF7SfuVo=;
        b=a5YYgvGbyhcXhnmApiI4T5m3qhJSCC6yKjeaqm25eaokSvjDrronGcVB7wkBEN6oOd
         Dh9bpYQlyKDwbhu+WL7HsWfGBhoF/d8vI1guAEdUekctpGSUB2Cm3Jc04wn5ChxQyiC1
         NPSmatr/iHQmxqLrv94x6SGE0UI9n2yLtXrRl1TwLbR8lu27dEoOj1uq3sZXc5WAco1j
         TUzh5Qw/zcYbKgG6dgF3l/L9de/TXflKyyXEjFi+9/4mrNVyPrceR1JlpB6xv2eijky1
         pdPY5g60ho13g/ciineL/Y5RLbG5syA8RGQFzCLlc6gTj0FVOqg81IGeGSTE8dItiUHl
         dy3g==
X-Forwarded-Encrypted: i=1; AKwUvBwy6/W4luajcykYR1wEtfGxR+dpmP3m4NkshqrTJ3RdcmBo3xy3pfUWa4kGgTsmgQFoLaDL2hADWcMy4w==@vger.kernel.org
X-Gm-Message-State: AFuF++lCfAid8hMRah80Nx4M5vj6Jv7DUFXaB4yXGdRWQJIWaP6WIFnh
	r1RNHIeQlDpZg4n2wa+1fG64qUsezl5Wffiwz76zCB6lkJLi56feMrfzVPsVZ4RCfxM=
X-Gm-Gg: AYBFou3Z/UhEkdyVDaoTRoXp9zRSbj6LQGK7kCFjjDXLMyXEsavOCW+4P+IMViX7HjU
	gvZQlZ4L3KYga3lMqcrc8tzOXIg1PbXhKlPbE2eqQVXNIWwIDyyXGellOAzSHywly9YjkPKBBa4
	Gb4UXxvYl65cpyBP1vkghN+Mg0JMJurxqTEHeQacGu+bQiSS/KKa7o1Xh0l+7VqP+2ILGkJXPIE
	3tHh4/Cc8g0g5G2oandbXR7wCb9y+Yc4+t7ClSjj4FA9UpPIe/YVWHJFO7+fCs9UkGFSfLES2ss
	ap7EzliWej36ZJ1cmlYEMzMpp4g55nC4qtiCxU3Xnr/5wiT61p1Vm1xqrJRXBTg7iSEXaSoiZyQ
	zumLaW3hZ91Y4hViKTCoUhThqj5D4cmGr5NBWq+myIYdTfhtL2I01T0pzDZWlukwhGZOz3bnQOq
	KPc+pVxHNXJQAfofZCwYfRFbzhff4SjSSBaC8UiJTdOdzKyMMD8RXpHwkq7JF/l1uYKvYVjB64U
	uoqI15ZCHYLrMUCVZzm
X-Received: by 2002:a17:906:c156:b0:c25:833d:3839 with SMTP id a640c23a62f3a-c29a437c67amr329463066b.15.1789383803122;
        Mon, 14 Sep 2026 04:03:23 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29852497b0sm286364666b.38.2026.09.14.04.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:03:22 -0700 (PDT)
Message-ID: <ceca8547-ff15-4f5a-8844-8ec9061a5e6c@linaro.org>
Date: Mon, 14 Sep 2026 12:03:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/5] phy: core: Add devm_phy_get_by_of_node()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-3-f7bd68b5369f@linaro.org>
 <aqRuCfmgPqa5h0y4@lizhi-Precision-Tower-5810>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aqRuCfmgPqa5h0y4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 22:09, Frank Li wrote:
>> +	if (!link)
>> +		dev_dbg(dev, "failed to create device link to %s\n",
>> +			dev_name(phy->dev.parent));
> Is it okay to print dbg message()? suppose return NULL or some error?

This should be dev_err() for sure thx

---
bod
