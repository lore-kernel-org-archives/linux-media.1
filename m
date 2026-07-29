Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEF5469837
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 16:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785344013; cv=pass; b=BExrLi9JzmhHLBnC8VUOCgShc4xnaeaV3fm02JtmwdIUHj2hhGORVu2Di1fdPgVuM48uiQH+45hb3Brqr1oiNDWjYEjPiI7Vsk7bcoDLk8V8spB7Oip5N3frAdeeK7e8hWfDaU4c4AJ3BgbXN0R0bocso2rhsW2mkvc0iR/O6m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785344013; c=relaxed/simple;
	bh=/YYV8EJ3uAY8vVlHWLu4xPFSaaoxJidP5IaWXw3aYyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPK/ede2tgN+1tuX+5oa+I7nF5UvTSn7RtKGSLv80gx5Cw+klC8wmgOF8LRmGyKU6xkkgCAOBBvpCH0Fjy41rixy3k10JSnjfSLGv7alu2240KN7gJy+Y4BBY+KXj2Q1tgXukB+JeoE/3PnQCx1pR/4g0MtPF5qL9WsNSgO5sjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZnLVGTN; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZnLVGTN"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so1289345a12.2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 09:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785344010; cv=none;
        d=google.com; s=arc-20260327;
        b=MV9w4aB1DVk2vFWevB391la1Hxl9ILgibF3NTP9UtU45dO4PW9NMkkMDvMg4aGUpwz
         qeOkLnAbCjKEvlzJafh0nfVyKeVuyfcWJ4Wh+9k77t2SY9GAmUmJJQi1hY9KWnlVhq77
         Yc6m6I7eHIBYEKFedgVMSkbEHoVQzyfNIBqVMUFuQ8mkfNlK/NrZ5+ZIBFvMTWdDAjZD
         KBtau5r0bOTJ0/tJV/vY+b2Ck8cnxr7ZcVdBC9VUKRisfqtskztpAOXzm8am/CbzGB7k
         S5LeAmXj+TJaHNnyMBQfViBjNdGjk2NJy5P59O8HDoh3vzqdYxZ8h3P/yGee+lfHyHTq
         qfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iRO7Ed4PohyaBZ/SmZ+npcgI12Qnh1MLhDgk3TF8jow=;
        fh=tDhC///c8RX3a4+qNvDQXyr/keJwunUV1rleqd/T67U=;
        b=Mpoo/eTB08FSzh8fwFS5zxmUJWouWGhYAQtZw4hiwyhmsC+ovQinmqbdy6VDvZKSRp
         X1EjYDNF3eGNeNjsOFDGM1QeLK1L5l/5hvxDcKcSHFHD1aHKEcriEk/ylY0v2UyCnncw
         WFOWZxg7o7uh9/e6vuSpV7bdkqNl/Tt2TTnXg/TSOpdfHU7BuN28fUgr1RGfTAEQg39P
         MrixHoNdOoBpGtr4bGDmX77tktb/nsTXKyIjMjSKzXHAeJYV67HOITtZ9KsbTwpbhQ23
         wqE0eB+zWhVC/DL6c0PmxS+g8+Wijb/2a1w30+GyKaZV3rp89kyzTjfc9wBXeU7ACEkJ
         m61w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785344010; x=1785948810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRO7Ed4PohyaBZ/SmZ+npcgI12Qnh1MLhDgk3TF8jow=;
        b=bZnLVGTN71+6rOGUEDOF2KKfsBoVzgPc+6KjOtUaxwoQVgAQmK+bgtKyqFpFZyFtJq
         nJFEqB8j7YlMnW8bUNEzJRfJdekDJcM3xXyXgWJfL8WDAjIA3f+W8yZPcnNdDQX6YYPs
         zt8TRyVY0NOcpOxJVRgxQ3PtjdnE21ULXhmra/XwVXzB7WWEeWKmgccKwMgl8IfnmX9e
         NcmoVChs0wbWpUsGydeoisKkkxMd3DGcCAK/J5JcBvgO1tu0OLStdS8VZccIfwTe6wFB
         My0l1BLssPp/A1RJ4FF3WmwVQ3SdB6FnYUo9UJmt9ZOwzK9HEYfhV0xxZNVb2TFtv0WA
         WvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785344010; x=1785948810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRO7Ed4PohyaBZ/SmZ+npcgI12Qnh1MLhDgk3TF8jow=;
        b=W2zLGxtQE9euB/698bUOakXjQOZ03HFuJJuMRBOr6remoaPcgXGheYAyiQMnn1iTTe
         ol6NpnR9IvftVe7qeRkkYOjicYSuyGLjV4he/mvrnEQktgj9cnMrlGNN4QkzgOc76FXc
         iDZAyts7tMj7RDWjLsgjyEbJLD0/cmGcAfylNabx2SpO+sS5w8CNK7vNk3wPV3l1Nncs
         jBMw4EbJB7RmA9Hey2jkxE0+Sn0JPpXioLTJ8tq9KoBunxrIu7F7emzd+RgqXD17sQzt
         NPf6RhZ0WC5JLuE82O6t/34b7usJUFwpTSm0phreH/KUDXeRB74zCNe+/lXmn8M5w+q0
         dFLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4aSTHsad1vys9RSIqYkqHV7XOOn5E8mPi9ArYsmAX6YoY2ViUppcFzOS1RNCOR6TizIJLO0tQjI+xJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP1EWT+8+x6+EeIUh/e3CJadTyCo4g5tG5fnb0NrerJ7alJrvr
	h3mtU7skNttdhkULzo1zMxJiFO2Sr0DZ+2nteLpXu6ItUu5lSTAmbCy2pO496qx5VHuQAdTpke/
	tFBSUfFpvc3C411L5/B9axfW4LXs2IA==
