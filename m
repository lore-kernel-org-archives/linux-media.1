Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710136;
	b=e1iWU/+MWgayDb4nnBM+OvOiH3gz6jQu1fgxu5lr7XIV7RoDuBAF3VB6zAPWPCuOcNvK
	 c+xABMDDjSw6jMjkcZaYN98b6K/jDZBTzAusnthNzF+hcOrTUtDO1pRgRzdNzuzn0rr9U
	 CjqI+0gOzwZkzsWlJaCliLBVOZXJmdDOAKQbgq7mlPVuKIwTnA3Trw/PzsHl+N/S4GdJk
	 KFDUaMtS/kajG/timc3EPD5XkHxTX0dpwF1y279vCxgrHbYOlvlmy1r1q3v4EgZEYM6T/
	 EA6o5RuBDqLjrJvQd7e/3uLCgG+cQpsbZSzPi/ujk3QW97rS7X65ZhF3PcR7/B8rm4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LhXW6WWxyK5q9TLN7DF86Y32xXd7qR1sGyUm/tXFhic=;
	b=rT0B94FkKTCfeQknyf87H9NgVOX32fkgHkVdZtZoiIABDoDNqdYJ+34rcRHLFBQSl7W6
	 bD7FyHa/KdPA61huungrPkQCOcplibokCWHReAh67y1eogRJ53mUoryN8rwn7Zi3Y1XtZ
	 WUiSG4ro+PCavdoE0i4FL2zCoHXGORHFYZTK6DNvXEfs2JbyM3qrNKukXcqo3l45MKVua
	 1ni05gHteW4P0J/H9JPaTLBRZ/Y9YGpORHkzRIH2/4iKrSpyD0Fyf/4YbnsNF2uJ+81fc
	 I6vK/e18I/AleLPTajLwLMrVfKd9pAqipbXiHzhCXsPnxlAUwhkpZRxBn0+SI8tq7Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sTXcBPYS;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F232D606A323
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 16:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F232D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sTXcBPYS
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso52370795e9.2
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 08:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795710134; x=1796314934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LhXW6WWxyK5q9TLN7DF86Y32xXd7qR1sGyUm/tXFhic=;
        b=sTXcBPYSeisnxxEwCZoFkwQP+w7rdOFVMnhCKwiTziMru4eR0LHtPa3aha6YYT1ceV
         CpmeE513GLsWm9+qqjK7wKXB7vapqRlPYKpQoB2Ffc9EdCY+CCjbwfy+QZtVgr+irFW7
         t7ufYEZ20H0Co2XeU4yJTf+3t5lazV15Y+cqlO2YwdB+787Modeuo0nGWcjCuGYRXVs4
         1akr24E0Xmdr7WT1m0mICXL/8lEGMedXGadIfV4wgf3HNI8HwypKypK5K0gSj5mGxN/v
         JA8ugjrD5VOLGnQbchT19EMbtRo1ALPIhUVBZwx+eaKKg/diWEezfOsKAZtwL1w1todn
         U0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710134; x=1796314934;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LhXW6WWxyK5q9TLN7DF86Y32xXd7qR1sGyUm/tXFhic=;
        b=zAgOWcFOzttnqH2mmZjfqzTilQVQbVySFrkd11BmniOC+ehcjs0nx86hofk1lLw0Pv
         Szez5Za9XpHez2+DoAUnUOVxwGssKk2lhVxPwUJoveq7eZcP4mVSYhE0oS4iuStjdp+v
         5Jz6p3NEe3/BfcOcse0V2xsL+sixC3+JZHJI9VEn+RKT8t5W6ErpyzgkX231PNzYsyWE
         jMG9+yu6bHZp7/oRI1Z8r1EDzrNomaF5pWUUqxzBZsJ2FNtqG+JzJ0jO6GuqBYi5glZL
         WPUTH1igVjfhH4nfE4v8QgSdVoHY9dakxQ2ExjhLx93dj1jO7Mwi3PSoo2jhqjyAo7F8
         3yaA==
