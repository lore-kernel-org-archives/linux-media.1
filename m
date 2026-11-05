Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894802;
	b=vDKUURiU1NBX9ABJ9pbzjmIadYYGtF/ZymxDCwULk7yIpdlYTIqGNe6cuchw9q7sBRWp
	 0E3EzIOLgu375t8tvhMKvJfk+lCmyjDKxCZ7b3+m09YxW4SgiwqhYyQ3/eFqVN394os4+
	 /mKLHzhUop20If357mvK7+2KwuyQAqd6oi8YaJLzCPjrqN1tTZ41JCAsACYWynCzlCTVZ
	 fxQgnFMaw8z991aXZF1w6gdNg5sooWquSLZQpskZgoD1uHuKVTvvNNnp7EzC+6BvkJbiv
	 Udz+bGsMBs6ssgH6DOBWLbngw31w+YY1pDWIVSnWFbKco5bs+ejK/s55Is8XBYTUImA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Oc104d8dubVkVVOeovNlpZRvCxc8r/7mBsga0gOA0Zc=;
	b=G4923GPXVrnm8MD/mZ+N2+xAUZ9wG1q70UhLy2U7Qxc68C++wvG9CZChfdh8Qju2HW2f
	 eebD6+aG113LybnEewZoa8z4Rc8tPTI+Bodr1vZMjXHttiq1BWy4ryBUWToDm6UHK6g/o
	 86pLhY/Uw6lc+4c7/sqXvDnH3nJsT8rJE1Xk39UolRXZw+lTlpq+x7a0SOaUEbGiwB2E1
	 WcJqE7cHi41SP816nwAFS3oAtuOtpPvOUJi1u09C10hr/qOezdxPCuFWuqQVEGy7g/0Cq
	 grWSVa6lEPBjM+Jn2Tdn7sunuD2oiiiG1CW2MTK5j43wn0CQxRdN/vCfF/PUS0ha1jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="bZN/dLgT";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65034606BEA9
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 16:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65034606BEA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bZN/dLgT
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so19690705e9.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 08:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793894801; x=1794499601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oc104d8dubVkVVOeovNlpZRvCxc8r/7mBsga0gOA0Zc=;
        b=bZN/dLgTnwp3fVVxvRKU30Fx8i1rNQrjZjCQICPIYUDtFBMcNfXrz13yJLAP/Lag7D
         sM0fRylYUGUx9byUV6VmGokaPZhUs1RL/o8x9cHERoSkp8m9dTLG9eFqZ3F8ua3kIZyA
         TqnkIpYWzGYjtTVpFhrd+2emTG9VOHrEHirJ0Yho04oZsBkZ/DTQCOn7Lszf9NUQwu6H
         K/FxM9ySoLX8UhIFXx0oegPlstft3EhkIbYx82ggNtGeybiohK0FmIIhOtDrx4ugzrvw
         g1854rsGGOmmgAbre2IlSyJOs4ShUKOOsyUcBB5YaTwIv1sShYNju1wnbnu+h6QcV0rf
         56XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894801; x=1794499601;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oc104d8dubVkVVOeovNlpZRvCxc8r/7mBsga0gOA0Zc=;
        b=2ARrhgIAqzoznovoNRzsqImBsKKWHDRBCpQJWhRtTvhbqEvZBiVMpv8ExXfPoGYZX1
         UyzrUsrHoXzSjBl8PyKB35oZA/Hq/iCK2HW+BbmyAX5qAUKjFWS0B3sakoVCxcWgFr3M
         KnkuuKABamdXlDLxHskf411xaKheM1l0bRd/e8TGZMHgWyHSDE1LGwRT/jB2WMO0spSq
         eviimou1BRQyXcN+ONil71SzSK3jQsk1nLO9sBSd+DLtwO1UIAfrrzCQ6wc94jg8mReI
         N49oYi5bTBwjdGjeyXP16t0vgqrfgNHetZEMLFRObcjGEIsI1JBC+CZzuX+voFvwTPJt
         RQ0g==
X-Gm-Message-State: APuU4Z+sTwz3kFNaetRGIvWt7HULtTdV/ySibqmfVRT22TI0+ZMOvxhv
	aTATdxAQ1rzHnvCGGfw7mUTLUwWLiFVv/l0rzGJFEKyhW4E/n+GySluEiwLOgiXNLdc=
X-Gm-Gg: AYBFou2SV2Z8L6PszaQZG0EyihdkuBsMHIfU8RJjLlM66JNVjQ4OFXSlAlMAOgvsVSY
	I5fO9aM3/D8ARqaTwJ7u9lJYmDVeK2O7JmyIR0QrCQ10czFiZbuNsh1krIho2vwXcB8zQlyaDi/
	3A/gZ17wThT9wUukKb8Ew24MdtTvWTxif6+pOkS2ym7UsGGFbMyKHi7DIiZWmrpV9tHDllyfFo+
	T0Ren2pLPpcguv037Rj8987uuku0MXveRsLIazGp5plOFUSmdxvCDOAFLDFyv9DCI7MeDwT80mG
	8I/6ILs1EH3tIf3lXWXRm1UkJbYMF9EpiIOds0m2ccMqCx9cZpio0E9f30+qaGrg5LnHNhGpDmx
	WrhlRsYrGbBxpyfkO+jCYMEbju8IMnPqap5KYuagNii3wxy7Ft8iky6Y3eef1iDtP99zaKJ/TRB
	LpO6qtCtEaJWxyIxG6P7tljzei1J8zVPx45y22Fee7nUTTgjd1fKAOI4CaQXdbXg71z8MUVylZ8
	4mPSZvUnYTZ7xvGWgilKzzXNICLCUbRyi4NxbRiwx2V5jTPNdMZ5ALlSYxRsqG+dF+zJXVWTAW6
	xDIEiElEz9cOkdvnoxaJ7XivJw8NmJarUytjt3JT
