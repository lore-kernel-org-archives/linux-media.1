Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794426865;
	b=YXzj/pa84DelRZbMyuF8PY1rxsjFNLPs5gQmY40iz2AKh+g1pmorhaUTty/BB/0fp0yJ
	 xT8JY0iuku24DshxxKlb/TGDsQ3pX5SKTl2JT/EDrg8NFgK9v3Vsz8my5WJNjQ5C5pCLx
	 6d+F3br5aBbTTELLJ4XVRG6CvoRoRb8RQsJFyIyVXKUI91qI+v+8wGoGZMPEaYC/eKJ8d
	 ozm82yrGlxB4Ipv6cEJkfVKBRl/ECt1kysSieOZB8tY71khD/vv+TjTn3JZuZ5aoBt9p4
	 0bVLpBVDPVgrwHanDe8lEtMjNAx9n6OnMI71Pig+fTUfj/psHxUYgyIFYZXeIe6qhjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uz4m71nRD6f+qddgfa2gOOtoUGlSJn5F5ou4PIom6y8=;
	b=g6omCM86WUd2drx8pX1FnNhQ6tnIi9r5ulZvXW78lzW2Hp5zKnLUTopdUHrBCDiL1TGr
	 BnCpwS6W/LYXnAu+/M5AxBa+uX/aDsJyZoc1r8sSEA92dXUkf+0ZwOb7h2Hy250N68zgZ
	 dxIdezQGM5V/YjbBPvYl4rLkib/ZvmKd9+YlDrGEs7sDUvRlKSGDT/a8YyQXgWevrNA+G
	 +MleC1wLWyd3ZRfYMz7VDLpswegZGHZsoVRrRelItM4vs7mCOgtiNX9qWWErOfRJ289O5
	 6ubsxDjD1TLyOqO50qgcYGDRLN8QkZnN+brpNtOIqccXGos+4NilC9qw77Zf0ZfZe9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UyUZKoyQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF7F606A321
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 19:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDF7F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UyUZKoyQ
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533202fe429so38231cf.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 11:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794426864; cv=none;
        d=google.com; s=arc-20260327;
        b=RbuN3k4G3eO4LKcVAUWJlSu8x52T236csflc1iIYqurLIBhPSaIisuL20XIpMQAfe/
         xpCznGUltV1ut3hbHT2ET8dyJRekJqS5wx7+AnW4qSOKBdHsWvnq9UVbVkjGRwsc0A/7
         W8lDFYdcdc10KqDplblozccdER05szxj6igY0vXL64W+XQQBxcyW8vzf2jS2W0+QFyHj
         iLdcNp7V514GnjvaYTTxjN4gcAik3pacDtmAJIytVPY6Pl+UJ+k8p/Bg92uv2o4jrQc9
         gaf1e7PH4uJewgZFspVqg6KlS3p/XmNt/4k7AkuCk2479l5rNlztjzPs3RQ61B2iHCQu
         J76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uz4m71nRD6f+qddgfa2gOOtoUGlSJn5F5ou4PIom6y8=;
        fh=Cc8oB6R+Uzohz9v09dq1UeTpgm9i6XZjzD4VZoQmwwM=;
        b=P3c6qQR7XvOq74+dM6VzJK9OE36UTkNLN770+ZUU9V3I4xWh8gJEDZ5lKeTMc/+B/V
         WaSVWzZxFls/uJkgC23ZTVfhOsX/WPXSZOpujYapACkCKfCXIqQnlQBv0JX7Cycupj6g
         KZUmlophY6rSO2rDebYKoCfeGxx79OR4kaRDwXudnINqRx3T2OvL1sHIjxQeHrA5/td8
         59v4xZkNBi0anMdG8uTTKIVGTMHxN0uBRFe+7WCJ+p2OTr4xQhnOtuYuXhvrvFCOpUg8
         krUPxidgQ/2MzpJZhjlE8Vu1KIsRM9+SYcx/4H5UrOp+D0Q2QFrDFk84rKcpde/1SuGj
         GA1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794426864; x=1795031664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uz4m71nRD6f+qddgfa2gOOtoUGlSJn5F5ou4PIom6y8=;
        b=UyUZKoyQc0C0giSLwUmxi3MjzDIMTkNydYBrUKpGmXE86lj7P2571vjHiVadD3usgo
         G2eI+g1ON6s3QZHWVAyr7MgPtq8nMO+pMx7BbLCgWOmoY/jaZ5NJGWm/b9Mt27iqvUW+
         ZHxX3KnWpNdxRbCKWGatvcZulAqvLgyfEAqDO39YYc5aiGTltRysfpYqwy7Nsr8bhlyT
         XTkSQTJ0yqM5343RIt+l33F44sTt9lFHYDFyAvv8nrPkrbsCGcnROBJ1Ui5pXOWJzawK
         zRjTymLwLhxhQ+rxlHrdIiYV0b5dK9mK7yTdtdLjBuq1zt1BxM3yYSL4sNtNa98eq/w2
         mSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426864; x=1795031664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uz4m71nRD6f+qddgfa2gOOtoUGlSJn5F5ou4PIom6y8=;
        b=G9c8NgbF3O2JO8yY7iQHd0oyTN/CoTpKcLI3NkmJ5VNFWH+Ng3aF2BP1BJPU0k2GSx
         5kN5kxKiC8IBH9NeBn7c8/Uw+Tk6DA3xh7FL7/HNtsb+luRF69db+wSO0TUUuLnZJxHY
         ZOsSGq/iRqPnpN6ZMbYpfdK9y8IqTftoSTzha9BcN/aR5UzfrrVMPGMQbcsw7TgNfBN5
         S017ESJ1h7tNykGq3iDUpbsqwShvBSa/fCHo/OV02N2F3Stho8XXsLMCMEFNPYzhTXFO
         LHh4SjE+7QhD13HVYJ7YHnCu3Nd8eEocngrdkl0Rho8qO9bv1vQrKYjj4vxCeeuz6RcU
         Z01Q==
