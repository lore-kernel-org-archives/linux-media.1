Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692204;
	b=HTH3ydY5GsYvXy9us03ncie6/+yKoozu2soKLwlMKq9GD6f+d0SoySiW+fkWFEO5gDhd
	 aaSSUkuGNUw2Dkc2VihwDbbCgdwqE+35bCZvsTnES7h53WOvdn02mEPbly7hIUT/ipQz3
	 89CArKz0sTyxkli5YUDe4OyrQRyxx6df72IyIk4xn8/wBYuVi+VC6qc/Qfjhw4F1sC3nz
	 le9Db5mUT4ZCSb9LTr4hNZUjZ972/QE+j3ahdosqMl0sJPwGx+Q987tw1xTNLoVgABJXk
	 P2elZMLJ3zkWzOxoEJfrhlTaKL/iAi2emq54HJ9P4WvgDGeNfKGUS7vxnK1uL1sS42g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=nkVHTBWGRkEmPj0y0p+bGJ739Ifet0BlvM+VCtljhP0=;
	b=pT9hn3p4YvFYFUCMauxGYxhg5DfE5RYqIylXDBJjPa3GV6nvrJRn+oJmv7N+QyRLSaXF
	 FuH9f2m3fHpxB3gBSsVa4ZylLI3K1nazEDDeUtoYHVBgjNqWrJFPTrXZMO80RiVbJlLJ4
	 GZ8VTQ3BYCm9EgJ7yV02p0vnbuSxSnw4a6D93DGc1oT86yJNzrJqVqzAk9QKsE0+oFwaf
	 6TXvx7wiT4/S89/JDSk7oHZ22R7N/UTN/Y9Ju2ZDyjI/Q85eUI/3GzTmzMsYDkdK7mzbJ
	 tSdlEvX5gIpKiJ5OjIgw8ohJlxbl0mEHfXh0WD8cKeRPlZhuK3Tz2ggRbp/mGsmPvdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lrYSgtMC;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD1F606A695
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 11:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DD1F606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lrYSgtMC
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adf222704dso7660491fa.0
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 03:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795692202; x=1796297002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nkVHTBWGRkEmPj0y0p+bGJ739Ifet0BlvM+VCtljhP0=;
        b=lrYSgtMCrESJBFokuoEjstgT0mV42/g7ywFU2W8mYFTCtK2+ri2Nw5YeyTEfXxzUFz
         uxh78hcP/h6G4FxUzs1L+xG13Y9Eh+8HlWzvc3xanKDMUDfHCsDomSD2R6kBBvormnkv
         pqeUyY0AL39Cw22AksXMAPwAes7vNWB7hxEE+AhrCG+XGTCeMIelkoBRi5bQAQvVoHrZ
         m3T9I3UtIN3KbkNwKlU6p5cMNZ4lqAACgJMl1jeAxQX9yJrYZdktam9OXCguCvZzyQaH
         NBjRs06aWGpKVKlSlGRTAhqk3AvKukeUxZ9JvsJzNrYJEKL9LlS/FW8I2HiiUP4KO2bh
         tCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692202; x=1796297002;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkVHTBWGRkEmPj0y0p+bGJ739Ifet0BlvM+VCtljhP0=;
        b=UQTlgVf8febWUfPPe4q/QF4W5Zi4ZZc20qDbNO0ZbsWC+epvOXrb0VnOGFZqTEd50T
         GOXszylMGhb/95xiWqew4AARuTAWEF2sDCTmNE8L8II64VXpw+8Plkf9WD1OIZTL2Dee
         hbVCtQ8y7+heSdkbohM+S970PZd9I2cht7YWouzBvnBy68vSwU89/W/2cWhn7/lLLRki
         2DhYx0Qrap5n0NHID7btT4/gBDzPgvwrcgpS05IraB/ZP9h2aIZtdxiMdCcAWlbyaD5o
         UTD63mA+JFDnNJj47NBifPKeBReDlcaZ0DJJjgXCjgG68C7g5muVDLv3aK6Qun3aiYsX
         QxPQ==
X-Forwarded-Encrypted: i=1; AL+hErE41POP4Z4PLqDok1AAPQzyiR/mP7cxrStNrgIkDYXJQpW9lKatf1U0UxAaeD7K/k0KM5253pMTKSGKkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9+KSJOg+xO2nRCJJCvK9PA1O8cTjMX64xjl3TDXWhXgeT7MSKP
	zhiWC4RfozeO4ojHEtTfIeVs9MhT1AuUt+W1+N1oipRt0za0rpJYpskRnuxODYKRWq8=
