Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F6436828B
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378442; cv=pass; b=nqM0CDMgLItB2mTxk3U6JUJLaGGh1qF7gFjBz26XN5W0kiN5stJQ8AONg15P9NEMzbdUYieRVjGAFKDuJxCfADxB9dF8ZTyi0fGCzUejDN6H72qU+FoYXCBoK0G6JM8auMvkR/Q8tt2RMTEd02DBkwZE2riYuRzI0JlaOOSYoCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378442; c=relaxed/simple;
	bh=NxMnKEtRmutvBESglMehXusUK7HyhLRrYQtbmHJavXY=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIqHoHXwOv6/lt512JeR7yI3SjZhF/O1HrEJSF1Mdpcgtsevvgn4v9G11Gy+/0v1AuLKU1ssAEBRL+VDYY54Pre/ULKGxSSv3R/lJkKCZNHoYw1FKaWVnJgJlkObXVcvmOabCJbLMUMJxZPVYOjD4jwFVaMB4r9GbuN2jkMBSWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMBqoBU9; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMBqoBU9"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-804239c418bso25376287b3.0
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 02:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782378433; cv=none;
        d=google.com; s=arc-20260327;
        b=Db5YDZff9xfjM99ofWNAqkQ78PmRVDCu87V+7RVu0+rR/MJKjH6XlzZrUPEYgY3mac
         MU/4J1/WRokK/giLcYfWCpjrnb7lQJ38ImZFjMigWbo3+hazK1oPyCKSjqb8HY9W+UMC
         5JwiTcL0nKmcrOif2KLmWBC/j0LhwbyUp9MpBLbta2wOANwD0nlnR+g7M3MMKgaAw3Pi
         ATTpaWPMf96gpEKbwizBXdkD59LQ+kmK74OmV4c5P0bJi5nl9r3qJNpl9JK8uXKHdPfd
         WwgVUNjotHGHEYxjgQKwNGNjuuQFBr2q3SLphHMzzyYQhwEAX/skdkib4kk6Y4OMTj3a
         yM7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=NxMnKEtRmutvBESglMehXusUK7HyhLRrYQtbmHJavXY=;
        fh=NQ6ENZer9B+Wl6g1foI4XA0q4QSUmtAIRyAWJ3VCTnU=;
        b=Tu5bMMy0fNMiP9ayY5WBmbDlfPtA29cpNGMWkbIfb9D/HDBCaxD/Rt/ruQLTtNZFc7
         0TOM/dkNKVk+YJ3hPivENbhGDMqHhpbnVfg83XTwjzI/7CLbGgb6D9keKKop24YMEwKc
         Vymt4IhmBYIvxBeaD3mw1lOr0dmiU8tpMTpxg0xpe8B7satUUxeWNkuOrOdSmM7ueCV2
         Yf21iQJtsZ2df4X9R5Z6Upn8nAn27a32xcGOaNZsa5HhO7A7sLN91V80SeTNH+NeeeYv
         9PBYICPyj7iligLIZV8FMDp5YpOi2Lis4aut7h6CrZEydtzyPVfZsPz0mWaUL6Qmaamh
         oB9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782378433; x=1782983233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxMnKEtRmutvBESglMehXusUK7HyhLRrYQtbmHJavXY=;
        b=JMBqoBU9rjsVuNaiJghSx5z4D+rFbpdl++a5I1CCEQl2AhHqdX6ALLd7OjiNcz0tws
         qUGqKqWMExpTCDrDh79YQSBE0E1Plw4ga/svGpbIJ2w74RWxtigyEKsiGqbHUrom//DQ
         /MSudEdyMWDk7h1CCgwj1SkDyD+RxDnEaHQ1ICaIhHXoYaIPkmlnSg7Kegx1eMD4+fvC
         FtXc/VJOU9ExOzuAjKst9PE9zqi9dFMwpwg4PbwAdpVNYwVW9gpcGQiQcYVFxhZ3tFbi
         sOsq5fiQmYEgfYc6AZ4u1UItFoJ+05UFgwVbF/EFpNBMJCDnNeb1cT9Y9PyQBjIqi8/U
         N1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378433; x=1782983233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NxMnKEtRmutvBESglMehXusUK7HyhLRrYQtbmHJavXY=;
        b=gzLcPQ/z3Hsc03sgYiNhLO0OkfGsSih+xneKwT9Xx3dOjeF/c7ZAKSaTSg4TY++v8C
         l0Yl7ZbAnQPAuUS75Z7QXmlDWHuzEN5viggs90wAyXaCGWiZO9vfouL9M0mcU+FPcWMm
         F/fVDS5A14dsm9rzlrGQj3+xJEeFGEAu18KW9NdEay4psKqSjS/GnPlNzdIOqo4zMRdA
         dgeUp42jsTa0NJ1kAqOQW82bbh16y50eQD0G6kdQZRrNYdZOQfeYzCCScCxem1J0c37W
         D6ge5mrGcaJ90F/APGBgYPeEjxrRoEq4AGz6oqyEpUA9ubcEJXomwoYgoKYCNxQB/fVJ
         /StA==
