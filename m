Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793749801;
	b=3tZTet7cYShpF1G4d6+IFKZPfz1cLrbFFh3FLvQBtxgruoslIXDGXSwxoQ4NaGYZdC0o
	 9DQ1NfyL+hr37tZJfbRxxU050HFaiWf2zfpbPWrORSDlU/j4CjZY+i7uYP+8VH+eSMY1r
	 0AUWnnVTAVH5hPdZdfu+XzloPthnmvB0b1xYhBGsRnw92jcakuG1UYZFA8FAhQec0tIhg
	 ik5cm6C61T7z9alk99y2komXy3gtVf+tG6PP9TtGBsHY5xeCZMid0Gw6bYwADKSuUp26V
	 uDLaN6ey/atJQ3T7jQLy8j9oY59V03SEGlp8vPVV/0EUU9XMbHd0QGKGZQXyu0paKzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2LyDKxPm7BmS9aARoXNEEpr8AzutCEsbFkZ2B7a7nyg=;
	b=yXi4S8s0YM+nPhoC9k6OVsblVd9HFAQoPmvxdbC1/CLIaO5ZP6KJ5aHpas5H1bxKhM91
	 2GMA2Qwnzvllxknw3XA+k90M+QqcS1cIUBVvMoUb1sHuRMzpERbapyug0vw8+vyw7J/vS
	 ZshJLUx1lTganUHWIjCjo7pEwV6Fb4tan1KR6x5UDVOpqaQsObNVddE4xTplX1vm64XfJ
	 xrvJWb6s6ECJKFWtze2gpX2zxqnmeDHhyrD4iLeYKmfD2livREN3w5Q/5p9JSGweMv7Zt
	 Ykff/BihN0RYKVAVtAvuWQGzZ3d3wc4eAgDVcFLY2lJ5jn2kN/p4C4SARA6iHsLelBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IoOy157h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F12C606A326
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 23:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F12C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IoOy157h
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a54bba0442so7765e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 15:50:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793749800; cv=none;
        d=google.com; s=arc-20260327;
        b=liKTIAGb4VC1URVcCgsE54cIY01o5kFm9S30nOKgnsKKmLHmBx8DVYUflyWLE4+Kc4
         LUQrZCllj+QDo7SZf8z0Ek/n0NGs1sLsaYSHzkq/8FqdBu8B9KlrSafgnooAliRvoP8A
         3noignNBkM+BeEwvyofBMM+hyV96VTkad7rCYffn4d18EpYIu70EBNFwDUVtyoDmkJ9e
         dNXp9jqENrm0YKK7qBWNVDsLKJyeAYh+Z113QRalyG7WEjmeRWmPQup+aTitnVtEis8q
         gkl+b1tZzWMJNW8GnAGrr5InkUfqf6lVx4knXxfBTrck1ETgXpNby95mhIgWGXR2HNSg
         bS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2LyDKxPm7BmS9aARoXNEEpr8AzutCEsbFkZ2B7a7nyg=;
        fh=spg7aru3JgYRiCOzV2CVbT3VpS/5DU0fUQV2vuUCM60=;
        b=MFC3T/0nE5oxPIRLr7dldknGmH6xM51EPfQ2x/Ik3s960avJWm5w8YUsTqRgrSVYUx
         jeQ+/2QCFijC7OG24awnNo41UmM6a44XO3WTRLQLCbdnF0PLQ+1m4Qm5Mu3KTYq19ZDP
         yTb+Z9SroApmJUaQdGigel0bBnwV5qXXMW32QChi5fF4fU2M5Rub7adV7TFtdOi+ZkIy
         0qxEVURAbGViLJuIAnQOYh3Elk2x9ytWwCyJ8sk6i6wPJvQ0hI80ZLJpyj7oA7ntpDUG
         HMipJbHua4tsou4uu0ltz4JhXTagBSjV+vngUi1oVZSPSsqrDdDRRSCfjj/QDT6MxK0Q
         MqqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749800; x=1794354600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2LyDKxPm7BmS9aARoXNEEpr8AzutCEsbFkZ2B7a7nyg=;
        b=IoOy157hpnNx0hX/TCKQyv/43AG4N4mu0MB87RNs8cyd+CS/6nV8lwK3QZibeSgDB+
         NO1mWyt8BUZVU/dS+mTvVu3rGUagC9cKJuc3RPHqWlzfF/TpkGKqMdA8v33BoMSSritA
         0/Qb9xT1LxW99/nEEz8QNUa/mRff4zCtl0BrYr51At5i8TbhLKXE7PKz7zA0oarEpEho
         /WTO1hx+3JoWTFLIfscvIwXle1q7P0WlXktQfjzA/APiPOF3iwGSs1PAePZ/ZTz8dDxE
         fFi35+ufV/y4s/0uiqxfhJFDAwcV3Z5Ex3gKpbVH3H62aYPygxSKeohvn8eexKy7c17/
         trWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749800; x=1794354600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2LyDKxPm7BmS9aARoXNEEpr8AzutCEsbFkZ2B7a7nyg=;
        b=Lo6T050XKBNL/UsMhYa5RhbVPqujFRn8I4HxrsnRNFmuGoLKSFmWA4LLnUM2zToPB9
         CCcMiHF9QNErw63Oa4PDZsFxx72Tpiy4lSppcomSY2WKyAFiO2Yams1QOFmiSfqf1/HN
         0YtuU1OzzHuznlqSLB2dtuMy0DX0TmKR8dMRbOBm1zUERtDlRDmykpQARlFcdRCs/3i9
         TdhXqs0eAl6yEz7TMf8thVebIjQpBfyVQ6OPftuvBEwaPHOiXskunZhYEpp/BFIT2OEP
         7orLchMGo1m4NtUyuv01CM5pi8N09a/5fhXBhsa3a1O/iWQ/wxnJSww4d17GoDFNKshg
         QIrg==