X-Gm-Message-State: APuU4Z+Kz1ZKdhRcv3Ty8mJckv+rI8eErEXyT9jBEMamwzoRB9nuhsnz
	Z+3kVx0Iw3EOpNGt/ZW3xOd0DqL3T7CRaBuBR2WCN5cDn2910ejufxoPLHZwZ1MJLcg=
X-Gm-Gg: AZFdTZc3Tq48kwuWnFNOoLPZq4YsFPYbyNlwOooe+YAzSJ5dcpcQ3bnK3iw49PxykNk
	gBqXhJGiD9UUxTfXVZFDky3Bwy1Ub35i/ixFIZp+Z7UV72UdpQb0/mdyPkYWipboTfFDLlm9mDN
	jNcCfYDTXffkxVWJEi7VfyfgNa+oXP2H+zaX7q+uiugQye8fCe8IRijV5pzNpY67FpHvdK5byJE
	NiaVF68pxHnMOP3MBDTkQM+/Vqbx2dxYvPMUntqU3mee/DRVhBNbbAibOCVYcsQDChIdLrnVjkL
	JO46Eb/zXxLMGqPHPs/Mdxden/80/QZWhrUJXA1qgrGyls2kZRurZ18EDGQtWkYPPlGo9CYveHS
	+zw0PH4sy4ATJPOYb7S9GFealFr9zFuwh1khWmt+sFSPDy0LSbwoa3Ys1/UmRK8d17vsrlUIKkE
	G/xy3uac1b5197hpfgHBWRSIk3Lr1BtecaJ/dVs9xAYYImIyWY4VS2BPVHAy8m1Xcl3DZwv1RVf
	Fi/96nA9IB+ZmT/FoMUtShTHVUSe6tQdN6otOK+9K4PSTGw+PadUROgchJSrU9nP3cS1+cQe8lB
	yKAGUjYCggSLSynp1JVeo817+XQ2WdscTWKetK9g1W7Kzm7VggVun6oLwDmsCNc=
X-Received: by 2002:a05:600c:4e02:b0:4bb:5d39:95fa with SMTP id 5b1f17b1804b1-4bb88811c82mr422575235e9.12.1795710134157;
        Thu, 26 Nov 2026 08:22:14 -0800 (PST)
Received: from [192.168.0.167] ([109.77.24.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm42722484f8f.2.2026.11.26.08.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:22:13 -0800 (PST)
Message-ID: <c7e1b25b-23c4-4598-9a22-577e105cacf0@linaro.org>
Date: Thu, 26 Nov 2026 16:22:12 +0000
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
Subject: Re: [PATCH 1/3] media: qcom: camss: x1e80100: Fix CSID2 routing to
 nowhere
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
 <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 02:10, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY input
> and raise an interrupt but it can't drive any VFE write-master. This is
> basically useless and not worth coding around in the upstream driver. If we
> find a real use for this we can turn this back on. In the meantime drop the
> definition, it only confuses things.
> 
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 21 ---------------------
>   1 file changed, 21 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 26e3f2aa3ef24..aa6d01d8fcb2a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4515,27 +4515,6 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
>   			.formats = &csid_formats_gen2
>   		},
>   	},
> -	/* CSID2 */
> -	{
> -		.regulators = {},
> -		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> -			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> -		.clock_rate = { { 0 },
> -				{ 0 },
> -				{ 64000000, 80000000 },
> -				{ 80000000,  100000000, 200000000,
> -				  300000000, 400000000 },
> -				{ 300000000, 400000000, 480000000 },
> -				{ 300000000, 400000000, 480000000 }, },
> -		.reg = { "csid2" },
> -		.interrupt = { "csid2" },
> -		.csid = {
> -			.frame_sync_en = true,
> -			.hw_ops = &csid_ops_680,
> -			.parent_dev_ops = &vfe_parent_dev_ops,
> -			.formats = &csid_formats_gen2
> -		},
> -	},
>   	/* CSID_LITE0 */
>   	{
>   		.regulators = {},
> 

This patch is too naive, it leads to:

20261126-purwa_camss-v6-2-5ab97aea3832@oss.qualcomm.com

I'm going to NAK myself here and do something better.

v2 incoming

---
bod
