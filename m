Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792791664;
	b=kdjsiGVMGQ1eh1mv6ed3LnC1BFgTGT/hbw88rxF7jIFl94SdTYP6uiLj8/5YYX3Hc1ZW
	 YwGmbh3sr6fJqeIzp+bxEjfuF0/6BxjOUj0Cy8gt/7/mgO+oBi/3uD60pqkjijtx3oyPA
	 XowmdS61wn4bl3Jmy7FYDBNJ0DAsdk+mQQAt/JMeG+f1WhklGYw0F9gXAmTr1Oa+QSPj/
	 wni2sCcKor9ToTeoADJ/IfZU0Z+8cpeVkGswbnZfHLATf2MFDi5MKLtWskhp0sGFkeV8q
	 KpUoQDGy5iJKEepSw1tQjFAtKAUTyJPhDpNARTZ8fDd2zYdLC6df54W6bO8OzRNamsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792791664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dLP+vrP/WYHAzwYYzRIUkm5egmqsrMk3OsoBqC+cLU0=;
	b=Hj6Ka4a7X9LxAMj2yyvKCf5YsFJdtkSe3gpJ2VHXUR2rvvcWBZ1pPSIIjLFq18d+oZHt
	 Ue9FpggKClT7csAD18z4Tyu7XjYgTSwCLIMXhL+EMbe68rEJ13ZFm3ejxQ1tJpsen0GRY
	 LbzzhdJyt+Ilb9Zq0wRhW/MHtyR3S1mwi0w4BFvavsl2iupopsyG28Ac4OJw48zStqrT5
	 AV3upfsBKrs32+ohYjyNWR+myOyFirtysEfdX/WUrdi86kKwt18bznftgCHAtOZTzoWEq
	 X3uhXNiqFolzOeCOKdqpUbWGLDpx5fGCKfY4J+73tobrtOqEON8O5QDyKPJANzMN+Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VV9t3m26;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD4D606A31B
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 21:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD4D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VV9t3m26
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso12946485e9.3
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 14:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792791662; x=1793396462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLP+vrP/WYHAzwYYzRIUkm5egmqsrMk3OsoBqC+cLU0=;
        b=VV9t3m26hBrBQD6LWSdum5wEpZPTJfaiwClM16DKnojK9o0cj8AEm61J5gJ2JjDjRk
         3OtJb9PFHB8z4J0nSbjeg7Eil79LkOMIPgiq8JMvhc3MoSm8TB2F7fjryTIUdWyy/vn5
         7Be9Y266WosxUhjpiu2tACj/qqJh/gyCH3x3TT2UDx1u5c+Ic9st/RXBPmHx8zxzDb9B
         fnKfC4725RnS5ii1fRAAIrfJ1uGoFMgjYFYGoq0YA+hH0lhu8cVm8LlYIMMaCtSz1maL
         CtT9ITSQ9EWgmC5DBWFfjW3yydjaUugVzfMbG73ziEJkqHE3s0V4LqBfFTouIATVZTL/
         OiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792791662; x=1793396462;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLP+vrP/WYHAzwYYzRIUkm5egmqsrMk3OsoBqC+cLU0=;
        b=I/P84ZtH1ioXxuDCaZqNbYLezv8b7/lJj1idbB3SJBIWCNQ+mc8+2kEgkycHwYbLq8
         uSbuDwWn0TUtlU0TMBtAcgSUbeJHvxDfkeU1G+CBsFTjiQ3o0+jHpmbLiGtdwlCcZ+sV
         PwL0ZFLOA32v9GLHEqnEClVMeSLt63F7+l6T5qXp2xLZNjfAzcH4WHTaeTx+Ro7BPYE4
         p5vGG3tFse8f6kRCWYOqgzaVPYZN51OjyAoO2ClKGRa5fM/J2TA6GyMk58DP3FxrQ1n8
         /scT7OLkb+LmYei1ZD/rHWb5k25WmjOhE8vOwhiLxIS3P6L5tDkLDlZYT+trefSCUEVl
         Edkw==
