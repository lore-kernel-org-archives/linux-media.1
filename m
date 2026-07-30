Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52C13D413C
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785400744; cv=none; b=c2qMbfwz3s9XmCFtvWxaLbNz05ZshO6IUSa6dAXNwy7uSSYbBi8duTSIbR4UKe1eBomgSFKkZmdNIJtB6/347MUv160TVUndZ6lRlPY6HWc9JEeU7lfJQkDxOtakByTi0iYm+WAlFzrR3wHTGc0Okkiz7jWYLsLjQTAwAtV52Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785400744; c=relaxed/simple;
	bh=bnoklQTVbTeNGwqtd87yLfBvVJfKM3Ux5RhP73hG3Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDDqVUDHSVnUNRSYRo0B7K5fGQ3+RD7HcZ0bWfvHYV7tls65sta9GTTZTYlqr6XFn1a9WolskH6CEsvANZ13k3m/ONN1m1eapgzVC6lF1+IuhEx2XDrx1OKvNucWMrrx+cTMG5AkN7pxJJ/BuDddfat3zGhKBxUirYNzcQjxetg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x0CHts/7; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x0CHts/7"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1c24ec9525so318531266b.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 01:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785400740; x=1786005540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FkYK6dd5edwcDAVNaFfBC6T7A7KyI3+YEgz2sgH0OM=;
        b=x0CHts/7Waqq+8s+MChmXEifypKYd+RlaKjKb9wnD9jfMg8aR0Tjz3RecFwF8YoTL8
         8lmG0MZ2n/37XckqGFu300vJ6WfsEjA299wMeLOLxZdD5t5N1MlvwpN8CiCZYIPR2NPt
         zaoN6HqClQV8U3q125HhEQGTAPmQRGAw4OKj4Di9sq7R0fe+2LClafKAmY1n0a+TLfXa
         7e1dtu3EKj2yxULXF7Lw97HEASt+zbMOf0gwif0ofmTS4o3bqU1b04aFXa83aOG2X9KN
         jTtD12DGKFt1Lyu/cyHFpE9PdNA7wVwwIb+vdWq8aHxSZDh4i0j2pu9k84qjWGKFb3Rt
         svZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785400740; x=1786005540;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FkYK6dd5edwcDAVNaFfBC6T7A7KyI3+YEgz2sgH0OM=;
        b=r9mOK9YileYzBUIT8RaBAbm3VzsmRNMN6wFJfshkTuJ5vr+NjQ7FkcJLMtZ+rE+10q
         seV0wXe5b07O15Oow9j5bTbGfXvtlNeydv3zMV+1T2n6/C0j+3XcZl/jevU1fhi4Y2R8
         oHkPgyQbkmFjCVVt/JL71pPNERpWCUEw0RTVniYMLuQ3/0fkRR3D5kY/6iaN8jb+cgXu
         3/weE6MJnLTGnWrZbfw8VpnMe8NbChOOx8iMOl7SvWz+/cTaWeaBJB1eS5pT84J/pMLe
         dBBgSTJA0TfeeQRl7tl3ZYElhbHtUFyh4lCnEeJi1eywc6YCFoTQ2Nis+/w8amrlTDVT
         ylRQ==
X-Gm-Message-State: AOJu0Yy0TSM40yNlHgp9qwRYge1cRPWsesVbE4Sv4NfkgF4DA8ES964B
	f/ApAUDYWA5BqbGlsm06iyT7iftxn/upBySxsW4bGpG67OG2vj8NAPuCLnvzBgPYwBLMhgxQioE
	mojSWacA=
X-Gm-Gg: AR+sD12qnljpNAm8GJP3LxP2+tPT72A0T6OODUt3EMgVLiJJHM7q5I/RFT7MqMlAmov
	etlRoIDxhkrFBmJXsiwp3nkO8N7Pb63MygEhZuZL+UzPUK4gh6ylz7e0Met5mv+tjcgARqBACaL
	CQEt+RWzU+P2Ke1oJSru9gjuboTSpUdsI7VjqgiLWaw/aaGTq7Km6U2h29F7phXLq2J1250nFsH
	3flWg/yTAPCSG8LI3INDLVA+QOELZieSmQ65yi6oiytBL+PJzWHSwpWMwt54FMW0F0dCRL4+JHv
	j9oW3Gd7yznR0zV39zY5d7sBrI8kQ6xaT2T4PuxfjHVwPqRdFA7HbKG6a3a21gl7ip2nahsMupd
	7pIUA20qmDM80LTVmFJcKqLl1/09Yl26KoQklifhH6G0pPzWZAtT0693TA/D52vbvD7oY/QtRCP
	77+ZCrO8J10aDpNfUAOIdjwvmoiqIHuHr35HaqIrqEhqK+xTLNHBshWuZfmwKOA/iiafAH+mI6
