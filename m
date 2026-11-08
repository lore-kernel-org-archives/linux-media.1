Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794118922;
	b=g4PPiGPw1e4RPcYY6UOJVQZCLv8GPXON295sKSZSD23QYdUMRg2kdS/+x6rcZUPOpgAt
	 Ew1JcFluLHBfg7hL4iqtLQfea+EsQIeburKrAmASuD4ET5vglyXQW6U+hH5zVAFQtR3ip
	 ot4udbkmgsyJbRYmv0PNVOu00lJ0GsDlfkRFTnCC3A9PLWsC+NAUOMNCW5d5fsLl2gELG
	 kubEhfPnJpaMas+GxovyTuXggQkbNQf5F+qnmLZAhqRWT1MpJ/pCW4lKD4BR+ATRbYcIb
	 /GICG/Zw1woqlxr9TGNNhIz1hHjV7NFNO6z6iIBYEUGy0bk+4Uy1dB/0PdLAAhbGn1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794118922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v2XprYGCXtRTCuqB4/wKtddK9ZYd1kM+u1y6WT6JlOc=;
	b=4dqUTgrnbx8qQ1glEb6RluI8cIwvaLKvoOrLAkA+HjswWeEedkjEScSh1CJzdAkoGPYr
	 ypGuKD94MyUbFWT5I9ugcq8124DGXxXfhldRXWRlGAqFZEnpfc0SRha6hpTIB1wUsKADw
	 WBaB7ynsJvUhreZpiStK+7V6VOzSe/GhNRY9UFn60MGcRTJg8/b+QX+SDRKfX0uZOgkM+
	 i1u33r7EljoLBkzqYulgv5WE7SYB4jSb/7rABCP46BdDBMkNogE15vnl0Q0XrLYPWAto+
	 R3YAgGbc6ZJio5JUG4p5yYDLg54d8fJL6X59BunIXEk5IipMiooAAGpMB7oAVG4zdow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hUgHyzbh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EB8606A31A
	for <linux-media@vger.kernel.org>; Sun,  8 Nov 2026 06:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1EB8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hUgHyzbh
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso226a12.0
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 22:22:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794118920; cv=none;
        d=google.com; s=arc-20260327;
        b=XGVw5+Rtpn8UM+ukKMf92uT8CtnHwDTfn75BVjV+4/OLyjE9ErcxLJTdTk76DLv+st
         FnFcP9QZXYvIKKAVlCOI5Pc8i8ZZm8g3oy9YQbVFp5W0udx6Vqj5ciilVY+k5V/guJsp
         rZP9OsAVE3pGdyU8FHb9kuAVGPCN9Nb/WHSY+ycXzBPQHRGiPTCkLgjOi8w1gLyV80RU
         L7+Qm0HX8YD70hJ3LPyR5GGZwJng0CT1fHqcW5UntCEgaq5OO6L1f5kilBIItZVPQyS1
         2Ax1fAf+EfLaueIfHYFhi+wdfDWonCxAImy6J4eGNE3aQBGPZ/fQmsMk+KwA94JFot/p
         eTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v2XprYGCXtRTCuqB4/wKtddK9ZYd1kM+u1y6WT6JlOc=;
        fh=kzYYOlVIN76aBnIJwUYwqz8SLDMtMWwZ7pBL0q6dQ0E=;
        b=LCDkEaPqXB45fsjso498heKcEiFcXqpn12492yK/vvZcPJo3qO3xMEh5HOmQjBvhcw
         fiLAvz9kWyrdYYgVWkOnb4HANRl2EzB+ZFb50oMxOqrUV0hY0RTWJAk09rrWsCGG991k
         WC2R6qcqPfCgaV03c/hKer4thE7EZ4VSAiFKH4wYk0bx5TDR+OYZBwVr0u3/L76jbkBT
         ByS8UgLbPDO+TYfKgutDe6wV/Ofszmf31bhKC1nm9jBAhrvhEn0GoQR3OtEKPh3/n0Bh
         HNthwk5sHk6qEieaeIseMuy1oQig+L7jDxhFs4cwoiVV/zzIaa3nfQWfQaekyY9Wyv/F
         M98A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794118920; x=1794723720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v2XprYGCXtRTCuqB4/wKtddK9ZYd1kM+u1y6WT6JlOc=;
        b=hUgHyzbhHHaa3x0MGZHtZ50WogQLFlCdZt/lmpI5crcqaTYEzBLVvoJT+z9qJrP+mN
         2zbgqjLjweGNemctefm1fEFSRBhgSp3oao5JaYrbL794p9RQwLH8IbD03A1vfK9G8Hgn
         xU6BgmL/ohZrkZkQyqHOCeP1wKoEuHAy+mrlzWmeCsJ2azmakD7HX9Dv1qYjRCWTRvml
         +A31W1Sdhj137368ySt2DvScSVHTeX6n1V3A5imgT+udmv2EDO5fo8gOJEOirBFNfme2
         CiOhPNFnNc+LyuKNTbG/oQjABYDT9OeAE1XRKctqmZGWr4uzP4FMUjddZw6ab+cFyo3z
         Mnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794118920; x=1794723720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2XprYGCXtRTCuqB4/wKtddK9ZYd1kM+u1y6WT6JlOc=;
        b=1IY14eeljO93voeMb7kOjQ7pKEcotMBhNcgIye+NUapbtea2Sfcl1GcLSe3p3qRnTm
         nAPk/t0XeBfar9m9GcmozMoGSm6aV70L/wkLVOswQ6KhTBV2r5D3rTG7zqeJliOCGyZL
         owXbNe/VLlN+OahLq5qB+oLWczc/1cdTgMFRdky6efqc84gOlaMXw0onqO99FnBtkvx+
         9hMMMkMJ987f7owjsZYacpLdRmrUQAy83Vg/muRJ5s42eMfm4V9oNbi4yvxFf+cnYCBU
         kA9d0YEAptTgkxRLaZjRHQG1kruEWDUxw/WwupdqJsY5HR+TvLLoWjhnUdaEbfnCYdtw
         c4yA==
