Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6758A3B19AA;
	Mon, 11 May 2026 13:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506149; cv=none; b=QJZuO4LDGAlxgu+YCvwMYskUUUA6XvJMnS278q2G8pzQ6MUHGyFWn6395uA0stiqxU/BOtVHOLCAPigQJt0b+QOw4+MHvtaXmKUvLbibi0TMc/fqLpj7jMT9xqw2pFvvo7IL/iLtWZvPiY4s3o+UkU/BgLjkHvtvatIv9ToEW5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506149; c=relaxed/simple;
	bh=gFdH8uo+DqCNAjdUs4qcOo7c5e9ICNafuOup388OgAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJBaUUQJEAKcBTGxQFKztqXBJz5DLsxvwAxpyetPFDE49ngAqA5xkiGfBiewRBEpZdEGxzFO6m1KTpn/bSKAuQSk53EadYwf4B2qKtawVGFxLJNWFqV4ald7FvO0zQzENc5404vHiLAksg1JqYI+rQosPYABDMOOKIOrYNlp2JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjptUJeu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjptUJeu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2DEC2BCFB;
	Mon, 11 May 2026 13:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778506149;
	bh=gFdH8uo+DqCNAjdUs4qcOo7c5e9ICNafuOup388OgAE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BjptUJeuB9zjPH5is4dXFBRU+OwyHrFOlMzgyBmyTWwpiClYUB8dHdwHEt3QLcVkC
	 iWcrXF4C/fVTZy3HdJjFBlH6+u9HrghiCm8+7H60Ive9FYluirp3hdWpWJauU6mP2P
	 rWO24fP40j6jIgtS0ACY0I/EEk2F618HTiP2Rava++txV4F1k6P/f9ZLmQjC/7e2Qt
	 cx7Sf5ulDPs979wC+jeNYI5BxcAM4RBmcfT5YoCvVy8W6201AsNaAt2QFHtxOr78Zr
	 h8ZaAOqsH7TEJCd72UVeUUK/eyDPg5B4Ho8y7M/IPsapMCiWr5hq81BiL81g6r4Vff
	 3TceSkJ0Q6cbw==
Message-ID: <9ac8787a-b7ba-4f84-a17c-4c1440cabdac@kernel.org>
Date: Mon, 11 May 2026 15:29:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: uvcvideo: Avoid partial metadata buffers
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260417-uvc-meta-partial-v2-0-31d274af7d2d@chromium.org>
 <20260417-uvc-meta-partial-v2-2-31d274af7d2d@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260417-uvc-meta-partial-v2-2-31d274af7d2d@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Apr-26 07:19, Ricardo Ribalda wrote:
> If the metadata queue that is empty receives a new buffer while we are
> in the middle of processing a frame, the first metadata buffer will
> contain partial information.
> 
> Avoid this by tracking the state of the metadata buffer and making sure
> that it is in sync with the data buffer.
> 
> Now that we are at it, make sure that we skip buffers of size 1 or 0.
> They are not allowed by the spec... but it is a simple check to add and
> better be safe than sorry.
> 
> Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
>  drivers/media/usb/uvc/uvc_video.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 5d45c74c6041..cd77ca6f8136 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1149,7 +1149,9 @@ static void uvc_video_stats_stop(struct uvc_streaming *stream)
>   * uvc_video_decode_end will never be called with a NULL buffer.
>   */
>  static int uvc_video_decode_start(struct uvc_streaming *stream,
> -		struct uvc_buffer *buf, const u8 *data, int len)
> +				  struct uvc_buffer *buf,
> +				  struct uvc_buffer *meta_buf,
> +				  const u8 *data, int len)
>  {
>  	u8 header_len;
>  	u8 fid;
> @@ -1278,6 +1280,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  
>  		/* TODO: Handle PTS and SCR. */
>  		buf->state = UVC_BUF_STATE_ACTIVE;
> +		if (meta_buf)
> +			meta_buf->state = UVC_BUF_STATE_ACTIVE;
>  	}
>  
>  	stream->last_fid = fid;
> @@ -1435,7 +1439,7 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
>  	ktime_t time;
>  	const u8 *scr;
>  
> -	if (!meta_buf || length == 2)
> +	if (length <= 2 || !meta_buf || meta_buf->state != UVC_BUF_STATE_ACTIVE)
>  		return;
>  
>  	has_pts = mem[1] & UVC_STREAM_PTS;
> @@ -1552,7 +1556,7 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
>  		/* Decode the payload header. */
>  		mem = urb->transfer_buffer + urb->iso_frame_desc[i].offset;
>  		do {
> -			ret = uvc_video_decode_start(stream, buf, mem,
> +			ret = uvc_video_decode_start(stream, buf, meta_buf, mem,
>  				urb->iso_frame_desc[i].actual_length);
>  			if (ret == -EAGAIN)
>  				uvc_video_next_buffers(stream, &buf, &meta_buf);
> @@ -1601,7 +1605,8 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
>  	 */
>  	if (stream->bulk.header_size == 0 && !stream->bulk.skip_payload) {
>  		do {
> -			ret = uvc_video_decode_start(stream, buf, mem, len);
> +			ret = uvc_video_decode_start(stream, buf, meta_buf, mem,
> +						     len);
>  			if (ret == -EAGAIN)
>  				uvc_video_next_buffers(stream, &buf, &meta_buf);
>  		} while (ret == -EAGAIN);
> 