X-Forwarded-Encrypted: i=1; AHgh+RqOdyicGOvVkQkneQmzw7FdW05uYq98ASQjYzAMqjJYousbBY/VzHO+ukyORHLUOxbg8UDV3mqcO+iRaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI57EhzhPpQXz4K2OdxNmacLBXrKD0kF6fMB+k+v+C2PTFp4Oz
	NGNO49pTzeC1U4NXTNlvoZYD7J6Hl30XB+laNzZEODBFiEtJjnNCDq1V56Irwx6mDC6XF1X5XYP
	fGBhC5cbP7EOA2QudabakCdaJqaxCn9A=
X-Gm-Gg: AfdE7ckvSvY2E6JUVkH4LbHfQp5ZGTz1HsFTXhFHkoyup4yrvQQWalAq9bnw5U7rQHA
	Xk2Ydo8k+hv4XKaNXXfPXhFI0+H3jK5EP7JYPs+z6EmQuOM8+iH1DoxuQ3/Jx5eiGny7CqWB/a2
	c4sHxZ3pZI1fhvZRMW44pa/jH7AvjybtXQvg/agWZmVy6ivTVnI7PDgc3+nX/zaRbge0iKVuJlh
	UZUGDQFrKKdVilDg0W1jCl1r8AsYVmdFVzDlxhxlMvTFBjS4HyjECt0c1jhfo/osBnW5XqaIQ==
X-Received: by 2002:a05:690c:6d01:b0:7f6:bed8:5420 with SMTP id
 00721157ae682-80a688ddd42mr17613747b3.16.1782378433216; Thu, 25 Jun 2026
 02:07:13 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 25 Jun 2026 02:07:10 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 25 Jun 2026 02:07:10 -0700
In-Reply-To: <06bddfca-d868-4043-ac6f-28ca103fff02@amd.com>
References: <20260624125242.11232-1-alhouseenyousef@gmail.com> <06bddfca-d868-4043-ac6f-28ca103fff02@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Thu, 25 Jun 2026 02:07:10 -0700
X-Gm-Features: AVVi8CezeCOLduwTJPystmNQMhzBFoDmS1Ku5dFQnx-yRqXL5wq6-ysBxSe0GV0
Message-ID: <CAMuQ4bUdL+7OujEf6f-OUPeDgVK4FHXbL32vk3cPBN9DbGOkmA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: udmabuf: avoid list copy size overflow
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Agreed. I sent a follow-up that makes list_limit unsigned and keeps
the checked array copy path.

Thanks,
Yousef

On Wed, 24 Jun 2026 14:58:58 +0200, "Christian K=C3=B6nig"
<christian.koenig@amd.com> wrote:
> On 6/24/26 14:52, Yousef Alhouseen wrote:
> > UDMABUF_CREATE_LIST copies an array whose element count comes from
> > userspace. The count is compared against list_limit, but list_limit is =
a
> > signed module parameter while the count is u32.
>
> We should probably just drop the sign from the module parameter instead.
>
> I don't see an use case for negative values here.
>
> Regards,
> Christian.
>
> >
> > If the limit is raised too far or made negative, that comparison no
> > longer bounds the count to a range where sizeof(*list) * count fits in
> > the u32 temporary used for the copy length. A wrapped copy length lets
> > memdup_user() copy fewer entries than udmabuf_create() subsequently
> > walks, leading to out-of-bounds reads from the copied list.
> >
> > Take a positive snapshot of the module limit and use memdup_array_user(=
)
> > so the multiplication is checked before copying.
> >
> > Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> > ---
> > drivers/dma-buf/udmabuf.c | 9 +++++----
> > 1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > index bced421c0..b4078ec84 100644
> > --- a/drivers/dma-buf/udmabuf.c
> > +++ b/drivers/dma-buf/udmabuf.c
> > @@ -469,14 +469,15 @@ static long udmabuf_ioctl_create_list(struct file=
 *filp, unsigned long arg)
> > struct udmabuf_create_list head;
> > struct udmabuf_create_item *list;
> > int ret =3D -EINVAL;
> > - u32 lsize;
> > + int limit;
> >
> > if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
> > return -EFAULT;
> > - if (head.count > list_limit)
> > + limit =3D READ_ONCE(list_limit);
> > + if (!head.count || limit <=3D 0 || head.count > limit)
> > return -EINVAL;
> > - lsize =3D sizeof(struct udmabuf_create_item) * head.count;
> > - list =3D memdup_user((void __user *)(arg + sizeof(head)), lsize);
> > + list =3D memdup_array_user((void __user *)(arg + sizeof(head)),
> > + head.count, sizeof(*list));
> > if (IS_ERR(list))
> > return PTR_ERR(list);
> >
> > --
> > 2.54.0
> >
