Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793118154;
	b=k20txFN1AVKrTC37NJmzbSk9VfeJWaG82d94mZxq0AQTR3eYLXBrsECFKJT9KNquD/wl
	 hN9au4YsYmLIwKw5MyS3TduExSyGtOX5WaostZ8dEdjibyqGLqS2Z6my8NrOHiTBlN3k7
	 cIAKX5JXr1WWKcDBoEqLZ2N83MzttIqnOM074Al39DR537ZLoq1EKOkkZxq6DMzX8aFz/
	 pjLO9aaG2Gh57LReGFe163B4dhvT+AOzs5XzKbZx3SwrBRyyeIA0Bcrfq7Qz6ADXt700O
	 nVJrdMVgyoglxDHM3eWuEAJ3jb7PjM/5JTzk0b6rvNAJy8B0QnFBmh5WK+EI1mle/NA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
	b=LdWO3otcbQGnCDR2LOpQn5jjnuOK9Exgn7HlxzsGtHOG7Rr2VCrdALIiHWtCub8XMkVU
	 YMCZQFdbUcKkcvSTm/xo90Ohe0JBFDQ5/BzdKgNzPLzxAb5JHbwUq61tAk7qE6emVkY/k
	 iunas2X8KVQ4JIZkIi2fvdHX+tiiblCb6lCo9X8NZH2m3J+JcBXOjNJdktcovStg3OXSB
	 grJ6uRDclrDwCLfxlzgsG97091FjurJjTwC87i66+CxU8wker/X0b5DY1Mu5KicwwmAf/
	 j98Oo0h9GITvwgjwj1X9LQ1VJkosnjb+zqc2LIedgln7mKyxEQQLyTNjOJdymO2TKhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1iQHa5S;
	arc=fail smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0536606A31F
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 16:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0536606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1iQHa5S
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0d126f631so39360187b3.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118153; cv=none;
        d=google.com; s=arc-20260327;
        b=UT/I/jFdRikv+GLOQFclobPW0mTizWiHLRPEO2/JKjGV2TWd/aRcLayrjuKctdfnTi
         5uyD5dFFw910Aojz7Z/RemJh5NB93w3FF2vp1+Br67iAkALhsBdAuC1hFHdiAXsB8eNF
         UGpRSm4pEZu7Gn5nJzbjE9sKCww5qLcycswNO7gG/Rjw2tb1MonUMCFTvAXmegTOuqXs
         V/Jag59xUTWtc4vSkdj/v89oKYeLAUbbzxGEU4/yUQ6uLtYyashtfdqGCh6j0XpDJDKl
         H1U06MR8V+87ZWgpa4HS/OB+74NislrMe2qaRYq9FnfA8Cnlq0TNqT/KRJ4WEhvVKubb
         SnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
        fh=qM9oo0xUzDiXv7B96zmLmJ2snGvbFh5b5suTEeqkIkk=;
        b=jlRHcSe3tBjh2wfp04ycB2MJoqNS9EjE3tayLFxzrayO6j1HixLDQWBP2uA/yRmQb/
         Vu2ggDw9X6cVtY+7Mc/HHKFFDFdFzfKCoIGcVa5EEFdR5/N7Rf0Lk6jOz++IM2qAaf9l
         d7yHdpj95pPs77wtDCnztg1qJtaCarw3tkulYURPSLnbVUf+Ha+Zzd0yv2VlmH/OYMEF
         djxtie5cPYjF9lUUnavQZJuzVai/mCcdbvjHYEbI0PfmO8AXcSrV7d16q4QQMOCu7Lvu
         HjTRFjnkRCYKB9IhbDkTnB9SEcRK8Gkbs1n7w4H/WJe4B4F+DOJY1JwelNLXoRefy8nA
         qO6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118153; x=1793722953; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
        b=W1iQHa5SX/Qc+pJyHgnzeP49i7n4MyoEA1Sg3k4vdH/8WuPlX0on9nVDrySw3Zna8i
         VmAyaK3ohLRAwCwDkIuGUhl6lFASHb9v/c6ua/hWP4ZnWIS4Pg/QPxL+h/j2+M/ph6tF
         1vS3HMQklRX7SsooBGhCqQgqAsP87LL1H8P0aiSVUl4bKJTDy8l9YqnJ0x5Ec1X5CdbS
         J+/smu1iGC4WhXJMXPInRtuGzDFJObu3iEpaPAiN+VC9nv1zNGfLCEZH1FiQpKqwIiPf
         VWeWPMWfSjW129zws8g4m5xGzmWq5KHVcVk+cQtM/DXfJbdUlA+dhI85l6M9pPu5/00F
         GlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118153; x=1793722953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
        b=uTZEQV+Ky/NkLjguV8oTdXDZ4HG7dQSFvFz7AawQG+1XxADcpSRLdlmMJmQRXPlaGv
         0J6tgWWwrqgA8u/2iEmR7J7fRxUrlhTtc2Ar6I7/9OGmS/+EdzTcpLsckcKGQ97wrz3w
         hp79/oVREm24i4G1vjRNxSQxbRNOvICDdZ0IQokCFNhpE7dc4UGNbfqnjyo6MWvL2mP7
         B62J3AKiHMIpe8kffB6lP/T3VmMKFyjMDINHQDcPdIbdAwjuJFdTumPINwXG6iYaKrJC
         ZgrW9uDf9oljA5XU37OlxHti47bilobvd4mQLnq/fuwwSCv2e1odEJGAorKv3oLFvQnw
         nCNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIwb45h5aJ0uDtW91JRKPPNMznfsY036cPuJMCt1Wo55RU51b/XSXKHK7vXwzUVJhi2S15GjMv24Pbeg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+zisXmvsLg+09zc3K+kjxsMSGWCvBEHCZxpkf6ESW4KWlODjU
	hVWNW1Bww4RWs92fT2UMzeE3brX+y+FV8LMgFXmyLJrxpBhE3mMpZzYYCsZtN8MuBMXMqoMJcmL
	eLmYsrkCcGTdPbvq2PFsSCDtBsImrZgk=