X-Forwarded-Encrypted: i=1; AKwUvBwybIPmFZNzB2J5XL2NqALo1W4+FNvc76LuRlET0bxoqDXMODeo8y36EULV3IDXGoPRbhf6D23Obztd0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLWFSTcvryyOTdjoImyKKVYkZ+p1UoPeZ0C9dpqef/FrD+rqOvX
	jy8eN9SIlX1M7kQr1ipQg+3/gITgXUppZGKH/aDTdt5P/+ZlN73flMbqDMsDQLuk9Q0=
X-Gm-Gg: AYBFou0hw2WHggnHskBk0ZwCSCrdoksRrst4q3cteoG4A8AQtddViJXdk/sSqSRE8uS
	M5IBPea2oHopV1NXj3gAYlL5XTB77yD4hcnpOfVUXWCwqnkFvlEJ1qoZe+zPw/oTSI8oD46sVfQ
	28kbgSbM3GpAxRsRpdizLnMD9jiqiE+/cJhnaSiyV6yzFxqqh4YpA5MGfNKDl7JgWmblvnv5lVY
	dZGvPsnv1jlEe+qlwAMhr22GRWyq7FZRg0pxObkEFYzAw4aw948OGRC1dKzX2r0ryRk+UY5skVH
	Qz1rJbWI6ec6/yzlVgCCSB7uxVyo2/RDb9Sj6vG/53ykcx77aPdM/zA6VdhJ21fcqCevKFVWqqM
	QrogN3rYOPY2HG8vzeiFAy96pfLhUfejBnOQDcf4se+c1fQC0C8bi4iTRzkVRiTXPYVAub7McmF
	GVmwjoYeCTj1lK8FFDHpxJvPXq8/ymMjhxttkShnytJMYP5An/OayyHM+btNfsQxjgG2GV7YuAo
	OD7Hps0h92g6JDYoWP3Z60gqour1OjCVE3kQSOjQNUUUgfdT+VfxCUAOUgoGkTSHiEp
X-Received: by 2002:adf:e186:0:b0:48d:f730:bda8 with SMTP id ffacd0b85a97d-48e3eb879ebmr390913f8f.50.1792791661485;
        Fri, 23 Oct 2026 14:41:01 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.107.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm469172f8f.18.2026.10.23.14.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 14:41:00 -0700 (PDT)
Message-ID: <4a88a2ab-0020-41d1-8924-bba8ac42f429@linaro.org>
Date: Fri, 23 Oct 2026 22:41:00 +0100
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
Subject: Re: [PATCH 3/4] media: qcom: camss: share VFE clock sources by the
 highest rate
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
 <20261023152857.2859767-4-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261023152857.2859767-4-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 16:28, Atanas Filipov wrote:
> Group the VFE clocks with rate tables by their clock source at probe
> time, so that a VFE no longer lowers a shared source under a running
> one. A source shared by several VFEs follows the highest rate requested
> by its running users and drops to the highest remaining one when a VFE
> is powered off; with no user left it keeps its rate, as it may feed
> consumers outside CAMSS. A source with a single VFE user is dropped to
> its lowest rate on power off. Clocks whose rate the VFE does not set are
> left untouched.
> 
> Grouping is enabled through the vfe_clock_domains resource flag, so far
> only on SM8250, where the VFE AREG clocks share the fast AHB source and
> the VFE Lite clocks share one core clock source. The current parent of
> an RCG depends on its last rate, so other SoCs keep setting their VFE
> clocks directly.
> 
> Also let the VFE set the SM8250 AREG clock rate instead of the CSID.

You're simultaneously adding a new clock to an existing list and 
introducing a behaviour change at the same time.

Those two things should be split on principle.

> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c |  14 +-
>   drivers/media/platform/qcom/camss/camss.c     | 175 +++++++++++++++++-
>   drivers/media/platform/qcom/camss/camss.h     |  13 ++
>   3 files changed, 196 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 87096095b1eb..a3133720c765 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -907,12 +907,15 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
>   {
>   	char vfe_name[7]; /* vfeXXX\0 */
>   	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
> +	char vfe_areg_name[12]; /* vfeXXX_areg\0 */
>   
>   	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
>   	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
> +	snprintf(vfe_areg_name, sizeof(vfe_areg_name), "vfe%d_areg", vfe->id);
>   
>   	return (!strcmp(clock->name, vfe_name) ||
>   		!strcmp(clock->name, vfe_lite_name) ||
> +		!strcmp(clock->name, vfe_areg_name) ||
>   		!strcmp(clock->name, "vfe_lite") ||
>   		!strcmp(clock->name, "camnoc_axi") ||
>   		!strcmp(clock->name, "camnoc_rt_axi"));
> @@ -1002,7 +1005,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
>   				return -EINVAL;
>   			}
>   
> -			ret = clk_set_rate(clock->clk, rate);
> +			ret = camss_set_clock_rate(vfe->camss, clock, rate);
>   			if (ret < 0) {
>   				dev_err(dev, "clk set rate failed: %d\n", ret);
>   				return ret;
> @@ -1101,12 +1104,12 @@ int vfe_get(struct vfe_device *vfe)
>   
>   		ret = vfe_set_clock_rates(vfe);
>   		if (ret < 0)
> -			goto error_pm_runtime_get;
> +			goto error_release_rates;
>   
>   		ret = camss_enable_clocks(vfe->nclocks, vfe->clock,
>   					  vfe->camss->dev);
>   		if (ret < 0)
> -			goto error_pm_runtime_get;
> +			goto error_release_rates;
>   
>   		ret = vfe_reset(vfe);
>   		if (ret < 0)
> @@ -1131,7 +1134,9 @@ int vfe_get(struct vfe_device *vfe)
>   error_reset:
>   	camss_disable_clocks(vfe->nclocks, vfe->clock);
>   
> -error_pm_runtime_get:
> +error_release_rates:
> +	camss_release_clock_rates(vfe->camss, vfe->nclocks, vfe->clock);
> +
>   	pm_runtime_put_sync(vfe->camss->dev);
>   error_domain_off:
>   	vfe->res->hw_ops->pm_domain_off(vfe);
> @@ -1159,6 +1164,7 @@ void vfe_put(struct vfe_device *vfe)
>   			vfe->res->hw_ops->vfe_halt(vfe);
>   		}
>   		camss_disable_clocks(vfe->nclocks, vfe->clock);
> +		camss_release_clock_rates(vfe->camss, vfe->nclocks, vfe->clock);
>   		pm_runtime_put_sync(vfe->camss->dev);
>   		vfe->res->hw_ops->pm_domain_off(vfe);
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 7fe12049b78a..db5212b14d5a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2053,7 +2053,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
>   		.clock_rate = { { 400000000 },
>   				{ 400000000 },
>   				{ 0 },
> -				{ 100000000, 200000000, 300000000, 400000000 },
> +				{ 0 },
>   				{ 0 } },
>   		.reg = { "csid0" },
>   		.interrupt = { "csid0" },
> @@ -2070,7 +2070,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
>   		.clock_rate = { { 400000000 },
>   				{ 400000000 },
>   				{ 0 },
> -				{ 100000000, 200000000, 300000000, 400000000 },
> +				{ 0 },
>   				{ 0 } },
>   		.reg = { "csid1" },
>   		.interrupt = { "csid1" },
> @@ -4509,6 +4509,167 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock)
>   		clk_disable_unprepare(clock[i].clk);
>   }
>   
> +/*
> + * A clock domain is a clock source shared by clocks of different engines.
> + * Its rate follows the highest rate requested by its users, so that an
> + * engine started at a lower rate never lowers the rate under an engine that
> + * is still running.
> + */
> +struct camss_clock_domain {
> +	struct list_head node;
> +	struct clk *parent;
> +	struct list_head users;
> +	unsigned int nusers;
> +};

It seems to me as a read this that the above text is the abstract 
description of at least one patch - which should have examples in the 
commit log, to make it less abstract.