X-Received: by 2002:a05:600c:c088:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4acda922e24mr314506055e9.1.1793894800616;
        Thu, 05 Nov 2026 08:06:40 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f0237aesm77536955e9.9.2026.11.05.08.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 08:06:39 -0800 (PST)
Message-ID: <770ddb46-2f4a-4eab-9ce0-fa537860c310@linaro.org>
Date: Thu, 5 Nov 2026 16:06:38 +0000
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
Subject: Re: [PATCH] media: qcom: camss: Use contiguous DMA buffers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Todor Tomov
 <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Allan Siriani <allan@fatecpompeia.edu.br>
References: <20261105-camss-fix-dma-v1-1-74e9ec56e518@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261105-camss-fix-dma-v1-1-74e9ec56e518@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2026 15:08, Loic Poulain wrote:
> The VFE write masters are programmed with a single base address per
> plane and then write the whole plane from there. video_buf_init() took
> that address from sg_dma_address() of the first scatterlist entry of a
> vb2_dma_sg buffer, which is only correct when the whole plane is mapped
> as one contiguous range in the device address space.
> 
> Neither the driver nor the hardware can handle a plane split across
> several DMA segments, so scatter-gather buffers were never really
> supported here. The issue stayed dormant because vb2_dma_sg gives no
> IOVA contiguity guarantee but still tries hard to keep the number of
> segments low, and with an IOMMU dma_map_sgtable() usually maps the
> whole table into a single IOVA range. The mapping therefore almost
> always came back contiguous in the device address space, so reading
> only the first entry happened to work.
> 
> Where that does not hold, the write master runs past the first segment
> and writes the rest of the frame into memory belonging to someone else.
> 
> This recently surfaced as patch proposals enforcing contiguity in
> camss itself, walking the scatterlist to verify that the DMA segments
> follow each other, which amounts to re-implementing what the dma-contig
> framework already provides.
> 
> Use vb2_dma_contig instead. It guarantees that each plane is mapped as
> a single contiguous range in the device address space, one IOVA range
> when an IOMMU is present, physically contiguous memory when there is
> none.
> 
> Fixes: 0ac2586c410f ("media: camss: Add files which handle the video device nodes")
> Reported-by: Allan Siriani <allan@fatecpompeia.edu.br>
> Link: https://lore.kernel.org/all/20261104202313.72494-2-allan@fatecpompeia.edu.br/
> ---

I'll fix this

> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Kconfig       |  2 +-
>   drivers/media/platform/qcom/camss/camss-video.c | 14 ++++----------
>   2 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
> index b51745c942c9fd71a95d09993213bde4b7e877e2..e1967bc20cf03ea1b0b159c5175294eeb40fe1c1 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -5,7 +5,7 @@ config VIDEO_QCOM_CAMSS
>   	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
>   	select MEDIA_CONTROLLER
>   	select VIDEO_V4L2_SUBDEV_API
> -	select VIDEOBUF2_DMA_SG
> +	select VIDEOBUF2_DMA_CONTIG
>   	select V4L2_FWNODE
>   	select GENERIC_PHY
>   	imply PHY_QCOM_MIPI_CSI2
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 0852eb6f13154cfae7147ce39d22de64d14a5cba..5de6ff5ecc76a2863e536fca1c40ae6b2de6dc0c 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -13,7 +13,7 @@
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-ioctl.h>
>   #include <media/v4l2-mc.h>
> -#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
>   
>   #include "camss-video.h"
>   #include "camss.h"
> @@ -154,16 +154,10 @@ static int video_buf_init(struct vb2_buffer *vb)
>   						   vb);
>   	const struct v4l2_pix_format_mplane *format =
>   						&video->active_fmt.fmt.pix_mp;
> -	struct sg_table *sgt;
>   	unsigned int i;
>   
> -	for (i = 0; i < format->num_planes; i++) {
> -		sgt = vb2_dma_sg_plane_desc(vb, i);
> -		if (!sgt)
> -			return -EFAULT;
> -
> -		buffer->addr[i] = sg_dma_address(sgt->sgl);
> -	}

I hadn't even realised this existed, ick.

> +	for (i = 0; i < format->num_planes; i++)
> +		buffer->addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
>   
>   	if (format->pixelformat == V4L2_PIX_FMT_NV12 ||
>   			format->pixelformat == V4L2_PIX_FMT_NV21 ||
> @@ -699,7 +693,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>   
>   	q = &video->vb2_q;
>   	q->drv_priv = video;
> -	q->mem_ops = &vb2_dma_sg_memops;
> +	q->mem_ops = &vb2_dma_contig_memops;
>   	q->ops = &msm_video_vb2_q_ops;
>   	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>   	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
> 
> ---
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> change-id: 20261105-camss-fix-dma-c32288664dd2
> 
> Best regards,

LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
