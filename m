Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793762753;
	b=W3jXRwy0Qz4uzr6QulLqoPJwUNFHsRJOfpua2ctAO+d9qBnNZclioK9BAMJCMDEkxTnk
	 88YFDEJSOsYir9kcOIV+M2BVK6EHZTpF082jp3M2057NVj21FIiKJpKveyxx1bB13tBmV
	 WH+693YPAa8g18tuOWbMEhzkG1GGUTzzYb4LbL1qTK7ZyD4FsUgwVFcIFzpGJ3JrRA1K6
	 OcB99pk0A/L4YVslymuegRTpcpxa6mctIiAdJU/3WOWPtXFZEe/9vd1vTs439jh8EvMWx
	 5KdYmUbWpPx6yUZfRIPJsfsdBNUC+gKOaw+Z4a/4SPLU8NN3DNpH1XwD4YuakOF909g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762753;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FiR8bNJz68wyQ94GkBHZoR3YiuS4hpz+FXLXPKGN9Lk=;
	b=FW/80XXPhf66F1WY7IsaPu3fzQKxWht8pGlM4xQt0z09tNp0uoKpH1D/sX9XUoqNnLEi
	 UzetXAnBTiz9noHAwvL26toxeyrm4GNqSmbfSR7V92xXr93j+9g+Z1GZWy+IBvS/3Robe
	 P9HJfqf4RltsU3j226LBVsULhaIk3sdumfnixnq7zfK7afYhY1wZfRIuoUErnWxsVtMby
	 9cS1QR/5wHUM6EMxqmmxysUj4vbnBqcHX9GFCYU9fWu7BG7Pf0SvefFiFtt0KR+/9cmsm
	 J0Ebn/LvTeR+xjBcAv86wkyEo/WCRUZv4gYsDVkgkLNZdbU+rTzjoDqt219lKyfC9gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5IOzblz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1B4606A329
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 03:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5IOzblz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997DC1F00A17
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 03:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793762752;
	bh=FiR8bNJz68wyQ94GkBHZoR3YiuS4hpz+FXLXPKGN9Lk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=F5IOzblzVMFI6Zx8tG7Yt2TBiGdnoDbxyv6HGYRoDScDZEGta3FVGaKpN2Hcktbky
	 GJJcGsjqbGIFO5FcXmWnYbabSnO95o+H9/OQ7rnY/jsNjOGn8jlo8ycg09LL6MzQmB
	 zz1LAG9JD4KqD+QXvLSyHu33uMeCJJVcsfHP1ajPTp0lmtY3n6A7CBY34quq7LQnN7
	 F10HywVMTczJoShhzWDLzAOPWhTw+15r99gmxX1euVy3mprMVQNeXr3wYkmlWNHvNO
	 1SgVdJF5S5dJKlheJwUe4LCwDl79onScy96ySFZNqKlOD5hdsHxe2tXCYJIeO2zXV/
	 C64WEZT6EKL/w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso160153e87.3
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 19:25:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxbSmrqXHXmGurZy3oiQosac5K/SCKnnZ9v1w4IpvhTUhFfsqn2Hb0TdvxnZ9+S1Kvie7mu3LqvIX3h8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8sAR3JCti1xYrTs7yu6zwdmfYXvm/dUxv9AKKv32mXTjdLpdih
	TSrXXR0E4jq6BLdkOSpxX1JGQxj0+IEauFpqdpLE/XdNFx0SJUudHoRQArlpC1d5LPy38Ej5/Sc
	Mz0psj52O3X2Mw8W98eq38IUk7uzBX6U=
X-Received: by 2002:a05:651c:b11:b0:3ab:4ab5:56ce with SMTP id
 38308e7fff4ca-3acb7b4edb0mr35654131fa.28.1793762750881; Tue, 03 Nov 2026
 19:25:50 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <aupKBdon3N4Kpnkt@daniel-HP-Stream-Laptop-14>
In-Reply-To: <aupKBdon3N4Kpnkt@daniel-HP-Stream-Laptop-14>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 4 Nov 2026 11:25:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v65DdCiWrEOefDGUjYtT2=tcxQ+VW3vfcHVUAUgcEtEfwQ@mail.gmail.com>
X-Gm-Features: AclHuK_5Y2MLhaVY7HfmVbOKOfX5_2eeteHh2sW4OTC1OnqSFna6GnQ5i2y_CDY
Message-ID: <CAGb2v65DdCiWrEOefDGUjYtT2=tcxQ+VW3vfcHVUAUgcEtEfwQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: staging: media: sunxi: cedrus: spelling correction
To: Daniel West <daniel.west.dev@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:54=E2=80=AFAM Daniel West <daniel.west.dev@gmail.c=
om> wrote:
>
> Correct spelling in comment.
>
> Signed-off-by: Daniel West <daniel.west.dev@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 780da4a8b5af..f57642c0d8fa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>         }
>         cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
>
> -       /* Neightbor information address. */
> +       /* Neighbor information address. */
>         reg =3D VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neigh=
bor_info_buf_addr);
>         cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
>
> --
> 2.51.0
>
