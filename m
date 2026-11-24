Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514219;
	b=GICbZGaKyC+NetF9oztEp20Lua1crXvgD5MoIktxeoBsHDlgql8qtLq7LZGCBjvcunPQ
	 oyF9uXDUZeelkEPAwOcfWwp/FEveA8v2mFEJ088j2qbIG0CcIq3ROdHowZgylzCd0Z2BI
	 clS3BZQDw4v+50oeM57nCNtSl14PhYwUISryEc5Qlhc5ryQS1wxpDM3z3ab7EdD2MKA7w
	 0cCRDjJsJWyw3a/l+B1th9nzjjFoJsCs46TnnndE+q19H4NBRi16azcnHbeGttmFvm19/
	 43E+8Rc1b4mjljhS7QxJXTf2tjQn2FIT4gEbmPV2mpzuA6AMGjbC4rW+svNzXfJ56pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Z7ixIHGB/x6muOCf12bPPxl1sG73TY3AqjMKZ2p7Iqw=;
	b=aRjr0/03da4G8OJNc39ge+HSFtLzwd+trNce3/2xkLUlZxwXHPCu+DQI+bCHR560PLJi
	 nSG42YiDKI8LG1rFDPZfDiR1DJCWM6sFumSvwsrApjRBvOBtBF5B0cZeLiKnv/Me0slIl
	 9pEJASopHXUUcK6ngxN3O5EWQyu4FS4mYBEa7m0O29eVIaSfu0dszMeJ9DZVjt8kmfdTS
	 ZBB8nlmjlRNaq6BnMVpkgJ+uUMBC3RIJzgeNjA8yjy97mX23k9U+eOrtfUpNcq3HdylAu
	 CF824EHubCpkPRWu0pLVFCjkXRwQP/6KmQVgb9OXGU4UgaV8b++BsskESEdHsUnmq9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fmCLP9gt;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56605606A31E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 09:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56605606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fmCLP9gt
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c0ea47f5b8so455917e87.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 01:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795514217; x=1796119017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z7ixIHGB/x6muOCf12bPPxl1sG73TY3AqjMKZ2p7Iqw=;
        b=fmCLP9gtyFynzPpKhVinxN3fvX0HMhPJbqD1her/p9bj1TkyZMQ3CUW2x1K2iN6Q6x
         wZ4W5yjzxqt3fzPs1oofjP/eOC6ezr++bplcBpOLgydsEwa/ibvh5ZgR4ciR1XPO9Nun
         tJP8gaFyKB3uXo1JAq1nJVoyQ3d6zu2DJFMcAnm9FOJt6bYNI5jAISAfNXrcQZLMqqbS
         XbcOsFJ/qBdpwrj8ya6lkp1s4F/MKwr8F9x6FTOxCEkFzlQMc66c57dzu5b4dZXrAyqU
         sjyN/lSUSN7rV1QbdPFM53mzZAdsRIXj0FmSSgxsnNdCJIdXXBRN5ZSI4uvoC3MJhezY
         xrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514218; x=1796119018;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7ixIHGB/x6muOCf12bPPxl1sG73TY3AqjMKZ2p7Iqw=;
        b=eNGCbz+Xh+enNln4QFNPyg/gEAwq7Y6+5ChX8uS7JBakhKfJekjSeXnAITX1SZnNvo
         EeF/m0nCiHthLEJpZZX3/onpWqztzBlKO8T3fVJGvqL0AtkfTMJmYifz4SmSS3L2EA98
         G9qDd65kk/I8PPlWGnit3ZxwLuC4R3nh5Y9eV6HHa///J72ctJh2Z6H5HkFCzZanHaw1
         WsUXCvnpYfg/rlQ0p3ip72krWqy+4qka9MjHjDWmD88cmxRFr9y69K9zmL+FjXIP90uA
         dzsyVLFvsp3G608gP4Jb8DX22iM1oG4cbOTE5quPnZCpE1rLKIPMNJo8zaEFJkRy/KSG
         PHig==
X-Forwarded-Encrypted: i=1; AL+hErGPpk3GvXJYyXpViQBiXo9dQVDH3eSZU+5o1Q//QLf53XmIEgK7OxoN8H0qrPYKE9Nn1IcD03t7ZL5v8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zbXT3bTeg53KU+81eKXb8HYt1Lr0c8OhhkGa+kCRIDV9JjlNK
	1YelruEpNDsl40Huu+veCdpSLGFunaPl3RnfT/0vyc4T+74EIu3OhOFplnRcNPcIqgc=
