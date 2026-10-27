Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140601;
	b=LR/mUVTJKZXBwMBdzOvbA1C3JOHLMOsA/ZqPWFFIxHLhvtmPKvL/Q7QYZh8ByyJzJ/P+
	 cEDrmW0CEyJHYb1aDt2fF0ZggMUDxt6RTfDRpPtFbH+COk001pNtX9gLzp9d4jZAHm952
	 klbHBBLemt3++3KK7yCtHfRyDVbzEy3gCeahkAu1Zj7pVSrKPevGClxVLdSlTxUHMeOUK
	 AmMybtvWnN+l0wlYHlQLLYWtRbwohnZZAkHQ08hOzKW08LDicJt3zxwdtj+/uOaEdRbos
	 ev/7O/sS6gGVnuITryTB+3R5TRbg+8jmuyHGSj06WNM869g5vBAAGPc9mcOunMxVrrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140601;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XZI5qDPhTmZVj1Qw6YTy5ddVyLHtDr9zUld9Eh7NGNY=;
	b=CggeVDlTst1xwDT4/guT+kBH+ZtE7tJSTUD0Okqd9sXTRncgtfD12Y86onTiB/d4lhRB
	 cLu+aJLHKMoWSHYP6VB2Qy3Xr4/ae46oxqbLiASrsTxcCBckl2CH7zghDCGPcHoJPcXcv
	 S3o3tDJ9kY7giaw6WUBIqMnH7xDHJBk9UX2cNMuuC98E9MHaQvTI6yWYV8qeaXJQTwo/X
	 IDrEqHHM1p9HX2IYekjdbJAFFWcJUDjq27p9k/bQFQNHOeBQqXVa/R0dbJ/511PsPcbVC
	 C3vzvALrHjrS7ToLu2W1nw/SP40hOQPvIum/8xuzWb/atz0leqHIrtz7WWPRnMUNiPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lF6yiStj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94303606A31D;
	Tue, 27 Oct 2026 22:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lF6yiStj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9AB1F01825;
	Tue, 27 Oct 2026 22:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793140601;
	bh=XZI5qDPhTmZVj1Qw6YTy5ddVyLHtDr9zUld9Eh7NGNY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lF6yiStjYM/71CMyOoLtytdD4zW7yZ+z52IEnXogMaB4klnlnPD8oulGlVpX4Hyaq
	 Td8E+oxHTj8EmR2ncPQ8iLvEUwbPIPOtrJ6k++W0yF14wxvH9I6bHTg/pMnn0aB+Vi
	 4N3/rISFHUVGDTv99Qc/MzN8vEY6Bez5O3wWzfEtxFM4ZuB09SHOT3pShh6F8lWIpZ
	 GLJD9iJFZfIC/WPEmrhF8a5N29wJNiBRPXOEkUvPm3tuNyeJ/IsyKebRCskCaVdeiL
	 7wdUfUTOdr2fybvWBU+P9oH0S43t35UA6Ve0nW9zVjdt9T3Av/CeIC1naLh41ciY6R
	 uQXL2i1cp84yg==
Message-ID: <9a02ffa7-5ea5-4952-9ef8-45c7fee8f0fe@kernel.org>
Date: Tue, 27 Oct 2026 23:36:38 +0100
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
Subject: Re: [RFC PATCH 2/5] media: iris: Update the CAPTURE stride and size
 on S_FMT(OUTPUT)
To: Christian Cortner <ccortner@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Birk Skyum <birk.skyum@pm.me>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
 <20261027021934.22113-1-ccortner@gmail.com>
 <wAdJeeSreSNXfknQstuVnZ0f_y_udNQMiMQa7xh12xaNjRrqWiYB8hprj6vd23FuMiQaYY3pMbZsk05LQjLOIA==@protonmail.internalid>
 <20261027021934.22113-3-ccortner@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20261027021934.22113-3-ccortner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2026 03:19, Christian Cortner wrote:
> Setting the OUTPUT format also updates the width and height of the
> CAPTURE format, but bytesperline and sizeimage keep their old values,
> those of the 320x240 default on a new instance. For a 640x360 stream,
> VIDIOC_G_FMT(CAPTURE) then reports 640x384 NV12 with a sizeimage of
> 147456 bytes. VIDIOC_REQBUFS(CAPTURE) allocates buffers of that size,
> and iris_vb2_buf_prepare() rejects every one of them with -EINVAL,
> because it checks them against the size computed from the new width
> and height.

Again the commit log is a word salad. A much clearer problem statement 
should be possible.
"When updating the OUTPUT format we fail to update some variables which 
we should be updating i.e. bytesperline and sizeimage."

Simple and clear, like myself ;)

> Move the per-format rules S_FMT(CAPTURE) uses into a helper and call it
> for both queues, so that S_FMT(OUTPUT) leaves the CAPTURE format exactly
> as S_FMT(CAPTURE) would set it for the same size.
> 
> Fixes: 8aadfd445373 ("media: iris: Update CAPTURE format info based on OUTPUT format")
> Cc:stable@vger.kernel.org
> Assisted-by: LLM sparse smatch

On the substance here I like it.

- Functional decomposition
- Reuse

So... I'd be inclined to take this. It fixes a real bug.

---
bod
