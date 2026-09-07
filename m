Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2542D0C89
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 04:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756316; cv=pass; b=biEdnw4EDuH+4b73sgtBoz/U3IxcI7M1rLo5/9lNIqMCk5YtxJmNKv4YBTko7HPI+scOlUQHx+v+ssX9+SniEm10Wc9rIgqvJovstJHb5+PccHMzq6XEloVGAyR1B4CxiVMaBQnEkkLyHQZ18+bDlkPT6FGd2W1vFUnrNNqI/LA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756316; c=relaxed/simple;
	bh=zC1w4EkKZqsmCEBeSg9Ze6B0PIqbALjemuPYfMxHiBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MeK1gR4+KzN4fAWp1LW6JcgsK+bdpsuRI70sDXr7dgyG7qa29c1liaJnYolrjuXxtZhDsiPV78ppxr9Fv7K535WaevtaaRhyEuBfDVD/14HalScEkVo7u32EYGNj0eO/SplGCzzXhw2EQW/bVkfCiE8ueH08ZfA0aPDckmK/exo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cppu7ac6; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cppu7ac6"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7f3f52143cdso2473950a34.2
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 21:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788756313; cv=none;
        d=google.com; s=arc-20260327;
        b=J8tlcjMi/ODklH71FipcIox4faFd/sUmnDJK+D0hOmzuHxB9sw8rOeMrSatIOzrW9y
         91hKBiQGq5t77JBC/ZXJ6kz1QQYDyp3ocGGoTEaB3lY75j+P2+8CuX/iHSE9HV0MAizj
         C22qOatzCUPWUWE2x/F0beTP3r3LtlruuSgkf+ZMbXKBOEXM+fCgNy4W/7AGKtQuhGJA
         k58135CffoztVg8QeEqEOgJR9kaQK8cWJiFL2nlkAaaFcYGWRWzTnBmfxQtl4L99w3AV
         MpV6z3lxH0jnoVTyLelMWF8dsxBUxK04/tzCvpuEyl/gDz9oEv1eNN8MYfMP+0rCJfm5
         Mxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G7qjWXGXsxkTDtjG+v9DutrMwqHR45zXHmJ8Wl9xjoo=;
        fh=pPIi5Ry7tT87dA5DxyGxnI8c8Fci3QogRWO6GzRs1vk=;
        b=ozb7JljlLaYsd2ns2kKo/YbAxyk6dXE5lYvbPejcQbXGzAbWt/YbaDFtlsNnOrBoDF
         Kc42HtQulfbBS9FjSHG5YyJG0coOYrGxZtjj97UybfSZ9jWjfy9qVz3efeDlFIMjHmM5
         4XcXuuTG4ziBJjnNuoB2F3KIupBIcKbVpNPRutewZJfpjnViyU3jSbhnDtTtEsEjzmWE
         n0tcTLODmCc+5IO88Sz0v1gZ1xZt6aYfgk/vSda74bYaEQJXn81C0lQB45/1SG6EXm9T
         465PDtQYVp2R1Hk3CvmKIgvK+I0c6eLPXK67AzBdAw08CDC9xJv+sxVM4xM0y8l330Sq
         dpaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756313; x=1789361113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7qjWXGXsxkTDtjG+v9DutrMwqHR45zXHmJ8Wl9xjoo=;
        b=cppu7ac6DTY4x9zsFRuBUbFlNDPVrWd7psRM0wMi8eJujj7yiksdCK+qDRNPzlLtKe
         yUGRVaH3ccJ/rQhtiSczanAv0x2YQXoKkOfARTEIJwItRnZboBsG0uNrkE42FYnXhuXR
         cEbBveG2sst1d2c1CpnkT2gtOyzXKvY5RVh48Z+zO3dkZ2mibpmxEpDkf/2p/7fcZDyN
         NGTcKXsZ0UP2/0/S8cAQLqsuXtr4GJIB1aLc99Osjb5lOZjYUvqs+tvBgzap4nXNEjUf
         tktsIfQFlPsIU5CzpcagtxNF5da0acc5hgLKuqWAYYp9hUl71lEm/HtPGuzG78ZFwbcC
         iTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756313; x=1789361113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7qjWXGXsxkTDtjG+v9DutrMwqHR45zXHmJ8Wl9xjoo=;
        b=tTXoVK+rwiJpJwpeoqNvbEFe6/0ZIC49gcNhkiiGg1hxKzgPk9TBL/byeSvJzT/3d1
         N7F9+ixkua264RsIrBx2s7NP56bgfZgvqMPX4UQDKaRDHHXEIVKWDBXOuEB78g+/T50x
         q8rnS0fiVQxS0XzVo5v8ct0g3irNC+WLmOzfos6NfZ2S5Q8RPC195iC8r3zRT2vmFq6e
         /M07nUA6USJOyfeKyyV/NBpjA7rsaIfQMqkyp4PZ2vLPp4rC3S9zH2FgjWGwAdWEnlOF
         w1mDeXHysee3QB3spGqRO/H1MfILBxO7ICSGoMurO2+pqCIurQBQ74i2q3b3QNbBOlCW
         WaVw==