> +
> +struct camss_clock_user {
> +	struct list_head node;
> +	struct camss_clock_domain *domain;
> +	struct camss_clock *clock;
> +	unsigned long rate;
> +};
> +
> +static int camss_add_clock_user(struct camss *camss, struct camss_clock *clock)
> +{
> +	struct camss_clock_domain *domain;
> +	struct camss_clock_user *user;
> +	struct clk *parent;
> +
> +	if (!clock->nfreqs)
> +		return 0;
> +
> +	parent = clk_get_parent(clock->clk);
> +	if (!parent)
> +		return 0;
> +
> +	list_for_each_entry(domain, &camss->clock_domains, node)
> +		if (clk_is_match(domain->parent, parent))
> +			goto add_user;
> +
> +	domain = devm_kzalloc(camss->dev, sizeof(*domain), GFP_KERNEL);
> +	if (!domain)
> +		return -ENOMEM;
> +
> +	domain->parent = parent;
> +	INIT_LIST_HEAD(&domain->users);
> +	list_add_tail(&domain->node, &camss->clock_domains);
> +
> +add_user:
> +	user = devm_kzalloc(camss->dev, sizeof(*user), GFP_KERNEL);
> +	if (!user)
> +		return -ENOMEM;
> +
> +	user->domain = domain;
> +	user->clock = clock;
> +	list_add_tail(&user->node, &domain->users);
> +	domain->nusers++;
> +	clock->user = user;
> +
> +	return 0;
> +}
> +
> +/*
> + * camss_init_clock_domains - Group the VFE clocks by clock source
> + * @camss: CAMSS device
> + *
> + * A clock whose source feeds no other VFE clock forms a dedicated domain
> + * with a single user. Only SoCs whose VFE sets the rates of clocks with a
> + * fixed source group their clocks; the VFE clocks of other SoCs are set
> + * directly.

What do you mean by user here, its not clear to me. Another engine ? I 
think so - you mean the JPEG has a dependency on the clocks listed in 
CAMSS ?

I thought we decided for full separation of JPEG and CAMSS/IFE ?

> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int camss_init_clock_domains(struct camss *camss)
> +{
> +	int ret, i, j;
> +
> +	if (!camss->res->vfe_clock_domains)
> +		return 0;
> +
> +	for (i = 0; i < camss->res->vfe_num; i++)
> +		for (j = 0; j < camss->vfe[i].nclocks; j++) {
> +			ret = camss_add_clock_user(camss, &camss->vfe[i].clock[j]);
> +			if (ret)
> +				return ret;
> +		}
> +
> +	return 0;
> +}
> +
> +static int camss_apply_clock_domain(struct camss_clock_domain *domain)
> +{
> +	struct camss_clock_user *user, *top = NULL;
> +
> +	list_for_each_entry(user, &domain->users, node)
> +		if (user->rate && (!top || user->rate > top->rate))
> +			top = user;
> +
> +	if (!top)
> +		return 0;
> +
> +	return clk_set_rate(top->clock->clk, top->rate);
> +}
> +
> +/*
> + * camss_set_clock_rate - Set the rate of a clock
> + * @camss: CAMSS device
> + * @clock: Clock
> + * @rate: Requested rate
> + *
> + * A shared clock is set to the highest rate requested by the running users
> + * of its source.
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +int camss_set_clock_rate(struct camss *camss, struct camss_clock *clock,
> +			 unsigned long rate)
> +{
> +	int ret;
> +
> +	if (!clock->user)
> +		return clk_set_rate(clock->clk, rate);
> +
> +	mutex_lock(&camss->clock_lock);
> +	clock->user->rate = rate;
> +	ret = camss_apply_clock_domain(clock->user->domain);
> +	mutex_unlock(&camss->clock_lock);
> +
> +	return ret;
> +}
> +
> +/*
> + * camss_release_clock_rates - Release the rates requested by an engine
> + * @camss: CAMSS device
> + * @nclocks: Number of clocks of the engine
> + * @clock: Clocks of the engine
> + *
> + * A dedicated clock drops to its lowest rate. A shared clock drops to the
> + * highest rate of the users still running, and keeps its rate when none is
> + * left, as its source may feed consumers outside CAMSS.
> + */
> +void camss_release_clock_rates(struct camss *camss, int nclocks,
> +			       struct camss_clock *clock)
> +{
> +	int i;
> +
> +	mutex_lock(&camss->clock_lock);
> +
> +	for (i = 0; i < nclocks; i++) {
> +		struct camss_clock_user *user = clock[i].user;
> +
> +		if (!user || !user->rate)
> +			continue;
> +
> +		user->rate = 0;
> +		if (user->domain->nusers == 1)
> +			clk_set_rate(user->clock->clk, 0);
> +		else
> +			camss_apply_clock_domain(user->domain);
> +	}
> +
> +	mutex_unlock(&camss->clock_lock);
> +}
> +
>   /*
>    * camss_find_sensor_pad - Find the media pad via which the sensor is linked
>    * @entity: Media entity to start searching from
> @@ -5427,6 +5588,11 @@ static int camss_probe(struct platform_device *pdev)
>   
>   	atomic_set(&camss->ref_count, 0);
>   	camss->dev = dev;
> +	INIT_LIST_HEAD(&camss->clock_domains);
> +
> +	ret = devm_mutex_init(dev, &camss->clock_lock);
> +	if (ret)
> +		return ret;
>   	platform_set_drvdata(pdev, camss);
>   
>   	camss->csiphy = devm_kcalloc(dev, camss->res->csiphy_num,
> @@ -5474,6 +5640,10 @@ static int camss_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		goto err_genpd_cleanup;
>   
> +	ret = camss_init_clock_domains(camss);
> +	if (ret < 0)
> +		goto err_genpd_cleanup;
> +
>   	ret = dma_set_mask_and_coherent(dev, 0xffffffff);
>   	if (ret)
>   		goto err_genpd_cleanup;
> @@ -5736,6 +5906,7 @@ static const struct camss_resources sm8250_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
>   	.csid_num = ARRAY_SIZE(csid_res_8250),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8250),
> +	.vfe_clock_domains = true,
>   };
>   
>   static const struct camss_resources sc8280xp_resources = {
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 7dc2fd9f03e0..ad1d49275e0f 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -11,6 +11,8 @@
>   #define QC_MSM_CAMSS_H
>   
>   #include <linux/device.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
>   #include <linux/types.h>
>   #include <media/v4l2-async.h>
>   #include <media/v4l2-device.h>
> @@ -120,6 +122,7 @@ struct camss_resources {
>   	const unsigned int tpg_num;
>   	const unsigned int csid_num;
>   	const unsigned int vfe_num;
> +	const bool vfe_clock_domains;
>   };
>   
>   struct camss {
> @@ -141,6 +144,9 @@ struct camss {
>   	struct icc_path *icc_path[ICC_SM8250_COUNT];
>   	const struct camss_resources *res;
>   	bool legacy_phy;
> +	/* Protects clock_domains and the rates requested by their users */
> +	struct mutex clock_lock;
> +	struct list_head clock_domains;
>   };
>   
>   struct camss_camera_interface {
> @@ -153,11 +159,14 @@ struct camss_async_subdev {
>   	struct camss_camera_interface interface;
>   };
>   
> +struct camss_clock_user;
> +
>   struct camss_clock {
>   	struct clk *clk;
>   	const char *name;
>   	u32 *freq;
>   	u32 nfreqs;
> +	struct camss_clock_user *user;
>   };
>   
>   struct parent_dev_ops {
> @@ -170,6 +179,10 @@ void camss_add_clock_margin(u64 *rate);
>   int camss_enable_clocks(int nclocks, struct camss_clock *clock,
>   			struct device *dev);
>   void camss_disable_clocks(int nclocks, struct camss_clock *clock);
> +int camss_set_clock_rate(struct camss *camss, struct camss_clock *clock,
> +			 unsigned long rate);
> +void camss_release_clock_rates(struct camss *camss, int nclocks,
> +			       struct camss_clock *clock);
>   struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
>   s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>   			unsigned int lanes);

