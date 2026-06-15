Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1343AA9C4
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512212; cv=none; b=q/bbCjdFDvJxo7tQr0cpSu656tzore1OWfcRkCQE+7Tz7GVad4UYHhA+dp1bEgDPQsRBbs3il/ufNiN5QOBLj1KMa01HHUYKPNL3Q2+W1jIxHU3zrwJC9ld6PiB3mWqAEElOh6brTinCEJjFmJIBKqq4ilWMU+xznPgu+u+qeAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512212; c=relaxed/simple;
	bh=gqmW/ia5szlluJ4hSlmL8eMu8dTFgQD0M8A+nc06qEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNnUMIMSUZ6S65euO8sVqgrfp59ibYGSu2amp+1E0syUKhFcClFmenXPAuPtKJVR7J8KQa/uWoXfY/8wkYkw+wxkvLQoSFCbKD54XwYPQK5zCUwtMpQBV2qGTVVF/qjMMsfXZopLIOVNx6i2X3K1H7GGwR9uKzpfVxybv04NhGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=on9A57Ca; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="on9A57Ca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781512209;
	bh=gqmW/ia5szlluJ4hSlmL8eMu8dTFgQD0M8A+nc06qEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=on9A57CaTogO2sUsUTRG4Xjuo6mL8MVWkOeS4zssFDULGDHSquQJKq9m2KNfzRZ45
	 l/56aOPUBJm8W+KTmuasHR5HgPyCS6u1FRIKRc1+bxhuS2BweW7hFlxbSMpw5o/Q2h
	 1FkjTEBirCAM/CUfQ6L7zMOS8U2fwt8iHC6RaR9RuJjC+rcDpxq09w3PWno0ohGR9n
	 2MvDCqHzkEuBBIzD+0P8RCWn+wMzpT4itsCf73iCUIyFInGUCloC3wybNTqGlcDxyd
	 /n3AMMDKXxMocLit4m43zoMs8ipQsywXBKJeoidJGoyKcT2U+JtuAuYiKuG3s5z9Ew
	 FSBCrQdUW+xXg==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD36117E04CA;
	Mon, 15 Jun 2026 10:30:08 +0200 (CEST)
Message-ID: <0769e561-9bd0-4eab-8b76-21e90c3b1986@collabora.com>
Date: Mon, 15 Jun 2026 10:30:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/22] media: platform: hantro_drv: Add missing
 media_entity_cleanup()
To: Biren Pandya <birenpandya@gmail.com>, linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260614202835.11977-1-birenpandya@gmail.com>
 <20260614202835.11977-17-birenpandya@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260614202835.11977-17-birenpandya@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 14/06/2026 à 22:28, Biren Pandya a écrit :
> The media_entity_pads_init() (or media_entity_init()) function initializes
> the media entity, but the driver forgets to call media_entity_cleanup()
> in the error paths and remove function. Add the missing calls to fix the
> API violation and prevent potential future memory leaks.
>
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Thanks

> ---
>   drivers/media/platform/verisilicon/hantro_drv.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 2e81877f640f..ad71c0402ef3 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -771,8 +771,10 @@ static int hantro_register_entity(struct media_device *mdev,
>   		return ret;
>   
>   	ret = media_device_register_entity(mdev, entity);
> -	if (ret)
> +	if (ret) {
> +		media_entity_cleanup(entity);
>   		return ret;
> +	}
>   
>   	return 0;
>   }
> @@ -860,12 +862,13 @@ static int hantro_attach_func(struct hantro_dev *vpu,
>   
>   err_rel_entity2:
>   	media_device_unregister_entity(&func->sink);
> -
> +	media_entity_cleanup(&func->sink);
>   err_rel_entity1:
>   	media_device_unregister_entity(&func->proc);
> -
> +	media_entity_cleanup(&func->proc);
>   err_rel_entity0:
>   	media_device_unregister_entity(&func->vdev.entity);
> +	media_entity_cleanup(&func->vdev.entity);
>   	return ret;
>   }
>   
> @@ -878,6 +881,9 @@ static void hantro_detach_func(struct hantro_func *func)
>   	media_device_unregister_entity(&func->sink);
>   	media_device_unregister_entity(&func->proc);
>   	media_device_unregister_entity(&func->vdev.entity);
> +	media_entity_cleanup(&func->sink);
> +	media_entity_cleanup(&func->proc);
> +	media_entity_cleanup(&func->vdev.entity);
>   }
>   
>   static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
