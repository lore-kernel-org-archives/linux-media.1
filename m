Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794427265;
	b=xxNUGFQ45HZcS4OtXd7B2Y8wuI/3WBXe8uX4KiR2IerFN3/7Dj7t/Bf0SH+9ndNlGuP+
	 3uEIIUCfAz0lrkTculqOHwTpH9vu1/iso/Rmo3qt+PXUYW4rUeDjNO76Ez3vfK0oZSbIY
	 4eNoq6uS58FrQhNIyWqj+0IpKwECClHgqJIeDfbfw1rDSRA4xyUHuwKQpS2629i8zfwoC
	 pn36nXC9E+uV4rKA+04BbfI97/SIukvC4qCN6LAP4NnnCZQivqVmiTwc38C6UvpSS91s7
	 n6c/QPhry2q5NyFd92S3yagBOIjehgYJjD2DHjuCkH+eHP1JS0DKe7+D/wLp9tkMgGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oLVXFVt29dYBkYQT6UIOPSuTbBUgUXoB7bt0qWYFj0Y=;
	b=no4zNXWUSp7lESkMSieJ49WyhAdYnhN5QRsGCTEfXwry34jKo8EVm+IUmJprPhQQyryd
	 EXsGtg5S+hT+poQ6ox2wEluEBp+8JWdaabd83NuAX8O2dAwQHcNpFHIfczi2KgDF9Ni4x
	 LDhm1KecHrrUkMe9XVUb7iug45MfZVnHSo5grH5WFu2M474o2B3hIsGkB38kJgQlf3++a
	 wpHIoS4YMYrdEEbVoXqxA2j0h5mlxTiRy8JqLRKdsv/2zb3pKQj/aC8cEU82yiaY60J6P
	 aNPd13cn8YkXoxtDOVhFld6J1h04qFJaXnt2ShM9KIYC0j6fSfV6SgOspZTaoN8FFMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="e0/7texl";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D391606A324
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 20:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D391606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e0/7texl
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-54492d8a988so41941cf.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 12:01:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794427264; cv=none;
        d=google.com; s=arc-20260327;
        b=N2Qhge3i7sxyMhecdD/UIbI64hysET4A+aIgkv4/svtpJBEmwhvsEFEK9L5BxuPYMv
         CBNqS+al6Rom3EG6Nbu61SLKtCUZBxXIZNrOkTsQSKduU8qxu1r+yuQewC0b4flmhNnn
         Pi28LXUSyaaHfdHC94XsbeIzADDX64pe4vagGfOWbq8CozU/ElKOiySrUkbGpy79K5b8
         Zj95Z6M1B7zm8Vl3RncXCwh2mMeRuLJlRyKaLRqQb+v0AAgqxjRB3qNh2M0nGewYsfsw
         HBXq3mcAiaSaGI0aQhqieZMmcKOd9i43r4YRjlIPQb89swhZESvuf+UXp5gatd/3Z1xd
         AVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oLVXFVt29dYBkYQT6UIOPSuTbBUgUXoB7bt0qWYFj0Y=;
        fh=5bWG53+d9qtLQusWC85gd/ShyjW+woCiuauD3YFcAx8=;
        b=Oa4vdUMuFwqsa15Ag6rvBziBakN57A/Y1hU22PW7kL6vcif+u+Baz6L4nRBc3zXSKZ
         fSDzZasyQLiniCnZ8GlYOz12XeakVhzAoLsHaygUxBNCPFPvM9dhqY1znsrXti+E1TcA
         FfjUrTbhSabOn47pId7qpnp4vKfB5EMQq4csMf97ryP7WVR7xIPlmI6ZA3hd1fdesP25
         yW7FHDTFLFOlUcIdG4EsIKN1aKdpyP0XJS16zooo/KvvHu2yyQQxOgpJXBIxKx1Mkg3I
         WholnbU4+MsZ9yv7w8W9BMHY8VjeUu1htZWuc6TsuBbiNJkLqnPDa9BVIQj15674AISk
         Eccg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794427264; x=1795032064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oLVXFVt29dYBkYQT6UIOPSuTbBUgUXoB7bt0qWYFj0Y=;
        b=e0/7texlSOu4KxVZE0iowt9LZ3snSvdmUmXOWXqPvVg6nIujvUChLVQUD1CQnS/21L
         DdXlTDttd464JKAHMoLOl3o94DAdpWFnNkIKdwKGjWcZG9l9O+fnjoGxm0JxzRAFvZCo
         yF5YzRzunZQUkSEzBeXlt4Y0A1bkdMnN2JtnOW7eIq+kUucV3uvL46rSRbm/HbJNnFPN
         jAdOipxflAvbMEwHX1AVPKlqTd7vp2SfnW6HUpZu7+UwuwNGfUwus6Q/EtcjXLtxfLRl
         t3blfXCBNN5P6LcWe9IZZtzyCCJtekzOC1vrSY5Zd0ZDLXnngRuvAxIvUPrQc3qgvEd4
         3uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794427264; x=1795032064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLVXFVt29dYBkYQT6UIOPSuTbBUgUXoB7bt0qWYFj0Y=;
        b=TTDpVymkxmjXyQ0xhLWVJyl+tRUptupGuuCNwGvQQiDQCrn/jbwpbwmlAdiZm1mqza
         SLFTl4qJh8uGRIAFPPL354rJqaI84nnqGigoMdtxrGxEhPeoWpAe1ZDpUOzhsjINrgJT
         3OieCAdpwAxm9qEyh9WmeDcZqdmNtQ9crSYv95p42nWCO3rWCvtl7CcPPEN7I3s+0iDp
         CZ/mMn80mK28hgbrwBr0V7de6CbJIH+siUzB2+e6BjtUJA8tMwIyZKQTITqsh7aZvS8D
         g64ebXJrsE04Zua6jEGiVIeINiLsgptXgZi+uISKTqNKIMW1uADjVjBnZ6yCYJKxDDOH
         /fxA==
