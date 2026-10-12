Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CB940B6E0
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 11:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805154; cv=pass; b=mqcrxpQVkwhdk5n8EqKEPUJsNI2DtJtEpaTvnKW/mlz3knFzvayy4rDRPmwsRstScF14w/TzJrA/rpCeunJebF2IEG/HOtZvYrm0qAxR8epjr0gfgYa/Ddp0mZWQn2iuqaHtGspucQWeONsLJ8sUL8GoPHoMl1Nh0AhY1euXF18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805154; c=relaxed/simple;
	bh=gxd33QN0xWhYVmPss2FNJZFt4BJYVI0+VcxXiG0EsG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9XfSF+4vSXelZKLAuWcoljZnOW8ki6EHI0amOQrHexewJkIPp3fusyeGyjpVrXTQcTVzINIa96vX5ZZFxw5G33Wow2eoxJwDWMXhqBR42bFwXAp4rgZfAWsHzLJy6Alkc7A7BBqmoH0mj4K6nM1t4vvDvOw4DmdvuL7rwTMgig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I37E5cZx; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I37E5cZx"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8a83d2706fdso11188327b3.0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 04:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791805151; cv=none;
        d=google.com; s=arc-20260327;
        b=rX4lgY+02Rw6jdMhYmcD0nH88+/KBxYl0aWngrIE/0XuYD96ZILRENwrnUeAGbbyjM
         m7Ou1H+4+5QXoCXm/etBgQh01vrBrA7XGXC/TOsp1224vvS8gvlNvj7DaRY2smPIWkrc
         c9CwG0Yb4NMH6QJCZtxIa8SL+Hk0asKCaRqsjzqEUUTMWKmskF8yqbdlkmJm5nat+HQ3
         1PKTaWvK768n44tqvbg0c3o96AVZ1eCl1m2cA8dHrCl9vbgbk4HetYB+guCZbXbLuwvI
         GouxDAZOoeuCTWyozoodmPb8Mhm+aY1h01Ep/KwTf+4SZHko1u49fanIxcgthHBWOqm0
         bOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ni29dh9h/iY48KqO27Kf84qCvqIwpSgqllYQhFBWKYg=;
        fh=gDbMDYt3h6srczZHYXuhtCUNLIJa8ANkztCxxKfP+2Q=;
        b=sU688Cmcj0dQ93f6BmMXqG2vhrg5SRz2s91x0XTMXiqfxFyfNR32V/fOux4M1cenLc
         VdylIWsAaYOcT90XAsyWPuYJdVA30nCZDcR+VSd/g7lpUrPFgV0GivrGys3U18CuFJS5
         JO/dPD1eSRYgHrYZ4VHmhLIXnxoIMOlaYb4KkQjWnmhv+WA/bgL5y+BmIp8IMvIKkJj8
         rgnYoPK+uaBnpt69oOXR4JhZcfSs/+9AhKsVVa1g8VS79hZeQZxMBf3ZttExja/liHki
         7ud0byswFLIuQYIiwHFzSgTgIrjn9CLnbh2MkumXRevPsDusZ9dzsdAaq2xYu1ji/Nsy
         /m6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791805151; x=1792409951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ni29dh9h/iY48KqO27Kf84qCvqIwpSgqllYQhFBWKYg=;
        b=I37E5cZxhmYnkhCij+FTNDOVAp2TA8c4vhi63pbKHtCubBdMu8gtDstzFeJOlH9/q+
         DuFGfIUFGJ0ImybN2bF8+5zQoWW0AW8ri/ceKZwhA1av3iSWAObWF7B4H9JguA8hHmaB
         VpM1ak7RoPvl3uO2oor8J7ee9xZdYUO9V9NoZ+YDiSzLVxu4+oRKhajNXmUKskihO97W
         0a8mKGaW1C+xtZPdt2QxBy/FAT6kB/8AneWRtWw5qMeuazwkQZf53GbB+8NM2NLsUQLz
         7uL9LxCeK9y7adZQ0Bj8y9lp1HScw/aie9/WQ4ZQHmuaoTtBKCVSTYTrjzReO2PR3wXr
         hZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805151; x=1792409951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ni29dh9h/iY48KqO27Kf84qCvqIwpSgqllYQhFBWKYg=;
        b=cbvWDKoLXwBitWbR9eScmNwEisDh240GxhAnNSp5vBKt7ivwFvwudoJ28oFLq5LNsu
         aryLXIV2xx08VuQFiJAWkfIWQ7GVbD+enfgWRGTBPWdGOdEsvdSzgFG/YoUPWRrRBlNv
         gAuybMQ8QpnYtPnC5ADnY/bI1Svg4iMkkw0spa7M66rfa4hDrdMumIGm2OO76jOL5F1V
         QkzkRI9y0IS/fcDia1vU41kpZezWS995Aw7b/7p4SimcysfUZ90cEFzNeIaErcYpX5WE
         zGE9C3DUw78ZtSQB5wf0oNwVYRO5tekRflODltn37tEOPit2wVQOWetUhx9SZFhHM8M8
         GQyw==
X-Forwarded-Encrypted: i=1; AKwUvBz+W/olObVG+hhtZ9JvPR45lwfpfobfwvsf2wUihxXxls1ffzI4SgT1oF6HkEPRDOzrkKNSgsnFgm/Ljg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIuCq1LczL2kfGaes9bBdVx4atSWj39WnC7zICMEC0fK8rLxcnH
	twO2hmya85LWOoAeq7I6jzCDGluJ1vHiE0pC8A1HVqqEenjYGbplDR0nOs2IY0R7zbvCL9a1Flj
	Ci5k6u+qLiSntEXPlZW2BviO14dM4vWk=
