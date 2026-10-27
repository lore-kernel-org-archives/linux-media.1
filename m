Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139977;
	b=NLHqQgGZsRaxTQs79JXkzQroGNSOMnb+j2ilY0MjUdgm7xvqRVpKcdDMgBchhAu2hsdd
	 kku7mLoVB7hLm8Z027liAnbPWDkEVvino0M6BbV8VwhQwNQo9QTKJdMcWT9VQvST4OV3H
	 GUOeVrBvJKs+oSGqFlHeuIn8q4UkWsFNSSE7ijhvSveWj/z6VAAHWft3ujiP1hHb5+X4X
	 CRdNa4dqBwqDFhtSt7RZfJI0UoggnHkTIqiFL/lqrD/OCpb3JKVvzPngS+wGu7r1k+VtZ
	 d/xsDNOD6oy7FwcRgE7PyCSL7S1lsnJRcbNb4Yvm0KO50veq3x7gOIeAxncyaFJUVYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139977;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Hi1S5o6/5Hn+eb9Uz4vswpv5KcMHmoQwPjO3j1ggNbs=;
	b=KfP4qmg+4ztCXEMb6AKkGeD96p4kSjhgvSLwZTAVSl3TrVL+E+lrkMkCu3Nesdue7kBK
	 ts/9E8ls13WMSDv8h0Rs4kpc2tUHnBK09nVk9q2sytHh+NHv7dz4xJ7DCL0lM23Iipj21
	 rqBUj+giXKhL0B0nvcJrSPZYgWOOafttGfXk9JoYXONIdVD/efY0x/qN4e08hArrQSPI6
	 dxQbeqTQJWf+cp56HWZfYFMlMjf1tpx+j7YZvumXi+uWjU0fr5CIblW/4pcgTLocZfT56
	 eKy89WIaJjuSXgKK2oAehPizVjTNYBLnuhF6Vki7Av11Lz95JnyyZPkiTHTfvXUJ5dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVSifXhF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4A9606A31D;
	Tue, 27 Oct 2026 22:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVSifXhF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982A61F01828;
	Tue, 27 Oct 2026 22:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793139977;
	bh=Hi1S5o6/5Hn+eb9Uz4vswpv5KcMHmoQwPjO3j1ggNbs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QVSifXhFjn8eJF2swarmFpOkNB9wFhZbCgDfBXFrTQdK3Gm7df82T4AuV9W8G4mSk
	 dXvAIwgrQlEC0t4/K1At7qgul4PIg7wBSL+fAaCV7Rli56RkKv5HjLYUrhEmh8mYuw
	 kA07W8RlgnXV8BqQpa1zUSpxhPLXEDxpwrupyX7rMqJpqz2OXGr+vsHNS57d+kjxaU
	 hVI51J43YNl5xfQ6gl4OcvXgEgEIOCGHG1waDPf6BvKJ9WXP9ngRejmRxFpSwyHK1o
	 2M9s9ohuZ2aWGyuPyhY464SqCqsHIjvBr3HJ6q/qD8T7xawS5XBl0IpyNfRn4RJLEg
	 gCoBMP4PLHi4w==
Message-ID: <cd9fcbf0-fc93-4c0e-b2b7-34c4057e5b56@kernel.org>
Date: Tue, 27 Oct 2026 23:26:09 +0100
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
Subject: Re: [RFC PATCH 1/5] media: iris: Don't flag an empty source change
 LAST buffer as an error
To: Christian Cortner <ccortner@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Birk Skyum <birk.skyum@pm.me>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
 <20261027021934.22113-1-ccortner@gmail.com>
 <4Sunhzjffw3cqD9pTWQfGRsBoB9-FxgAMHNeS-RmLbNdPD2Ufk1spnI_codV5v6qtyyD0Go5uZFrAk6E_1EvCA==@protonmail.internalid>
 <20261027021934.22113-2-ccortner@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20261027021934.22113-2-ccortner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2026 03:19, Christian Cortner wrote:
> When the firmware completes a source change, it returns the last capture
> buffer from before the change flagged HFI_BUF_FW_FLAG_PSC_LAST, and that
> buffer can be empty. iris_hfi_gen2_handle_output_buffer() sets
> V4L2_BUF_FLAG_ERROR on every empty capture buffer returned while
> streaming unless it carries HFI_BUF_FW_FLAG_LAST, the flag that ends a
> drain, so the empty buffer that ends a source change reaches the client
> flagged both LAST and ERROR.
> 
> The stateful decoder interface says of this buffer, as it does of the
> one that ends a drain, that it "may be empty (with v4l2_buffer bytesused
> = 0) and in that case it must be ignored by the client, as it does not
> contain a decoded frame". With the ERROR flag, ffmpeg's h264_v4l2m2m
> decoder reports "capture: driver decode error" and outputs a corrupted
> frame.
> 
> Exempt HFI_BUF_FW_FLAG_PSC_LAST as well.

I really had to read the commit log, the code and then the commit log 
again to understand what this was saying.

Significant reduction of prose and more concise statements.
> 
> Fixes: 7adc11e6abf6 ("media: iris: Send V4L2_BUF_FLAG_ERROR for capture buffers with 0 filled length")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM sparse smatch
> ---
> Reference only, not for merging (no Signed-off-by); see the cover
> letter.
> 
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index f0782c4b1e6e..b4fe9066fcb8 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -390,8 +390,13 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
> 
>   	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
> 
> +	/*
> +	 * The empty buffer that ends a drain (LAST) or a source change
> +	 * (PSC_LAST) is not an error, the client just ignores it.
> +	 */
>   	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
> -	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST)) {
> +	    !(hfi_buffer->flags &
> +	      (HFI_BUF_FW_FLAG_LAST | HFI_BUF_FW_FLAG_PSC_LAST))) {

If the analysis is correct then this fix makes sense.]

Where do we get the conclusion from though - persumably from observing 
packet types returned by firmware ?

That would be a more convincing thing to put into the commit log than a 
log declarative.

>   		buf->flags |= V4L2_BUF_FLAG_ERROR;
>   	}
> 
> --
> 2.56.0
> 
---
bod
