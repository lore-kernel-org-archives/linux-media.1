Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147263DB32B
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574632; cv=pass; b=GtVfn/wggUS7BVLoI76+gmmOw7cVz63Q6UTQYDlXz11yVbaUcwr+ZCF/xgQDNUYirKbEwo/zDhpFV083q3FA33Ya3uMi/V2eeMCPes5wQFRpdXdrEkzEMny/8UWLL/YQiXXvaXGikKJ+pYIvMVxCEoul0CyNg/EazTHiyH95NTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574632; c=relaxed/simple;
	bh=/sYg6HCX2NniI5KvZuS6t1I10Labn2Y/FeR9nIXb/pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t30YKp7DZWwr9hxWMoVEAkZJ6UG/KyPJczYWNWzimYOiHFT7oBtZx10m7MEF5CRVvtytOsiN+57XxCbBSb7nKUMzywpinS8VhBtj3dFgXbFfOci+7LrO/UBxX10gWRT2O5scEJReR46TWRsWe79bN0v1eMVGlAhbzIrwSRINInA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L4GTBPa3; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L4GTBPa3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b5e50eb70so50035e9.1
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 09:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789574626; cv=none;
        d=google.com; s=arc-20260327;
        b=bMqatvEPqlcONrXlNQFhRXOiXepGRwrnm4cjylSEuPXZQtmfBF+CQ2KePv9LqIOcod
         qG5GelHDW/0BeNJ6nl94IUfuM/RRS57BgczWWhf0x5rrOHRXx2elC3RjhGvqDT4pQfVi
         XyRPYmFNEzYu5WcWKfi8lC9PlNX5fv3cmugKT3Si3SzpY16jk4a6hwSC1HjCHAE5Xbry
         PcTe82h0Mb9LzpWXxZTfFaCCU4Ac39tu2B8Smpdsimgd5RmrOlL9ILN8W8dZNhE64QMp
         vHHEg3oUKk6F/+fplo5eOJebvC2RoV9crjcQ+OXOYqVYwVl5dkVd1wpXy1o58XN746q0
         siZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/sYg6HCX2NniI5KvZuS6t1I10Labn2Y/FeR9nIXb/pc=;
        fh=96kLcp3x9K7N8/uo57dcxUTatrQBay3xFUJ6Ws0KeBY=;
        b=mB4Nm4sYeKw/VFFaoYIM1KaQWsT6aSqbCGt1fydx0GlRd1edxgGoPgdzy/EKHzAGh+
         1ADmx3n9WZ3A4PdIxNOrR3gxd3wJVPmL3i98NSnB8JQ+6MQifW/0ugAHO01lUe2ZuHWL
         dpYNbodYIK2oME0rDtkx8FpB35XxI7xuC5ujBtyPLVowKfCEjsg2OcZeI7WYMhSLjNSG
         b/2KBPVitlb5QSy1uk50kR1cd/OfCKtlCLE60KQkxNfudDUEkkYjYP54H6aCGLL7LrSd
         xK/Xvm5oFN8hBQKdCcXVyuRRVJAHK2jBga4U3Phf0mk1RRBaBfp0l04qJtoGB5K64U8i
         i7ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789574626; x=1790179426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sYg6HCX2NniI5KvZuS6t1I10Labn2Y/FeR9nIXb/pc=;
        b=L4GTBPa3SrtUMpi7JO/o72CLSmjnjomRWK5ca5ga9eDheu2Et8n3wylwMmw7OS9UVo
         RTUbh0zETcOzeynEk9oQ00PAiybuEBFF1ZMUIKC8R8VOVjWs1iEEfaeDfEWHEYQstDJN
         0ovnGOwNjxkoTim0pPGu00iS1u1HbsUou7vRHe/9yJ9uiMchmmyS+Go/Wya7ffV62or5
         cbw+RUVxC8dym66bOcpMnig3tFztpdHhmJzhS4SOm2ep9VhmRb/i2JLWewIBEd07izZY
         lSyck/Yhio4ZQ/EzRsL3hZYO65C6bYHugckhlybuVfd78PQgFStz8lAWS+e5CTAIEBiG
         1TRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574626; x=1790179426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sYg6HCX2NniI5KvZuS6t1I10Labn2Y/FeR9nIXb/pc=;
        b=FOukjFGSnqckO14ziNXC3J6BxADgM9fK6UK5/XjOHJxgXC5iylH71FsyW475tycN/+
         1cUMUAOHTFwS7Qw1s63mnFQDdZcVOE+670V1D2u5HkrN2RyqnSH0OgTtsfa7iKonWJ6s
         ZBr7M0K5XdgbJysVr0aZLXT5/wPvWHm+oFbyuTWHblE6de6HDyQYMPwiULSuebL//On7
         3+nAnMVaI7B0mvB/u+icVjRHuS6XxlpR5P8UoqwYKpGngiYMMwuvKdZdKdYxYDmjSTVJ
         Bvr8BO/am+L3uLcHA5e90Ny0z+ueDsylA/SftEDMQeXm5r8snCDqHzAe3wVHA0q1gzF9
         Owbw==
