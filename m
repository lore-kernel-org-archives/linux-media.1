Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B823E4C99;
	Mon, 18 May 2026 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094950; cv=none; b=ZZXVPwc38HLemjIUZyiZvZYbwQeDkO2AY9zJQemNghxt3ipcTJ6meG/kzxf1SE5eRJUCOcz8m2CU4g/0FXa6EIhRjGWKRJmk1Bl3TBMmrfXMgeDOaAWkRVtZERxCRjef41HrUPQWtuSbYUdfEIlU4pvLXZMJBSZ0W2DaC274JKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094950; c=relaxed/simple;
	bh=mkqh6tajjCTRtxuQ/nmbWYefsdsGtNA1pEcLfyMNdxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMnfci/OT3R4mo3s08XTL/tqyevL9NUPcK7N67MHyWTTQ+xJY9ZVjIBYU+Qn3zmSJdMbGl7BL2HhlcBVbat0ju1+dT6kFxaRpPKF4cCNLX11r2P74lFaYzQ/tr7/6r5WBCVq1Ijn4FLhi/5BVkv9mnBLqotaLxzHHK+OdtEMDBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NycOSLAT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NycOSLAT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C1DC2BCB7;
	Mon, 18 May 2026 09:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779094950;
	bh=mkqh6tajjCTRtxuQ/nmbWYefsdsGtNA1pEcLfyMNdxs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NycOSLAT7s/y4NrbZtbtHtzLAzuhXYziTeAjE+4WFw4SVS8uEPobAEOCNlUfFa6Ez
	 TJnY3E7zKOQTp60XoLyBYhtBik+fxX72IT/e0A8OujCsp8O4CM83pvNrQUXj6zzjHq
	 sRUel5nXR8+/USsTGCwS7r66UOJgxRcWlsJHmXBb/57JokO5N0vqo6Mr1Xv1+sQRqx
	 dALhgoeRGQIrryQHWLtHgbvUxbvCj7/S/NHJzP/UupCD1lKiZHjGzdpC6cZWNGDSfZ
	 h/8GD9DimDLeOLrPma9CXWnmpwmbH/MF2X3ULf7J9YCknbr85NjZzrPKf2p3gQH87C
	 UdLwu6G05Xjzw==
Message-ID: <17e2f68d-c414-471f-8705-80ff7c206fdc@kernel.org>
Date: Mon, 18 May 2026 11:02:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] media: uvcvideo: Only do uvc_video_get_time() if
 needed
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
 <20260513-uvc-hwtimestamp-v3-6-7a64838b0b02@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260513-uvc-hwtimestamp-v3-6-7a64838b0b02@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-May-26 1:49 PM, Ricardo Ribalda wrote:
> There is no need to calculate the current time if the sample is going to
> be filtered.
> 
> Move the assignment close to uvc_video_clock_add_sample().
> 
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_video.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 6794031cd0fb..1cc86a18b2bb 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -645,8 +645,6 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
>  		sample.dev_sof = sample.host_sof;
>  
> -	sample.host_time = uvc_video_get_time();
> -
>  	/*
>  	 * The UVC specification allows device implementations that can't obtain
>  	 * the USB frame number to keep their own frame counters as long as they
> @@ -687,6 +685,9 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	    (UVC_MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
>  		return;
>  
> +	/* This is expensive, only do it if the sample will be added. */
> +	sample.host_time = uvc_video_get_time();
> +
>  	uvc_video_clock_add_sample(&stream->clock, &sample);
>  	stream->clock.last_sof_processed = sample.dev_sof;
>  }
> 

