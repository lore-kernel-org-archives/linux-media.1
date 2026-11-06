Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793985930;
	b=SitMJsrNSJZLcq5G6eWMfosSpGw57YzHmpBe8k7EKNGa1+7caKRkVL8F7uq80DlEOHJA
	 39gkyh5bjmnsEz1Fc037R+8jgt8O22iTWyl0f3/a785PMPL79oIcux3i3o2lrtHfeIs6s
	 wfa4+5PWr9xVbL63/8olHnU1FImDXvwBj2uvBpWxicKjBlRt9DCyqFv7Hm85KJn9o381V
	 pkpQvYC2l/HeLI/RAwLn3KHk18x/b/jNfi6jRb5r9HwA0+rfyIF1dHwl9TVwF+FZZgPpt
	 tJwzeChSMOMet97+U/VryYEr3/63cfhI7AqOPErpB/ujsKGrr8PYqtmKS88YOijDudg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fUrJNblI2O1hZNjcXmW6nSh+tuR5hYmiGJK5WvnJCM8=;
	b=H5gwlJnNxfEHdhvrEjR/7ShKG9AdEqKwVth5ujkBgSCpHSxPS5f9o/Q0sjz7hkOorUKX
	 P5xi792MFb7KDV4kfp+SxWTRaKs9zJ94RtpUpwc6oGmfeKoZLwk7fXh8fQ5Fy+bJiQ3H5
	 K/KSe5owc17u9TWs24iaWaQ2IxyctwVJW0nmj27cND0Z9B23WCS1i06yrAxMh9qZQDAiF
	 oQnnxFgG2qK35OyTkGmoOv9+TcCbo24PBgeeUBBRR93+YT+gY5R4156cztBM/NJnOCF5r
	 D+4soXxWoZ78HfmUXTm8GRcGx955R3jS1pdIjTyAsK6QaXlmG6iDt6BVyYND8aJFkPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ewlCk/lT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5332D606A32D
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 17:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5332D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ewlCk/lT
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b6266b5bc4so1355e9.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 09:25:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793985929; cv=none;
        d=google.com; s=arc-20260327;
        b=DWUtUm1+W8pRAYTdBiJMlYFsUsJxxrjR/zZyCGAOCu1Y/JY07+VPs+RzjDWlinbClJ
         CKkXRRFmoVB6xunt+9LBrbp/rurBtMyY16SjTQGVk9xIcu+O6pfDqjaNjiFE91l0b5PI
         1PUJcOTLpPFYlCvPdHw1LaGRwKH6G0ol3GCpmwN7edrOnDeqEkg0+c1B2gdsiZt1jO8t
         RRgiK3RrqjvINuKg9nxYCXfh6TfNesmBJcC5lVtIXvF229YWLG/0g3kqzLWTmNTYEO6N
         sURJM9aKzYVvR6Ts/m4QSd8F07l04tyVkn+RDIzflK3Hbh1WXtnFnZn32xdL8i4KRHG7
         s8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fUrJNblI2O1hZNjcXmW6nSh+tuR5hYmiGJK5WvnJCM8=;
        fh=aDjyAwS9LdeD9oeKBn1mUEK/duYu3tyEK2EOKMGp93w=;
        b=IBxnsBExIQLjydGDDn1s8ufl1uBc2Hr+ZgRiLSEIXQy8mGeIPquSsp+ana1voUlGuK
         vhRFRqekspl6tygV2Gx6a8Si7/JRS84Be7KSaCL9yatU4MaShj1uEjDEVz/xDnlLlbuq
         ZGdQycdNV6av+45pYS10Uo1yjhOhdrBdrUqBfii8dWEzHEEJPXyaNRGTwa8BVbB4zVdf
         8WPAPpYzBVKLbcqHxE7v52Lm3/iVxGwXUUJ9xLGJtr3FL6tk7xyjfau3rZNS9e1/b/++
         s4dnKkq3HcRkgHrIq42MniLxMxLpkjzden77gITUmSUQrpjraDv2PwEzeUbDa3BKgVyK
         +HgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793985929; x=1794590729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fUrJNblI2O1hZNjcXmW6nSh+tuR5hYmiGJK5WvnJCM8=;
        b=ewlCk/lTPeKUbMBQjEFxdvXeSJcIPNy2WZqd3RMZR0f4utguz18d1I/25cveVMzzFo
         RT7lseKNhSlQDjNcDMIS/DhwPwUeEMuf3p3QA2SuaR2YWynu3cJ86aMi1V+rohgW/ueU
         wdYBRPMGl9NpfqRBybmsYTfqpJAAsq2YUA3wBescnBCrmLOck2h5FL8JtaVfjtntUhMa
         atBGAqnYj6CPAyn1iWAem1TaZV6cbQ3Ry89bYsb3Y3ddSg87IS5+y0t3k5n/93i7MVsR
         kOjiJQAHUQ9kOMLGGhlfbBtqgDPKlex2gLuJNJ4aUDDAFXSR7PLhJYKjThP1OZfQlk1U
         nw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985929; x=1794590729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUrJNblI2O1hZNjcXmW6nSh+tuR5hYmiGJK5WvnJCM8=;
        b=qm9OGO4rylhIp2Ny7DDSFafIvwEUqZZ0W07G1DELwEQbJx6Zo82Tq2eDIozUcQ0sC6
         wWokuucXe65N5y3m/4PVK7l63/jN1H8xWaaRs7LAtjhqOrealeKdH6wwWWE/8SvZ3KfF
         RQw6hnMbdLrQxPS0UyzYS8SBPagmx440wsNoZVCCzSc8vMWdZthva/lwYSknvtAWJTyo
         CVxzRRXNVnt//lW6dgHRxS2sdeOkX1P+YeTjaOw8MOQ14dd9qWYa0qWTw+0DbmLQ/uKz
         mcYKemqIB361RQ9HVj+Avk2Xz208mfXXikHd6/X6oofRn9EpChvtgnZsp3aVkPT/XpQc
         RHjg==