X-Forwarded-Encrypted: i=1; AKwUvByuUNFjhlPF2d56/Ia1QSGPbee2X5pFwFo0gAGldVQBAuVRd4t6LRdoRrGNVcxqzBk7d66NE/cQdkPNtw==@vger.kernel.org
X-Gm-Message-State: AFuF++mRo2vk3OSp4m6uLWvuP/YOtJIAJ97njqXSCMK3TjPJ+fAuYFBn
	d9Y8a6EAFiEh3veCLWi3u2IH1S6hxTb9o99V9ypw1DhjmmNoiJ75Y0TPjR2kq9CYWC7lnNUVn58
	GttmCewtMZ62Hjhyfjz4nhTRigz9lPKQ+6TWxKfZM
X-Gm-Gg: AYBFou0Bix4lNq/wQ1KrAnj9mT4WWaC3tSJztOKn+MVCf9+dbrMFY1hvrHBmbSD4k/t
	5TYPkV7UwECmCM1QAR2aPyW2MYwjMYwsL02V0VqHvQBlTYub6c1O9CHP6Malo8CvlSkcqI9pvbz
	ki59DjkHU5S4WjycZcdjF/neW65kQqaYAdcuDhUa6p31eXf80P7Q6N9MM+ecpW3+aSijCuEePyz
	0Chu1qkj16Ps0TOu2T3yuqK0hlRzySfmEC0xmctYwZZISkNbympXH/m9G3pzmv2F8yWyXfm/nBo
	Q9L15x+TCIqcj30WD3fd4Gkz/pcRZo6exHb0pkBWmuHSmMvL3Th5i2/V1cPio9cYWjtoiBmngCY
	PUBWw6z/uATPJ4XxzRR1Diiuk/ssezItVx4IlbqSWJg==
X-Received: by 2002:a05:600c:4d95:b0:49e:7946:d8ce with SMTP id
 5b1f17b1804b1-49efca9e4a5mr423505e9.3.1789574625116; Wed, 16 Sep 2026
 09:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914212258.2657788-1-dave@stgolabs.net> <20260914212258.2657788-2-dave@stgolabs.net>
 <54ae0d83-d777-4357-8e87-dfc3a5c7b835@amd.com> <CABdmKX1ky3Jfr7B-Oqaz17aLJwo1SSh1huZ05NG7D44SMF=9fw@mail.gmail.com>
 <871b6fc6-e126-429f-881c-9cc517ee8dcc@amd.com> <CABdmKX1g=wcLHOFkRN6DLPTABrnn2uWmgCKpCtixhiV_b+9J1g@mail.gmail.com>
 <CABdmKX2GU0Eby=SEeALzeEp5ragEjU3Fw468Jv1yykD1Zdrgag@mail.gmail.com> <d8d3af91-4f21-44ea-bc90-339fa1adacf9@amd.com>