X-Forwarded-Encrypted: i=1; AL+hErFCesJE3nl5iMRrfmTx2/9r+rfAEX1UhlNc9W57HuFuFpBxalsgiK6CESGLAp+Tvw9UvLUdwwcyqSXo2g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/EyO9qLm8scnSKK6UK8cmPZsskZsO+J9GniMuXISYuC29dCKKn
	75C4CS95HNPToFlADOdyFm26EmptOHqmcIWv342e8LK4JkzoGk9ds62R3dHv0KkCAcmVC2a9Mga
	8Z1YGADmuS6PNR2jgldg2bO+Q1vggp3bTumXD1aht
X-Gm-Gg: AYBFou3ouM3PvjqPqEZp2lXLqOKaaQUCJ2uZ52G7j2W40oVFjlE8ZrNoAze8HPij72c
	I20vHNnqVuzkgjSfurn15zmY9pBw8iCkoUHAQle9BP2TTCHuR02DU1Pdf1gKMb5pyjcTl7h0osL
	DsLKALp3aicHaCJUMyyqTO1gPLVGG103+dfTffdt2Y6hQOa9XDt98leAnPQ94MvWSeNuMuAiVpk
	KDIShGlgdm5x+5q9JnsXinma7132eZKyGnANWg+MYLK45p2amIdzLXzEYwaK0fZS9TnSw/Q0jba
	YZwZ9HL7UG3xM7hazz8g27NHvEqUQCLH2ZA2DyeC06ZuvhxTeVCdJC6AlOSKLJL1b2TEW3TgSKB
	okrN/HdBBEdYb/pasCAH25xLpTARjHOoc5HVrJcLgNT70U/VPr/IuSOt5FYVWGd6Ml1cmmGN756
	b8HTSudd4SCOO6cyvt+ZFavw==
X-Received: by 2002:a05:622a:2b4b:b0:535:ce3:ee07 with SMTP id
 d75a77b69052e-559710b30e1mr1999241cf.13.1794427263429; Wed, 11 Nov 2026
 12:01:03 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn>
In-Reply-To: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 11 Nov 2026 12:00:49 -0800
X-Gm-Features: AclHuK81JcIQVOh-tqCQX9JsRqdWOHCGs7dqRFvbpp7CrwexNznx4vXc5gM5Rp0
Message-ID: <CABdmKX09vLG4U-7FwF-vm_iTy1AjGUPXka08KhWE+qJ0J=XGMA@mail.gmail.com>
Subject: Re: [PATCH] bpf: make dmabuf iterator stay drained after NULL
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: Yonghong Song <yonghong.song@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 4:57=E2=80=AFAM Kang Chen <k.chen@smail.nju.edu.cn>=
 wrote:
