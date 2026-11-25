Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613321;
	b=3sbkrd9QNhzZEZPkA8UdBQ5LwZUD/BWSoMIihIdC6Aoj3lwVsMrecTajr2pgoR/5yHF5
	 vPesMwKFCGQUEC4MnOvA7norvLSSgzOscJSI53242lYn6fqCvs1ST4Cr1E/VTFnWVFGeq
	 4Q6v3zcp94NDl7xQxvbj2ygKSyCtnrpNBBfNKM8ntr6i42lP6Jdqz1MAxymNnmtLgxlbM
	 +9NZZgO4IUFrPhkeY49oIKfeAxB3GEj6D0g/p9oH/nCRI4KTBaJc7wSxOsps4hdArfa2b
	 9wC4zcwI0f6PbnTKAOGGzGtLu7mChy4MoTfX8pNpiAcvoF1YehUgq6SchZ8c0ytxhPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AdBqif1XdprtG6YwyZi9UA3LL5Dre8swdPb1+TR3fvE=;
	b=l76plRTfTwotw4GnPip4ttyEjSeBEwICoBACsB9qZ1J6vjslrBFQFa4SED1BMJOmozBf
	 Y8gHwaomWDpO342DKDQABqHNN9St9S05y3hXx31SHCin2fHdjhEI/2vr5Rf+iGKHZikcX
	 X72LViHpnLHykCjauov5Hp11f8uL+5k/zbVOS32x1pP9sixzw6RbfsNe85at79/uTM6Us
	 H/BTQyw2Pf2rGBFsIQ6m3zkvr0eOagc9EVzchpOBLd2m4puwN5G5g8NE0GjvVZ28cqur9
	 0DxXnu4TEbkioLCAln1F1ga7/lnhzLfXqBLwbZYmgSGM6CYeEBWPbGeH1VdcMcXeG5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Lc98iv8n;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B38606A321
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B38606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Lc98iv8n
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c0f0e04628so469854e87.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795613319; x=1796218119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AdBqif1XdprtG6YwyZi9UA3LL5Dre8swdPb1+TR3fvE=;
        b=Lc98iv8nhLEW6JdTzd/vHJpSezeDJHH6M/66PZ1oXpIor2ipcSI2kOuCTfZkI3fQLA
         ZGHKgfCKDJwOdC4Hs8i9o0Fn5riETmKP8hc+edIRV6EUGqW3cBmEuA77uoWleYlzLIXd
         b7iR50U/1vohH/C6Yj+7N6aTLNBvKvLLKI8mekY770Gs/3Z8IOH41zI1+2qjOzAIsb8O
         N+6RdLiQvvPVU+0p9Y5sLoDSUZgZTjJc+9H3sph8aQyVaiSurPMSS9ncOiAy3PL/ts67
         bncGENx5GHzrxq+3rVTNmlKUWUTclbJ+VOpsyi1P4MhOFI+fQs0oJ3HYa8O52Qoi36IJ
         IX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613319; x=1796218119;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdBqif1XdprtG6YwyZi9UA3LL5Dre8swdPb1+TR3fvE=;
        b=NVZukwRWZf/GZhod8ndy17AVc2pvVQzcZvrdOlkqxbnAxRSqX7LRalBf7LM4Ln7QQM
         MmT4Ub6Shsm0qpZPiECiZIffhR3rKIjse4Zlz9p5p6hU0l641AuUbBiAhmcFeS0WOJWm
         xSwn5Owi2WNcE4G82hmvUnI0uDEeIKjSKZntF/wIbTaUHKBM4LweUUcliotCpuRtkrVi
         +S/Gkr3BOvhSv6dETI8bCJkMauAW88Q9VC71uPzkKsX0JM8cgP/b4v0BbcLE07ReNLBl
         VQdRq8uqrJylVL6N/qCx3mizuOfXndqlEc9F4rEk23824rhR7DB1VmLvKGi1z0jaCXRf
         IrbQ==
X-Forwarded-Encrypted: i=1; AL+hErF6t6Mnrwgg7HXZzYmn4tj8tZHtJ9bcqz0NolC0EpW+ljC8o2uHgvKQxbY0yu9jK5i26swDWuL26MYomA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Eccqq5R77V8HGnD6ssAEcfjIx8R7RrqIFXB6ApafxP3j8/ZZV
	vB9M1e9Gwvt6mwyxTTtW5q9u4wDzPSMWku/YkM5HhtWBtzLNjJN2J6uINL2n5w4QMg4=
X-Gm-Gg: AZFdTZedj42Xy5lX9mZYrHiummcfAkxi6b4AusIfqxSxwXvkl1ZhC0xxG+XtEHwfTGS
	hpzR/A5IeoJDEfowjfpbVhiictOSRWQTnMTefkU7dijPShIphg7c9aznjNxmM4wU6OthqUMFpGJ
	DvB7Ztc+fTfiFec28Dcu2+4Ijk877bjDySM0ZApyChMA/qCX/blCMqk4gcQ5DDpmRvUwTt6jGfa
	bWXQMbHTOumX0b0OdUYsfMsPK5QauZ2ShQt8y1Z92Db++xezdO7ALwMlIROIO0/DiqSYuiHRbfM
	Ep3BUF2BhRtXwKBgdJGxtDjKmPHnDJWCEvHcI/77qWhKV0nOEQBjoGBxVhWnOwKkQrLd+5GCdhc
	+NQ0TSC4PISPcBHfEKhn+J3fJpGf1pNibQJRPhTITD+VtgpPF3YllvkhaIUp79LHaoFhD2nbKG8
	m/uLi4ZyrsFm1njTRelD3L2vMeLMHJbMIAzj2sUQP255j0gcU7FTVfazfmN65c1oe6VOyZJ6EW3
	H6Gz0u+of1+uGbGKbpsQchJICBzvgeIqSSvl6TADfhfgy8jS/Uk6I5Hs5EFtCMa3kKWDVhcq8n6
	HMtQRG4Y00u3VvULHBZ9WtGCYGmVW3V+XAww2J+yyr0dgE8EZEAPDR0r/PHOcUAbqryJhdBFqpa
	+T9eK7O0=
X-Received: by 2002:a05:6512:2514:b0:5bf:a66f:e5e with SMTP id 2adb3069b0e04-5c1bc57989bmr6590468e87.0.1795613319090;
        Wed, 25 Nov 2026 05:28:39 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf333bcsm4683145e87.2.2026.11.25.05.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 05:28:38 -0800 (PST)
Message-ID: <a2010032-8750-4289-b443-3afb57d656e6@linaro.org>
Date: Wed, 25 Nov 2026 15:28:37 +0200
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nihal.

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur's camera subsystem hardware is a functional subset of X1E80100.
> TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
> three CSIPHY instances versus X1E80100's four.
> 
> qcom,x1e80100-camss is not used as a fallback compatible since it is
> already claimed by its own binding schema, causing a duplicate
> compatible warning in the DT schema checker.

This sounds like the DT binding documentation shall be fixed instead.

It makes no sense to add a large number of new compatibles to the driver
code.

> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> +	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>   	{ }
>   };
>   
> 

-- 
Best wishes,
Vladimir