X-Gm-Gg: AZFdTZch92IMD0CWbKGEhgiV01vZ69kR2cRQitY/99LjC8QzJYKYlbdChUOVuyBJfRj
	unKM1/H33UN/QrLvfoHfEyhkHbnD9zEYWahwlz6KLySWsvpsdesunqWjbeJWRN99msNhElZGFkb
	+Wfd1RKeBYrW7zkrwaD7avuxTSDYoByCMu9MSeb8d6pYJ4/nTX3+/Mxk35lTPyzYOoSPDIs/q/L
	BZ/w83IqeeUmbcx3nJRqMPaLHNLFbPmmu4kfSypgTjBZhOjx5wkPW/GQMyIT/W3JbfVCDHTKQhi
	ixmiulPUcs/W+OBAYGGA2suz1rqeN1L8lGvL7Zd01Y0gK3n+/zZSejEkT4aKRIuZSMo+eS9XORr
	tbr0wyHmT+UNwbyq1+h0/u4/ztRP+x4mdLBcDpTTIIiDX+k020xHXWOuXJiVa7WkmNb3ulsTKmL
	vF1g7yeD6bW/liVi6hugxTcnhSU5fUlVdDQbkIlUSwIFnaqvE9RoUY8kEV4HG1w6nzyK21IgB+u
	nztLbu0Y5R3EP43N6AIwH1k+JmyhFfCHXPhazt8AG44w4/FkPECV0dHJR6NdNjQnAyAm8WxcpdR
	ZG3D+vPEvXUF23ThEi3caHWkn1D+RTE/IQf146o+L4J/YwMZYKhszIxtO7268gYpdVSt4T55uX5
	6NQRG4lw=
X-Received: by 2002:a05:6512:b88:b0:5c1:5488:f57d with SMTP id 2adb3069b0e04-5c1bc85b735mr5132306e87.4.1795514217327;
        Tue, 24 Nov 2026 01:56:57 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff86c4sm3570448e87.22.2026.11.24.01.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:56:57 -0800 (PST)
Message-ID: <da038528-5b25-4956-a14f-1827ffe2eef8@linaro.org>
Date: Tue, 24 Nov 2026 11:56:44 +0200
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
Subject: Re: [PATCH v3 2/7] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Andrew Gigena <mail@andrewgigena.dev>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-2-0103e8a0bbcd@andrewgigena.dev>
 <21be3761-9da9-48c6-aaa1-b56f8625167a@linaro.org>
 <ab79818e-4b4c-4b58-bd2f-57d9ae4cddc3@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ab79818e-4b4c-4b58-bd2f-57d9ae4cddc3@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew.

On 11/11/26 01:46, Andrew Gigena wrote:
> Hi Vladimir,
> 
>> That's an intermix of names, and you will get a review comment from
>> Krzysztof about it, I stand aside.
>>
>> Here too.
> 
> Krzysztof did comment. I kept the vfe0/csid0/vfe1/csid1 order from
> sc8280xp-camss.yaml in reg-names and interrupt-names, and asked him if
> he prefers another grouping.

Exactly.

>> Drop 'gcc_axi_sf'.
> 
> Downstream sm8150-camera.dtsi feeds GCC_CAMERA_SF_AXI_CLK to CPAS and
> x1e80100-camss.yaml has gcc_axi_sf, so it is used. Can you explain why it
> should go?

There is no CPAS in the upstream CAMSS stack, and it makes it irrelevant,
that's why I asked to remove it.

I believe one day CPAS will be modelled as a separate device tree node and
device driver, then it gets its SF AXI clock.

>> Drop 'cam_' prefix and 'cam_sf_0_mnoc' also.
> 
> Prefix dropped. I kept sf_0_mnoc because SM8150 has a CAMNOC SF path.
> Should I remove it too?
> 

Yes, please remove the interconnect, it adds nothing for upstream, and
I believe your tests will show that the image streaming is not broken,
if there is no 'cam_sf_0_mnoc'.

>> Or C-PHY, right?..
>> In fact you shall drop bus-type from here, because the link between
>> CAMSS and PHY's output is not a CSI-2 bus, it makes it inapplicable.
> 
> Agreed, bus-type is gone from the CAMSS ports. It only exists on the PHY
> sensor input now.
> 

Thank you so much for working on SM8150 CAMSS support, will be glad to
review the next version of the changes.

-- 
Best wishes,
Vladimir