X-Forwarded-Encrypted: i=1; AKwUvBxxS+FS6X62bEiLcz75Rdxj27G2lWBHyJiw+1k0EK/08YF10Caxvf5bpTjjsT78dU5HZkxfLOjUHCvKsg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8u9aB0a1cA8bUKEcmq0ZQHM2ts8e6GdnDn3pTYE2iBknfz8UMy
	vvhDTWThp73hnCjossW9i0CR2uNV33lvnurTG5Ydg6+SHjh13PTmYLdxYjpR69e4+5gjsmDvhvG
	bEtnhD3QN6AcoTPCZUfjXSc5EjdbAZJ+aBdW4/7x3
X-Gm-Gg: AYBFou1/NC01iIG1Zs76qrAMrzhccFaWMYRy1FWu8SqIoD5xM/EwVj5gLicdQECWzAx
	2UiJculdcnq0kZW+HlbPcXC3Ia1SMbzwdAH6vYcIApH5j7uFffGmNEN3zEHksqNaS+e/e7VlwTt
	rIl6dQ7K3KzPmoq43+B/WiK25d1M92MVaQDpULDub1Fu5FcVqlIiCVxitlGGnV0cDtfDZBGA8CL
	6kcXkRlDpNAv41mzMSTASnFCcvnQP1t2a/P6wQOtAm/MBra/hL1QTmOdrcdnjscDI2dM2RlnRFm
	EmKXGjSIRrJOvvcmEzY1DsJwdEaax6Uio5b1+u5BoViQGHspvIgedLClAsDjXceGffYTgIofpBn
	nZ/ozEQDWuONvm69SogXb7ML5XWkr1yeHING+QNu3q9ZPx1VX4yxDBfhU2SQBCxA1Ov3MJuPPl9
	TceBHrZFvNrdyMK3Y77TtiVI94dDn6BtYrzY6Vj8Su/u/T
