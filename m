Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794826571;
	b=Z9+1NGmK0gVTACJTxpyUlKeqgnDmWjdIX2lQCJCKbgrOffByZK92Nv1Ttw8b0hfyNmTq
	 3ktlTwtzvABCaaYO1jlIpjAI/Rh/1KbtNVOIVqUhFeSVBu2O09th45i6IN9HYYGmSKnJ5
	 s5jdXQCGjTKPTh/Ncqn/kS4WhoeLa49/Go3xfyVdUmhgTaFWF1ZFceFvE/H5+llnBvqb2
	 ihWLyMhjTvHQFp10/5W3r15tHazil2maDGfNWkRFkeEfpsCTzAnd5e6shwdIInkOPsQxL
	 1DIJ9NV9XmBoPz6Q4tUOxrmmAr6VhBJvHQlrd/txzT0dgpb8EHxbovaOdKNDqw3VV3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826571;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=i5vPhwDiE7z7Zwb8d0Muf0ZMZMm+vZas1a34TtADxvA=;
	b=PCZ3vy+gh+JIIXjy6R0O+aJbha5hc3tnae/cCeDvYgMun1MXsgwTyl1wOWnyM1gL9vtC
	 2FZ3FYTxo/DtBNUkDoCJzYDjLTuIPQy/BUBjbPMLH7gteVITKmoQ20alSnl+xTgBVF/o/
	 2R5MTVPGksogvZqFVfX8NoWOi1SXFfeyGadA5b2+2OsMev9ss16FuWtRWU1Uer1I0TLSl
	 KrTcRIk09KH2oH6UKIxxO/L+aj/kzVl5SIcLFsjs/HMHmcUzUzotd+Lz3nY9K+vRlqFVZ
	 FRHkkRr5aJ9SrKcgMicCD+kfQ9sap653Dh0UtTS0eImyQLNzJkAJ61+OyNav/gmZa/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=avk1WsRB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0017E606A31C
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0017E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=avk1WsRB
ARC-Seal: i=1; a=rsa-sha256; t=1794826543; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GbPbNJSXNaRNmYNwWn/zLQHSHHoKI9sWeN6ZDduUHeEJQ/ArS0IVNuHn60YSV3xUAhv70gzMKct3u7fN66czEzHQvpq85IVFjmFyx30qC/MKduA5P0YpO51BFqyB2CB3KO02xHXbgizR4MNkp6X7Raimq3+JyUvFOSBL7snUr90=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794826543; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i5vPhwDiE7z7Zwb8d0Muf0ZMZMm+vZas1a34TtADxvA=; 
	b=M8OA5ieLY/DncTFgQG1nsiBm0pkdqa+JRTnn+9hKr2/OvX7RntjIozO6WKaLScY+KYvhMM6IxpOxZiI3iUmFOyN/rtB+s8Ty65lTUs1Qa+SR0NUQwx+7QW5x/S2+QMtzN/Cat/bXYqCRiynmdx9CVXBFe5XdqEWfJHUMNAO6LqY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=avk1WsRB1rKeMbRbIpd0UBCE7NGrmA0pogpdxTodVom9cagcixa2m4uq+Oz91sI3L5O2giDBKZolzeJC2GH85fc8fjCjQLsUYo6p4eGGujIDUjuDE5OruWKG8/kPQ9iNvgK+GjdP8iR9PbcuhSFJK3hKBJf2Bay6Y4ijekAtzwA=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=i5vPhwDiE7z7Zwb8d0Muf0ZMZMm+vZas1a34TtADxvA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794826539849525.4495504025143;
	Mon, 16 Nov 2026 02:55:39 -0800 (PST)
Message-ID: <86a697d3-17f2-4637-91f4-8e3cc30377f9@collabora.com>
Date: Mon, 16 Nov 2026 11:55:33 +0100
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
Subject: Re: [PATCH v1 2/2] media: rockchip: rkcif: Validate the pixel format
 against the media bus code
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: linux-media@vger.kernel.org, paul.elder@ideasonboard.com,
 daniel@makrotopia.org, linux-rockchip@lists.infradead.org,
 Gerald Loacker <Gerald.Loacker@wolfvision.net>
References: <20261112183208.2688580-1-mehdi.djait@linux.intel.com>
 <20261112183208.2688580-3-mehdi.djait@linux.intel.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261112183208.2688580-3-mehdi.djait@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Mehdi,

Thanks for the patch!

I think I had a check like this in the source code once, but kicked it
out because it broke one of my valid pipelines. Let's take the first
entry of mipi_out_fmts for instance: the capture block can write
V4L2_PIX_FMT_YUYV image data to memory. However, I *think* it can not
only accept MEDIA_BUS_FMT_YUYV8_1X16 as input format for that, but other
mbus formats too. Thus, if I am not mistaken, we need to rework that at
some point.

Cc: Gerald who might have a pipeline that will be broken by this patch...

On 11/12/26 19:32, Mehdi Djait wrote:
> The link validation only checks the frame size, so a pixel format that
> does not match the media bus code on the source pad is accepted.
> 
> Reject such pipelines with -EPIPE.
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

...but all the above said, the patch as such is valid, but I think the
definition of possible formats needs a rework. I'll leave my

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

here just in case.

Best regards,
Michael


> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad55..66726f654674 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -460,6 +460,7 @@ static int rkcif_stream_link_validate(struct media_link *link)
>  {
>  	struct video_device *vdev =
>  		media_entity_to_video_device(link->sink->entity);
> +	const struct rkcif_output_fmt *fmt;
>  	struct v4l2_mbus_framefmt *source_fmt;
>  	struct v4l2_subdev *sd;
>  	struct v4l2_subdev_state *state;
> @@ -489,6 +490,17 @@ static int rkcif_stream_link_validate(struct media_link *link)
>  		goto out;
>  	}
>  
> +	fmt = rkcif_stream_find_output_fmt(stream, false,
> +					   stream->pix.pixelformat);
> +	if (!fmt || (fmt->mbus_code && fmt->mbus_code != source_fmt->code)) {
> +		dev_dbg(stream->rkcif->dev,
> +			"link '%s':%u -> '%s':%u not valid: Format mismatch\n",
> +			link->source->entity->name, link->source->index,
> +			link->sink->entity->name, link->sink->index);
> +		ret = -EPIPE;
> +		goto out;
> +	}
> +
>  	ret = 0;
>  
>  out:

