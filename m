Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792465779;
	b=eaQ9YhfliNbuGXZ94ot1aRQoUIQ/G+Sc9ILUkRzSE77woI2gQplsnGoL4eY56gXZhiPL
	 jCvFxc+h+n2j8kxIO0f/2UoJmOgK2lzmsLAlqiKr4SmwsMGybkgiXLyGHfZPYJgVp2Nis
	 5M0YRoopjIC0AGoUEsWxP0zzm/KKOJpj+Uyw8DUTpKuiSGy+9OIayEbDmZT4v6qkZz++f
	 r0fzRtBu5yVQZCArPcYr8LitFoHvrGL803GZrUVs7wXg3NDQodx8J0f6pZ75FxMj51P+n
	 HUPFeVMfYYoxM0YqM21IlRdxqzUOVdO/fRhVHcH/P32ye6JcmzM24GGopy9VWBYztMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=eRFeOO3Kki8hDmAHeTRG/02QqZyLShI99Jw754kjQWE=;
	b=TtvCVgxyFiP/u85QgwMVUgIn22GU5F923wc8SmkKt6pcY4gJUQ8ua43/5hUDggGVqaVI
	 rUw3nj8FPQDGrNKc0xaGHEZp+F8iiYvomzF111ScBTDH9O+Ig0oDgausneyeM+P+n0cCK
	 Gd094149iReDJxTHE2ep4UBIlMLagfHFMJkhiuY5KPzsnlEZyU0qNAPzS8bRQW9Y6GMKV
	 jp3p3ddG55OqMf9h0JMWh6UUAx8uIndv3KyYL5mHMQJvhvd77B7h/gD+X8xAJoJ28fe/1
	 XwnBtAX4n5FElTJ2LDU6t3GsldYnfV0SScNWKj+D1Lc4KEzLLN/BBBGrrnLl7kLDpIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=imQ8JPEx;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88B9606A325
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 03:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D88B9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=imQ8JPEx
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dee593f18so2027939f8f.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 20:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792465777; x=1793070577; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRFeOO3Kki8hDmAHeTRG/02QqZyLShI99Jw754kjQWE=;
        b=imQ8JPExHTOxYo7Lop2O+jSTr0ewO2urQMhayDNlxHBfVU4P2KEIzWXMgTNTAJ0bcj
         +6jVZ1XexFP2YmNQsL/wKMjpuhcBUGP7/jX0JKzxR1RwdhJ7jltcF2CTKbCSwMc4HHtO
         H5nA+nOLGutYUAH8SVMercqaixJoWQnd8QSKR7Qq5WIdtSMRWLlyhKwyPRJfd49mui2j
         wy6Jg6s9A+PBmB/znzdHIkLTyXtTDWcX7fasZdO/MLM/HZ7HLhGjVnnvYtCC6S8J9rxu
         14HONj0NBQew753/9JsPGCWo54H/4vqBZqPmm323xRU8qcwXojINqT6HWjhUZqh+xBTO
         2BYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792465777; x=1793070577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eRFeOO3Kki8hDmAHeTRG/02QqZyLShI99Jw754kjQWE=;
        b=2e/n0T9CqYXWO9wF2WRr4zzHioYsYLbYVpXVAruoaeh0r7AmZp6dFq/fpQ45ryMqpM
         /4UJRFsCJ3VyoLgfY8JeKvfm6fuNsw6/i8cAZG6rjmXDLatebcKHHE0ikj+XTvlid0Nz
         SUFeFb8sgYRU9Kz42AU15swP6j/U51ZHzhD0sK7eD9TRD1hNwW6GyOwq9yu1CeuBdV8V
         kFuH4VeT0O1AK2alpo8+YP/cju1Xc/uFZ9pKceLui33Lp/+Y/zkobI2ENyI+y4HYvIEJ
         dVOttr186QRGqFKe9pHptpPoQe6EAuDmp4AXGVK14/A53DX3Wtfvnzj8LD9EDTljU/np
         RiEg==
