Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8A051DDF8
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167693; cv=none; b=GZdE0Xk2/uHDQxU/c4OYwxFFNixyh9Y6GnTygIK5ZJl58q41sB+k9JTjWZHCf2b5GtgcfATt1ZrxLFhyk8yW2p8fqkmGjbwY18aqKZ2K4RbJk8EAeSmhsgH173vmjcfJgcAWVrHWf+SrsxRl+CHUv2qOdNr5cLZx8oh5NpO+Sis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167693; c=relaxed/simple;
	bh=IY2o/9Zd0FHMEWHyc0k2wv+f7cAv88OH6tphokM1gso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nrp93s5LV8Cjs38P3zKxWpmnJqge+Ytw9hcBbHUgHATXH2x3VXeVjm6RXD14TREu3pmyC8CeQ10A2yhKwuiC1/WYSVvyuUnX2IDCT8mDrs8j18PpQKcsa3oNGPNZsJKXUA8N+TaovPNI2b4fY9SxRW8cYEB7z7liNWFPb/9xhm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Comt8vul; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Comt8vul"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so138927966b.0
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790167690; x=1790772490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SLuek/JnZcrHdEol8bs1CY5iS+EZUcbu/8zASCIc9oo=;
        b=Comt8vulNJSzEfrWtzbQpLlA2WLwL8E+hI/7Vxzy3p4qTVogQ1pMHK3q45X/Z61pPp
         gqB11bctP7gzA1H3LeZkx1Y9pxRxY5uRYkFFzrXuwGh262uxJwVODHKrIHxLLD6eXzNr
         EBGweZBmTallHSNSkyXwmZ++huUu2d/M1+HLC9XV8ZJDOXl8bqDJAySM4Gic1sGMo4YS
         EnOLKW8fyl7FPVh0a/WB6HIGXUJpg++K+dW9d11yOpr/WFBsMx0EJMJRAsrHAkqBMKQZ
         zsVbaTKzO+KfJ3NRwpiWJrYbwQbPH9GPt8Y8bG45XLZI/3t+OH97yDCNewuxB0lBL+TX
         hTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167690; x=1790772490;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SLuek/JnZcrHdEol8bs1CY5iS+EZUcbu/8zASCIc9oo=;
        b=BuvGMTVhM4rxNkgh5pz4UnJVzxjSMLIFf0+2LCLilODULUar+mEKVwT+vBK6/5khr+
         wRJJmAMwD7MnGJMTry5blgv+irfrhrb8TPUTmXxTPVR6Ojge1XpSZpQySlLl1DdVHu4M
         cCDa2Lzw18Xw0D6zz4gb7p4snX2t2cz2pHZZzsXHTT49EZ61ArnCgh3x9nKrGw7hDJ+k
         PE8vHcIkElmZxqhf6VFMgkTGh8SlUcRyuG+rl4PfyFp8WtsXIIKiOZb8EnpwQWKxSHCt
         E4KR8Ax74DmtikxTKXrejY/2XYojq0BxuqGeS9g8Tz3sivfO9r3ScmB2KafiEnYAmIpR
         dITA==
X-Forwarded-Encrypted: i=1; AKwUvBxzrt2JOFD7rCCzU1WDwSX67RFhDY4hH1Wbq7TBGRjZMJw51Z53/tRelFWWfd6dY1OU/7HoTdcKCYyVtg==@vger.kernel.org
X-Gm-Message-State: AFuF++m705FDOTQaFb2hxOp1JEi0TCXsRmj0Y/15g4tVPqgRxglXa/CZ
	i8pnYr5HPH/50n/h4NrlU3Hge6uSmm6XP43dPXRfFlwOBSrp4bgbr09HWrY7dJp7lrs=
X-Gm-Gg: AYBFou2kmvzXFxKXlc96SkjBiNyppQplI0VbIVS0SNp6UY3d4pNQpdw5CxLQM54L+GE
	83mxYNEiygjf5AETlxUa87znL5NCpK6vpUeWqcVZtVaE33NmJ5fDIVoaW+BYLHKXeH6CCpOsSlH
	coSEx5yhLy0rEmRQz8RKEhEm5WvE798Q4HkoNuqFcTFN4zwYTT6FoyKfn602+JbNRVDZUIn/SOb
	kYxv8cBTXzEu5G/nBJggV/wYZP7X/ClakPlnpIrENaxE+WdwF9xDIR1gYPJcbumx3EQ0Rz2v6+u
	Yck9WCEAOnkmdPWFV8ZwHjSthCy170PlKDIsTObhoKz8QaT3fHZI7Ntx4lyA3UQ+tuFD1mVVcGm
	oPMoI8mXjwM5IVxi5MQy1l1qg5/zczhzmwerY73rTThJx2dqMEATvL90DyYBRVEuHHmS1TN26Y0
	wwSW0ZC5qk8mg58INWGVDQZjtxAya5w8y8QxiGzcmBT4cR5qHSFhrGbt0msAdipeFCUHdGnDoSt
	gWoCNAfYSxUY8sKe/GV
X-Received: by 2002:a17:906:9fd2:b0:c29:f5d5:5aa6 with SMTP id a640c23a62f3a-c2aae2b6a2amr198058466b.48.1790167690003;
        Wed, 23 Sep 2026 05:48:10 -0700 (PDT)
Received: from [192.168.0.167] ([51.37.94.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6ecd17sm112583666b.63.2026.09.23.05.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:48:09 -0700 (PDT)
Message-ID: <97595856-b932-40fc-b39b-04016517069b@linaro.org>
Date: Wed, 23 Sep 2026 13:48:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 15/15] arm64: defconfig: Enable S5KJN5 camera sensor
 for Qualcomm boards
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <RbdPcB-QGL3Q9kH1vj2YTIDgS-JUQ3rmbo-QovaLqE1ij0XTZhsPpaet3uWWJI9Yag6wL3TciIvWVqVK4TcTzQ==@protonmail.internalid>
 <20260923-hawi-maili-camss-v1-15-cbbb42e534ef@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260923-hawi-maili-camss-v1-15-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/09/2026 12:02, Nihal Kumar Gupta wrote:
> Enable the S5KJN5 driver which is used for the camera sensor on the
> Qualcomm Hawi and Maili MTP boards.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5217de386edc5e32289e453288db0bd9449d4c6f..fa35db683bb253e83af6bb25f702e3127761c086 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -960,6 +960,7 @@ CONFIG_VIDEO_IMX412=m
>   CONFIG_VIDEO_OV5640=m
>   CONFIG_VIDEO_OV5645=m
>   CONFIG_VIDEO_S5KJN1=m
> +CONFIG_VIDEO_S5KJN5=m
>   CONFIG_AUXDISPLAY=y
>   CONFIG_SEG_LED_GPIO=m
>   CONFIG_DRM=m
> 
> --
> 2.34.1
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