X-Gm-Gg: AYBFou2ep1kS0ZBMZKEp7enQAU6Dz8MsvA8v1gYmCYTucF6Al5h3uyo332L+CGo7k7s
	dWXjr3TSq+j3h7AtfxSWABUNAw1hP3grND+8Wd9u79YQh3kDAU2KLRgq7ARpWr74PV0GPxp1n33
	7Qnss98iUQalRGNEE+7zQipzR8iJpyEraSB4Q+wWzRyc7MFNl5nCRqohGBSdXIk1oHcGgusPETL
	djRgckLs+oKaKKWXmOFyaDiN3ldEu1NyvBPSwB6PwUiQQS0U2tnrXhSkbv0TSdjyL0By9qRVQtx
	t6CqEQNYh/mDHYA35kCuLWuPkic3oaG22FCK0024Wn8ow3NbtJdT7vzrgXoc7nz0yecjHKcJJoZ
	mZZWCSYs7EZCaQt83/Gx4RBs3OTnPE7dcjYpZ
X-Received: by 2002:a05:690c:dd6:b0:8b0:cee8:53cf with SMTP id
 00721157ae682-8b1669cb374mr84387667b3.3.1793118152555; Tue, 27 Oct 2026
 09:22:32 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027145313.136305-1-lgs201920130244@gmail.com> <f7d242b6-a401-4ea0-bfac-e988f1497bc0@kernel.org>
In-Reply-To: <f7d242b6-a401-4ea0-bfac-e988f1497bc0@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:22:22 +0800
X-Gm-Features: AclHuK9WhSZ_5Xj4ee9jEQ2X-wRviwNJD5dHM2yTu5byUlkX8Eudsa4g1RS5X-w
Message-ID: <CANUHTR_RYcMEOTevXWRF2iS83oNDc4pXqsbBZKLV7QbSUeYh=A@mail.gmail.com>
Subject: Re: [PATCH] media: exynos4-is: fix DMA memory double free
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 27 Oct 2026 at 23:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/10/2026 15:53, Guangshuo Li wrote:
> > fimc_is_alloc_cpu_memory() frees the coherent DMA buffer when its
> > DMA address does not satisfy the firmware alignment requirement,
> > but leaves is->memory.vaddr non-NULL.
> >
> > Because firmware loading is asynchronous, this error path may run
> > after probe has returned successfully. A later remove can then
> > attempt to free the same DMA allocation again.
> >
> > Set is->memory.vaddr to NULL after freeing the buffer so the
> > existing NULL check in fimc_is_free_cpu_memory() skips the
> > already-freed allocation.
> >
> > This issue was found by our static analysis tool under development.
> >
> > Fixes: db47622c13ae ("media: platform: exynos4-is: remove all references to physical addresses")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
>
> More of postings by bot ignoring any feedback.
>
> Best regards,
> Krzysztof

Thank you for your feedback, and I apologize if our recent submissions
gave the impression that we were ignoring your previous comments.

We did take your earlier suggestions into account and subsequently
submitted a patch series accordingly.

For the more recent patches, however, since they address issues in
different drivers, we thought it would be more appropriate to submit
them separately rather than group them into a single series.

We certainly did not intend to disregard your feedback. We appreciate
your time and guidance, and we will be more careful with our future
submissions.

Thank you for your understanding.

Best regards,
Guangshuo Li