X-Forwarded-Encrypted: i=1; AKwUvBysDFFVkTAwUtz2dUERDzxpvXosym5RQsf4Ipx6crB0eDpE4bwaEu1p3gk3umcU+jcp/Y8y1eTY0EZBBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJCyHah/JUGj5XvRbTL4+lyi/3/PE7MFLYeFbmyXaNQVPkRQ5mk
	Hse/+RNtFyoIaRgYeA594N10G6bg4M7kzKFbuq7pXARB6ahkk7CjCYbv
X-Gm-Gg: AYBFou3t4m9XtcvwzwJUnxYAkeXuytnLWdwOQzpBIWYKjlQuPhrXKSxONK9RUJcPYrK
	3kp6r84s9159lc/U6ez95HNhUI/rKF21MMEoKvgGSu37PE/wvtUkPW0RrNjxd6IjfHW7GDw/1aY
	SxQOu/CU7ufDaDx51rXQu/bQ9YOnqXkUQtl7qADl2CD4g6x7kOykzRi2010JQwFG1b4t9D1SFFy
	54VaUomexdEwR42WzXWiz1HA4SThX/aaH27SlISZrqOLnmk81X7H7AYHc60LDi4TjXQRvg3/7pR
	8x8M1jT6fpTTjqfc32k1UKtRyQYr1yW0qeDjI6Sr/sJo8ygbzXaZ/LP4ydCBa3IC+R/r0RPGLoB
	oBZQYvAePf4bqfpZ/sW5VRAcfB0BXOAoGS5Ur+g58vJSwFU3D7r+a+mHLs0RmOks8TtckUBB1Vj
	T0DEFD9LHNdAG7kcORuuiz13IWDSY4ZSCsP5YBYURZaqcMMVOxqfRUQJNjvA08sdq8F8lX4T/y+
	T3pMZYT9S4ZpGoQ+mVsiAmyk9vh726fyTKfQHmEJHYV9tCkJPjHTza9FsjUXkmcciQUcLpl9pK9
	N1SvNLA5RNYr5mlZ0IHF2GcpZB5VTHqk1EY7qav4Fg5gn2eQR41O68BNX/PNHkHg1vzkAMedJIo
	=
X-Received: by 2002:a05:6000:22c4:b0:48d:ffce:6cef with SMTP id ffacd0b85a97d-48e079200b5mr21966256f8f.0.1792465777063;
        Mon, 19 Oct 2026 20:09:37 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9c92-6501-cda9-90cd-4e49-75d9.310.pool.telefonica.de. [2a02:3100:9c92:6501:cda9:90cd:4e49:75d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d75sm3304578f8f.25.2026.10.19.20.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:09:36 -0700 (PDT)
Date: Tue, 20 Oct 2026 05:09:29 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: synchronize CPU access to imported DMA-BUFs
Message-ID: <atba0NA5lyG-326_@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
 <20261019124433.GU595565@killaraus.ideasonboard.com>
 <b9f5ee4d-987f-44c2-a1fc-2570f4500803@amd.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9f5ee4d-987f-44c2-a1fc-2570f4500803@amd.com>

Hi Christian,

On Mon, Oct 19, 2026 at 04:48:13PM +0100, Christian König wrote:
> 
> What the drivers do more likely is that they use the vmap interface to access the DMA-buf with the CPU inside the kernel. Correct?
> 

Yes. UVC and the tested vivid vb2-vmalloc path write the imported
DMA-BUF through a kernel vmap. Userspace mmaps the DMA-BUF and brackets
each read with DMA_BUF_IOCTL_SYNC.

> In this case dma_buf_begin_cpu_access() and dma_buf_end_cpu_access() should be called to properly frame that access.
> 
> That seems to be added in patch #2, but I absolutely can't judge if that is correct or not since at the same time you speak about userptr access and the code really looks a bit like spaghetti. 


USERPTR is not part of the CPU-access bracketing. The cover letter
mentions it only as a regression test.

An earlier version changed q->dma_dir to DMA_BIDIRECTIONAL and made
read-only output USERPTR fail PREPARE_BUF with EFAULT. Patch 2 leaves
q->dma_dir unchanged and passes DMA_BIDIRECTIONAL only to
attach_dmabuf() for imported DMA-BUFs.

Thanks,
Karl