X-Received: by 2002:a05:600d:644f:20b0:4a2:a8c:22ae with SMTP id
 5b1f17b1804b1-4b78a315689mr14125e9.12.1793985928307; Fri, 06 Nov 2026
 09:25:28 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106131829.3228926-1-cui.tao@linux.dev> <20261106131829.3228926-3-cui.tao@linux.dev>
 <1e18fcfd-785d-43cc-afd6-d181bf8305eb@amd.com>
In-Reply-To: <1e18fcfd-785d-43cc-afd6-d181bf8305eb@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 6 Nov 2026 09:25:16 -0800
X-Gm-Features: AclHuK_zmhBLd-fBLwMoqE-7QVB_DAT0nisVVyTe7VWHd67XlQDn1ECR61povKo
Message-ID: <CABdmKX0nCB2hT+iMh=BB-nC=fUBPof8YvjvO-gtEw+zcHZgvZA@mail.gmail.com>
Subject: Re: [PATCH 2/7] dma-buf/udmabuf: account the page array metadata to memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tao Cui <cui.tao@linux.dev>, akpm@linux-foundation.org, dgilbert@interlog.com, 
	mkp@kernel.org, loberman@redhat.com, jmeneghi@redhat.com, kraxel@redhat.com, 
	vivek.kasireddy@intel.com, mst@redhat.com, jasowangio@gmail.com, 
	eperezma@redhat.com, stefanha@redhat.com, sgarzare@redhat.com, 
	rostedt@goodmis.org, vdonnefort@google.com, mhiramat@kernel.org, jgg@ziepe.ca, 
	kevin.tian@intel.com, axboe@kernel.dk, linux-mm@kvack.org, 
	James.Bottomley@hansenpartnership.com, sumit.semwal@linaro.org, 
	phasta@kernel.org, joro@8bytes.org, will@kernel.org, 
	linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bobbyeshleman@meta.com, mathieu.desnoyers@efficios.com, robin.murphy@arm.com, 
	mason@kernel.org, aesteve@redhat.com, harry@kernel.org, vbabka@suse.cz, 
	cuitao@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 5:23=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 11/6/26 14:18, Tao Cui wrote:
> > From: Tao Cui <cuitao@kylinos.cn>
> >
> > udmabuf pins the pages of a memfd and hands them out as a dma-buf.  The
> > data pages keep the accounting of the memfd they were instantiated in,
> > but the bookkeeping around them does not: the page pointer array and
> > the pinned_folios array, both sized by the buffer page count, plus the
> > transient folios array sized by the memfd folio count, are plain
> > GFP_KERNEL.  A 1GB buffer costs about 4MB of uncharged SUnreclaim
> > memory, and size_limit_mb defaults to INT_MAX.
> >
> > Charge the three kvmalloc allocations so the creator pays for the
> > metadata it induces.  The system heap in the same subsystem already
> > accounts its buffer allocation;

Only if the mem_accounting param is set to true. We (Android)
currently depend on it being disabled because system heap buffers
don't have a single owner for their entire lifetime (ownership often
changes immediately after they are allocated), and the kernel doesn't
have the ability to switch who is charged for the buffer memory quite
yet. Albert is working hard on it at the moment.

Could you update the message to note the mem_accounting param pls?

> > the data pages here stay with the
> > memfd.

memfd / udmabuf is a little special because it uses shmem for the
backing store, which is already tracked by memcg under all conditions
(except hugetlb). We don't currently use udmabuf, so the lack of memcg
charge transfer for udmabuf is not an issue. But once we get charge
transfer working for the system heap it'd be good to follow up with
udmabuf.

> T.J. needs to take a look here, but I fear that this might break uAPI.

Thanks for looping me in Christian. The buffer allocations cost
gigabytes, but these metadata arrays are only 4MB per 1GB of buffer,
so I don't expect charging them to break anyone. Leaving them
uncharged is an accounting gap though, since someone could spam many
udmabufs from the same memfd and only pay for the memfd pages once. So
this change is ok with me.

> A lot of the DMA-buf resources are intentionally not charged against memc=
g.
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Tao Cui <cuitao@kylinos.cn>

With the commit message updated to mention the mem_accounting param:
Reviewed-by: T.J. Mercier <tjmercier@google.com>
