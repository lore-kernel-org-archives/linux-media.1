Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793311740;
	b=0mb+NEQ8zkBYJPD7hFE1Ne/eA0nznWanKZyHQWninPCJSBD3taIrjXRrinU6eBN3Js5A
	 bQe8bnBHFHADNpXqlVvBjFYoHawHvyxGmvQMcmsDephQivm7Uy+sXwtfSzQ7f8+6Z0l3J
	 MDD2ELKgqT5dlbwTCE+X5tYed1X+/okDY0DqIPBVQgjcB7M2vbweybyXCyEfsKsm28vTk
	 ZFtYjuvRqiQM0sq4A8UFPv56M6Dfk6A2SFyvoF4XWrXPF/ebNieCy7mWdjxuJGPopJSU7
	 yRS6DKBjA+k3DmfU0LmLuQiy9BA1tlYrCXPzUDCEFd7ZvREwj8S7kwU29HUVFAthQmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BNBRkMvcPM5q+NH92pjwUamOJbPLuAm/rYF5XAa5e1c=;
	b=4frfLGpLoKKYdP8ectJ7b6TV0Kh2vaUk5NBeJyhW7xB26p2lUvWUxzqqz9rhsxvEQQMP
	 l/ejGkS+znPMfWljyEdNH9Xi0hbaxzNjKJ5+jCW2sn5rw/tlVDuv5oOGo+cfA0H0Y5MOB
	 Scc3WWDHL0gfqDgry0KiZl5VtIrDQts4ul4EJBMLAI24vwfH6aPYfNh+6moDk0FDF4z3s
	 7fFvnKG34xTRqzJRA5DsJv+Ro+is75Q04kT/a/6OvplX1wEHbL1aEyP8ZabJUx7Kv3rTD
	 /0qy69Z0qm2xVspLAfMM5E3419LVnftRoy69Q4DSh9YrVmo05Xv5Z1Ypu8fBU7P5rnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IO8tJ5lx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6E8606A31C
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 22:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F6E8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IO8tJ5lx
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-34c522572bfso18477eec.3
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793311738; cv=none;
        d=google.com; s=arc-20260327;
        b=rXfVx+DZeEFyl05Koi4K61hTvs1IczhGi5mT1qK2yRPSk6DIDFNsZESwVXckZXtfal
         2JDligR9TPf+7xnH1Kjp/xB40nATqiE6qfdNvAA6VXyGa8j5Pie8EIvqpkOUBWo8oa+F
         MuMWY0QoLNUtwF0dM/okax0kp+lW4mbJtL4pUEQlM52P7RL7unXKxAJzMNePRf25j3dG
         yx3tB+1s4rwH3RlBY6rbbJt7hWGh+5MjtzRaweQeMqJtWUCQ8gtV3QuBQVqlJoXZ1ai/
         cZXtuAFFa7Tk9kr/GfQjMs966RXX+HPCmEMqxY1I+eUUL1VJqMTR4DP8ceqgCfRDqzDL
         B7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BNBRkMvcPM5q+NH92pjwUamOJbPLuAm/rYF5XAa5e1c=;
        fh=lpttIqNAYJi0qUmMyyhq8WyH2nDbfjMMn8Sfto0sg0U=;
        b=ebHb/cgvGQKs9SFn0iGQAUF7Pzyqq3DYt7Slciqr3SwGy2MXkXpwf/8dh08keAnYT9
         AgYPLT2C0psT0Kq99BDY3eHtpFENEjNIF/p2nTcg4yKBCdm8EkbH/q3jPNpyTdmuCk4I
         P93Zhpfq2ShZQiLTbyGLPRFH0fuOuJ+jcxbgWg22z9aaaG4fhCh3dPXGwRDHKUrBnK+5
         zakgnCgM2U4wNuDYUIfWeDLFJH7zlaHJELH+T5SOx8CcOZaf9uCw2qtjB6q5dl7P/IAj
         LfWiONLmdbtf+u4sylzxPnaZQRd1XuNMfjV7ziqS3LSXueBicvXGVlN1MGouRfS+DP3y
         RQZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311738; x=1793916538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BNBRkMvcPM5q+NH92pjwUamOJbPLuAm/rYF5XAa5e1c=;
        b=IO8tJ5lxB70rtIbO8uqzbf0HgTt2rHzzsGrh4yuPST3h8+Y930eFpXhmYktJ0HfdEF
         DDFLOav01Xh/FyxELAyoXoIuPH++7401hIvdbB9OilUiSJIVICslrtO3Mi54zarHgo1a
         3LAkB/bo9X9s6xjbh7EcngQjYsuxDgEieoYI4n5OKSW5AGSs3S83cft8qXnE/zdTqhi6
         OuASCwvb4nKFa3dV4QBDVi9Qa/RQ2EtkKYgPg8dkJUOC/K+A3dfrX8XK8ZUWPBxjohPz
         zYWKW/ckGaAthBAq0nYGI5+1Xj+uzjPvTJpexo2jgDMeI8RfMI+pBHEBSPSvPADpVIng
         O1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311738; x=1793916538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNBRkMvcPM5q+NH92pjwUamOJbPLuAm/rYF5XAa5e1c=;
        b=Ke5QAY7pfAWKVk+ta9AtalyqMRp4qWaFraxaAn+UIS5f6akYa1Q9c6RvlOPtGCQ0F9
         gQkZl6vtpiEwb6ep/bEVv/tOMJFm4V4lL8wukW7/stu5foizyof4+agGTYsi/mwhkjyx
         3qXQALvab3s/mqp5+G/JtDaCloX4vUnfzMqlycBkXsJ3kW8ymAyZg8FgA6xMxbh4m25b
         PU5s/8Ea/SM5pHTjRovADlphS2K/ghCu/Q2H0T/AgZI+EIWdjjUxFAHJqCDGErahSy+8
         GvhBc995Jt5vd71FFQqbKNMXu4FX8YMXUtTc3RfW9yITm+IYyIGtrNKsVnbcEPI+6bxo
         79oA==
