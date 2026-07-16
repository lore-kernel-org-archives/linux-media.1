Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934363A963D
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189968; cv=none; b=gRIfG7lrXjo+iH+2KfoP8k1VqMgDVu9aLBqxI9BMsg4s9m41T0wTRq7Bu3Fwj80ndG1cRrhH+3bwpVY9OYrB1VPlqHOVw46BbNwmljiPYNzdFz3WULaQjSEpuwU9Bo0hjK15jm/6pDcCkJAVG+/XTKxE0KdWNe9HoUzo/bte4RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189968; c=relaxed/simple;
	bh=4pXxj9sflnXVnalwaaDAVzItXeY414uRgyR603la7jI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=ViSkqL8nDQtX0qwGGjYoMyvcGlfyUef3JpSCIJNrzJDUozBiXrW6T8YlVMLq5TX80YM3Nximp5MgGpJ9u5umP+PaYjy5sc8CLXuVw1Ppq/oZ/t9pbWHKLjUAbp410ObrcbN2bAAaGBXihmuEI1Cvrt646pDuhnaLcKX/dQAgHfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXMJBIWn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXMJBIWn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDE31F000E9;
	Thu, 16 Jul 2026 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784189967;
	bh=26TFCm6yWYRVvkT/OLb++D7uL8+W4OBNNvAUK/q6jVI=;
	h=Date:From:Subject:To:References:In-Reply-To;
	b=fXMJBIWni1RcKBAdO3sKiv3aGyz5Vrle9E/7I1wvHSln1DkTST4kawZk1m7n7M/UT
	 dHC2iPfk0kEvJOCXzc4F8xmz6gTCS0pz+Q3B86ubxEjQ/NBIka6ry9ViyNPZU/o3sH
	 xNOwNg6qDYXmg9IjQ5Q9xjqB8pn3BwTIOxrVpX3JvjCUhJR4pnnzfkwtgwSUDJjZXc
	 HyiIkrApZ7/PknXjOelrbd+qWxJSWEv2DK2l2yUKFHmYo2L8vmyMEZcpLtK2q020uy
	 0roeH284ZKpykNvFaWTM5C/iInh9D2Gy/MX4Gny7/EL5QylmgSmXGyk/UFivbOx9cO
	 WLjUQP7rZ/cjw==
Message-ID: <87aa7ed3-f2e4-4873-9113-adb19b290556@kernel.org>
Date: Thu, 16 Jul 2026 10:19:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] utils: fwht: support resolution changes
To: Rivka S <s0533160580@gmail.com>, linux-media@vger.kernel.org
References: <20260326081211.26562-2-s0533160580@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260326081211.26562-2-s0533160580@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Rivka,

Apologies for the late reply!

On 26/03/2026 09:12, Rivka S wrote:
> The FWHT decoder currently fails when the resolution changes
> between frames.
> 
> Instead of returning -EINVAL, update the internal state to match
> the new resolution.
> 
> When a resolution change is detected:
> - Update visible width and height from the frame header
> - Recalculate coded dimensions
> - Update stride and reference stride
> - Reset GOP-related state
> 
> Also recompute dependent values such as dst_chroma_stride,
> ref_chroma_stride and dst_size after updating the state.
> 
> On the userspace side, ensure the destination buffer is large enough
> for the updated frame size and reallocate it if needed.
> 
> This allows decoding streams with dynamic resolution changes.
> 
> Tested using a custom FWHT decoding script.
> 
> Signed-off-by: Rivka Sabo <s0533160580@gmail.com>
> ---
>  utils/common/codec-v4l2-fwht.c | 29 ++++++++++++++++++++++-------

Note that codec-v4l2-fwht.c is a copy of the linux kernel source
drivers/media/test-drivers/vicodec/codec-v4l2-fwht.c. So any changes should
go there.

But I don't think the problem is in that code.

How exactly do you test this? Are you streaming over a socket? (qvidcap -p)

