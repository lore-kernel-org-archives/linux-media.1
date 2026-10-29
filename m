Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793282773;
	b=C6Gf7950S+rOF12/t7LeerFpcUDg16a5dwCw2/GjgOjWvJx4tBOzBqYTlkXNJEB0kVr2
	 FWJZRvggKefC3jQ90NxaOH0PuirLhPJxPAhhB76ihzV86F1HBXLHowJUT92YAM7Nxa4W1
	 j0W2G+i03NeqjBAxAhYMXcJp0hhqMcYNzz8gnK4dJJZhQsVCt33QinnmgjMuULOLn/fAK
	 huyuvt0+neyp4CfCuog+mJCYsxCQ0t9L5kL9c+iVpo0I14gPrzaL8nHqAeXS7yXx0X11W
	 PYe5DKEqyjIlGSKZNSisau0GhJy6Vwbtdb34QqTVh+tMHvpi0Xu7ZaPZlE9ETf7RdqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5AFMA62x81Eod9qLhy82JE4hw8ngyRnLnh0416nT1Yg=;
	b=Hgyaw+84DEUFpliPqIsIofDZaqxwJWv2UbnnirtEh3LFMp7gF1mFLowrCsUmNPEZLS3e
	 PaVIrCJ+iR7ylGEd0aPPK8f1z41a5Mrl2VYxxdR3FpbT6Quuz4ctrox1xHe30rVnRM85L
	 MXcGSDqqBuMGYbRq3OCIrHlOp6F/jyBRSPP8QjHsxjLytxgrql57/0WTDQiBcd0jlDc1Q
	 DBbVPk3muV8tz9tRcqfwjbiaBwlo1tnQ4GFLSKhPgwuhsJDXqe3F08Se6MY+xOeF0s2Si
	 b+nYdDk5liMeeSV+W9FhmGIFWD5hgBN6JZyX2pWfIpderNjjCX+x/Hl3K5b5urehNdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PUMIvSwQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A7E606A31A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A7E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PUMIvSwQ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-353804b591eso3341984eec.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793282772; cv=none;
        d=google.com; s=arc-20260327;
        b=bspChnTOX28b1lt4vxvwAgCSZyP1rh6nNYndLCLKhx+Cymiw4ECbsUPts6epTtl/4x
         pkwf34Eil4l352pRoXVv0Q0SmR1oKT64f8G7MtAPM4v8GOMLIJBkCOlO9OX6WHXyK+rF
         OtSneyrAzcAeI77dr/vDs0aitULNuiUUnRwSdYTO0XGzGzqQ+3yqdopQQqOWYQpwEhcg
         vDZMAt9kPe+Fe6G1NWOhRcAvN80Mg1EpcilzwvICKQ6W4wPBr7poYuHjlCGGoQgCTxEX
         QMEhKo9kieAksXR0G0uJO4l9ADFGdlSSolJVwQ6Ue7XJE5zdl7JPbH/BgnvoB0HQXnHY
         VZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5AFMA62x81Eod9qLhy82JE4hw8ngyRnLnh0416nT1Yg=;
        fh=7HKLRgf0JwtSc18W0qrc65xR9FBBgH7up+6tToZAX4k=;
        b=AlQqq4Fqmlc5MJNTHFVQeHsm+UorhMzihkYzCMGm4SxkV1USExDUTvbXWvd1EaNEUb
         RxwkKpko+U9YSQtwDrFFjsf84axoUYi/1q9f/bMUGfIUe6mhBlWvGZETv+Si9Ihai9jZ
         gjQs1EcjuSsncZMAP9F7FDys3TpMF1cXzcyeI/KXZVP9dQK0uXJbQ/aOOfGXxqsp4CGO
         YfxQJSvxcK467a19TsLgD9HqySpru0t8LeDf0n2XX9OxOjRdyzcjKvmV/xIeaHYak9MS
         7Zzxd7JLJTAp/mVEA9Tft3bDaL+XpjToqv3EtF+r+YHbg878DHqlR4W50JFYj0J7/NNZ
         QHMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793282772; x=1793887572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5AFMA62x81Eod9qLhy82JE4hw8ngyRnLnh0416nT1Yg=;
        b=PUMIvSwQU+R4CLSlB5Lx/jStEGM2g7fWdLaGdT88RoWpXvqMpGBFUnGMn2je4Drajj
         zKzZ/hcw+7aDkUlZ/mLyWEAepcg+lcT2wAP9YwRBYWCHSm1fGMKyYQHabWrLx0tfNecl
         ZgT/Fr+HfZJcaDm5h0++hm+hv05vSxLNZmr+n+rexbNQKK/oTL0E1qhRj9DnN9pa1IzP
         59zS2mtCLGf6oE8pmIY0NttEBy+BRG6jCoqzuUu0RbrqveTk5tPtZCo6/mlPDaA5gbhR
         OBhC58I/7yWrg1nDGhyv0T5mjPl9FUGXaGN49B6cE6vUwOWF4pqrp6UArrajWppcGDSx
         gKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282772; x=1793887572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AFMA62x81Eod9qLhy82JE4hw8ngyRnLnh0416nT1Yg=;
        b=WpoLarW7Fad1qcF4rGdREU3eKu4M1JI91k3mRLHV2Tw7rDzHoIL0oLUBJRFGgLi6Rn
         95Q+Pn6ws0oGuXFZjub0plwZzjCqBihGS7Y9hXBp9GhxEwi8UAYxpwXBsAMwN925rAi8
         p4kl5yDBmNTHhlptaj8vj0BBpPTbRn1z1v3fZNVZgAWpSXDkzsXmLop7pJq/hzLPEQmI
         ziPvvB0uDzK06u5QVP6mFaV0EynXBO5xirTjQFp0/ea8b4wNZG+PkDtz7gWw0GLJobLp
         sflEKy9ZyrvDyfs5HVlxMP97hnFIIbiTrHm67gvNH1Vl4AhSSZtwflTPsXi6g0d6ZUm7
         Xr5g==
