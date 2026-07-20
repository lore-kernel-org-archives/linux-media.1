Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D399F399360
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542264; cv=none; b=QBMnEvDKp2Y9G3eqjxCzcpz/1OZt0Grx5PspXKSgNcMKDgKbSUMtL5X8+jiQDwIePCBoAFvTi45XHsbu4UCqllTzYl6Nz+FZVUh23UbrpcYF8sJDS5t/mdbwn+RiqIo8hazkgJplxGMwIJpzinNqz+Z9kTfgbiymCyAHDxbF/KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542264; c=relaxed/simple;
	bh=3VGzNIVavy4riBNoVaQGq83t63k4CBx5YMYFOuF7l5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEO+5m9NETdmjkbyISJKsMmj2V7pv19aP8vp2xxGAML8tM1ul/8vM6AynNbxc/UwEVW/wJ51rrmp9IKjZzW52g6yRJDeBazW3FaAA9fuavz4Ykx9jBvxS1UxdRpwaZdA0ylC0weHvqRSTslfAdFjysTReg9D2q37uavMj5ha/ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Prv0kC9j; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Prv0kC9j"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15e03c2763so843152166b.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784542252; x=1785147052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKvQpFa1elvV0qe/8C8Y/Fz5QGnzRdhnFNUsbcgsZbw=;
        b=Prv0kC9jS6EpSBzK5FA1R46Ng1uKoRXe1xT8oHaD8vXv8V7mL9xcljj6f0Z9uaKNEZ
         ofGJe+9q9giZsJvSUQVZUur1lcFnpKi+mvGgpeyecUYu9pHN8N/JXQ5evkmyH2yIAfVv
         PJOo/K+qllyby4rRMFUjxjJgRa0zlEqRvb8P1RAF+fp92ksXhmvPFosubgS5P0o+elpL
         czCrBTK6yilk58BH/eoliKDsYXcLLeOw8wdf0ITzVZ5/bUa9tbOcjWrbvXLoLk1pqu6T
         zMTFhaggR42zNhTasL6MpiCv1yN3Vdy2HhdtZjalG4tUcNF6f3LRjSCt95jM3eOvsq88
         QR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542252; x=1785147052;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKvQpFa1elvV0qe/8C8Y/Fz5QGnzRdhnFNUsbcgsZbw=;
        b=V7CTWATNxl9BTJU5Ls1blbDaWqCpIzW82XAcT2bN2UxyNIO67fZUxz8CpreKclpeCA
         LISkEO2c/8gSAYtZF4uX3JhVTlPzykNyGbwNqmRmDvnTIo9xbicSqQJKsFBpGWyL0JGh
         w6alp48Orss+ExjLDXaHNzijqytb5UJ3cgBiS2xIoSFL0ixzqGIYDn5QzmoAw1JgAssN
         yfKwMa+aWTyIHBANPJC8xlp05E6IwSXA1xRaOzt1CBq6QPFLy2i54LFvvJRVL9HYMyEX
         d2tibwGxZaKlDUYTwPYMl6rZij5e0tftCj236VEeZ4XHSsUaviWbRtyO4JirEcZPBWs8
         hcVw==
X-Gm-Message-State: AOJu0Yw84P2a2FmNHIfK7wtez8vXEhvM3lrkIPliPKbMnVmvb+4s+DvQ
	IDb61eezklORz480oSc3Cgu82lKG1MKvrCRY7lmOEAcL5boSc7FzrxgL3Dem8U+e1ErDxGKb7gJ
	6jw9a
X-Gm-Gg: AfdE7cnQwbEwRv6oNI2aR+181n+je0qAvEC+AvxlqijrHqU+0xCn9FQ+BSwjyzqve6F
	/1MioN25I/dFVeG3hyEIXW1iMZeT4Ch6Xma11zUyLqp0I4hcOcTffFB/3DzbLOLyjm4M4Q/aMpr
	3Ka4IYtv3oj1gTcbb5xUnUWsiz2ah6HNQhGD2Q9CjccuBaclWITkCKsUhgziBrwmsSl/h4p4VAy
	bSSFgWpC/X1DVXLZ39kPxmzOJVv1G3Lb48lEbE/wstuf6vSGItaomIyDIwiklBjttzP7OV7voSq
	KGsUkv7D2hfi2zJfn75irtxziMjnqEIGb+72NqtT1VjK9KCvt73Hb8JMp0D4gFbe2F+A7CxQ3ed
	QUxc4s+9lEcnxy1aJ+A7Ayl5uLb0bn5Z21K9RgX1TFBUd72Qe7p4DWkIrdagNzgg0uESMSTEafC
	rz/00dionjrWTXNaPGnYyrHlqF
X-Received: by 2002:a17:906:f584:b0:c15:ee17:47a with SMTP id a640c23a62f3a-c16922d7b1fmr921088666b.15.1784542252253;
        Mon, 20 Jul 2026 03:10:52 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.26.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705afeb98sm441332466b.22.2026.07.20.03.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 03:10:51 -0700 (PDT)
Message-ID: <edac77f9-ad83-4576-b233-e3a7e602791b@linaro.org>
Date: Mon, 20 Jul 2026 11:10:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
 <20260717-camss-version-v1-1-7ed71fea95e8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260717-camss-version-v1-1-7ed71fea95e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2026 15:20, Loic Poulain wrote:
> Add optional PM clock support to the CAMSS driver using the PM clock
> framework. This allows CAMSS clocks to be registered once and
> automatically managed during runtime suspend and resume.
> 
> This is especially useful for global CAMSS clocks that are shared across
> multiple CAMSS subblocks.
> 
> This avoids the need for each subblock to reference and manage the
> shared clocks individually. A typical example is the set of clocks in
> the top_group, which may be used by CSID, PHY, CCI, and other CAMSS
> blocks.
> 
> Introduce a small PM clock descriptor table in the CAMSS resources
> structure to describe clocks and their optional rates. Initialize
> these clocks at probe time and delegate clock ownership to the PM
> core.
> 
> Hook PM clock handling into the runtime PM callbacks to ensure clocks
> are properly suspended and resumed alongside power domains and ICC
> paths.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 40 ++++++++++++++++++++++++++++++-
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..6a2bf3373e8755805c8cd0f8fe5037b788d68fa2 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -18,6 +18,7 @@
>   #include <linux/of_graph.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pm_domain.h>
> +#include <linux/pm_clock.h>
>   #include <linux/slab.h>
>   #include <linux/videodev2.h>
>   
> @@ -5346,6 +5347,35 @@ static void camss_genpd_cleanup(struct camss *camss)
>   	dev_pm_domain_detach(camss->genpd, true);
>   }
>   
> +/*
> + * camss_init_pm_clks - register shared CAMSS clocks with the PM clock framework
> + *
> + * Clocks listed in res->pm_clks are shared across all CAMSS sub-devices (e.g.
> + * top_ahb, axi). They are managed automatically by the PM framework.
> + */
> +static int camss_init_pm_clks(struct camss *camss)
> +{
> +	struct device *dev = camss->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!camss->res->pm_clks[0])
> +		return 0;
> +
> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i]; i++) {
> +		ret = pm_clk_add(dev, camss->res->pm_clks[i]);
> +		if (ret)
> +			dev_warn(dev, "failed to add pm_clk %s: %d\n",
> +				 camss->res->pm_clks[i], ret);

return ret;

---
bod