Streaming over a socket does not support dynamic resolution changes, that's
correct. But that's something that (I think) needs to be fixed in v4l2-ctl and
qvidcap.

Regards,

	Hans

>  utils/qvidcap/capture.cpp      | 15 ++++++++++++---
>  2 files changed, 34 insertions(+), 10 deletions(-)
> 
> diff --git a/utils/common/codec-v4l2-fwht.c b/utils/common/codec-v4l2-fwht.c
> index 0c83678f..f45b06c3 100644
> --- a/utils/common/codec-v4l2-fwht.c
> +++ b/utils/common/codec-v4l2-fwht.c
> @@ -288,9 +288,9 @@ int v4l2_fwht_decode(struct v4l2_fwht_state *state, u8 *p_in, u8 *p_out)
>  	const struct v4l2_fwht_pixfmt_info *info;
>  	unsigned int hdr_width_div, hdr_height_div;
>  	struct fwht_raw_frame dst_rf;
> -	unsigned int dst_chroma_stride = state->stride;
> -	unsigned int ref_chroma_stride = state->ref_stride;
> -	unsigned int dst_size = state->stride * state->coded_height;
> +	unsigned int dst_chroma_stride;
> +	unsigned int ref_chroma_stride;
> +	unsigned int dst_size;
>  	unsigned int ref_size;
>  
>  	if (!state->info)
> @@ -309,10 +309,25 @@ int v4l2_fwht_decode(struct v4l2_fwht_state *state, u8 *p_in, u8 *p_out)
>  	    state->header.magic2 != FWHT_MAGIC2)
>  		return -EINVAL;
>  
> -	/* TODO: support resolution changes */
> -	if (ntohl(state->header.width)  != state->visible_width ||
> -	    ntohl(state->header.height) != state->visible_height)
> -		return -EINVAL;
> +	if (ntohl(state->header.width) != state->visible_width ||
> +	    ntohl(state->header.height) != state->visible_height) {
> +		state->visible_width = ntohl(state->header.width);
> +		state->visible_height = ntohl(state->header.height);
> +		state->coded_width = vic_round_dim(
> +			state->visible_width + (info->width_div - 1),
> +			info->width_div);
> +		state->coded_height = vic_round_dim(
> +			state->visible_height + (info->height_div - 1),
> +			info->height_div);
> +		state->stride = state->coded_width * info->bytesperline_mult;
> +		state->ref_stride = state->stride;
> +		state->gop_cnt = 0;
> +		state->ref_frame_ts = 0;
> +	}
> +
> +	dst_chroma_stride = state->stride;
> +	ref_chroma_stride = state->ref_stride;
> +	dst_size = state->stride * state->coded_height;
>  
>  	flags = ntohl(state->header.flags);
>  
> diff --git a/utils/qvidcap/capture.cpp b/utils/qvidcap/capture.cpp
> index 6b41933e..8fff20c8 100644
> --- a/utils/qvidcap/capture.cpp
> +++ b/utils/qvidcap/capture.cpp
> @@ -1337,9 +1337,18 @@ void CaptureWin::sockReadEvent()
>  			offset += n;
>  			sz -= n;
>  		}
> -		if (is_fwht)
> -			fwht_decompress(m_ctx, dst, data_size, m_curData[p], m_curSize[p]);
> -		else
> +		if (is_fwht) {
> +			__u32 needed_out = m_v4l_fmt.g_sizeimage(p);
> +
> +			if (!m_curData[p] || m_curSize[p] < needed_out) {
> +				delete[] m_curData[p];
> +				m_curData[p] = new __u8[needed_out];
> +				m_curSize[p] = needed_out;
> +			}
> +
> +			fwht_decompress(m_ctx, dst, data_size, m_curData[p],
> +					m_curSize[p]);
> +		} else
>  			rle_decompress(dst, size, data_size,
>  				       rle_calc_bpl(m_v4l_fmt.g_bytesperline(p), m_v4l_fmt.g_pixelformat()));
>  	}