X-Forwarded-Encrypted: i=1; AKwUvBw7lx9FCnnTKHOUUOuL9iFucbuqQuh0zUIZjie+G2p7hDBvVwe6K4TqwEnBF+4m2c7gIJaVjgw6GfKdvg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLJxK/XrjcAi5Y3LFu++qfpnVy2eDAfzVBsDHtvWOOxs2NaUx1T
	49ekbCx305ROYgIrqtLf9gnWytZwH5C0W5mjJpQVEL0ZUGkAsRLzzTp1PtQZ7AdgMrCCaRgFQfg
	AcpWyacBjeGgGs/n8l3PhtxI3XoVpZdGBsn1EMlAY
X-Gm-Gg: AYBFou04n2CcDCp8fV4ySzZvGMIVTyrMsdgWVfW4RLubDAeR5U6oXg8+ciuDfvgmx8T
	Fr9maocB8lP0iyIMLiA5b8obeWlydyuDdodxlPZXsoPLTNblWalmOEMAgBCw3INsmjsoZBMjEFO
	1uHMwXE4vIYMPEc3ybkuneaJrN2akMQaL4+8c0kY4mC4+DgB9wEe//+PFow/0y6RPhwd0ucp5bQ
	/NB4yck5mj/4G+TCC1SzvcaEYj3WUwmCqmvoeNiMP/XulOocoMbhmf4BqF8MWbweYZ00SBwkSpt
	NGow5nTCf2mn+6pl/aXKPnYbcOq70kIq4fK/rk79veBZLvsEQhMeDYc/X1RhQhNBQP5wzo5GU31
	pPH4ytJUghlBv0rlWUDzrv7V98GQEkQemPNx2ASS7gEpDCp9+j5cEdc6xHBIWrpKGlGvBaavja4
	NbO6sGkNJh2WAfOBDiN/VTdd351kbo9OU8HTRdeo/KqU5gObXVC0In0gKQBaL8PMOI
X-Received: by 2002:a05:693c:87d0:20b0:369:daea:812a with SMTP id
 5a478bee46e88-36a203e04ebmr7980604eec.30.1793282771027; Thu, 29 Oct 2026
 07:06:11 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022162116.2282295-2-phasta@kernel.org>
In-Reply-To: <20261022162116.2282295-2-phasta@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 29 Oct 2026 15:05:53 +0100
X-Gm-Features: AclHuK_SoizvoU1-Dr6Iy33-0wETUO3c6OG-X77GiKNsKuJD9voK4ASEhNNET7I
Message-ID: <CAH5fLgiDRJuid2usngucBVNd4tP3R6Xavx-WWoKpN7xMQqv+zQ@mail.gmail.com>
Subject: Re: [PATCH] rust: DmaFence: Implement Deref for FenceContext
To: Philipp Stanner <phasta@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 6:21=E2=80=AFPM Philipp Stanner <phasta@kernel.org>=
 wrote:
>
> A FenceContext carries data, which the user should be able to access.
>
> Implement Deref for FenceContext.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
