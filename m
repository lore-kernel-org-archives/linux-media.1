Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BB842E007
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805361; cv=pass; b=Dvb4jTQyBT1HBACITzNoF4X09m3Xe2zOMQcN+M0S4tnCCnwGQyxL5xyXZNj/zMNWRAK9nin89pOWNT2zKEzOBEsSdaOjdMAg3rY6s9/sGsyUdK9Xx1VSKw0uJHbXshT8QOnTWdqJLZHCqMkRp2CGvVNjmwi8YKGZCJRjYCbpTy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805361; c=relaxed/simple;
	bh=MUnFX2Kd1u1rl9k97vXohjbbROAqvzbf7iGpscvJBSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g3WQIAXoIuMslazqvlKkai86cOywVhxECjviJuS8bWa3d+5n94d/dkXc2ZNx3/8XKRY+F9Dv8UG0xqi54D5E8nHrDhviIj5Tk0+3cgrphMnZikr0W8H6/EBDvFjjhjZvBb06IcRmCcbiO9qA6d5dP1lbR0hes983j1Kg8CaWkMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5QJJULr; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5QJJULr"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ab8d96d02aso12534807b3.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 04:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791805359; cv=none;
        d=google.com; s=arc-20260327;
        b=ay6uSRJzWaXratxI1E0luggW76iG4LYOQC75UBIQHYE22V/9fsj6HyVr3fHNl5yw5H
         CCfdYELQUe7tTAqXvYgvKsm/D+t2yTOlt69dXBlcLHYza9WDnSF+AjXH/2DOrhMBNn3k
         pFKF8es95+eEKv28Ydzr/edchtzUldNbQ8rjvIBFnOwTIc8zBNhNQjWWxKLKTmugwA1i
         bSiceNKD8Lpk2BEDQjdxWnj9UZnpCyGRJyPZfZjV5F4TCRN8RyVzXJb+L1UBxWpmK247
         5Rz7vhrw0bCTlcPSe/kux6jWeuHgvVRVNYntvk6hg4nl1GHACaC6HZ0GVKRxB7iQz55i
         oeRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8d+kg9RkP1lylbAE//urm5mkbXdgQbKNqjBZri2pwEM=;
        fh=GOpfY6Dh0xf8LnnoJhamv9T2hIrHQLPrBqUxUPu4YbY=;
        b=ZLFJ8qLEew0bTKY0laiRaIiEW8EjFtV/SpiEoT9On+VnmWyxVLIZIx01nuivbrFv2E
         0Shr9buRRZ8zB+pxp4qCulzueKipEbwu0tHOmGMgFOKUHSfxeQQpmulXbJ7iZwwF+snB
         Anl62p+PAV5rbPE6+SisJCR006dofyJZNQC/aQx7BjQAcy6wNMqJ0mimfvSpzv9sYahM
         tWQw3nPMNDlJLS/pjroI/Axgd7UAIIrs22clYgYyzRaW4KiFngQkcZTa84lPWg1DHB0d
         /I4ui+EKjd83n5vKmkO8kbAMNtv024xGtV5ZLjs4IUSkZIrDY1mPTc9cMUJeVdvwdIaJ
         zfog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791805359; x=1792410159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8d+kg9RkP1lylbAE//urm5mkbXdgQbKNqjBZri2pwEM=;
        b=X5QJJULrjazAsdMtm7cJzxxp8E6B+WP7WulwX1InHnxqZQyY/tYjOrrHMiHw6dxkqC
         rAiL8pKCHaUJJE+9E9QRHFGMhC2ya0EMLV/ZoC8StPTW6W/rlq/4dV+lq1catT6ihhxG
         UhaRIAH0KeGlsINu209bsPYdaBjp4yOMK0Ov3AZ5E5P2yotl3t1nGtmjlIrAL3fn2Qb5
         c9+vKgoVDCLDiPU4tz8GWR2Qh/vRmMphLkyKhHDnRE8vIFgsOvV+gOivqfHoX710K/dy
         5VeidBwuugVR+8oi6BLDQaq+664Grqntei13z4UWTC0P4Sa45nuB/a0uMeKfKK93gozS
         1r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805359; x=1792410159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8d+kg9RkP1lylbAE//urm5mkbXdgQbKNqjBZri2pwEM=;
        b=TaA0Avps/CTco+pBeOAbuNEDTl6XS3qahjBAXui1Ge3V/zCm4kO+u8kHdL/OLIV69j
         S8bNX77AtVNRqGIr8QMKuNgy/+j2c2hZXUQC9+fgIu5c8Wujxl8Xu1GTwuystm6jCa+a
         yQSqVmWEioglFPZcE7x0yZtgn1p6b8F4uZYBq0eJ4EKVJc6aAvHJapug9HIrpPRgcA3F
         AJnR89oc+KsPAnohgZIkupYvpS5yw6YDCGAz2G7vfBJ+73HThO0M1A73Zb5mTq0yNvZC
         yKjf/C+qOZlYY7mhyscYCX63iAjECSFbPJytqf9sZ1BbWvhmdG4yJ4zZmPWjKO/CCN+Q
         KMdQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2piNmz7m0iwQtGp4Y6KB2FMEhZvb7qNjGBylPkW4jbbCLTSe/SeuPrBtn+n6oKxZ2HmSCN5EcODSJgg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJQJObutTWzngnZDsVXikvX3Tvaw/XYR4MXqZRI06tforYhRzWn
	g4dqbo9iJnNbER5uRP1TnMLp3c3gGkluDKl057O7jJmqu4CxLvdg4ED382PI59kdoZRr1uAyRQ/
	pVpms5s5kzMurevAy/Qp48FGdB2EH0DE=