X-Received: by 2002:a17:907:d10:b0:c12:959a:1477 with SMTP id a640c23a62f3a-c1fa57076cemr85304566b.40.1785400739622;
        Thu, 30 Jul 2026 01:38:59 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.38.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07c7682bfsm337996a12.1.2026.07.30.01.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 01:38:59 -0700 (PDT)
Message-ID: <a4a1dc46-ff07-4ecb-b41f-341b6aacb3ab@linaro.org>
Date: Thu, 30 Jul 2026 09:38:58 +0100
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
Content-Transfer-Encoding: 8bit

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
> +	}
> +
> +	return 0;
> +}
> +
>   /*
>    * camss_probe - Probe CAMSS platform device
>    * @pdev: Pointer to CAMSS platform device
> @@ -5434,6 +5464,10 @@ static int camss_probe(struct platform_device *pdev)
>   
>   	pm_runtime_enable(dev);
>   
> +	ret = camss_init_pm_clks(camss);
> +	if (ret)
> +		goto err_v4l2_device_unregister;
> +
>   	ret = camss_parse_ports(camss);
>   	if (ret < 0)
>   		goto err_v4l2_device_unregister;
> @@ -5775,7 +5809,7 @@ static int __maybe_unused camss_runtime_suspend(struct device *dev)
>   			return ret;
>   	}
>   
> -	return 0;
> +	return pm_clk_suspend(dev);
   CC      drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.o
   CC      drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.o
   AR      drivers/staging/media/ipu7/built-in.a
In file included from ./include/uapi/linux/posix_types.h:5,
                  from ./include/uapi/linux/types.h:14,
                  from ./include/linux/types.h:5,
                  from ./include/linux/kasan-checks.h:5,
                  from ./include/asm-generic/rwonce.h:26,
                  from ./arch/x86/include/generated/asm/rwonce.h:1,
                  from ./include/linux/compiler.h:369,
                  from ./include/linux/err.h:5,
                  from ./include/linux/clk.h:12,
                  from drivers/media/platform/qcom/camss/camss.c:10:
drivers/media/platform/qcom/camss/camss.c: In function 
‘camss_runtime_suspend’:
./include/linux/stddef.h:8:14: error: called object is not a function or 
function pointer
     8 | #define NULL ((void *)0)
       |              ^
./include/linux/pm_clock.h:77:25: note: in expansion of macro ‘NULL’
    77 | #define pm_clk_suspend  NULL
       |                         ^~~~
drivers/media/platform/qcom/camss/camss.c:5841:16: note: in expansion of 
macro ‘pm_clk_suspend’
  5841 |         return pm_clk_suspend(dev);
       |                ^~~~~~~~~~~~~~
drivers/media/platform/qcom/camss/camss.c: In function 
‘camss_runtime_resume’:
./include/linux/stddef.h:8:14: error: called object is not a function or 
function pointer
     8 | #define NULL ((void *)0)
       |              ^
./include/linux/pm_clock.h:78:25: note: in expansion of macro ‘NULL’
    78 | #define pm_clk_resume   NULL
       |                         ^~~~
drivers/media/platform/qcom/camss/camss.c:5851:15: note: in expansion of 
macro ‘pm_clk_resume’
  5851 |         ret = pm_clk_resume(dev);
       |               ^~~~~~~~~~~~~
make[7]: *** [scripts/Makefile.build:289: 
drivers/media/platform/qcom/camss/camss.o] Error 1
make[7]: *** Waiting for unfinished jobs....
   CC      drivers/media/usb/pwc/pwc-misc.o

Please fix.

---
bod
