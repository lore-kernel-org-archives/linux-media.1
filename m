Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919964D7D4D
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849496; cv=none; b=oPEx15YX+FprdkgUtaE30/uY6TPSgLSyruZzTirdJNZtV4IHaKcC4LIKl0FPxAU0qr5TCn8DV1mx8zeUZcCss+s1gNSzG3WjMEpHSLGaAp/aH/YbRqjhNyfRqsQZjt9wNgony9vmDZ04gQHKQt6ZlCN23oqVSKj4xOR8duiT6yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849496; c=relaxed/simple;
	bh=6C565t/VlyoDv3UV6Pv/GK2eTKoZ4N03hIDuBo2UJDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5ytEFEzGM+eYk3A7dNvSaR/2bnoRRs/9vgJJA1YCMPNcHWZW8DOnD9jIdPSXhed0YCMJ2RpjtHiDFyY8QAV+Eo6dnrWaYXhmhSuwBrEqoQ6FEnJITBQdxjVWCR7wo1aWJbLwMQJv8SA0lXJrEjrWMeovICAJ0TDzo1okriVkbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bOMFfnn/; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOMFfnn/"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae3a72e02eso1095478a12.3
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 03:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790849485; x=1791454285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3XG5cy5KBLHekXoy0zdt8qQzO6LEdX5LiupQKnkZIo=;
        b=bOMFfnn/jgcz1WJBEzhyFKMrlGUEYbsuCSbA6r3wTylJd66TyCu5SR5fCkUgQwBOZW
         KCIcufLthnXh9KQfCHlLl6IF1XEBvloeFkmBFXF0LJHMarEOn6JQ6byyvAzMyOShQzQ6
         ZeXpvpF+kCn/QX5M7cdXO+ltiSp50HpNN66qTWqfVzrO1GWLSk6rHIO3ctSgJGFXilPx
         cWJ2a1WagwmIT/r5gmeYZv75Sgf/gADZh2ePg7Gip4Gs5qS3RkeVui5mj57bHcWc1hYD
         tT8Pn0TUhjCu8dEhc4DwmL1JtVVcp4D+xWFtpf2R8SZMySyhumIc59LClekjWdnvLITG
         CLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849485; x=1791454285;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3XG5cy5KBLHekXoy0zdt8qQzO6LEdX5LiupQKnkZIo=;
        b=cPPo5mOPO/oQnsESwmGd11qcXC5mhMRarqPnITa3iKpskpQNT0jelbjNJMu/2k0KAs
         vmYLHCxLoP3q4+66sOA3QnP6LolWNW8eveYXFRYMMvdu/vTm0j+D8HnP0oxjockGb7dh
         30ZXboDnbAh6qGA0Z/+qc4+AFq1K8RmRYwmKXMTK+Xy6QRJWITmMxmBWOiSr8vrQ2xOA
         aiUoopwoBR0S7l23C6K04yDsQOWdJcC8i/YUWaD7pV9la/CEeEIyaAKqKaiaMq4SFHw4
         M9yM2O864N2tGXWSJIOfndFTCuCto9iyhkV3BuuXvv1JACnfiRhSk1Kq8QEoFYxVZ6aW
         Iu7g==
X-Forwarded-Encrypted: i=1; AKwUvBxemXyr33O3jQZnlzr/u7PxGcbKQhMPZK5f5kzfgehL79uRGkp3kXj6A1kHej9ODfBfccZIUKvZ0aCLgA==@vger.kernel.org
X-Gm-Message-State: AFuF++l8Okglbj6eZVCTcRZAHTQWW+aseyTYiDnc3NPrEhH6bbHXMPNE
	pN/s9Xy3F3G0gnRRZKRezw7KALbIaIBoA4+59Ll3ck6q2ygSFIQjSxngJx8SCkEJagc=
X-Gm-Gg: AYBFou2sOl2HTBR6/iUinJ1sJr99JFmzn08/SABdhkZOGDBsO03n74ELEsJeeMONCFM
	se6wGxt9qJg5mq9jLnOYQv+c3vFyHGBkBXQvtem7JCYihch0ShfFoLBoPiAVggSIPFYgSBLYBE1
	3Sk8k9xWO5Kp8ygH2CyVWTtHn06bheGkph6U6REC7Y3wlZFgiCu3L0fx4PY9UGkV+8EVZRyt81C
	JQxRVubHAwNaPAfhTO5P39uyp86LLdLnml15oyb8PbPJ5QAB5JNJz3YOwajj9VU3qsQmO9hB6/7
	qFFWenLpQHeIvctI9z4yq1T2fGVbwqnVfoS0G1jLZCR+K0onmTVb01unpFTyYW6UHLcT2vEXF8c
	7ey4gvWe5PwLXrbIwNPa2cN/csEz+DirtlJxgpGfIecax0n+TRuFVXYkPGJW5XdKcIc1Q2UGDmC
	3tvMXwXCGynmoqKR+vox8MshWR2NfK/9WFGx2PZCMSdIlyeoNewc/EUXmKu0NnZrPcPu8vSQuVc
	gIn2uIDM74=
X-Received: by 2002:a17:906:f587:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c2e23d7e12fmr327647166b.30.1790849484765;
        Thu, 01 Oct 2026 03:11:24 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.14.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e342a24c5sm95689566b.4.2026.10.01.03.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 03:11:24 -0700 (PDT)
Message-ID: <f61f1882-d6a5-46ce-81e3-b84648ecc6d6@linaro.org>
Date: Thu, 1 Oct 2026 11:11:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add qcom,x1p42100-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com>
 <20260930-purwa_camss-v3-1-0fe2a5b11208@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260930-purwa_camss-v3-1-0fe2a5b11208@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/09/2026 07:57, Wenmeng Liu wrote:
> Add bindings for the Camera Subsystem for X1P42100.
> 
> The X1P42100 platform provides:
> - 2 x CSIPHY
> - 3 x TPG
> - 3 x CSID
> - 2 x CSID Lite
> - 1 x IFE
> - 2 x IFE Lite
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

