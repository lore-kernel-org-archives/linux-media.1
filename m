Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793990538;
	b=YdbRwNMo5JdelXsI2CZOnASj6UyLSohf2gUU//WoO4QfgEPRA0qWW4inWqHtWsLRCcoL
	 6KR9VUIsg60sVUqnNZMvHFWAT5ydhVf5pw3M/C1y3BAJpj6UWHW/o83f+Vgg7goVDMQb7
	 AbcLMXVAZB8DhUS9NUlkGuJHVWfVoibYL8iMCZTlgY6KrQM8a3F19SbGMaj6LnTr2+xTj
	 qC8nJ3ypNYE6+1q5I/J4jS8EgTfHdHi8iOuEaB7hleN2+KLyrTK5yP+c10gszHpBEWnI2
	 /wEKLUX/0gcdQuEtX8DWeYvyfhQBf1+bl456k85H8lSWPYUqH6RodbjDSpTJ6CXrdUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9O0I1WlvitVAffqL6IMDmurKacq17pLSSS1ily/aCXQ=;
	b=4XvOjNyp3u1ZqiHyu02Y1kttaqvemFxOcjpb32/7VWAR7oMmJR98wsKeoFMHpGY3Qshj
	 FnTwWKgB3+9/MHUUAuuYQmW1Et3D7EZVSxccM537+l+CMwA1aqCi3Y/7cIxoy2KWBnLWl
	 RgT37pclwN8fOWbEI8AqSMq7xfH5qrvoznA/euQ2HSU2h75j6/vLfTov6ty+iE7PcOWzf
	 +Fx9hK+WwXgUwIVSgmjsTVrGbx+YG9MyxM2g58tMUzLhqkwzmfSRwp5m6P0pZR/oa/vfA
	 fWaQrVRTkuchfk0OQGStVFdR7LZq9DH5cDy5j7RrHCVyp/NIey7VYZKNJtzxLtA0RTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Ltf/oDpk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A5C606A326
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 18:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A5C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ltf/oDpk
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533202fe429so95071cf.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 10:42:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793990537; cv=none;
        d=google.com; s=arc-20260327;
        b=YvBUhpqDYyWdl0CkTib2eXwyYoOihtjeNXbklPRl7eNMSny5UNVU6w3mQShef8O9FU
         DLT2gGDG+pxA4395bx3+ID/tCyVfcHcswnQ3fuXEhkYErPeYtSsqpDOkmLYrkgZ4P+VG
         g0w8bLw4Eld5xJTsmICKuEd0+N+53SYiiT2AMzZQwnfmY6qm2Myd3n0AL1nEaW5OdvK0
         6mpG7DkoFNUy2oucgMwzyexizifvUgPgkbns2G9xYP4iGkMnScAvQfGYhM11li7IPJ2W
         GX0PmcwfZIGgiemFZlYcQj8sQGfdPqCs2ddtYK+G1bDzXYIjTg8SsmS5YhdJfjWmKv5a
         6tcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9O0I1WlvitVAffqL6IMDmurKacq17pLSSS1ily/aCXQ=;
        fh=R/VOvmE/9rsuBFrEkXgmElL+6d5I9zd2hhqH73Jfaj4=;
        b=sh/I87lufriC/hgxLL/3fus7p1DWr/XsNwVO3lVJpTQgiXczVZD5iSMAsOhhKHU7Zi
         gGVs5pHSUUGa8+cKpwkFK9e8F4/oFq93dlvRZH90gt5hPWEfbH1il9ElggZsg8MzYfIT
         sSWjDifUh/Cgr8yfSoPCYGP8R7w0+IgwLQoBu91XxmORFnP9W7skWH0FHAIWQeukhZ87
         KjJFd7QZo++kMNCzNwKSMNoXnFVL21Iteq/0kaQ5ac0TXP3I6Uc5oi/BxNlCf+m1989s
         n7WO4oBuxjQcGEo28hAlTGxVFVL8ivCgibIl8T92d8zBFIXrhNQE7baCuKJliY775cbH
         X/8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793990537; x=1794595337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9O0I1WlvitVAffqL6IMDmurKacq17pLSSS1ily/aCXQ=;
        b=Ltf/oDpkqac6bI1uJjUHiRwh1Kax9N6VmOnzZTU9UnR1nI5jR/ZJgtCgX872jJg12c
         OwBo6Gpy2AvgGNrKEJMqjYCMptK00JqkuY+CdFLSSHJm1ouwAxQabqukjUbIhSARx7AZ
         3qXkFzxBNIWGNn82I7DRDaQcqwYXyMH4pRX0VVDc/vhuNnKqxZaCAS0t7fvKgIip4I2H
         s1LJ89ykjtLx2eIRRtfdtJUAFMlwx6auuxaDJVSk9UHMx4JrhZRzKSA8GhUd0M8Jfz8n
         HJL2Noca5CmCLvc0376jFczCfDmr4t9rK+X0LdRMukeq+4BKYgvPtCaNT5XyWq5XWiKq
         ImlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990537; x=1794595337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9O0I1WlvitVAffqL6IMDmurKacq17pLSSS1ily/aCXQ=;
        b=ANr52LOZU+SIHD1OjzMVx9J8IaHfot6YfboZiqLW11m5ctyhIa/3te6No54L2660K/
         5Bg6AH2QXwqpgVZ4vhR1WR23mutUAskaz+x8Iav2TD897G+vX7Gu5U7GjRHSqpF29iIq
         ArtkorAcM3mVhYuUwML52oD6hy1R/PpJNqu1lFCf6dJ/pT4R2ZJmqHtGDahPKNKdu/yM
         L74TvM5sTvl8FTB/vmHbbTM0xYv1ZJr2phTDgZsw9srYjv4XwmMMi4tRVYUXKgrrm73F
         DZr3THbPBsFFZBPSNoAvSnDQ1Nxieh2fO0Z8Givv1kccLw9c3sKLlUpXP2Cd7O76L9+D
         T+Vg==
