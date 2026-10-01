Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6B747255C
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834625; cv=pass; b=D+hlwvCa6jyCUEdXx0HZkzC7piN2Aw1s+vUQy9h5Je27EgYBkiiSktc/J2hamH4qmoi0FxKaMxQE56U5SFp7t7IUykMUDffABKcHENAoBsWz/68hfONUDP8sV6Q+UA7z/kjRgnWQyb8J6dmKHF+w/UD/TIdfsw01eFTREP57wwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834625; c=relaxed/simple;
	bh=PIROSIJcUm8IhNkrYuoivcsIwzp3qi2TP3RwB/cUmfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=XFdap8hGfMZPd5OodCWVNaHX1+QSg8COdtmhxWeqquujZhch0Q6q2sifVDLqSGXSELw11/DMwYHfqJz1TSJJb+Ol79JRWE1vS+FnWZzj0SVpyzqcbRE2TJbs47LJ+xeoAvL0Kqy1OhF2+LSShK/GOEAeeV2BQahHvAi+qdrTw00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b=viIEHKu+; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b="viIEHKu+"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso54870601fa.3
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 23:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790834618; cv=none;
        d=google.com; s=arc-20260327;
        b=EwWMyObDJ9PamXScgdbBfWyDWt+aTvG1txdTzH0+dtg0+qpvddswyZDRPqS/v0C77H
         Z1TcZkIUWpf2abSlGzZV97ZHPRvG5jIbJfvVAo/4WYHwRTEx2JfhlC40YgypGWb3Qakv
         MOxtf1FWHpJA9PrYI6ggYasi5hVlZVfnA4zOW5Iv+5TUblwqTINUXk+6DSdV4/AQD9C3
         LatN18/fjnWA4KrHzpk0Gf/Gew+cbHw10zRxtkP14T5uTFUY/TlhCbtCuD+TuZMbRNnS
         U6SY5oq3QWUoqm2E4l3DazfmfqdWATTz/jDhXIfu6KfRHkn9k1L+pXIIITAjqMew+h1H
         +xJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hgp1C/l5toz2Y4Urz7dWHnR34B0fNj/IjonzU3eqplI=;
        fh=kGsUTp2m4fAqBE8iVbwumATd48rQbaXvK4LT0l58JqI=;
        b=tCSt6RLDdvR2SRmppiw0A6byHqzq5LCIUQenMvInUvX0fFHcp/zHq+tdqjkwQrF4H4
         oGX3K1+Elago2iHCJ8dr2+Ws4zsZ6KJ6AVoF8wn2lmKmdrznDXu/teT4sZdBOYNy/xds
         iPZLjyJfcbs3FN2pHQOLRTpGUD7Q9MS0+OIxceMhG8YH92F8SjGW8VElEJURdaVTwBhS
         q6JXXOmkBkYOfTA95hw5Xbmg3iMx8KUBn/AcicMmaFiZr2eh6LxluYx4/nw1dMuLlW7n
         8NomGEYsg6b+jpNqWMDD6fvOVVB8kKvBTjy5fSvsLEA1Ef2sxz/dK1aO49gRInfrglLE
         6hyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=canonical-com.20251104.gappssmtp.com; s=20251104; t=1790834618; x=1791439418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hgp1C/l5toz2Y4Urz7dWHnR34B0fNj/IjonzU3eqplI=;
        b=viIEHKu+FSG1KhfrpfaoKKTq6PFqiNt/yYweb4o7LRjKSQI/reGJVzBQdbbtyZr7jd
         Z0A/Fch0XuRIOi2UP4tfHOH4FxvBVQVGVqhSHhKr+sy6h9Kyl2hpOlxJA2XapFj0LrlN
         AeS10H1Sev9gzXCH8WaHb93Su49e6UQHTGWXMeCgZY8V90HaRaFSqCaJQhK4p6kUYulQ
         QTKCPFiQFujjOSeroqFVa4sH4pc8um4RWETSxTgjqfPIDRgqyAo6Rw3aaUFNxGAhO4ah
         5WrpAB5R5sq60Tfnc4HYEiCIUJaIRxxNt8dLlZwsubrZtPgRd1tSjX2ywfmQC/m7ShXT
         fvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790834618; x=1791439418;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hgp1C/l5toz2Y4Urz7dWHnR34B0fNj/IjonzU3eqplI=;
        b=bcTv4dBnUkEaphxS+70GMj2MhxxxZ8u46ZGzlAXoVqfvzVrCWPu6EchCAR3E1Sc7ud
         GwsvmjOXTIRdisWFktuAvk5300CM0qYWPBnPd89dnu/Ovu/RD8VncX07v8IzJzpWbA/F
         TzlO01tjoE+aOTKRXUcm7hJTqBGeBD2z9sLpUKoLMGrDOmWhaY5r3H+IKdRRBlP2LQJA
         7uIlFKIf3CjYjcejmSVMx5imAROlG2ziDRFi/JFDl+1XnFW5upl3N7ckzBynvOwSKns+
         x7W8tBnwTxmvhH9vhooIiaP4TZ7fSLkaubofyxd6M4ykWyAp8L/Bm9Lc01OKEomE5/JG
         OXeg==
