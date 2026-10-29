Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268461;
	b=ObsW3N2kIaaevaU7ERANAaI1Q0rXKyiLaYbhWct9tB9OZRVlvM5Dp8/9zxSFmjkToL4S
	 GIiaEcqLq3kf5M8kM++gGCCrPORKfsv8RZ5dFYQuXJH4nZp1JLfIE2XrLKzWxihcKiN3C
	 lx3jKtCQMiY8/TuynrhGbhKO6023BIjgF2Qfud0atil2CR2zm3bmwVLGoG36jOyB8p3f2
	 UqUE6ZQeMna13/GPKaY0rd07lAJTBkHJ3eSUTHJBOng8uNwXF7DzhAewb2lSXzOuwD6Hk
	 AqKVE2vWU857W8xe9BpBpsSZkV3i/TSqNiaZHEjMzl8enFxeQOYYLEaFsgYpuWWhH1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268461;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=TOvq++jCji0OxeCBeMHz8Jlu+ISSCvZ02t935RLGN40=;
	b=nT7fC1ep1b8xYGMumGjUUdLU322d1hQfHpk8dyR8+4ufPeKleKn4H8opYnIdBeVHk7e9
	 wNYmlWXHJgBLNYrlS4W0z631TwdHz1I69AkFXVKwxHQNey3a5xeA8n1LGLFiZ38Z1cHGr
	 +O3Fm/ugbsl0Lji72XNQhcH3LlufDKVPaG3NNHV+BFE8xX52aACNBUD6bK7UG4mVwstFF
	 kccYJ9IahMNvk1ahsoS3+m4kfewcw2F3t/zm+RX582bRZMA5086cHWLS0m+zXmvS8bxsx
	 YhkiXcoz9XM1ez0QeT9YsKbVHNIDQbyz7eJTfZC+wyU6fF+Qw2knGwxahpK4WwSswCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjPno7zX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C532606A31D
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjPno7zX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5F01F01825;
	Thu, 29 Oct 2026 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793268461;
	bh=TOvq++jCji0OxeCBeMHz8Jlu+ISSCvZ02t935RLGN40=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=YjPno7zXsS+XffsrD7dcOKjF9DimgPHXU9CJHGBdCtHnU4oVsG3Q3diZWVUKBfbuH
	 5ZxMJOyZwHEh+8013uXMPhrD20hAGdPGay7XT9In44lx42ZBsG+2bqbn8CENH6x3SX
	 meTrS0/jQSlM5KRXUiHbKEm6YtQ5/ZuEYPQ22z00ifRFziRnZhONsOpl+wYFqCODk3
	 GmMfmXZoCSUT0JclkTE0Vy2gQtmSR/VkQ84KSqB+1FrGFeRzlxL6fCQ9eWhe5u7wIp
	 aCQnukgpTefyJ9FYfgojlILvcUi6kT46AJ6FkUY+9TaYwvVg+8bIEkC9wO9ZYRHn0t
	 q/xX/g6URrlSQ==
Message-ID: <b4aa95de-174b-4a4d-b55d-136aaa2dabff@kernel.org>
Date: Thu, 29 Oct 2026 11:07:38 +0100
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
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [v4l-utils] [RFC/PATCH] v4l2-compliance: Don't check bytesused or
 timestamp for error buffers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20261027191929.2528156-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20261027191929.2528156-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 27/10/2026 20:19, Laurent Pinchart wrote:
> When DQBUF returns a buffer marked with the ERROR flag, the bytesused
> and timestamp fields are not meaningful. Don't check them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> I'm sending this as an RFC because the V4L2 API documentation isn't
> clear on the subject.
> 
> For the bytesused fields, I'm fairly confident that this change is good.
> A driver can't be expected to provide data for buffers with errors,
> especially if a transmission error occurred.

Dropping all the bytesused tests if ERROR is set isn't a good idea.
If ERROR is set, then bytesused is allowed to be 0, but you still want
to check that e.g. bytesused isn't > length. Otherwise applications that
do not check for the ERROR flag might try to read beyond the buffer size.

So we have to ensure that what the driver returns for data_offset and
bytesused won't go beyond the buffer size. But they may be 0 if the ERROR
flag is set.

> 
> Similarly, timestamping a buffer upon error may not be something we can
> always expect from drivers. I'm a bit more hesitant here though: while
> precise timestamping can't be guaranteed, a driver can always use some
> sort of timestamp. Doing so could cause issues though, as a driver for a
> device that provides hardware timestamping would need to switch to a
> software timestamp source for buffers with errors. That would not just
> complicate drivers, but would also make it awkward for userspace.

Makes sense.

> 
> There are a few open questions:
> 
> - Are there other buffer fields that we should ignore ?

Possibly the 'field'. In practice I think this might only be an issue for
interlaced formats. If we run into problems with that in v4l2-compliance,
then we can always address that later.

> 
> - Shoulg (some of) the ignored fields be required to have a specific
>   value ? For instance we could require the timestamp to be 0 on error.

No. Leave that to the driver. You'd have to analyze the existing drivers
just to figure out what they are doing today, and drivers using
V4L2_BUF_FLAG_TIMESTAMP_COPY may still copy the timestamp if they have
enough information to tell which output buffer originated the error.

But perhaps adding a note in the documentation saying that the timestamp is
unreliable for an ERROR buffer would be useful.

Regards,

	Hans

> ---
>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 22 ++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index dba471e5b488..47d4627ee373 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -393,16 +393,20 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
>  		warn_once("V4L2_BUF_FLAG_TIMECODE was used!\n");
>  
>  	if (mode == Dequeued) {
> -		for (unsigned p = 0; p < g_num_planes(); p++) {
> -			if (!(g_flags() & V4L2_BUF_FLAG_LAST))
> -				fail_on_test(!g_bytesused(p));
> -			if (!g_bytesused(p))
> -				fail_on_test(g_data_offset(p));
> -			else
> -				fail_on_test(g_data_offset(p) >= g_bytesused(p));
> -			fail_on_test(g_bytesused(p) > g_length(p));
> +		if (!(g_flags() & V4L2_BUF_FLAG_ERROR)) {
> +			for (unsigned p = 0; p < g_num_planes(); p++) {
> +				if (!(g_flags() & V4L2_BUF_FLAG_LAST))
> +					fail_on_test(!g_bytesused(p));
> +				if (!g_bytesused(p))
> +					fail_on_test(g_data_offset(p));
> +				else
> +					fail_on_test(g_data_offset(p) >= g_bytesused(p));
> +				fail_on_test(g_bytesused(p) > g_length(p));
> +			}
> +
> +			fail_on_test(!g_timestamp().tv_sec && !g_timestamp().tv_usec);
>  		}
> -		fail_on_test(!g_timestamp().tv_sec && !g_timestamp().tv_usec);
> +
>  		fail_on_test(g_flags() & V4L2_BUF_FLAG_DONE);
>  
>  		// The vivid driver has unreliable timings causing wrong
> 
> base-commit: c6600a7e342ef6e336fba02212c90b60a36ca02d