X-Forwarded-Encrypted: i=1; AKwUvBya+cMJZYlnGg9QqDBO+N4hM/smKe2AzWwqP5xLl1RlGSNKE9FloeLJs1Dlry1ny7m1DM/tRxXXz6CxvA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/RSvgNtZ9OrL6jl2yodftXwmvcefTyYPijrRwATEWuGVFMsoHI
	C0MRAzEheKJC4hTYw/KwbT+8PpIbkfqZNISlZPwMlzq8/U9yJYcQT7tHZCHzc/yYILFGytR0VeA
	1YL+2uL9XIK7BMIaWAKnyM4aSsnD+qFi0uNTT28DQ
X-Gm-Gg: AYBFou1DjEt0MRGaVTE8oDI+/wvAQVRAuENPJzNaP8StDVDdIKr26PSW+qxDcDPGpve
	MEPJ9h1ca04NloZmEA4o1Shc/osgverKxikY8Ffogkfn+1JJy0Abdm48GK2GcvGT7wnc5qCqDFd
	AvDXLlgMGe+xNYnCz7xTk0ShiCZpxl449R5Gl8FoHV8Nb9Ki5qr/F18RolPI3rHVvg4tGr6nWDU
	ewIYEkHxjpLvadT6X6RXyBpGLIw0GJVtN5n1mq4tnIo6ArCjeRrBuE3+8D+ZRLq2ZQohIpdH52y
	Re0B1AwIgdAN8zd/0BYOouhdGBjyAkf7PiZBNi2xjZ8IVOP86d+lr94oqXln7jIdh9Eyl/5+nxo
	AyjZcUNB2KegkcapSpLrxQptxHHe0lFtiof21UMP/5yZZYT1usfRJ5W2yKJ6X+tkXfsQ/jbcSzD
	cYQ+eLyRM1IyYbN9BlP9KKzdA=
X-Received: by 2002:a05:622a:90c:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-54f5c235197mr3962781cf.5.1793990536696; Fri, 06 Nov 2026
 10:42:16 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260811204123.3198370-1-tjmercier@google.com>
 <CAO_48GEUhpyeenX8Vu1NoDnvzib5FGv3rOBYNYwQEWu1-6cjaQ@mail.gmail.com> <CABdmKX0uiX=QKFAYgwwBPHW-X3vh-Rm7w-cNp9EsJzQarTzDpQ@mail.gmail.com>
In-Reply-To: <CABdmKX0uiX=QKFAYgwwBPHW-X3vh-Rm7w-cNp9EsJzQarTzDpQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 6 Nov 2026 10:42:03 -0800
X-Gm-Features: AclHuK8a9YKRuRmcG8Sb2ftYE5SfU2l8w8O16-ruNv6bWd_JSLmgbTqw6Ki40U8
Message-ID: <CABdmKX3Ep0cAPakwKDYWnOkrFgfhsJAv9Mh1us+OfscyNeb2tw@mail.gmail.com>
Subject: Re: [PATCH] kselftests: dmabuf-heaps: Open heap device files O_RDONLY
To: Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 9:06=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Wed, Aug 12, 2026 at 8:02=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro=
.org> wrote:
> >
> > Hello T J,
> >
> > On Wed, 12 Aug 2026 at 02:11, T.J. Mercier <tjmercier@google.com> wrote=
:
> > >
> > > Write permissions on the /dev/dma_heap/* device files are not require=
d
> > > to issue ioctls and allocate dmabufs. Applications should be opening
> > > these file as O_RDONLY. The BPF dmabuf_iter selftest already does
> > > this. [1]
> > >
> > > Users are pointing to these selftests as examples of how use dmabuf,
> > > and encountering permission errors on systems where write permissions
> > > are not available on /dev/dma_heap/*. Apply the principle of least
> > > privilege to selftests which open dmabuf heaps by removing the write
> > > access mode and using O_RDONLY for the open() instead.
> >
> > Thanks for the patch.
> > >
> > > The same is true for the vgem test using /dev/dri/card.
> > >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=3Dv7.1#n49
> > >
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> Thanks for the quick revieews John, Christian, and Sumit!

Hi, I don't think this has made it into any tree. Can this get picked up pl=
ease?