>
> bpf_iter_dmabuf_next() uses kit->dmabuf =3D=3D NULL to mean "iteration ha=
s
> not started".  dma_buf_iter_next() also returns NULL at the end of the
> list, so a next() call after exhaustion restarts from the list head.
>
> The verifier relies on the iterator contract that once next() returns
> NULL it keeps returning NULL: process_iter_next_call() marks the
> iterator DRAINED and treats the result of later next() calls as the
> constant zero.  A restarted dmabuf iteration therefore hands the BPF
> program a kernel pointer while the verifier believes R0 =3D=3D 0.
>
> Use an invalid pointer value as the drained sentinel so the iterator
> state keeps its one-pointer ABI, and skip dma_buf_put() for it.
>
> Fixes: 6eab7ac7c5ee ("bpf: Add open coded dmabuf iterator")
> Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>

Thanks for this fix. The cgroup (bpf_iter_css_next) and scx_dsq
(bpf_iter_scx_dsq_next) iterators look like they also have this
problem.

> ---
>  kernel/bpf/dmabuf_iter.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> index cd500248abd9..a2b7c38f9ae6 100644
> --- a/kernel/bpf/dmabuf_iter.c
> +++ b/kernel/bpf/dmabuf_iter.c
> @@ -156,6 +156,13 @@ struct bpf_iter_dmabuf_kern {
>         struct dma_buf *dmabuf;
>  } __aligned(8);
>
> +/*
> + * The iterator state is one pointer wide because struct bpf_iter_dmabuf=
 is
> + * part of the generated vmlinux.h ABI.  Use an invalid pointer value as=
 the
> + * "drained" sentinel instead of growing the state.
> + */

This comment explains why this patch uses a sentinel instead of
growing the state, but that doesn't help anyone reading this code in
the future. This belongs in the commit message, not a code comment.
The real constraint is that the size of bpf_iter_dmabuf is
user-visible API, so it can't grow without breaking backwards
compatibility.

> +#define DMABUF_ITER_DONE       ((struct dma_buf *)1L)

I would prefer this to be DMABUF_ITER_START to mirror the kmem_cache
iterator. Then the second if (!kit->dmabuf) block in
bpf_iter_dmabuf_next() below could also be removed.

> +
>  __bpf_kfunc_start_defs();
>
>  __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
> @@ -173,11 +180,25 @@ __bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(st=
ruct bpf_iter_dmabuf *it)
>  {
>         struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
>
> +       /*
> +        * The verifier assumes that an iterator which returned NULL keep=
s
> +        * returning NULL (see process_iter_next_call()).  Without this c=
heck
> +        * the NULL left by the last dma_buf_iter_next() would be interpr=
eted
> +        * as "not started" and the iteration would restart from the list=
 head.
> +        */

Same here, this is commit message material. If you want to add a code
comment, referencing the rule from bpf_iterators.rst should be enough:

/* Once NULL is returned, subsequent next calls should keep returning NULL.=
 */

> +       if (kit->dmabuf =3D=3D DMABUF_ITER_DONE)
> +               return NULL;
> +
>         if (kit->dmabuf)
>                 kit->dmabuf =3D dma_buf_iter_next(kit->dmabuf);
>         else
>                 kit->dmabuf =3D dma_buf_iter_begin();
>
> +       if (!kit->dmabuf) {
> +               kit->dmabuf =3D DMABUF_ITER_DONE;
> +               return NULL;
> +       }
> +
>         return kit->dmabuf;
>  }
>
> @@ -185,7 +206,7 @@ __bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_i=
ter_dmabuf *it)
>  {
>         struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
>
> -       if (kit->dmabuf)
> +       if (kit->dmabuf && kit->dmabuf !=3D DMABUF_ITER_DONE)
>                 dma_buf_put(kit->dmabuf);
>  }
>
> --
> 2.34.1

I think we should also add a test for this. I've sent one as a reply
to this thread. It fails without your fix and passes with it. Feel
free to add it as 2/2 in v2.
