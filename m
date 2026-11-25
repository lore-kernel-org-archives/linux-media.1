Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616252;
	b=Liw+kH0TOi2PaN0PVKSe9KFbPqudtmonW5dCLeWh+uMYgLEKRm+vergT9xsHjwxN0FAi
	 0cyWUX0Bgmq886yrw/3vLge5BP7p/4Ky4uqFj7aNQ5Qlvjmd0/WLSPYkyIsa7bXkjd7mQ
	 I1fjavE8GdX6Hvjt05N20VZ5ZxXFfiS0E0kgyj91hNSrRHwKoibMQ100FB3DroHZB+79k
	 hHLbJ59d0fhQSxUuqIVyWGNmiKk1H2naZ4NvQQZA55FVyIn5Flw9jTWWeMGZ/ZeN5lj/Q
	 7RopzMCrFk9p0iNrtF6xIiKyb2HeFQebWk+Jpat6UYgi/2LRn94J6wTP/ZfuNhicjBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aAjT/juoIc9zz5suBwAKIoZ37zYZ6TKZoBm98/nn904=;
	b=375tUzAja0rYfd2S1VPY0zR3Hlf3qu1P3ooRJDEBJeQABTtZq0ZSb5VxNd7HtaX3nW+q
	 k/rSECO9gst1+QTuQ7L3OOhqhFRTdZJkfrii52pZSM05+VaHyRM5Arfddf4qsR2GYNDLy
	 Y4OtF7B3lcwfCh64L8JF6GZvBhyk4Y6SwNv6uxje34DNnsf18eB4+Tw5AZS7fAthn3Myp
	 ezrlVqHU7F0BbSjdvp16yMvIIf7LiwojsgBpVBhvqetKfIesdvleeiK+OEjwdoN9ZfmTA
	 C1CcGvOVcZHG5vutY5xySw7n/Wa8fe12z4zPBTogb3MFd04Zq4a0U2QYVUe0F4pauCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A1uGbcBK;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F92606A321
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 14:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34F92606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A1uGbcBK
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3adf04a55f5so4142431fa.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616249; x=1796221049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aAjT/juoIc9zz5suBwAKIoZ37zYZ6TKZoBm98/nn904=;
        b=A1uGbcBKfncw0Tc0tLr4lyu6d9hbYldzQ35IkDT/oie+1W9Oj7OT/fRppeExQukyJX
         i6DBLiUHi782agsruQuGjA0zcuVTluaD4d95YNsXDOIY62phyVNZIZzGpg82u5r9TBTL
         KP5Evba48Ci3NeR5K4gC5Uo3yVTh53n/yPMCAOudo/k3OR2XuCO5snmihk21L2FljI41
         0267N09LyKKKG7mcN2RHMuSjHGZu2U6xwNZnP9qKjd0uVbBnDo/sDu5pII8SHH9DCC2j
         WMIS/qGAl0H+vQPvMGsMHjv4INCcwDqN1xDPefrteQIKQutbbRcoOa3ky4Wz8GjXsAph
         mzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616249; x=1796221049;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAjT/juoIc9zz5suBwAKIoZ37zYZ6TKZoBm98/nn904=;
        b=ErJIhrruPw0ri2pT7O5zmW26z7TAgVdtslaIZ5dVWIrTc0NAKmYHiJcm4dfZVYWjVb
         Xv5DW9mUX2RdCVD/5FqGxLPKIr3v7QDds/eDZ6Q7WxQjXXdR4IaPAgwqiJjmdciVJu6U
         S8TaFXlzYA+au2l5zLfjFVtncFuj4hiebIngtZTvlB9X35rmJYXHw66kV36imVJ6sG9O
         r6QGL703UH9AFoSojBLsF8pp4Jil3LtE3lTlR6ML9Z93Xl92cdk7yVvDMX+aTpZn6CDq
         wwYdm5ViMjLpU1nzqZJcTXqc9X6mUtL1S8sDTQfVI/PkFQRj24OQH2gWFFhdxTWs29rW
         fg/A==