X-Forwarded-Encrypted: i=1; AL+hErFSyeRwmp2L4Y55KHDFdU1jL9Ua7d6gLmbt2j5N+IwQJTrNWtK1NGdj0TOUNC3gdVJA00BEGp8DvWaAYQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z98xlwDUQqVUFPRRdHIi+XkUxqcMFbrRQnZpjxq0ipAru0BOGGf
	AyB2cdnftJB8QnNzTE21tAjxFw4fAMxKGIfKUFqUpVjvimPd5B1Sgm/E6CCU7yub8ATvn1KgboO
	tPAKUrxeHwXnJ/OZQXqu11/oow24yiWInjy7Lumi/
X-Gm-Gg: AYBFou3CUmNYUWsXxFdRiYZbujzbo1Ix5JkJ3nHkFbBvzUDyDTb2Lu8rMC5H07c0sbM
	TbDlzhbQvlIzk4Sf7hwjCoZ0fU1krxPGM+2G5y6aNHZE4fkKi9XlZ07y7o2TZoy/0pPOYcWNtaU
	XxJLznUkeSJ9+z9wmhblVP2iWDvm6o9RNDEt5y16HTJPuYW5GQwUVrNYGsuG9CMSjOQcFyTRHje
	22taxaxxriGUrCZ2GUcYaZ9lVFL1sAFNpi8c7zG4I79Ebf9XGX6ep5INlW2Z7Ci+qyLkIpEH1NQ
	Wvh9upTW9guokNnG1ryESIyD812XsuqyGsaOpgEZ21h/y9Emr20W34rdZ/jHFdtcFBz0Ken8qAn
	MrlupTVVXbFEQKOn3jULWWdqoePHUS7+t6rLm7di47YoNpshuyxiuwgZJ48DnVGkOjDP6c/d+kD
	RfEjSx3nQypkFZg0DEYT/NgQ==
X-Received: by 2002:ac8:610a:0:b0:536:6ea4:e6a0 with SMTP id
 d75a77b69052e-5596dcd0110mr2182331cf.11.1794426863094; Wed, 11 Nov 2026
 11:54:23 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn> <1e7fe0eb-2b06-4db0-98b1-3535218847b3@amd.com>
