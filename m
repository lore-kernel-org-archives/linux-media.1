Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0971D4772B2;
	Thu, 23 Jul 2026 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821735; cv=pass; b=ZQDw3oy1jUs7XeYZqQZGIIroA63X9D+KcYQNnYzFtikqlnWXNx1JEG7XrknzwyuXCDedeFrqNskDoGfA/dnknbFfLdyequ9WW++KTZ/j8Nc25zFaD3x1zBgkJJ67DfRd5SS4qESbNCRK7+/Lx8AggIXoYYXSc+A/lmsKBZexqZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821735; c=relaxed/simple;
	bh=5m89t1kVtJXwqB+lKT32rHOdq1cxYta4pNNHNACTl7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwA7+NTjUsztoMK6aZM29SmNyM2O/D4AO552zOTO8ly0yDtD65xFNFZ1oKTcHWGbdXIBMB5CqNg6SH3jpzRKLTY24UGigz6v29mbbgb2YvgW/P7B+Na/966uL5KZCUE+dCfb+KBbsD4W89D6QUP8+pwwlkW7iJR+5173ALjnknM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=TkZ8ufJv; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="TkZ8ufJv"
ARC-Seal: i=1; a=rsa-sha256; t=1784821674; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nV3GWbEp0XVXoaHH8AELKpRqI5Ple7OfQZc6LPrS0wbJiCOiU1kZOu+gh9idRaimyX4rqaA+vPIKTMwfhTtmbDY+XJAqwFNooF2/CQjx0ytDw2VoJDYpZaEb7XOdWBbtjNmaSX/x2s6xKURT+4rW0TZSoaUT+Wpi80rMzvi4UOo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784821674; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4f10VgaedUle4y917j0RkomsQFduTcKlicQl04iv244=; 
	b=iDozdgvqLZVSbXnmx986QBg63V5ontWBSgTJFvFf3D4T0VVr0eupXl4Szo85VYBMjxh8PUGxzlvHSTeLsjxLzlSUzOlPG5MUg1bIofgAEhxBDhPeoiIO8BIX1mOzMx177gQJt5nMhJYEA9bv2g7E/dmaby8e+f4w75urHm6aIVU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784821674;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4f10VgaedUle4y917j0RkomsQFduTcKlicQl04iv244=;
	b=TkZ8ufJv+ODKNZ7LV1Wkje/LBQkGE/i2X/j6bwD+Ki/kmjhlXxn5vMWjhZotelwS
	+nMbPXS+OUPGv2B4fz5IuVBTm/NGKObRlPMChnIJt7ohsB7FI8w60bbwvegZd8IrnL0
	HfAvohhqLBHbwJOFyOfkqLnyomldxOab1GzlCqUE=
Received: by mx.zohomail.com with SMTPS id 1784821672515696.391367355813;
	Thu, 23 Jul 2026 08:47:52 -0700 (PDT)
Message-ID: <f005676b-0229-47a2-9ea7-bd1809396c43@collabora.com>
Date: Thu, 23 Jul 2026 17:47:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: hantro: disable runtime PM before hardware
 teardown
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 me@brighamcamplbell.com, jkoolstra@xs4all.nl
References: <20260722160820.2401-1-tharitt97@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260722160820.2401-1-tharitt97@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 22/07/2026 à 18:08, Tharit Tangkijwanichakul a écrit :
> Removing the Hantro driver may trigger an SError on RK3588:
> 	SError Interrupt on CPU6, code 0x00000000be000011 -- SError
> 	...
> 	do_serror+0x5c/0x74
> 	el1h_64_error_handler+0x34/0x50
> 	el1h_64_error+0x6c/0x70
> 	regmap_mmio_read32le+0x10/0x20 (P)
> 	_regmap_bus_reg_read+0x6c/0xb4
> 	_regmap_read+0x60/0xdc
> 	regmap_read+0x4c/0x80
> 	rockchip_pd_power+0xe4/0x600
> 	rockchip_pd_power_off+0x1c/0x60
> 	_genpd_power_off+0x98/0x198
> 	genpd_power_off.part.0+0x178/0x288
> 	genpd_runtime_suspend+0x210/0x300
> 	__rpm_callback+0x48/0x1e0
> 	rpm_callback+0x74/0x80
> 	rpm_suspend+0x10c/0x580
> 	rpm_idle+0x134/0x1b8
> 	update_autosuspend+0x30/0xc4
> 	__pm_runtime_use_autosuspend+0x48/0x64
> 	hantro_remove+0x8c/0xa8 [hantro_vpu]
> 	...
>
> hantro_remove() currently asserts the device resets before disabling
> runtime PM.
>
> Calling pm_runtime_dont_use_autosuspend() causes an idle device to be
> runtime-suspended immediately. At that point the Hantro hardware has
> already been torn down, while the generic power-domain genpd code
> still performs the power-off sequence. genpd regmap_mmio_read causes panic
> subsequently because the reset lines were asserted.
>
> Disable runtime PM before asserting the reset lines so that no runtime-PM
> transition can race with hardware teardown.
>
> Apply the same ordering to the probe error paths as well.
>
> Fixes: ea71631b7129 ("media: hantro: add support for reset lines")
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/verisilicon/hantro_drv.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 2e81877f640f..bbeec5ae509a 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -1212,7 +1212,7 @@ static int hantro_probe(struct platform_device *pdev)
>   	ret = clk_bulk_prepare(vpu->variant->num_clocks, vpu->clocks);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Failed to prepare clocks\n");
> -		goto err_rst_assert;
> +		goto err_pm_disable_assert_reset;
>   	}
>   
>   	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
> @@ -1266,8 +1266,11 @@ static int hantro_probe(struct platform_device *pdev)
>   	v4l2_device_unregister(&vpu->v4l2_dev);
>   err_clk_unprepare:
>   	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
> -err_rst_assert:
> +err_pm_disable_assert_reset:
> +	pm_runtime_dont_use_autosuspend(vpu->dev);
> +	pm_runtime_disable(vpu->dev);
>   	reset_control_assert(vpu->resets);
> +	return ret;
>   err_pm_disable:
>   	pm_runtime_dont_use_autosuspend(vpu->dev);
>   	pm_runtime_disable(vpu->dev);
> @@ -1287,9 +1290,9 @@ static void hantro_remove(struct platform_device *pdev)
>   	v4l2_m2m_put(vpu->m2m_dev);
>   	v4l2_device_unregister(&vpu->v4l2_dev);
>   	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
> -	reset_control_assert(vpu->resets);
>   	pm_runtime_dont_use_autosuspend(vpu->dev);
>   	pm_runtime_disable(vpu->dev);
> +	reset_control_assert(vpu->resets);
>   }
>   
>   #ifdef CONFIG_PM
>
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