X-Forwarded-Encrypted: i=1; AL+hErEOdQmEx6NfGh9pO4fvlR2J6HSJn4jQmlGnJngcX0coSWrXzfheqxGSnThs+1CtVUBHAi9Ho/YqikY4YQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/S1AGXZiIF68skWe+mWwr6Ujf8VXgadwPGhceVvoarAfK/LWAi
	fWu4uf4EH86OL6HceptVBfxQGWvwG4aG8GiMoFLMiy/QUViXSLOXmoGpSQQ16E/tHiM=
X-Gm-Gg: AZFdTZfzwHxCkUwz1j5jiJ6gWx0f574iX2KntX+QB+PKF3WupyEvMAUFy6kFZzPHELb
	WD+JUzF5jYQysc2cffDyjmvs4TFPuKz7jHPEkjh8VUXjUXDtInVqfZSDYBGsZPpne4ePzf75i+9
	saWjKnjUDP4wM3DWDYWtdvC5G1umTyM/wORX5ZMyypFTrgL87Ea/2rT8wsHinZbX+E3GIu0NBPw
	n5LjXslE2TI64IlXy7Uz8T5UauBEtsXfBpG+jfV9cYi2PdLu0a3JuTe01hvJME5v4NiKk2Xyn9g
	wF5sbQtvHuEiu3yP6uFh5+TsX7Cmwk4GbwnqLpzBhX+4ebbz6c51AdBE75lPt2iNhFxmjUo8Vs1
	xtv4o0GMmrrcpZvOo6NrH/dUwRjshn2CU2WGextG3ZQar5Mi8bDyBBBmkuBBRNIG1e42kEkkRjy
	g7vaoh4ag29ab14BOLzx1vOkoGOXdMJH3gt3+E5hf4gdrkgWFdcSY1rgWpwcqBzlBtJZdF14Vc9
	AdIZCtLa7C9PrZHoK63WFxx2wmKc3GREsmBsBcy83OtP+5okbvTxWxq2Y+/hOvhql5/n4RL3IKN
	35CHt9s5Znx3aKGqTlmUbfjMdfpV9kbNoJliCMS4fBdsrFZF/HGCjoiZAoVhnjGYSNlaN7ihW8Q
	Szx10tQI=
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id 2adb3069b0e04-5c1bc785b7amr6120129e87.3.1795616249240;
        Wed, 25 Nov 2026 06:17:29 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff993csm4633339e87.23.2026.11.25.06.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:17:28 -0800 (PST)
Message-ID: <a1b367f1-a65b-437c-a9b7-92b29750597b@linaro.org>
Date: Wed, 25 Nov 2026 16:17:27 +0200
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
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
 <a2010032-8750-4289-b443-3afb57d656e6@linaro.org>
In-Reply-To: <a2010032-8750-4289-b443-3afb57d656e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nihal.

On 11/25/26 15:28, Vladimir Zapolskiy wrote:
> Hi Nihal.
> 
> On 9/25/26 08:48, Nihal Kumar Gupta wrote:
>> Glymur's camera subsystem hardware is a functional subset of X1E80100.
>> TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
>> three CSIPHY instances versus X1E80100's four.
>>
>> qcom,x1e80100-camss is not used as a fallback compatible since it is
>> already claimed by its own binding schema, causing a duplicate
>> compatible warning in the DT schema checker.
> 
> This sounds like the DT binding documentation shall be fixed instead.
> 
> It makes no sense to add a large number of new compatibles to the driver
> code.
> 

Please ignore this my comment, I believe it will be simpler to move
forward with the current code. Sorry for the noise.

>>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>>    drivers/media/platform/qcom/camss/camss.c | 1 +
>>    1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
>>    	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>>    	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>>    	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
>> +	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>>    	{ }
>>    };
>>    
>>
> 

-- 
Best wishes,
Vladimir