X-Forwarded-Encrypted: i=1; AKwUvBwQ9gx6ibMTbXGAeVLhNBY5Jx7z3FCi/E6276oneNBLhVeEZ2EymbTx+1ybQzq1W4zEdlb9Y8fJ7min9Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lPhd9KBSod0UbSaZ3XrqTwGya0LLF2zh0my/X7bXeiYxG8ka7K
	6OvIDZE67qFjwhdXMb+/R+wqh18tUj5QFaaxT1PisU4LbBE3DN3nhwWgqyulDgiO965hdyJ4A5P
	aNHdh97Q1r2f+9vmx5xI4GavpCBTJ7c1OdOVwObzuhBZOits=
X-Gm-Gg: AYBFou0IcRpBET3UDhBPY3lRgGuxXZT8tPh++T+L/hctEU20OXUH8UOAuHNZEpZ4XPp
	Biy5DNTYNgzqXkPq4s6OTvTp9N+tvSX718WGwzYOUMXPhz9B0i1rvg72tSlCEGt02JXmL/j85NP
	q92m+SStsILgj6HGJv7xr6madGqj1wWGEpyAdobHjzRR+N5toZkPqt8EHfYx44i9xGdWuDDH7In
	MgbGr4IMKFWDyDCulpdKQnfG87RCKn54nApZ8tBvdeB84JK9LMEHbzfrcn1/OOLOIBSB6SgSC/8
	89LIhdbbnQt7v+y6mjNkat/RiciTXHMHDGthwfhWMsSGfwgY+lIf9DQTJuRxxI7qsIEse/7N4Sx
	Gy0UuzC+qKljkLjNMLeGfO7b9504=
X-Received: by 2002:a05:6820:1889:b0:6b1:afc8:3162 with SMTP id
 006d021491bc7-6b6fa4d5f8amr11758130eaf.7.1788756313416; Sun, 06 Sep 2026
 21:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804072630.28745-1-arash.golgol@gmail.com> <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
In-Reply-To: <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Mon, 7 Sep 2026 08:15:02 +0330
X-Gm-Features: AcwNN1XGwRoDkNehPDVqSJPI2X738z011aMfgwn8IosFsynC5ZFf-DlnIt-yf84
Message-ID: <CAMxPZkhjurfpPvvymamJqTuia8CtFw1gRyYA4KBwFcQoH5jz3A@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com, paulk@sys-base.io, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Wed, Aug 12, 2026 at 9:50=E2=80=AFAM arash golgol <arash.golgol@gmail.co=
m> wrote:
>
> Hi Hans,
>
> On Tue, Aug 4, 2026 at 10:57=E2=80=AFAM Arash Golgol <arash.golgol@gmail.=
com> wrote:
> >
> > These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-csi2,
> > and sun6i-csi bridge drivers to use the V4L2 subdev active state API.
> >
> > Each patch has already received review and testing individually in
> > previous postings (see the changelog and links within each patch for
> > that history), but none have been picked up and none currently have
> > a delegate on patchwork. Resending together to make it easier to
> > review and apply as a group.
> >
> > No code changes since the last posted version of each patch.
> >
> > Arash Golgol (3):
> >   media: sun6i-mipi-csi2: Use V4L2 subdev active state
> >   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
> >   media: sun6i-csi: bridge: Use V4L2 subdev active state
> >
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> >  .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
> >  .../sun8i_a83t_mipi_csi2.h                    |   2 -
> >  7 files changed, 194 insertions(+), 220 deletions(-)
> >
> > --
> > 2.34.1
>
> I've been trying to get these patches merged for a while.
> Multiple pings and followups have been sent, but they haven't
> been applied yet. This series is just a collection of my
> individual patches.
>
> All patches have full Reviewed-by/Tested-by coverage from
> Laurent Pinchart and Paul Kocialkowski. Current status of all
> patches are still New in patchwork, without a delegate.
>
> Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D28=
738
>
> Given the review is complete, would you be able to pick these
> up, or let me know if something else is blocking them?

Just following up on this series.
Link to series:
https://patchwork.linuxtv.org/project/linux-media/list/?series=3D28738

--=20
Regards,
Arash Golgol