X-Gm-Gg: AZFdTZd2ZwmYiGj/tvQqLIsoSuT54gla7MEKm2qX+aW62quWF293bvRaViZyyCPsGWx
	OzDaNZa/8kKH/cbT3PuvGz86ihpUZxk+9CoMtyqDQM0nZyjTEQWbhNCXH3GDbyOW3uPM+MeiDgM
	QnZ3sDV3uGthS4Sn8QAwxAZHREKq6Mv6xh5MS69p2UR/8pqfUrf/AR8dc39BSD6gnnskE4bSEWy
	XoLUCWZhxObQV9Zr0zKgD/3yKpGSQGQUU3b49zUCT6u4IuqDNzxaHhtnteRwSm+f9rzMeVpSu2F
	i0g6NDlBqxQvOnUN4cfm1bZNAPp1ioVLpXqD3ggLwGSANQMLbXxwGu2YzVnsBjEhkw4xqViEbaR
	pC+ehcUTo5CwvPQDUhgqQo4vOm+MJb6LjK0W9lb8vFwUX1KFeh6GAb/w0rHpjxXE+X8hfU8nh22
	rVvHjehur3OepCdE+vOkq6rWlScqE//Uw06A9Z4HdIbFKj+Jgo1g5056T8cwOuQbfrdJlP5X2JZ
	OOKI+r3mJkd3MoujeWVb+304LFDe9oB7wzO5TYHFaU0x9rMagazBebGsEoiNiy2mVvzcvxbUzlA
	QtTYIMA4xAKPHQdwAwOsnjdDwX42JgLzAVqv36L4V+ZfUrjVYTo06k3wHpEKAK6XcAhlzsaUgUA
	Ij7Phk6Y=
X-Received: by 2002:a05:6512:6313:b0:5c1:ac32:9904 with SMTP id 2adb3069b0e04-5c1bc80e619mr6458406e87.3.1795692201670;
        Thu, 26 Nov 2026 03:23:21 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd077b37sm5089736e87.74.2026.11.26.03.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:23:21 -0800 (PST)
Message-ID: <8a34e083-f364-4eee-9a46-9533647f323a@linaro.org>
Date: Thu, 26 Nov 2026 13:23:20 +0200
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
Subject: Re: [PATCH 1/6] dt-bindings: media: qcom,sm8650-camss: Add test
 pattern generators
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
 <CAFEp6-0Ykn4VNMMAa-WzCDcJ9=Z0x9Vd5e7z8FSNf72gGL7c2Q@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAFEp6-0Ykn4VNMMAa-WzCDcJ9=Z0x9Vd5e7z8FSNf72gGL7c2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Loic.

On 11/26/26 12:52, Loic Poulain wrote:
> On Sat, Oct 31, 2026 at 12:22 PM Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks.
>> Describe their register spaces and the non-real time CAMNOC AXI clock,
>> which is required to get TPG output frames passed to VFE.
> 
> Do you know why TPG support requires the non-RT CAMNOC AXI clock? Does
> the TPG perform any memory accesses?

No, I don't know the details, here it is a simple experimental evidence,
basically TPG works with this clock enabled and does not work without it.

I believe the NRT clock is "cheaper" and good enough for TPG usecase, and
to some extent it is a buffer data copying from some (static?) memory page
sitting inside a TPG IP block, while dealing with PHYs requires more
expensive RT clock.

>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../bindings/media/qcom,sm8650-camss.yaml     | 24 ++++++++++++++-----
>>   1 file changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
>> index 9c8de722601e..50ae30cdcb82 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
>> @@ -17,7 +17,7 @@ properties:
>>       const: qcom,sm8650-camss
>>
>>     reg:
>> -    maxItems: 17
>> +    maxItems: 20
>>
>>     reg-names:
>>       items:
>> @@ -38,9 +38,12 @@ properties:
>>         - const: vfe2
>>         - const: vfe_lite0
>>         - const: vfe_lite1
>> +      - const: tpg0
>> +      - const: tpg1
>> +      - const: tpg2
>>
>>     clocks:
>> -    maxItems: 33
>> +    maxItems: 34
>>
>>     clock-names:
>>       items:
>> @@ -77,6 +80,7 @@ properties:
>>         - const: vfe_lite_ahb
>>         - const: vfe_lite_cphy_rx
>>         - const: vfe_lite_csid
>> +      - const: camnoc_nrt_axi
>>
>>     interrupts:
>>       maxItems: 16
>> @@ -226,7 +230,10 @@ examples:
>>                     <0 0x0ac71000 0 0xf000>,
>>                     <0 0x0ac80000 0 0xf000>,
>>                     <0 0x0accc000 0 0x2000>,
>> -                  <0 0x0acd1000 0 0x2000>;
>> +                  <0 0x0acd1000 0 0x2000>,
>> +                  <0 0x0acf6000 0 0x400>,
>> +                  <0 0x0acf7000 0 0x400>,
>> +                  <0 0x0acf8000 0 0x400>;
>>               reg-names = "csid_wrapper",
>>                           "csid0",
>>                           "csid1",
>> @@ -243,7 +250,10 @@ examples:
>>                           "vfe1",
>>                           "vfe2",
>>                           "vfe_lite0",
>> -                        "vfe_lite1";
>> +                        "vfe_lite1",
>> +                        "tpg0",
>> +                        "tpg1",
>> +                        "tpg2";
>>               clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>>                        <&camcc CAM_CC_CPAS_AHB_CLK>,
>>                        <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
>> @@ -276,7 +286,8 @@ examples:
>>                        <&camcc CAM_CC_IFE_LITE_CLK>,
>>                        <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>>                        <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
>> -                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
>> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>;
>>               clock-names = "camnoc_axi",
>>                             "cpas_ahb",
>>                             "cpas_fast_ahb",
>> @@ -309,7 +320,8 @@ examples:
>>                             "vfe_lite",
>>                             "vfe_lite_ahb",
>>                             "vfe_lite_cphy_rx",
>> -                          "vfe_lite_csid";
>> +                          "vfe_lite_csid",
>> +                          "camnoc_nrt_axi";
>>               interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
>>                            <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
>>                            <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,

-- 
Best wishes,
Vladimir