X-Forwarded-Encrypted: i=1; AKwUvBzpptfV4QUweAKJ6mfFaVNNESrp7asZgzk5sKsLovGAgwufXNRgpootsE8CioZIFY1hz9T8tqtI482GIw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKS45a++ywz5B1yzSjrsboyCsqCIlz4h2ta1CBojrM52PkDUZ2w
	FtNReI2KC//02Zri42cqWhbFMKkUm/UFL0XFlInXnOtsHbEZyqvYKqg5gVtiIBh2qulq7kSk4ad
	rgcHdSGo5M1//ZBph5MpaS9H+pijc8RZqD+ofO2U=
X-Gm-Gg: AYBFou34ahJjKwQ1MthNDiSk8grZgAQAMy7rTa1QaCIG3Hf1/10MjgPj7OXOd5vQP8b
	ef+bSGpbaJRowk0xsURUZt3LWq3Jz2WxFRP2qvzzVkBDT3rJ52By5V2hF3KUptvw+PVM0nZDxGT
	qj1DS/3/So1+rZAbMRc96Wt8SQo3vjjd2G/Ys04wSHxFlOhGUc5ht7jTH0OYuY3S+TYTUt8SNN0
	q7CSjTzovZ3D+6+sb1YjjQDoL0/ZTXcwIbIHshONSjKQTQw4/0kZrDpHH5T3n7LF5uXtiPA6aYX
	4IkSh6ycZAOiJn8eV1lFCMioPUr2Nwd4FoQMZeb0jVakYifQCu3yQyo=
X-Received: by 2002:a2e:be07:0:b0:3a6:568f:40eb with SMTP id
 38308e7fff4ca-3a7792077a2mr11432771fa.27.1790834617800; Wed, 30 Sep 2026
 23:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114011917.241196-1-acelan.kao@canonical.com> <CAMz9Wg_i5Sgewa2N7jfEoNJrp5jMp+O5m+kM=VN9rWKcGLzQXA@mail.gmail.com>
In-Reply-To: <CAMz9Wg_i5Sgewa2N7jfEoNJrp5jMp+O5m+kM=VN9rWKcGLzQXA@mail.gmail.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Thu, 1 Oct 2026 14:03:26 +0800
X-Gm-Features: AclHuK8bG-XKFgjsQDqse9lVQ8q5WyIRi7oBeYeYkMJTSBRhJ-JWaOzReixkG5Y
Message-ID: <CAMz9Wg_E686NQe5XigWX6s2mbWE4t2DoTvW+GmtMzN6bP0tQ4Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: set SB_I_NOEXEC and SB_I_NODEV on dmabuf filesystem
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

AceLan Kao <acelan.kao@canonical.com> =E6=96=BC 2026=E5=B9=B44=E6=9C=8813=
=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:10=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Chia-Lin Kao (AceLan) <acelan.kao@canonical.com> =E6=96=BC 2026=E5=B9=B41=
=E6=9C=8814=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:19=E5=AF=AB=E9=
=81=93=EF=BC=9A
> >
> > The VFS now warns if an inode flagged with S_ANON_INODE is located on a
> > filesystem that does not have SB_I_NOEXEC set. dmabuf inodes are
> > created using alloc_anon_inode(), which sets S_ANON_INODE.
> >
> > This triggers a warning in path_noexec() when a dmabuf is mmapped, for
> > example by GStreamer's v4l2src element.
> >
> > [   60.061328] WARNING: CPU: 2 PID: 2803 at fs/exec.c:125 path_noexec+0=
xa0/0xd0
> > ...
> > [   60.061637]  do_mmap+0x2b5/0x680
> >
> > The warning was introduced by commit 1e7ab6f67824 ("anon_inode: rework
> > assertions") which added enforcement that anonymous inodes must be on
> > filesystems with SB_I_NOEXEC set.
> >
> > Fix this by setting SB_I_NOEXEC and SB_I_NODEV on the dmabuf filesystem
> > context, following the same pattern as commit ce7419b6cf23d ("anon_inod=
e:
> > raise SB_I_NODEV and SB_I_NOEXEC") and commit 98f99394a104c ("secretmem=
:
> > use SB_I_NOEXEC").
> >
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > ---
> >  drivers/dma-buf/dma-buf.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index a4d8f2ff94e46..dea79aaab10ce 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -221,6 +221,8 @@ static int dma_buf_fs_init_context(struct fs_contex=
t *fc)
> >         if (!ctx)
> >                 return -ENOMEM;
> >         ctx->dops =3D &dma_buf_dentry_ops;
> > +       fc->s_iflags |=3D SB_I_NOEXEC;
> > +       fc->s_iflags |=3D SB_I_NODEV;
> >         return 0;
> >  }
> >
> > --
> > 2.51.0
> >
> Hi all,
>
> Please help to review this patch.
> It does the same thing as
>    ce7419b6cf23d ("anon_inode: raise SB_I_NODEV and SB_I_NOEXEC")
> and
>    98f99394a104c ("secretmem: use SB_I_NOEXEC")
> Thanks.

A gentle ping

--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
