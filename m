Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721753;
	b=aauyAXRvYvM4LKashYoA/ov8YtQPk/HS4PCFjbcy0Ifcx62xobC7t7izhUVIiKhhj0av
	 6COlFuGfCkRKKyovqXOkseelFC/JBOxbisowTPbG3sxuhGHkm+9WIeSG+2NL6fcx4kUus
	 cAOsf0pGiz4Za/GIpnVxZUsTOg1d6p3s19dCVNbsrZh0NbxtJpJqXJGQsik6vH70tb6gX
	 sK2dfCGQmg1wDcHH6QMPE7M1kfIFw2kw6hTVFGdctiPIM2nn0/8U6gNA3LCgltVBBBf+p
	 w33O6Eadz24UM6bDrq2GIXNhvHiFa/LB9i76ff+x9CguPO/IoAQVHBLm93tS+igqJZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AJyEzxnFilSuKrupjSrd3QaNv2TToCy8Tn714k4Frwo=;
	b=GZIAXkuEGh5CVNQKVMffW7ZQc79jKbSmACCpi9ZYZ4bC8GHeiJwDdGGodFTGo8xk1tTO
	 jbKWWQoV+Q7IuR5XI2rIq79d9DDZZJHNsltEBonKPFGp5LxL15hPf590YT+fLu8E1hx6P
	 HXSHm3ylTEBRqrPkGITpoV211VsDvGUByt8OTUYoCiwvHJB0G6JS1UjwAUEOEh/cn5MD+
	 bpijF3g+R34fxNvZKSOnIZU40GP7+4bQ0LR2OMlu6kYJcjswTtBSYy2DGGUB/Bl1+N0yB
	 sxMPnxHIuiB++9VBmbLS+fHGjksNoBbZdAtCXu/j5cXwAKNE/1pzUbrRRxv+s6stQRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N6bPXlOe;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF5606A31E
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 02:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98FF5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N6bPXlOe
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so1563405e9.1
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 19:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792721751; x=1793326551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJyEzxnFilSuKrupjSrd3QaNv2TToCy8Tn714k4Frwo=;
        b=N6bPXlOeCto0Xw2q8GWbXShiK73KSeIs2hmlz4VTfcv3cAbpYobZAt88gMpOm2lBHw
         M2WfJeRF6ZYKReLfipIpDUfAnbhsUsv8J2oQW7l1iK/5BFKX5UR9US08NB2EImhYxU01
         2LYE468fIOMwkAgcUbeK18A0/ZLhnrOFo2PLaGYrpw2YgPiNsFcqPE7KgYGeV83cPrxD
         FpIW5fQs9yEITiLjip/HEMToKsJMw1h4sWvnRhwc4bj0nGYObUyUW9BKyBpxz/jbhbZQ
         KB5f10X3NGyq3jXPSCbI6gkZJLGk3MRSi/OUtQCBoCmZigi6eBIaVazUcUv/Q2qG5inq
         g0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792721751; x=1793326551;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJyEzxnFilSuKrupjSrd3QaNv2TToCy8Tn714k4Frwo=;
        b=LIgEtRLAWIDbXy0LmvxD35PFe9g5ZD4xV1deVEl5Y8CPf83lTiNrzYTJyBZmgEXUDD
         oZt8KHkbNPKuBNTg5d84Uw2iI0UeI3By+vBBvDOfTyTzsNMafLLDUOgqv7/nHBeGyxSj
         lOn3JFTMLu46I2NtwuIdxAUdq+Veou2LHA4XztuRy8dlpB9XD2cd+PjGfJ3bTSnta6uT
         tuIAMECe3hLH5t7p5VLUik62sYhtuU3Ii2Cttp3gWH0wRC43s1e06qmYNSqseLv4f7QA
         jCmePOq/oUwRJYb0sTQmOWRWM0f7cLY4iZROywXbh5ULQKwvbfhmoe0sT1UxRp/ZapNA
         hCgw==
X-Forwarded-Encrypted: i=1; AKwUvBykN0f1WYPLs0CgDzSZOTd3g+qKEAemh9zEsVHi66fqDRJl2uz4KubHUfYUeugm2K8/4URXgmp0AgXtow==@vger.kernel.org
X-Gm-Message-State: AFq9FYI/3sYzD5QHHJLbKHH5pxEOHuDmjTxPlzT1q+xrbuMr6sybQMYr
	3JIw/6nxFXN6Kq0nGMWH6CHiRtB1YUntyebkRgdh0qWDSc/eiSjuIWp2tVwQjR8iag0=
