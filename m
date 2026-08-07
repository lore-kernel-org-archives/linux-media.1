Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3AF3FBEC2
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 21:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786139374; cv=pass; b=PyT08gM+geGS4sGZeWqxn/boBoOaHBwINiB+EY0a94tEX0GNILG9CMNxA3c2jglrreMVQTbkEfpYoHb1QoJ1duXsJ1AA2oUjIJPzjGjvbUb8OWpqIItAC99XWdmrbkEblTamqJoDH+pYMLuu3Pcyg5MBguXAdB02Xy3Bhfa14rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786139374; c=relaxed/simple;
	bh=G5FTjcRpMezBve/ofJFZdVct+f6BL6BnRtg87rQ8DyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M+4e0vMnEP3f2qiNs4B8MJUY0gMEmt0tAblRNlC4pnPUssfAHEDLNJ0ZoYmIYKJTWXqvHL74nQ2v64yVeiardNGidEfxTlxCht8W7UQsabqYoi9aqIySDFq/P4VH2fmGkEHLR+JvbKQCJp4o7RYX6QDLYV0v/oiJA+A//aNqrwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Me3rQyY8; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Me3rQyY8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495509b08ebso5695e9.1
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 14:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786139371; cv=none;
        d=google.com; s=arc-20260327;
        b=qgiD4XG+XI/UWgCv+d+J5UqAU0Pv+KpLcv8s09yugwBJvuQKfltQx6J8MFbYmgOGa0
         8JMjZbqqS6rYfKfnX9fPDAoqe2bu0dxx9tzSUBxG/fosJmr5aM/gnq0zvBsRsydaqq5n
         TQXp/lUj4cwU6Id2vXaij42szhW6Di9Z/H05vXxrq3Afn9Oz6Yd49gVIAlz5KVgpaIfb
         dqHWzN2iPEFR4BA3QP6luB/x6JAjm5V7m3Mg9hLuY4Sq8BSj0BDmz+I7vHWAHYIOkSYL
         IKjCZnHBqtLqSKdqT5d+8IcK+Xm1BG8BamYChQQGfskncbtk8eTWoVpIZwMhjyy304Du
         6Zmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tojr7GnFU0It/HjO8jYmDDXbwX4n7nas02X2nGuMiz4=;
        fh=pRtD5uByKO3WARiLdEd5L8eScKWJoBsrgL7vCAtVUP0=;
        b=W4+rDSdv+UR8Ow03wYAveKraq7seGwc7NMMjRRJu3bS/e9Z4oOAdlB9dqH1Z9qnEJK
         4yTUSg2pSl+ksAplRXQmOVKSkvl6XxKGkQy3wJT5ckAasVPGeH2k/rhgxwRiWhLI0A/8
         RrPzolp8fwXwVBHZQfXNXDnbdGrqGA75vyx+z/rmrmVUhtR/HNm/juRvtlUAQfMpEOPy
         /UaDg3AHWglXSNYWPdeqfPJXR+TOSR0LAvJmXArauMIAbX1GL/HT09wDGGTuByqd29Ng
         61Is+zHZTXtzeVarLzSJ9v7Dv/FwWRUi/MsunrVJmQRuProSiqi8odYVjKUmEgIxo/n8
         3ZlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786139371; x=1786744171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tojr7GnFU0It/HjO8jYmDDXbwX4n7nas02X2nGuMiz4=;
        b=Me3rQyY8zwJnMbRcsTZYZBN0mUbQLcwqP34ndbwdzzsI6PoCk+y0Egkc15WFT01Mh3
         qnQozarUufIbzgac0Dxv6Ha06P/dpGiRhSB3m2cDz7eeIJy3RvG94vlH/jjLYVxYff9D
         qrotEmfATufKSn+YCjnOKCaKDuQENt0XZGkGIFsUWkwMpsR+v66iyxMHQ/oiFAjV1CUu
         q4Tr7dsLgdaUJGcpjhsEKwz2NFXStEvDuJJfjxlg00B7nYI2vTZNSnXa1tQCrJgaiASK
         7E6RjiiSlpiVu4DEEVO+s+FMxw7UKP0j0TPGrqTVGYtcZNouh7P1HvKvz//oPr4QGgRM
         WIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786139371; x=1786744171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tojr7GnFU0It/HjO8jYmDDXbwX4n7nas02X2nGuMiz4=;
        b=KxKHi29wZBYRDrwXaa+MygHvh8MmHA2cVSoUTMwoD623a6d+KNiQBhFFpo+yuh1DOK
         T4/vIS0ht8NyJBAYQDGMcg/t5+aGmpDmPPR2njSL0C3GEjMTweIoqBG7+J0lr9cxuNta
         xUtghJFt+kMjiJ+/Rvm6WdyG4WjPkaZJxfgEGf/AR5PDj698iNumx71ulZv10gO9M1yd
         gQt+ttFeF6dajw+sk5mhfezj8YXzgbrwanHI2hL6UPgkj0vuFwHbmx8qj0vZiX2rr48M
         nT8ym83XiuhOr7e7l1/J87bHVvl7PrFRuUDi/47ukKHMPZe8sM6vA01gtg3KW0aJ8cII
         AERg==