X-Forwarded-Encrypted: i=1; AKwUvBwu2cFpeXhkvfAwQSlKNzBjc1Q+frv7PiI48UO3PRTAzE2t1VvEeG3sPP/QnLEiuu6Ivyk09nuRiJ7zQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9zu3ULaoTV7jTspclyhcBrr5x4DyowpoE3iqttsyeTg9kg68pX
	xGXAZElc5TLeYI/Yg04A8JlmK8aOm9SdEOkkDBeFlFpHCtNmW0uyXFVTzc5pszoBf/I2llMer0F
	axyYpaI0/5Gz3znMj64iJOs2PDifxG1S34ZsNFTZ8
X-Gm-Gg: AYBFou39+NKCnB9kHoFItjcnYvkD0TjYvSNrUemdVM31huACZfPm45+84Y9TORWFueS
	krYYLlR3KWDbpGBI6bhSJULg+pf5tj0dgNwxqCaV00+M36djBRHbcRCIZBV5V9YXaUalOzx03Zp
	pWlL7R6D5frurF5JutGl2Bx1bmTOY527tm8EEvckHUXAyr4+jlrnpLsLweG1h7OAR0SPOHtQjxD
	soeq0514gGwscYik01+Dzyd1VyFG6C0B4eTbLWvIviAn6V1xds8cds1S6JnZM0st5vuWsYDYpVD
	Q2kl41ulnTDkWdA4qmD3TpgRjKQaPvMAE9+LwbvBtzk4V7dP9U2AKMY8yX5I/ub9G7PSjyhrbwx
	Zx3lR8Cn/wMUKQcGxZ/UJQqQz4IklVL+gpYZE0eAMx0M+vTYk46bcDi4oLTfvFS7TpTbmNM2AuQ
	3VJ7e8fuJUKEFVMCI3YLubgwM=
X-Received: by 2002:a05:600c:5799:b0:4a1:eb11:489d with SMTP id
 5b1f17b1804b1-4b4606a61f5mr16595e9.16.1793749799475; Tue, 03 Nov 2026
 15:49:59 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <18e445c150434665.3137322e32332e3235332e313736.109a67.0000sendgmr@google.com>
In-Reply-To: <18e445c150434665.3137322e32332e3235332e313736.109a67.0000sendgmr@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 3 Nov 2026 15:49:47 -0800
X-Gm-Features: AclHuK8ZKLm3rVsIDA_wL7c0dXQT21arwcYZtB_K4EiOQaTULkyqjY3FAmPFPP4
Message-ID: <CABdmKX0h5Vv2cFHRksJx3hHn5c3aBqbmiTASk5GKn3BqUO4Vbw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Reject private mappings in dma_buf_mmap_internal()
 and dma_buf_mmap()
To: Chris Wiseman <chriswiseman@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	John Stultz <jstultz@google.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:00=E2=80=AFAM Chris Wiseman <chriswiseman@google.c=
om> wrote:
>
> DMA-BUF mappings do not support copy-on-write.  Mapping a dma-buf with
> MAP_PRIVATE and PROT_WRITE faults into do_wp_page() -> wp_page_copy()
> and allocates private anonymous pages whose writes never reach the
> underlying buffer.
>
> Individual exporters like cma_heap_mmap(), system_heap_mmap(), and
> mmap_udmabuf() already require (VM_SHARED | VM_MAYSHARE), and DRM
> helpers like ttm_bo_mmap_obj() and drm_gem_shmem_object_mmap() reject
> vma_is_cow_mapping(vma).  However, dma_buf_mmap_internal() and
> dma_buf_mmap() do not check for this and pass MAP_PRIVATE mappings
> straight through to dmabuf->ops->mmap().
>
> Reject mappings with -EINVAL in both dma_buf_mmap_internal() and
> dma_buf_mmap() when neither VM_SHARED nor VM_MAYSHARE is set.  Checking
> both flags still allows read-only MAP_SHARED mappings, where do_mmap()
> clears VM_SHARED and leaves VM_MAYSHARE set.
>
> Suggested-by: T.J. Mercier <tjmercier@google.com>
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Chris Wiseman <chriswiseman@google.com>

I really hope nobody is trying to CoW with dma-bufs.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