X-Forwarded-Encrypted: i=1; AL+hErHs7tOwzI97kjv9xcn512wEWhGFLphHOaBjIkfDFEk3xIVHWXp/UiiAcZrCF6Eommo08bpJ/5kQBT9XZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ok8lITUSjzTzjo+OjL1ZcEr09T8zCuUMo3h66jTHgybPJtJ/P
	IVpMGwgaHkR+2KSFLRX4u5zzrL0uoUgRpQQE6C6R5387WNamXOkPdZFLsMJvVXd8IHpdKhXeGP8
	sx4N6bOpqkUtmodOWBo7CYhKiLDEkhVVlpPHVyhus
X-Gm-Gg: AYBFou3lARdM+/TDQF7giNFklpK0UC5kLbG7W3m7mQaGAoFrEBxEcppGtesK4Q+y2qR
	PRbP2zkpeLnM5Mj2q2h55MGsTIVdqZg0hvP0xdRnxnBcm4/RN4RBuKqUJnz2kJZ9jMwBjqcrMzH
	NMh9s8zkPreBOX6v7IBmk6BZMCLDoHGQvkYL9Vx39W/cTxqAtOOxg2LXydWM7ypxbpwGvcNFGm2
	AZ0WSVQIeGZykZGAbeA0Ho+v3jwGI6cuW5n7Cy45Owp3I0Jyb9otMohT/OpPtuk3VuMd9inD/Vu
	wycESapVUIW2UI2vxRC1sRF2yNJDxHjnmShopxQD/fw9B/rMwiguNGQgRHUeW5p7e401GwRGZaW
	KkPhutWwRMKOsjTi9xzBPejPpOAIpispDpodeeu88dbKKP2fQWyxwpb7uvA==
X-Received: by 2002:a05:6402:c502:20b0:6aa:128c:36ad with SMTP id
 4fb4d7f45d1cf-6b6fef8853fmr25733a12.10.1794118919631; Sat, 07 Nov 2026
 22:21:59 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-4-almasrymina@google.com> <20261020121858.3b9107c5@kernel.org>
 <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com> <20261021132304.23e0a4e7@kernel.org>
In-Reply-To: <20261021132304.23e0a4e7@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sat, 7 Nov 2026 22:21:48 -0800
X-Gm-Features: AclHuK84A9Z4KJMCekRVvO906KgemJ7leA4F7qgUGSEUquHWR-U_KufDY8SuGMQ
Message-ID: <CAHS8izNTbs8ONvjhiw+6cRkZQq+cX3t=BZK9aCr39JNkVbY9gA@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 1:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 20 Oct 2026 23:17:34 -0700 Mina Almasry wrote:
> > But on the other hand the test coverage is nice, and maybe one day if
> > we add enough devmem support in netdevsim we'll be able to fuzz the
> > data path or something. Is there a way to get the best of both worlds?
> > Like put a comment on top of netdevsim that this is test simulator
> > device and any missing functionality and/or bugs in it should be
> > medium criticality max or something? Or is it too much trouble and I
> > should drop the netdevsim support and tests?
>
> I already strip Fixes tags and apply the patches to net-next.
> But it's still a burden. If you're signing up to fix the issues /
> review the slop we can try.

Hi Jakub,

So I started looking into whether we can improve test and fuzz
coverage with an improved netdevsim. My LLM prototyped full datapath
(with devmem) and offload support in netdevsim so the hardware
selftests and packetdrill run and pass in a plain VM without physical
NICs. I posted the branch at:

https://github.com/mina/linux/tree/nsim-devmem-rx-tx

The main problem is the total LLM generated diff to netdevsim: 62
files changed with 5,525 additions and 672 deletions :( So it's a big
change.

But with this, we can do pretty cool things:

- All 36/36 drivers/net/hw/ tests, 18/18 drivers/net/ tests, and
164/164 net/packetdrill/ tests now pass on a linked netdevsim pair,
without needing real hardware. This is significant because a lot of
these 'driver' tests also actually tested unique code paths in core
like devmem.

- NIPA can now (I think) run all these netdev driver tests and
packetdrills without real hardware:
https://github.com/mina/patches/tree/nipa-nsim-hw-and-packetdrill

- Packetdrill can now run on netdevsim:
https://github.com/mina/patches/tree/packetdrill-nsim-default

-(best part) Syzkaller can now fuzz live devmem/zcrx datapath &
offload netlink APIs:
https://github.com/mina/patches/tree/syzkaller-nsim-full-net-coverage

You asked me to do add syzkaller devmem support before, but adding
devmem support to netdevsim was too hard. With LLMs, it's almost
trivial, but it involves a lot of generated code.

Do you think this (or a subset) is valuable to post upstream to add to
netdevsim?

--=20
Thanks,
Mina
