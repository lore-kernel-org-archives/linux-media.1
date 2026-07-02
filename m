Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E357847D954
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995091; cv=none; b=Rs14tw5KajXEelww+1RMph/AMUqcLLuwnTzdQt4fX1O1UgakwoAGew8DeFBK4A6X8HFAzH1rwf9K9EOG9+13K+OyPRlr1XIXcaUyZ77P7CIGVwMl1O/C/JGatQ2gO25hn+FfrMB2Q/7KEk7aTf9hSz0nYDG9bVPqhsEjbr/5ZbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995091; c=relaxed/simple;
	bh=7qGuFMvllEpDqWefN8L6UtrRcmDGHxh///3f50FPo8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsyerc/Lqn8cwZVl5XMxIdPUIkmmuBvL89RGSBkp64R98/gfR320IzzMscOYCsIP+PJn51SwBnYIVQ12DJHcTHldXxlUKY56PmpX0VfRFxpmr1ysXL+TXQ1CBArbUB1dFNo1yeCRyGhwuNltXjFK8VwswBRpbscSKR2T1beA6DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pFzxUU+x; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pFzxUU+x"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39b01ee28a8so2485451fa.2
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782995088; x=1783599888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BMunvEvzFx+EKCn/rHllT9/LL7rulR07jvCFBPoEfWQ=;
        b=pFzxUU+xxyGzb30fYfdjgoZ7w/oDjg635DCp6V+vmrV99k2sze8MlUU8AraGCQbfSr
         0a6ghzRGwcsx0dUuR0Qs4roZ31yEr5yQxBxmlj7OfXYznyBPRHP38MoVl+BjjhCLucaU
         S7ceXMUjGLwKMhuQoqfmaCmutf+hvzx0M99kFFWUH9svWQsS7fjBmRcoXzsUEBrUZwF5
         NzGQHUWkzqwUk3VYCiCom7u3k8Fre1Jc0/73ysfyBtVq1xpPM0WbiI52AygfN8g+gUHr
         KmBNXCTiP24PsoJMLBQZXO2cs7rg0WCiNSx2G07iHrSaWh6nEhXztYf+iPFo5TItboMx
         k38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995088; x=1783599888;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMunvEvzFx+EKCn/rHllT9/LL7rulR07jvCFBPoEfWQ=;
        b=FY5MwpdZqr2UVRwuo5dlxsbgbaTV2/pRYOo9YzgtT0f33CuWrceQRy4oOBUxCEFY9e
         ZdxLREt8moYd4a+TvCIE669AEOzzITTFIFjt4MpYRqTOR1EAuvr4Yoi3U04TYTRdFbhG
         dtwdfBQH9QpBuMGvF5E/9BdfegHzMyZs2moc5XQ+YGz1+v7Qk7+KHVRyqOtF2qvBA6az
         CsQDCF4TKQkWkcUIHxxlcVM0m0CqJXfLqbAXkqTamNE4GVDAE8AnW1tzSnarZ/ZAVeZJ
         uqO1uK+s06R6N7f+AUzicViVGthGPIz2+/dJfhdgCqXLU2SyCMR1pa4OBRmiBmlGNrjb
         u3kg==
X-Gm-Message-State: AOJu0Yxh7g40MePw4J1WEPM/BcjYSIsaZXyUQjRXI9EW5TEFi6KYIPnA
	KkdHgrTLJf4fFGlx03LXlSKgH3teA/rbCTdmFL9yTeGKj6DO5raGgKKvTZ8Bt/kx59FDFPa96pl
	bdZESmX0=
X-Gm-Gg: AfdE7cnkBXhiNb62vOULUOJc6cyjBFmOneSsj6fLCdFYW64aE8e83SJGcKeiHRZYo0c
	s89jqMbVvYmqCAF01lxYu0Fq6z39I9RaSUayfmATlNHLAMC6O5w9SpmJUmyxzUoCmL/F/g93SBA
	gm/ZuEhnY7ycm7JbSzM3zrURCQPvCF83MaL8xGk30aDNao9tvw8xF6tLo9ARouRKAXseL2T0SXx
	32MPD42F8ntpniHV02xr/lUuc1lNN536kJv43fyXmZl4tgKSMA/kAURAWkc8kpWqRWJGuSAU3xM
	GNFSpneleIETiOhpfU9FdmKYx996YzFyaAmqu8LMZDTKFjwFLLoMcbLOoG014P7uQNpNdhu9fKD
	MFruAgmNTuU9vvNsmGRj2r8Faf02zc7NTNjuz3VYD8+Hx8hwL6zOdjXjdAeV+f9PrP3H1Uht11D
	vIOu/sl2Wz1CcAye6yzQsSY+/WvjF3a/qzC+pDkPjYoAfsBCyp4n2knMpiyYScHOZMvr4=
X-Received: by 2002:a2e:be0b:0:b0:393:d08b:2a0c with SMTP id 38308e7fff4ca-39b34034b20mr7388641fa.2.1782995088079;
        Thu, 02 Jul 2026 05:24:48 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b37fe9960sm5868781fa.32.2026.07.02.05.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:24:47 -0700 (PDT)
Message-ID: <df510ed0-815a-4d72-b7c5-05025d8dbfd6@linaro.org>
Date: Thu, 2 Jul 2026 15:24:46 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
 <20260702-og0va1b-v2-1-0071442caa2a@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260702-og0va1b-v2-1-0071442caa2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wenmeng,

thank you for the updates!

On 7/2/26 13:52, Wenmeng Liu wrote:
> The OmniVision OG0VA1B is a monochrome image sensor closely related to
> the already supported OG0VE1B. It shares the same SCCB control interface,
> power supplies, clock and MIPI D-PHY description, but differs in its
> chip ID, register programming and output format.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
> index bd2f1ae23e6547032361924a6953000bab1129df..ae44ec2fa9035b4e19834888a41987ae9e25118f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
> @@ -21,7 +21,9 @@ allOf:
>   
>   properties:
>     compatible:
> -    const: ovti,og0ve1b
> +    enum:
> +      - ovti,og0va1b
> +      - ovti,og0ve1b
>   
>     reg:
>       maxItems: 1
> 

Since it becomes a shared dt documentation, it will be accepted to get
a generalised description section also, in any case:

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
