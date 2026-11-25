Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634268;
	b=OVx3Rrj4NiSu9EYFj96RfRR+12NUjQ9ZkMizSRO4m0ZC7p1ByrXX/Jez2XRe5WUHnXwb
	 wzM9xRJMmRnh8P1FvNx/ycSigaScYSZt1rUn6DrFJFmNNxpTixK7w471xSN+MTPwgyFXl
	 5R+Z8kRuGGUhQrqKBbv/sVPU5eyGu/OMdwPrNEaHztQ/O1m2LypVQgg146gUXp9EAAAjl
	 DEowSZnYJnfK+pSvkU7oqz2wjzhxZ11yYYWPm0C9p2IsvgP27O3CZVMkYxEFY/CUiGqkS
	 TreXoeFbLy1fTLmPDhNvSXxV3sat6L8OLK5FWgV2gzqR720GD1A002o/GEcCvDgAGcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Vn5QeghxKopwgmJC1JLC3ndSunXCU3zxobPFDaZ1R/c=;
	b=JtMzJ21uaJ0I/tehH4RarLaHMpFjBzY9BqrOiD7rW2DV3ToREJu0zt7Gjcb+hCROVyUb
	 2AU1tG3T8izEBFxO6NdAPqfKKDNDt8t9wjhBb2eqGpjUhosMqgLrQgwMVGHqC0CRDTjxo
	 l6/WBJ+UeiJl9geup87fTkUpi4rlM5iJipVsJyxjDoep6Tnqy/qNmzqetAWsk5cl2+j4S
	 U/RMvb6nSS3eN4JxZqXc0nQyOuOkXKYt0Lj5QsQ7oxkGmPYPlf19y4ZR6VMza8h73/EOK
	 1sLlQ2LjiZhdGIsXyJS6wTW5WxzfAr4TPAdzLNlzAejqlh58ktVyWx7xFTxB5k4MqXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="pvBp7/tB";
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7011B606A321
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7011B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pvBp7/tB
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3adf04a55f5so4496891fa.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795634266; x=1796239066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vn5QeghxKopwgmJC1JLC3ndSunXCU3zxobPFDaZ1R/c=;
        b=pvBp7/tBpC1KSjYcZGoQVAbwKtI3KuoTioFuA05nFzjOLfCmy1gzs/om0I2tHfavRB
         yP7wd8NaLh5diwgrRFebK6Gec0OpjEbLbqbesceF8RpBwkYV9NEESDgr/+JaWXAWM2s1
         zVVbYvkYIuVNo5A9UX/5fGyzqXUNmc9Lb1Hr9S+7DhCUDyt2CWeQBUiyxYKxpyFHF4Wo
         WQTxTpKJ+SBZrDtd6LIphmcpAl2g3ThzWu39jZN12bxfiUqskPthYJHrgzTvat5q/EGF
         KDR7VAJshgus3unhbCoE8Uz+i35+I+y0mtw/W0v2K1C8f7LxlLxHUuXzqHT7keskXDdk
         YXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634266; x=1796239066;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vn5QeghxKopwgmJC1JLC3ndSunXCU3zxobPFDaZ1R/c=;
        b=LZmJJ4jQSrCADRBqX+T0OB04W25iTD3J75Cym9tvDw3lb+8lLDZRFY32KaFHo7R+cM
         VI6cbLe8IHn5WiImKEhhjnHNsKXfb0/+K2sdnf+3LftCdtkauREvvfy+8ovXNO66/BXb
         XeLRSBXSGDC7JZQ9x1O2coX1xmKof6lhJASF0Bb5pwJcc4jiZyDwkrlWA26cKqdGZhmC
         cIeZUqnhb8IevtuUAJSIXnAJ/SMU0p6DT/rM7riryv7N3Q2QQRTgzqYCgtY7BMy4yR9O
         kfCJmcHQJzeVX/186/sh+iksj3ujes676J6pBcSJld8a1LasVnIBPo9wW/qyJj9JQkFT
         grsA==
X-Forwarded-Encrypted: i=1; AL+hErHJ4Gfc7DDm3iGdQNRwoDYwpZDV8OM0ewylY9RZQtfuT1e5xsTliCwuDEFWBcMJ0guo4SIAe9UkcKV7UA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+iFrPYLIXRgLSKfxEkvkCoXDAsioPmVXYBRca/u96kuJdikank
	/8HyZbvTusAoaB4M9lfSO+YqhgNe8UrvSWZMbb5LzBkCVn8NXGuuBze3boQZ+chwsU0=
X-Gm-Gg: AZFdTZfR810FcngGMkMWaOYrOiT1Sn0wXHHjdQXBTQ1yDDi96PH70dCsU0pI77hBCW0
	iuqyV7Gs8LxObVh541udoCm8p36lIYCQ6ioARzIsyqQDf9Wlv0e3TK4UtVUbFlVZh19+Zy0ssWG
	HQVbLHLbBMhkNODkO2DBCcPup59e8/qvf4n8jM5zX/WWbW+jaNQX/7f5Q3ScvHnuH9WpmFV4nP2
	AwK9DQ7GBd4xBLzhPjYuxnpxNlJc6jglkkSbyvoVDKWjrnBvB72jlfAeyrLS1W6bU/1j+eLE70Q
	3wYLeyiGPoIxB4CsXee8gEh0fqh4NcgGJVvO7VWFrfWZAWm0tOZZXxMydp1erAtVXt0rn45lJEp
	WOrKgi8pDFOXE1kDaL5/cIQ2geRPchdBHfPGvuarP14W0Q5aP4dzrnebmcBbt6jCz/DJgmDCCd5
	yc6NSQRiUHtEmLt/LcUl85BcAhZOvhQH5+AjA8jy+bO/AgS+9jKTVDuEGk09ou3c6nBUTaetK+4
	Dk+vEZ6nqDVeKPhnyvT9NeA0WxsWbJHilyizfkAEUCj7IsFGV/r5iAA+kH0BWkC1j3NpwALIb0L
	sLVfuqHB8SC9NM/Neh4gfqzSShWPbxLqm15qr0Ibo2WRiKbUh1iUeY3a1OKIF3ONdQRK+wf/p/h
	uqz/zI6A=
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id 2adb3069b0e04-5c1bc785b7amr6416689e87.3.1795634266419;
        Wed, 25 Nov 2026 11:17:46 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80537021sm45702711fa.28.2026.11.25.11.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:17:45 -0800 (PST)
Message-ID: <c88c7906-efab-4956-bb56-cf9ca6734c6e@linaro.org>
Date: Wed, 25 Nov 2026 21:17:45 +0200
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Rob, Krzysztof,

On 10/31/26 13:21, Vladimir Zapolskiy wrote:
> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks.
> Describe their register spaces and the non-real time CAMNOC AXI clock,
> which is required to get TPG output frames passed to VFE.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

that's a gentle reminder to review the change.

A report from Sashiko bot is a false positive, there is no intention to
support the old dt bindings:

* https://lore.kernel.org/all/sashiko-outbox-191924@kernel.org

-- 
Best wishes,
Vladimir