X-Gm-Gg: AR+sD10elBexTHR9/V38noFpqWmaRYY8yKq7OdIos+/A4bPyAGv5+XTh8SJcxHEUlg+
	v0BjdN8aVLmpK6ojTx6TXdOeLPVmcDw/JkRqxZsSqcHYnsLxTik1llx6CxOk4KS8xtt1GsL6O7H
	EzjzUF6E6QulxSewQ6Czc0FsppNJNE/PXdNiy00XU20kCx/+2+6dyJerXr5RWgIIxA+lWWcld7n
	WmMTu9qSizCf28YUD+axeZOH26jJhjHdkGWTGsy7rU0xpSMRdfx+YWqOTciPB4melZlet9+32Y4
	phYNon04H58V1ARk5Q32hNiVaRuh7OaLMx+XbMAkOdg3xj9TpnGXO/m/7Mj2S1ezTuXBdQheZu6
	1I36w7ftRynyyM1ni0g==
X-Received: by 2002:a05:6402:5018:b0:698:ae69:3992 with SMTP id
 4fb4d7f45d1cf-6a0349ec697mr4404066a12.16.1785344009469; Wed, 29 Jul 2026
 09:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785274111.git.asml.silence@gmail.com> <CGME20260728213020epcas5p1721e72ba5544abf0b61482da005120d9@epcas5p1.samsung.com>
 <26dcd0ae5c87a3ada5710b14b6894ef343cec6fe.1785274111.git.asml.silence@gmail.com>
 <583fdfb2-5368-467f-a388-6d388859c995@samsung.com> <0df2f832-e8a8-4fdd-a5b6-e08657c2891f@gmail.com>
In-Reply-To: <0df2f832-e8a8-4fdd-a5b6-e08657c2891f@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Wed, 29 Jul 2026 22:22:50 +0530
X-Gm-Features: AUfX_mw2n1ETd8ASN5Vcu4oMSqcqp6oKyV0zFdoD8l7zvxibNrqO80gPOx-5lV8
Message-ID: <CACzX3Atj+hJmF+Au1Yw5KMk--EHy_J=7Yof1aQNkUV0hCrdVEA@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] io_uring/rsrc: add dmabuf backed registered buffers
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: "Anuj Gupta/Anuj Gupta" <anuj20.g@samsung.com>, Jens Axboe <axboe@kernel.dk>, 
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	io-uring@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Damien Le Moal <dlemoal@kernel.org>, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, 
	Benjamin Marzinski <bmarzins@redhat.com>, David Sterba <dsterba@suse.com>, 
	Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev, nvdimm@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 7:37=E2=80=AFPM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
> >> +static int io_import_dmabuf(struct io_kiocb *req,
> >> +                       int ddir, struct iov_iter *iter,
> >> +                       struct io_mapped_ubuf *imu,
> >> +                       size_t len, size_t offset,
> >> +                       unsigned issue_flags)
> >> +{
> >> +    struct io_regbuf_dma *db =3D imu->priv;
> >> +    struct dma_buf_io_map *map;
> >> +
> >> +    if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
> >> +            return -EOPNOTSUPP;
> >> +    if (!len)
> >> +            return -EFAULT;
> >> +    if (req->file !=3D db->target_file)
> >> +            return -EBADF;
> >> +
> >> +    if (req->flags & REQ_F_DROP_DMABUF) {
> >> +            map =3D req->dmabuf_map;
> >> +            goto init_iter;
> >> +    }
> >
> > O_DIRECT is checked only during registration; we should recheck
> > (file->f_flags & O_DIRECT) per request.
>
> Nobody should be able to clear O_DIRECT, unless I missed something?
> And fwiw, io_uring wouldn't be the right place to do it.
>

fcntl(fd, F_SETFL, flags & ~O_DIRECT) on an already registered, already
open fd succeeds. The consequence is that subsequent I/Os switch to
buffered I/O and cause silent data loss. Something on this path needs
to reject this combination.

> --
> Pavel Begunkov
>
>