X-Forwarded-Encrypted: i=1; AHgh+RoDrun6S6cJ+Q4kRq7eYEfK5+kNuWEBmjXrXb1D89je1F+9O5cebYnJH3jaThuT6wkna2YFaVHRxYptzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm1IsO/TR2XsrqLz/E8AKkc+kQVN3GHfzIaVCBa9DC5R+pH5wP
	iFc5oO1hQtDue5qQ4A5yLGW0c0t3k38SQDOjxFk6+IMGIm3OEyDVZ95of+SOGEYiSltG4yDeqji
	R1uT3e8HtqUZmXK1Ro4t/or34909/4uHk7TGLdoKP
X-Gm-Gg: AR+sD13aqJAJUigq487VjKXXq2LglOEZdW9NYBr06pe64t/FxrJVgrz9T7wyNK2CILW
	n7g/+eJiCuMunOcKbO1xLfTELkLedRYD1m9wrBjRquhpXayyUdv0Q5Hr5D/UxydvlvmtFQwQ5Mp
	yKH4yGKe0YcgYnfbgtyctbKp+2w3jvB3IAPP4ucqaamC44dUZMo2SFeTPLz35inXxzne8r7rF5s
	0yYzA3xNlBF5SI+uE4oE50SdnQnFi0VBXYpbcwTry82yptOenlOHIvdUcukFdUQbO3iT35ZuCUu
	AMfNRZEGoA4Mrd1Y1u2mWaiETxG5YbPUFHCokWYfCNXJsz3kj8sOiWperxjDjWTFC4T+eM8WB+U
	=
X-Received: by 2002:a05:600c:1792:b0:48a:5618:b4d4 with SMTP id
 5b1f17b1804b1-499624fa627mr282955e9.1.1786139370663; Fri, 07 Aug 2026
 14:49:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
 <20260807101140.1357218-1-shoubaineng@gmail.com> <20260807101140.1357218-5-shoubaineng@gmail.com>
In-Reply-To: <20260807101140.1357218-5-shoubaineng@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 7 Aug 2026 14:49:17 -0700
X-Gm-Features: AUfX_myL6rl83duYDy7P4wt3f7i8-Bq4xO_AORup9Lze93VGtdc5GMGWYyQ-sUA
Message-ID: <CABdmKX0i_DaS8Q2=Q8Xs5bTbSCj2FFSpib9ReCGYFXSeiBcntw@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] selftests: dmabuf-heaps: add fd-leak-on-EFAULT
 regression test
To: Baineng Shou <shoubaineng@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Sandeep Patil <sspatil@android.com>, 
	"Andrew F . Davis" <afd@ti.com>, Srinivas Kandagatla <srini@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, stable@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 3:12=E2=80=AFAM Baineng Shou <shoubaineng@gmail.com>=
 wrote:
>
> Add a test case that verifies no file descriptor is leaked when
> DMA_HEAP_IOCTL_ALLOC succeeds internally but copy_to_user() fails
> to deliver the fd number back to userspace.
>
> The failure is triggered by placing the ioctl argument in a private
> anonymous page and flipping it to PROT_READ (via mprotect) between
> the kernel's copy_from_user() and copy_to_user() calls.  With the
> buggy kernel the ioctl returns -EFAULT but leaves an extra open fd
> in the process's fd table; with the fixed kernel the fd count is
> unchanged.
>
> This serves as a regression test for:
>   "dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds"
>
> Suggested-by: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