X-Gm-Gg: AYBFou2F9xdaIbR1NW54zvn9eivTrhVepNLjpbSoJ7tGu4J61VhD0B2umgEJjJDsnaJ
	hJPQo2wfp+w8yCVgoWG6DuAK0hrNNdf8us2v1v6e8kytnMCLWqsGY8ZZoIyMLrc6MduGAmh/a1J
	rJh7jKbdlm2gtvFCj+PK/nVElKjMf5/VeucnFT/YDeEdmv7BJxPLzGyBne4Mb3q4h2Q71XoWyZN
	7fggkzFHzRtctK+Cj0THWrkN7Sgv4WwJfMunKBti/m8m//jSay64nY2sof45Uj/28W8zTopH9cP
	dnLPDNpqLQrwH9RmNtOg5kszp0EQicxDiTOw3NpHGVKLHTZxSOeFinx3krzjNXtc6PeFNIia7Bj
	DGy/k2XGRg1k8BSRWQ27UxLB1586OEgDZffCu6nNMLxCkMnrpvnvEW8DSpJZ+csZ/WKFoo/k4Yf
	rqi+edn0WD9+dl5TUU3H5njuoGczZAaNSYcLyKpwj90hVv9tS7VWqA2Thw1OAQ7vG1lPOV2SBXi
	lZeiS3VYKU/gf4YvJv2soweFJIhcBzQpczSzl1EtIHWM+FzorZ4NWkwo6PwTDZYtnk0N1EfMPsE
	U74HwjtR093L
X-Received: by 2002:a05:600c:19ca:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a211c65f14mr11839735e9.10.1792721750941;
        Thu, 22 Oct 2026 19:15:50 -0700 (PDT)
Received: from [192.168.0.167] ([51.37.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21034b3d0sm47718525e9.3.2026.10.22.19.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 19:15:50 -0700 (PDT)
Message-ID: <e3d322a0-43d5-4369-bd09-128152f4b233@linaro.org>
Date: Fri, 23 Oct 2026 03:15:48 +0100
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
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/10/2026 01:33, Anusha Arun Nandi wrote:
>>> +    if (!cfg || !lanes)
>>> +        return -EINVAL;
>> Lanes must be a multiple of three to be valid, at least for your three
>> submissions to be logically consistent, this statement must be so.
>>
> I will update the name of lanes to data_lanes in
> phy_configure_opts_mipi_cphy struct.
> I will add more sanity checks for data_lanes > 3, as C-PHY supports 3
> data lanes only.

Sorry the only thing weirder than arguing with other people on the 
internet is arguing with yourself.

I argued myself down from this.

=>

One CPHY lane is 3 three wires. So data-lanes = <1> means three wire 
that only the PHY driver understands.

We communicate in lanes not in pads. There is no meaningful way to 
specify pads in DT - only lanes.

Which means lanes - I think we should follow what struct phy_mipi_dphy 
already models for us:

/**
  * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
  *
  * This structure is used to represent the configuration state of a
  * MIPI D-PHY phy.
  */
struct phy_configure_opts_mipi_dphy {

         /**
          * @lanes:
          *
          * Number of active, consecutive, data lanes, starting from
          * lane 0, used for the transmissions.
          */
         unsigned char           lanes;
};

For example in DPHY lane == "two pads on the SoC" so for us in CPHY mode 
lane == "three pads on the SoC", there's no need to deviate from that.

The CSID needs to know the symbol rate - so that it can vote on the 
appropriate NOC/CamNOC clocks/rails but... does the PHY driver itself 
need to know that ? It does not, symbol_rate is not required in this 
struct no more than it is in DPHY.

Sample principle.

So _really_ thinking about this I suggest

- Following the DPHY example
- Including all of the CPHY specific timings
   The ones you posted, plus the few I found missing
   Any other relevant CPHY timings we may have missed
- Include the helper functions in drivers/phy/phy-core-mipi-cphy.c
   IMO we should use defines not hard-coded constants for the
   specification of the timings here, unlike the DPHY code

---
bod