In-Reply-To: <1e7fe0eb-2b06-4db0-98b1-3535218847b3@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 11 Nov 2026 11:54:09 -0800
X-Gm-Features: AclHuK842ds_mKapn9TcQRUw1syxLEFrhFQUvpEEkUm30hfHXep4Wlia77qvmLs
Message-ID: <CABdmKX2hLTrxmZCRRLKFd3GuYP7tr1TX0-JGuXiKAZ+ZV8U36A@mail.gmail.com>
Subject: Re: [PATCH] bpf: make dmabuf iterator stay drained after NULL
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Kang Chen <k.chen@smail.nju.edu.cn>, Yonghong Song <yonghong.song@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 12:18=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Adding T.J. to comment.
>
> Regards,
> Christian.

Thanks I've had to aggressively filter emails, so for the most part I
only see stuff where I'm on To: (and I still can't read them all). I
would have expected get_maintainer.pl to add me here.



> On 11/10/26 13:51, Kang Chen wrote:
> > bpf_iter_dmabuf_next() uses kit->dmabuf =3D=3D NULL to mean "iteration =
has
> > not started".  dma_buf_iter_next() also returns NULL at the end of the
> > list, so a next() call after exhaustion restarts from the list head.
> >
> > The verifier relies on the iterator contract that once next() returns
> > NULL it keeps returning NULL: process_iter_next_call() marks the
> > iterator DRAINED and treats the result of later next() calls as the
> > constant zero.  A restarted dmabuf iteration therefore hands the BPF
> > program a kernel pointer while the verifier believes R0 =3D=3D 0.
> >
> > Use an invalid pointer value as the drained sentinel so the iterator
> > state keeps its one-pointer ABI, and skip dma_buf_put() for it.
> >
> > Fixes: 6eab7ac7c5ee ("bpf: Add open coded dmabuf iterator")
> > Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
> > ---
> >  kernel/bpf/dmabuf_iter.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> > index cd500248abd9..a2b7c38f9ae6 100644
> > --- a/kernel/bpf/dmabuf_iter.c
> > +++ b/kernel/bpf/dmabuf_iter.c
> > @@ -156,6 +156,13 @@ struct bpf_iter_dmabuf_kern {
> >         struct dma_buf *dmabuf;
> >  } __aligned(8);
> >
> > +/*
> > + * The iterator state is one pointer wide because struct bpf_iter_dmab=
uf is
> > + * part of the generated vmlinux.h ABI.  Use an invalid pointer value =
as the
> > + * "drained" sentinel instead of growing the state.
> > + */
> > +#define DMABUF_ITER_DONE       ((struct dma_buf *)1L)
> > +
> >  __bpf_kfunc_start_defs();
> >
> >  __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
> > @@ -173,11 +180,25 @@ __bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(=
struct bpf_iter_dmabuf *it)
> >  {
> >         struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
> >
> > +       /*
> > +        * The verifier assumes that an iterator which returned NULL ke=
eps
> > +        * returning NULL (see process_iter_next_call()).  Without this=
 check
> > +        * the NULL left by the last dma_buf_iter_next() would be inter=
preted
> > +        * as "not started" and the iteration would restart from the li=
st head.
> > +        */
> > +       if (kit->dmabuf =3D=3D DMABUF_ITER_DONE)
> > +               return NULL;
> > +
> >         if (kit->dmabuf)
> >                 kit->dmabuf =3D dma_buf_iter_next(kit->dmabuf);
> >         else
> >                 kit->dmabuf =3D dma_buf_iter_begin();
> >
> > +       if (!kit->dmabuf) {
> > +               kit->dmabuf =3D DMABUF_ITER_DONE;
> > +               return NULL;
> > +       }
> > +
> >         return kit->dmabuf;
> >  }
> >
> > @@ -185,7 +206,7 @@ __bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf=
_iter_dmabuf *it)
> >  {
> >         struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
> >
> > -       if (kit->dmabuf)
> > +       if (kit->dmabuf && kit->dmabuf !=3D DMABUF_ITER_DONE)
> >                 dma_buf_put(kit->dmabuf);
> >  }
> >
> > --
> > 2.34.1
> >
>
