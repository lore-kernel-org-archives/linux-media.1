Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C743C7AE
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315963; cv=none; b=JvORYdcpEtwBGJjnYgvMipQUQJO+Y4XFOEzEYeGwvAb8hchDxtdzgSElg2bonzOZzjazpnOmEps2mA35PZ0zkQaTdQIgYfk8RAIrRpxr5+PhXFCv1XLP3rp0BVKMmd1aPqsln1Hem8y+Zztx6oS/cndZheA0ro3X0/GYXlsKXA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315963; c=relaxed/simple;
	bh=Pgzdd8QWkHLx5iJntf57eHKC3caXUVrMC3GRDLNiXIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l12V3RbTpTbkVMX0MAgZBwV65aGBU6rjn52IV0pRULLT6BD7ITs1XvqPYfUxdBwbnN0ddEXR4NQ3jBKPB6alV7BM4jbKZ5jtJn086UhE9/Z0Y0L6e3jqCdsehhvy1Bpe0AOu6pSX86jtKy7m7MPPROhQyx4TJtzG56wQAO6N190=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mE0/FiJy; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mE0/FiJy"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c169ae1cb26so320340266b.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 02:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785315960; x=1785920760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/MLmidGDM5QU9T+4fBVHNCPTr7RK0V7QVFC0bGSvSY=;
        b=mE0/FiJyriFLB0XSsNSfv8S1OPGzSI/6lTdLM0KcToXv2AgUM2COud11WYHC0PMJtH
         Piebq4RkZZ6Hhdn99hEW1GDRTwynXyKhs3GfgN7a4nClWVoej32HCrDPyzRl630HaLXv
         xPZtsBySSGNKKuriqT1COFcSsKKLK1OYSIrJbQx8Bw06jIYNegOs4f4z1PIQ5Wn6F6Xq
         rO038n1NcG3MTgWksqkd3PWcBqs+euQ7sJkAv6daRCGuhHbroGFHCsQmbzl3oqzQan0E
         d6xsB/3D5QG9FOgqqubGBb/6Tp0WuuJYrMbIsMrgxmecv9N1euvyIeaxkJKMYRNiTxFB
         AM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315960; x=1785920760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/MLmidGDM5QU9T+4fBVHNCPTr7RK0V7QVFC0bGSvSY=;
        b=Z3euPDxCRg74Hfdex2F7GyzwYXzxF4gyeRAh+oTvKCJ7jei4wUekwOkSLAhtVht9FH
         YL1fCWFmkdfL2U2whUP+t7x+zgvMbeYgRRQNOJwvvrJ/dEzLNXtnM6Dk04IwojWqE+Kf
         QNlqH+5XckiCYXUpQEvAZhZIU6muzIyIjvf7i6ye2t/ruv/TTvecl+98FE69n+VKEva5
         vG1SJpYtWYnLwNwmp/OTnBlH2UX23cwikmEXkzLudYrO78E+P6uGK0mmg0J1i6A0ILqJ
         OdyQaSJTKY00JEEXtM04MxVfZrprCK1/3vF70G5dL2/aGV5exqnui9uhCqkJYqogw5kW
         e8lw==
X-Forwarded-Encrypted: i=1; AHgh+RrTCKR3c6SHof8WgPiUKeMMH3wwEf521UqcOmv1no6KcChdNLnkxaWO9RhKu2YHkN5Mhs1ODBdwHtSJxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfTjLLP7VmsaJzhHcNuK2rFZU7FM2XpolG17ZDeDvK0m8QAb9x
	rZ0fTLZNfdZ84m3CUhUYASriJZ8gBOFCHMllSMCMDvzK7QLpl1X2UHdZv7qlZWHqijU=
X-Gm-Gg: AR+sD10UWbxq5qPKEQT0txYhjfMecvX+w6F/CIwwz58V4XXtMQNtlhFGQBXYwW0EP3p
	cASAEx7RUonjPfDMyL84WiXtE9bHWtR+yjBj0DhNfYMTfFgKXsaxJcoWi3sgses8j3EPRRn13Y4
	BzXMMT7hSyml/hYEzk1OavPZVUxtA9p5zVZnm7zgapRPYKPyZ96f6pXSHsgMgL/9/SJZIqHQuzw
	Hj75o8nKVRuSOVezq0lneyrey9lNZ3IB9tHmTaHSTAPsZcyiXVt/nZed+vVPAg2IwtC/T8tWcou
	O1GExRRwmDGbuycdIzsqCIpaxWungGsz4jHfV95P4/cqtIZQFA7UyxhEFFJeuvZNW5JcAQdMebt
	TmGUGhG/Eeu8d7YSzQqVeTNNHQeo3kiGdYJSdQppLSx2Ug6NVp1AzOx8q7aLRNuZA87m5vdTBFt
	zHfjGBQksI1wOJyE8BFouvbEQjhADbyH/Yix8J/JPfELZJjN0aQxbPC/FjPz2OooeP/P5Jcw==
X-Received: by 2002:a17:907:6d0a:b0:c15:a7b9:2ae1 with SMTP id a640c23a62f3a-c1f8cbc0449mr86006066b.6.1785315960387;
        Wed, 29 Jul 2026 02:06:00 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.24.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83cebf3fsm87314766b.25.2026.07.29.02.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:05:59 -0700 (PDT)
Message-ID: <a661e25a-c889-4c6a-9052-5429d9924030@linaro.org>
Date: Wed, 29 Jul 2026 10:05:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/5] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-4-ae811e2f0799@linaro.org>
 <20260728144448.GA2141274-robh@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260728144448.GA2141274-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 15:44, Rob Herring wrote:
> On Tue, Jul 28, 2026 at 10:35:35AM +0100, Bryan O'Donoghue wrote:
>> The original iommus list included entries for ICP and BPS/IPE S1
>> contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
>> ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
>> CDM IFE. The remaining entries serve other hardware blocks which will
>> be described in their own nodes as support is added.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> What happened to krzk's reviewed-by?
> 
>> ---
>>   .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
>>   1 file changed, 19 insertions(+), 7 deletions(-)

I didn't run `b4 tailers --update` is what.

---
bod