X-Forwarded-Encrypted: i=1; AKwUvBwP7FYKIP5CSAVAFoWzOVn0l1U+WH0qjs6XAb5R+jdIq7GF8Qid5Z5jVg1ijGYeKMDh279e6h+JGgy3fA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKHIH4c1SrFz6nZ2lLd7fCXioKDjXj1IWHB+VT4si5U0Ozgp/aI
	g1ZIBOpb7Aj4sASrbieMEF2CUWrACQ5DLYIvI0gXwQjAOVPwtbC5DKJYnQDk9slB13n58DGw/yn
	Lx4gddUJz1XAOz81XYow86fVVOB/AiXE=
X-Gm-Gg: AYBFou3kgyrbZgquzLOYKfaOE4oIXDm1hfXik8pWTvC8lKSdbng6Bi8j9BOy1fk+FLi
	SLdOoI3RU9jYKYCxxoQKmq6iCKEuTMh1Fm3PINFMyyI5l83oKr1MnoyNLwSVK98TqS0QMHdIWWZ
	TrMcU7ln+f+x0n5+q071dUX7oZu6Th91e6ix46IWjZbDlkZ1WAGWrM9Z9GXNp4my6VcpLYUU52H
	X0al/0bW5m9zKbzyvrrkICwcoBCtpoHA2sMwzQJsR+COwcMigDeUe3znVxU+qTUElIUEyGXCQdF
	eox3SkfOr0NLLVFuV/fvdLmiAS4iVaWAsylRfyMGM0kIDwrc2D+rQnB6Pg4tg6jRMVxq2r/CDXF
	IXwoThh72xQfYMVivSrUSDJ6NBfXZJKrIynUCh3vqpHPa06JkRoWhsn76Dczw4VMCMChdlzyh5K
	doh3EpMqR/8AI/pQYhU7wfxb4=
X-Received: by 2002:a05:7022:7e0c:b0:165:be2f:c56e with SMTP id
 a92af1059eb24-1ac5b7dcb2bmr780931c88.2.1793311738368; Thu, 29 Oct 2026
 15:08:58 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027133727.748652-2-phasta@kernel.org> <54e6cd9f-57ca-402f-93b6-27fe2b15b29c@amd.com>
In-Reply-To: <54e6cd9f-57ca-402f-93b6-27fe2b15b29c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2026 18:08:46 -0400
X-Gm-Features: AclHuK-38z0ojG634j8HTvYSqjvHDIGJv5-1HW3Xm4xmKYyn6vnp08A2upfv47I
Message-ID: <CADnq5_M6s1TFgHgfiPeLS0bQ0iq+iJWzPKPbacyPvBGibUs_HA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: amdgpu_fence: remove ops->release()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Jesse Zhang <jesse.zhang@amd.com>, 
	=?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
	Kexin Sun <kexinsun@smail.nju.edu.cn>, 
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  thanks!

On Tue, Oct 27, 2026 at 4:16=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 10/27/26 14:37, Philipp Stanner wrote:
> > amdgpu's fence implements the deprecated fence_ops->release() callback
> > which prevents the driver from ever unloading robustly.
> >
> > amdgpu's implementation merely uses a call_rcu() that performs a kfree(=
)
> > on the fence - this functionality is already centrally implemented by
> > the dma_fence backend.
> >
> > The dma_fence backend invokes a kfree_rcu() on the dma_fence, which is
> > fine since this is always the first member of a struct amdgpu_fence.
> > Thus, amdgpu's implementation is redundant.
> >
> > Remove fence_ops->release().
> >
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>
> I have exactly the same patch in my pipeline as well.
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> > Just saw that this should be unnecessary? Don't have a setup for amdgpu
> > testing right now, so please take a close look, just compile-tested.
> >
> > P.
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 29 -----------------------
> >  1 file changed, 29 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_fence.c
> > index 3043ad041bb4..3f8b2571d74a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > @@ -892,39 +892,10 @@ static bool amdgpu_fence_enable_signaling(struct =
dma_fence *f)
> >       return true;
> >  }
> >
> > -/**
> > - * amdgpu_fence_free - free up the fence memory
> > - *
> > - * @rcu: RCU callback head
> > - *
> > - * Free up the fence memory after the RCU grace period.
> > - */
> > -static void amdgpu_fence_free(struct rcu_head *rcu)
> > -{
> > -     struct dma_fence *f =3D container_of(rcu, struct dma_fence, rcu);
> > -
> > -     /* free fence_slab if it's separated fence*/
> > -     kfree(to_amdgpu_fence(f));
> > -}
> > -
> > -/**
> > - * amdgpu_fence_release - callback that fence can be freed
> > - *
> > - * @f: fence
> > - *
> > - * This function is called when the reference count becomes zero.
> > - * It just RCU schedules freeing up the fence.
> > - */
> > -static void amdgpu_fence_release(struct dma_fence *f)
> > -{
> > -     call_rcu(&f->rcu, amdgpu_fence_free);
> > -}
> > -
> >  static const struct dma_fence_ops amdgpu_fence_ops =3D {
> >       .get_driver_name =3D amdgpu_fence_get_driver_name,
> >       .get_timeline_name =3D amdgpu_fence_get_timeline_name,
> >       .enable_signaling =3D amdgpu_fence_enable_signaling,
> > -     .release =3D amdgpu_fence_release,
> >  };
> >
> >  /*
> >
> > base-commit: 731ba09867520c047c7de53f92e384808e0b638e
>