In-Reply-To: <d8d3af91-4f21-44ea-bc90-339fa1adacf9@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 16 Sep 2026 09:03:32 -0700
X-Gm-Features: AcwNN1WPGZ8Iyy7HZsw1Xg5R6VdTYd3IYP7pEJKqY6H8Wjci94V-WOlkQcsrMBc
Message-ID: <CABdmKX1YtyFM_MoMbPr4JUCXCr8TGPVbXUrAoQRELpp54cK-0w@mail.gmail.com>
Subject: Re: [PATCH 1/3] dma-buf: system_heap: add a 2MB allocation order for
 IOMMU superpages
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, sumit.semwal@linaro.org, phasta@kernel.org, 
	benjamin.gaignard@collabora.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 1:41=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 9/15/26 19:26, T.J. Mercier wrote:
> > On Tue, Sep 15, 2026 at 9:26=E2=80=AFAM T.J. Mercier <tjmercier@google.=
com> wrote:
> >>
> >> On Tue, Sep 15, 2026 at 8:44=E2=80=AFAM Christian K=C3=B6nig
> >> <christian.koenig@amd.com> wrote:
> ...>> Even on arm64 phones free 2M pages aren't likely to be available fo=
r
> >> very long after boot, but lately we have been doing more proactive
> >> reclaim triggered by userspace before launching workflows that desire
> >> large dma-buf allocations (and also at other times during application
> >> lifecycle in general). That somewhat increases the likelihood that
> >> high order pages will be available. I agree there's no guarantee we'll
> >> get any, but without __GFP_RECLAIM the attempt is pretty cheap and the
> >> payoff can be pretty benficial which Davidlohr's allocation and
> >> mapping measurements demonstrate.
> >
> > Oh I forgot to add that this behavior is similar to how slab
> > allocations are done for slabs requiring more than an order 0 page per
> > slab. A large optimal order is attempted first with ~__GFP_RECLAIM,
> > but if that fails a fallback to a smaller min order is done. When the
> > optimal order allocation attempt fails, the cost is just taking the
> > zone lock for a quick peek at the free lists.
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/mm/slub.c?h=3Dv7.2#n3373
>
> Well from a lot of experience with AMDs ROCm stack and Intels XE driver I=
 think that this is a really bad idea.
>
> The background is that there are a lot of operation which can fragment me=
mory to a point where only 4k pages are available, e.g. for example storage=
 I/O can do that trivially (the kernel compile is a really good test case f=
or that).
>
> Now acceleration HW usually has a very specific sweet spot where it works=
 best. AMDs GPUs for example can work with 1G, 2M and 4k in the L2 and ever=
ything between 2M..4k in the L1. On Intel it is only 2M and Nvidia has 1G a=
nd 2M (but really don't nail me on that this is just as far as I know).
>
> So if reclaim of smaller pages into larger ones isn't requested what you =
end up with is unstable performance, e.g. if you only run application A eve=
rything is fine, if you switch to application B and then run application A =
you see a performance penalty of up to 30% which eventually doesn't go away=
 over time.
>
> On the other hand when reclaim is always enabled for multiple different o=
rders you start to see stuttering when allocations are made because the cor=
e memory management tries to fulfill all those different orders.

Yup I understand the tradeoff you're describing here between
allocation latency and performance predictability for GPU/HPC. But for
a generic allocator like the system heap with very loose constraints
on what memory can be used, this lack of optimism permanently incurs a
penalty that might not have been necessary. Users of the system heap
don't demand any particular page order they just deal with what
they're given. There is no single driver or use case for system_heap
users. Opportunistic allocation without reclaim gives the upside when
pages are free without stalling when they aren't.

> We literally had tons of bug reports regarding those problems and it is o=
ne of the major reasons why we doesn't use DMA-buf heaps for HPC use cases.=
 Instead drivers even communicate the sweet spot to for example TTMs alloca=
tion backend.

This behavior isn't an inherent property of all dma-buf heaps though,
it's just how the system heap does it. You could create a different
heap that always tries to allocate the sweet spot for a particular use
case.

> I don't have much of a problem when we say that this is just for Android,=
 we never do reclaim here, instead reclaim is triggered solely by userspace=
 on application switch etc... but the general idea of DMA-buf heaps is that=
 it should work for everybody.

I'm not sure these patches were motivated by Android (based on x86
focus in the commit message), but Davidlohr would have to comment on
that. That's just where most of my experience comes from and what I
can share details about.