X-Gm-Gg: AYBFou2dujsykruPwITNOa3ZFrY/vT3qirAt7ahGnGRUyM9QA0L1U6Yvsywg9ISzDAM
	oGsyTyO6oFik6qNvacv9TfAIv0KV8l4VSMkQ1qQ+7DCkLg7cD/5Qirsx393p+LbzRmwqikotxr1
	NRyhQc6aNDAwIzZENaYO9HNpKOj02Fvtiv9XD6YdVxW35vbwzBgrylzkZA+9PSLz5xB7mwyOXGp
	h/HVecTIItuYCJQI3wOsJHveHfPrr6+fXoKK8fQDuMQMmDNOPiacTUGj+4js1xAtlm38Zh6afrd
	MrFCF2Q0hdIMLaRsgX0AaSjz2w9pAK9QPrcMYkTDvGhZ0zA8RXk5whDFdEJmuOxXtnGeCcy1YO9
	YzVD7hoUrsl3xSb9V15zv
X-Received: by 2002:a05:690c:f08:b0:8a8:e0c7:dc3f with SMTP id
 00721157ae682-8b07edb5995mr31001627b3.18.1791805151356; Mon, 12 Oct 2026
 04:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010180711.1548333-1-ju.orth@gmail.com> <20261010180711.1548333-2-ju.orth@gmail.com>
 <49d4f34d-6d27-4a70-88ad-a5e939eef084@amd.com>
In-Reply-To: <49d4f34d-6d27-4a70-88ad-a5e939eef084@amd.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Mon, 12 Oct 2026 13:38:59 +0200
X-Gm-Features: AclHuK_TvDl5T3sJwAa-8Y_DCBwlQE-ZZAXe0QSdCleHISQ5S_vtpBNdiV3KYsA
Message-ID: <CAHijbEWpH+0M=mU3GiQWNL8b+6uTd=dK59UM=ejtviHmiRFq2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/syncobj: fix fence and syncobj leak in drm_syncobj_import_sync_file_fence
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 9:45=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> On 10/10/26 20:07, Julian Orth wrote:
> > If dma_fence_chain_alloc() fails, the function returns -ENOMEM without
> > dropping the references to the imported fence and the syncobj.
> >
> > Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline=
 syncobjs")
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Julian Orth <ju.orth@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_syncobj.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index c23a5de27..5ca5163d0 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -730,6 +730,7 @@ static int drm_syncobj_import_sync_file_fence(struc=
t drm_file *file_private,
> >  {
> >       struct dma_fence *fence =3D sync_file_get_fence(fd);
> >       struct drm_syncobj *syncobj;
> > +     int ret =3D 0;
>
> Please don't initialize return values on declaration that is often consid=
ered bad coding style.
>
> >
> >       if (!fence)
> >               return -EINVAL;
> > @@ -743,17 +744,20 @@ static int drm_syncobj_import_sync_file_fence(str=
uct drm_file *file_private,
> >       if (point) {
>
> >               struct dma_fence_chain *chain =3D dma_fence_chain_alloc()=
;
> >
> > -             if (!chain)
> > -                     return -ENOMEM;
> > +             if (!chain) {
> > +                     ret =3D -ENOMEM;
> > +                     goto out;
> > +             }
> >
> >               drm_syncobj_add_point(syncobj, chain, fence, point);
>
> Allocation and adding the point is intentionally separated so that dma_fe=
nce_chain_alloc() can be called before looking up the syncobj or previous f=
ence.
>
> I suggest to make use of that.

This is the fourth time that someone has tried to fix this trivial bug
for over a year. The previous 3 cases were:

https://lore.kernel.org/all/c715ef30-9d91-46f3-8a0f-1039f3d25e7d@stanley.mo=
untain/
https://lore.kernel.org/all/20260516-jorth-syncobj-v1-9-88ede9d98a81@gmail.=
com/
https://lore.kernel.org/all/20260525025455.3887523-1-vulab@iscas.ac.cn/

The last of which didn't even receive a reply. And there have been
more cases in the past where I encountered a dri-devel-adjacent issue,
googled it, and found that patches had already been sent in years ago
to fix it, but were ignored.

Which is all to explain why I had all of the work for this series done by A=
I.

I heard some chatter about dri-devel adopting a gitlab-based workflow,
and I hope that works out and I didn't misunderstand. Because the
current system is clearly broken. Nobody keeps track of which bugs
have been reported, nobody triages existing bugs, nobody keeps track
of attempts to fix bugs. Which is how 3 people ended up doing repeat
work of discovering, analyzing, and fixing the same bug.

The same pattern applies to my patch two. I clearly don't know enough
about the (probably) undocumented semantics of where and when which
structure of fences can be used. Which is why I sent in a bug report
about this issue in May instead of trying to fix it on my own:
https://lore.kernel.org/all/CAHijbEUKuXNeSnT82P-ojOhzU5siNHjxUW+qEDOqx07Ys9=
m=3Dxw@mail.gmail.com/

I would have hoped that a bug report amounting to "this new feature
causes the kernel to spam dmesg at 60 fps" would get some attention.
But no. The only way to get this issue fixed seems to be me acting as
a meat proxy to fix an issue that I know very little about.

Thanks for reading my blog post.


>
> Regards,
> Christian.
>
> >       } else {
> >               drm_syncobj_replace_fence(syncobj, fence);
> >       }
> >
> > +out:
> >       dma_fence_put(fence);
> >       drm_syncobj_put(syncobj);
> > -     return 0;
> > +     return ret;
> >  }
> >
> >  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>
