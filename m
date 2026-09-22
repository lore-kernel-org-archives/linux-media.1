Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B89A541443
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079344; cv=none; b=NlzMi2/vtXbnoM3r3ovJrhKm+qIT1ct59dmgbQVqHvLPwvrXXYVIcpNLGgWVqiBuAkBXEEu0thfgdHPd5jPKpf3S80V6GQMjeUgAVRRUm4dTtrVAl9XWg6YCVufaXj7uuEytC5XMArs3kjHiiGe/Qnj9MeMH6tEFLg23dAxa/XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079344; c=relaxed/simple;
	bh=T6dJRCGr0tg8CyVITnaV4caTAtiMkYaG9rXKeW1fy/E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kgSE8OP99cTeQcWH4IwdoHsM2RR67lmVMnY1xkBRrNLUN1f+BaLuEgrX/Fg2gjLvAbu93963bMXuo/HHhEwYBD8a92Hu7mxVyOgpD62dgAv7N0JtAa3SgGMVYsyaOZ/sfzEybjt9Si+mJ6oIwq+xbCVYAz1y+XYlLDK8CvA3NuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gn34GsXr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gn34GsXr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so28142175e9.3
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 05:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790079340; x=1790684140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6o4kVB7SdHxVgXCadG4g08z3sTOxxFvqJY26n9s0pM=;
        b=Gn34GsXrBVO8f2Xeu+bkc2ESjW0C/nNTs7JQa83zBUWOyd4Ny+1jm7N893xcEYl4sV
         DB75wCfxrUVV7QgE3oRdLwLCeUob61i9YHTvTfjI73yNPywD50ziMiSSXAv2mM0XJBsp
         WW3atJb7WUixWizH0HQvqdQkFQ2z/iLtJidX1qrJdUQ0z+DjSBbcmYGbPQumLWEUrnrJ
         qYI+JJF3arxSDhp0tBwqZl7f6l8emrAKXNGw44Mp1ePNVmUgas/AJJafzfcZuRgNSHg9
         YoF1AChFUUXPG6T4Q/syLm493aCodZWW0fTqjqD7cAaNRbzKd2Z9Y/Z7BRKHnYW/jjV/
         WyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079340; x=1790684140;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6o4kVB7SdHxVgXCadG4g08z3sTOxxFvqJY26n9s0pM=;
        b=z8VuED+yAHwgQQbCldokiz5+QefwqKfzeXOjnOUTz5b/CvZlAwBW5pabeKg1wQxGeK
         6I5MwFnWjXrdjHLf3x8wFrfT81PuOwj2Mpx0a1urGwhbuEDmdrWbRlUwdZkvFU/2MzNv
         I1LHQsEYGAjIUVT4bcQr/rNP3wd4Y2Cx6S8/ly0lPCvfAGYJXQXkCiJ8L/a2SXYfTFP6
         M58VpUwAqeTirZy3rIAb04FbT9fbFsfD73n9WnJ7NVDsnO50DlM2Fw3qDIEtOJ+D8PQx
         xNwErHIeqcZ6tXijb2UkkAi2kxURSBswi4VeX6UGXDx4dHnffnZhww5GuAUm92BHB04x
         b94A==
X-Forwarded-Encrypted: i=1; AKwUvBwHGcFjj3IB8/ws8JHt3Ga4aLccc/LbqTdfjy13VKsHzuvl1HHQZN08j/pHNW4YlPbud2/lDSIgU13Mhw==@vger.kernel.org
X-Gm-Message-State: AFuF++mvPGFDUnMm8AEqwQiz9ybelPzgrnCf7T6YRGVfxbeoUM9vWMdp
	MGogdKf5DOtv4At3qN0hZehGkmkPWplP99KOsUsQ97xInQSOUda4YsV2tFYe1Yaie7Y=
X-Gm-Gg: AYBFou2qpvCaW/2+Y2ptP3Zm12IolP2LvBxtO5ZhH3rt2sdPtnXVeGni2J4uXTpgCga
	Q4UyQlqtwPR1vMmZM3nwqA3MhZW3fmPQqQ1pm7yG7pgNpZ7icsZN5EJCxj9mXcvfEp6o/+4p6FL
	OViCapXa4SJ0SAXAJmcn+DLSStTiProQ7cMx+CWup7pAUBmKATeu5gYSWKQfGIrln9tGOihtwIl
	5RvoCXv6yquNJObI1ePwn4TWGTgI2g2mCKT37OU4jEVKYTdPHTgMmTGmnj9c4KS0RR5VXIej2QJ
	cbaMgMXqy/BiuH4g1IXLAEgIznJ8d0YANJWNRQOl8YgCfiwL4GVTxq/gCQv6t64U/pIHLLHL06n
	XkeuGXhSE1ZNRnIWCs5OGG2dFnJWseOGEp7ytl6G32lhD8srYUbwBH05FulVMO2waEsxdKiWP9G
	bHZI9ftsdaHo5fmtUKyw2D6gNGPMRyfo2Ju+Z0Kb9BYMwFMJz0tlY6+gwcCT5liOMfTTr2/kQFI
	pH/vsFulG0Of4P75xS1ML9i7GCPArwo2M+bWWEQas95rb5xeC00KJo=
X-Received: by 2002:a05:600c:138c:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fc56ef0cbmr194687665e9.14.1790079340130;
        Tue, 22 Sep 2026 05:15:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ddd0:8cc7:9887:fa82? ([2a01:e0a:106d:1080:ddd0:8cc7:9887:fa82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad29ee8sm46774625e9.4.2026.09.22.05.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:15:39 -0700 (PDT)
Message-ID: <749294f5-9640-46a8-990e-b59abe9cb9d3@linaro.org>
Date: Tue, 22 Sep 2026 14:15:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v18 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org>
 <20260917-x1e-csi2-phy-v18-2-6515b5255fa9@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260917-x1e-csi2-phy-v18-2-6515b5255fa9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 01:58, Bryan O'Donoghue wrote:
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
> 
> The following devices are supported in this drop:
> "qcom,x1e80100-csi2-phy"
> 
> In-line with other PHY drivers the process node is included in the name.
> Data-lane and clock lane positioning and polarity selection via newly
> amended struct phy_configure_opts_mipi_dphy{} is supported.
> 
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now only
> DPHY is supported.
> 
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
> 
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
> 
> The PHY sequences and a lot of the logic that goes with them are well
> proven in CAMSS and mature so the main thing to watch out for here is how
> to get the right sequencing of regulators, clocks and register-writes.
> 
> The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   MAINTAINERS                                        |  10 +
>   drivers/phy/qualcomm/Kconfig                       |  15 +
>   drivers/phy/qualcomm/Makefile                      |   5 +
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 385 +++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 463 +++++++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  97 +++++
>   6 files changed, 975 insertions(+)
> 

LGTM

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