X-Gm-Gg: AYBFou0PDTpq9CeL+jqOh7MuTkj3Lia8qYKvynbwZRp1iygP43p0nfYWqujAfabOTap
	EExuT3w7Cxq9Q8qI9uyFa566/05Wd/tEd5Zws8UW+Eb4fJNVyqjSmiiigaFSOIulkDcK0DMfXtV
	HbxFwR1z/phwgeuaO47tJ9kjyj0MxedRBDgchkyOU4NIo0f1xa9d3L3ebeG/m2c5YdcaTDHTyp5
	NW18dJvYdN02trbNUGT8s5XYMZVbj1IuYaq2Fekvy3hY9G96cqSjj8dZEyJXEs+k78e0azjcaCx
	PmlLZvn5WZouwoGp8yo/XZ/Wh3aAqmRpxiCgGLMTErqq+m77nl87VTYe8JeeA0a+1Km/ZhgV3y6
	ZDCI5NL7pN/MhzrVrpn4h
X-Received: by 2002:a05:690c:1d:b0:8b0:8a9c:fac1 with SMTP id
 00721157ae682-8b08a9d034bmr20413527b3.21.1791805358689; Mon, 12 Oct 2026
 04:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010180711.1548333-1-ju.orth@gmail.com> <20261010180711.1548333-3-ju.orth@gmail.com>
 <f70c39c0-3754-4a18-8ad9-eaaf8a307b8f@amd.com>
In-Reply-To: <f70c39c0-3754-4a18-8ad9-eaaf8a307b8f@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Mon, 12 Oct 2026 13:42:27 +0200
X-Gm-Features: AclHuK9UY_9BF00vKMnCcUp0DHYkFhZbh5NYROup1fNDrn0hsAfYgZ-u9GoRjDM
Message-ID: <CAHijbEV=510kPTYit=EbXtsYosQ+WOJ58Ey1AqK1Ca7Wb77bCA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/syncobj: flatten chains when importing sync_file
 into timeline point
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 9:51=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 10/10/26 20:07, Julian Orth wrote:
> > A sync_file exported from a timeline point can contain a dma_fence_chai=
n.
>
> No it can't, IIRC sync files are only supposed to contain raw fences or d=
ma_fence_array containers.
>
> I think we never documented that and that's why this issue here leaked in=
.

When I reviewed this patch before sending it in, I asked the AI if it
would not be better to do the merging at export time. It was adamant
that it had to be at import time because of commit 519f490d by
yourself:

    dma-buf/sync-file: fix warning about fence containers

    The dma_fence_chain containers can show up in sync_files as well

>
> I'm not sure if that doesn't break anywhere else as well, so I think we s=
hould fix the exporting side instead.
>
> Alternatively we need to audit everywhere where fences from syncfiles can=
 be imported somewhere else.
>
> Regards,
> Christian.
>
> > Importing such a sync_file into a timeline point with
> > DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE |
> > DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE passes the chain directly to
> > dma_fence_chain_init() and triggers
> >
> >   WARNING: drivers/dma-buf/dma-fence-chain.c:286 at dma_fence_chain_ini=
t
> >
> > because chain fences must not be wrapped in other chain fences.
> >
> > Flatten the fence with dma_fence_unwrap_merge() before adding it to the
> > timeline, as drm_syncobj_transfer_to_timeline() already does.
> >
> > Reproducer:
> >
> > 1. Export a sync_file from a point > 0 of a timeline syncobj with
> >    DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD.
> > 2. Import it into a point > 0 of another timeline syncobj with
> >    DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE.
> >
> > Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline=
 syncobjs")
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Julian Orth <ju.orth@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_syncobj.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index 5ca5163d0..c545af77e 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -742,8 +742,18 @@ static int drm_syncobj_import_sync_file_fence(stru=
ct drm_file *file_private,
> >       }
> >
> >       if (point) {
> > -             struct dma_fence_chain *chain =3D dma_fence_chain_alloc()=
;
> > +             struct dma_fence_chain *chain;
> > +             struct dma_fence *tmp;
> > +
> > +             tmp =3D dma_fence_unwrap_merge(fence);
> > +             dma_fence_put(fence);
> > +             fence =3D tmp;
> > +             if (!fence) {
> > +                     drm_syncobj_put(syncobj);
> > +                     return -ENOMEM;
> > +             }
> >
> > +             chain =3D dma_fence_chain_alloc();
> >               if (!chain) {
> >                       ret =3D -ENOMEM;
> >                       goto out;
>
