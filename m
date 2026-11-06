Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793883293;
	b=cvyG+/KmhZy4Bgo0wZH/RlIcFhd2oaudiMRBAcqhwKekXrz4UxsJ7Ip5DP9WAVyZmSaY
	 koe+siSpfwk1p8214//szBoPybEljpTlztSXlqFiKGddwCyOnVZw0iF16ivh3jRslU+57
	 hb6qgIH3a2vkKOjBdeDIM/0EwimreKBrKlu3cfaXjgoznxfw8Vvk259ACSG+s6cCPyRUz
	 B61AmbAUDS8zIDTgFmVA3jLFwgcUQW+Ju4O0kmhn1SHVRPerSdkIDwBbhCn8oGy7yomeM
	 9lvdjeCy4EqC/x5BFRFTkAKX0IjbLwA5exn4/a8/yFZ0toUSAOM8csO0xiLvWjpJI/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=tOF6PS1JMi8W8WKP7mDpxXD9imSMAhXJwC00jGPmGBs=;
	b=i2irDmY+1c9//xTpUCqGFBPeQGlv4F5P2pzQWC1SM87pO9AOW9VFWtwjbD9GQFXbKv5C
	 jam80qeYpKBiuRMK6tiaFDO+TVD3cJr2SCk063XCfNcwp/aGlBYPbm7sQqFn+Pn4aOOSr
	 ge4fPeeWFSY+LpmFdh6REMnT4kbOobfKJ3g46zlefCEmZMwmw3STUeR2Ic9K6tAOAtCHb
	 vkJE9nh2j1k3fA4CpqQgOXi1s81xYMMHiPKO8u249mcQObnyqMHRqM3EGqIWOgP+H4Rvk
	 Z19nxsxKWrduROAUkhGaHnQmz+ui0YHZ8maePPNGIPc59gK8FqjOsU8uJB6/U/HRalg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGShpYqR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4299606A328
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 12:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4299606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGShpYqR
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4f488ba6e90so727048b6e.3
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 04:54:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793883291; cv=none;
        d=google.com; s=arc-20260327;
        b=k1bTuxrfrsui6V0MDHK77v29wjdk8C1BQdz7mXQ85Y8DROVY6ly8I5qpMckTzLfBCh
         xu8Hg8OSKbro92II/Fy2exnTHeLLwIidUq22LLq4azRsrL2S23upbna4+D2rjBV3HQPH
         IZSr/NIqBaYcLWAVvV/ZZ/D+2S4yB5ZDW7mDsAGT2Dv420FKvQB7zpC7/L8d/LAMtbYA
         vHBcaMWviDZFBye/iVdzQCkB7w00CzZt4ntkc8lNEo6KexBlyEsNbO/aHm8EOSnAZr+n
         jnSjgimZstHbXEWeC6IyEbXF0S1X8mYOocCZCbu0LaACQF+vjv5J1VjwBCIs3qohmVc4
         LcKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tOF6PS1JMi8W8WKP7mDpxXD9imSMAhXJwC00jGPmGBs=;
        fh=2NORyexC5XqeFod9PqAcPkTFbvp2tKOglja66TNFTmg=;
        b=lIFomSfjuw8yGSQmRoTtQbwrSy/mNFVJNdvEd5vqx7s83FJHdy9m0Cu3/hcNt9QlXF
         diBvppli8lStJ6Mm5KIn3pEHIHeb4V1nYVsoWYDBVMT7rjxj7VqRfSija7TJ7i90+LiV
         0wdrFvoGF4iNj5vdPWJKaEDeRSbWvMY2hHPSmvMJh7aIHUa1fv4Wu7uUJwHBFxo9+BED
         jlHR/X8nJQ36ZXwNFly7Y1QZT0D1zgYxSn0G7mJ0E5IsPtlF6QXG/+DHEwGZkq0y+oXR
         J2km8OVLUH/X8F0Wnd2irDxO/YXx+HK5Q3W20yriOUzcRyglGEZIh7TnKgguaQH3/Yu7
         pEIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793883291; x=1794488091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tOF6PS1JMi8W8WKP7mDpxXD9imSMAhXJwC00jGPmGBs=;
        b=cGShpYqRd1gpKNkJXxk2+CH34znLPFCQoxZOitSh3MLY9Ii52VWLw19U2W8AIxY2Mk
         uwaxCSYBqKouc3ZUk2AAAroLDyRiWafNK+yN+Jd8E+GkNwu7kRPI4yDJbVYBC/RGfiNV
         vBk5IPuJdVmCaCQO6L3l+KXGj4V8deIHUik221orXN3SzqB/nn/zeh/dBL1kfcd/d3NF
         QMrFLuYFO5ylyOcCmrdE4j1fsbBmQVOMNheK5JRMzvKIVZhl8OjJBclAgtby/y9UtNSx
         GPljLlPTtOsfSUdd0r8jpp2kDqnEDfrjQyeJeEwwn9RNKhYniSTiJ5St5lC9jiNNmEDE
         cMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883291; x=1794488091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOF6PS1JMi8W8WKP7mDpxXD9imSMAhXJwC00jGPmGBs=;
        b=RShqPkxDlkWmwz6cRL0lGsnlDesC/u/uWIfHCo4onRFHz68SP6kSH4CtXk2CKtv9SM
         S6HY1Ty9u7Aef3AMBgWuhfbKX79lJ+bNnTci3tdbKOYR47Yi+TSdzagcNb2Ef75v2CJh
         X7Ax+W/7YaLz5wjKSCs2qHLxdjLFX0x6Ly6sbwrwvKiSqVrbk4TryPH33eJfKGC1Mp7q
         K5zarY98Gf6AkxsU/oN4SPs24yMENgf/zypC633IwuoGy4xw9dWch4J8bXX05Fr+05I0
         SBf/85cjveP5fIyDamIbT3N9onDuPiD8qzlt4ANYaZpRNwTuzDrvjtVXvhhXN+AwwiiL
         EQfQ==
X-Gm-Message-State: APuU4Z+pLjk1vrB21+l/5rMb8VFHZdOW5GpEfgFMzN4hY0iM0T4FHD6x
	pnEMVKt/TbdiAW5KZ81UvkxR8Xjd7xCouUwdSplJtfUmW8BlN7sJDl0peVKIrLlFSaFv8g1ULuN
	5ZJZdX3Pcg/4fYTLTa/24qLH04c10wAyfxhUFhqXWwElm
X-Gm-Gg: AYBFou0nHB0tRw7DNbTc5zk/oYTUCzbx2DG7iLYL52p+G8j8bm/w7oAlMXhb/6v5fNc
	bdtwcdGvtwOX3nF5RfsUL+aUwTEWg2n3l3+/8wNgSkCXgtAvwjua80zqqHxEUbFRk1h5jdFmecf
	sn2lRtyrR3tpKnqKGi9JSocefh7ZJDmw2aDi761UoX76/uqjlNYRVYCCFJnb1vZTekGS4Z1h1bj
	ho/d+UC8MrdeeRCQKmh0vaBY3CsBT7X5wOPrug0/2irO5HLG3u0gGjtmOQ/qHtDuj005sSvH0LF
	2hJtV4WJt/Zz8Nw4v4TuUYBPluNZDs7RIC2fQTRlu0hLIo384BzCbe4qE9/oN6GKKKOvvcKXFEJ
	O+3dJK5LBEDye1wh7SGtNrO6zYrU5ljFwuhNhiYEo+CTH+6DGR7wNZApQh9oQjOCbbF6Z39NamK
	mNuMns+OBQJbvkFlb6JuU6pjIQL2MOPmvHQ5IAKlj5KmY=
X-Received: by 2002:a05:6808:6508:b0:53e:3b0b:fc1f with SMTP id
 5614622812f47-5640dc2a803mr13971941b6e.22.1793883291559; Thu, 05 Nov 2026
 04:54:51 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016113846.8602-1-arash.golgol@gmail.com>
In-Reply-To: <20261016113846.8602-1-arash.golgol@gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Fri, 6 Nov 2026 16:24:27 +0330
X-Gm-Features: AclHuK_mK9V2l6M4jlS75n76fTlhzkP8UIpwt-w6idtrgAnrQy8Zvz7juL15y8o
Message-ID: <CAMxPZkhRKB8uGL3L4K43aU4pqH+FdZdB829yaw6WDF-h4RW7oA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sun6i-csi: Improve capture and bridge
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 16, 2026 at 3:08=E2=80=AFPM Arash Golgol <arash.golgol@gmail.co=
m> wrote:
>
> Hi,
>
> This series improves sun6i-csi capture and bridge.
>
> Patch 1 fixes sun6i_csi_capture_format_prepare() to align both width
> and height to 16 for NV12_16L16, as its 16x16 tiles require.
>
> Patch 2 adds vidioc_enum_framesizes() to sun6i-csi-capture, using the
> same alignment.
>
> Patch 3 removes duplicated mbus codes from sun6i-csi-bridge. It was
> posted earlier and carries Paul's Reviewed-by.
> Link: https://patchwork.linuxtv.org/project/linux-media/patch/20260527124=
552.33815-1-arash.golgol@gmail.com/
>
> Tested on LicheePi Zero Dock (Allwinner V3s) with:
>   ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture
>
> As ov5647 only outputs Bayer, streaming HM12/NV12 is not possible on
> this setup, so I did not test real streaming. I checked that
> v4l2-ctl --try-fmt-video, --set-fmt-video, --get-fmt-video and
> --list-framesizes report the expected sizes for HM12 (16 aligned) and
> NV12 (2 aligned).
>
> Arash Golgol (3):
>   media: sun6i-csi: capture: Align size to 16 for NV12_16L16
>   media: sun6i-csi: capture: Add enum_framesizes support
>   media: sun6i-csi: bridge: Remove duplicate mbus format entries
>
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 12 -----
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 45 ++++++++++++++++---
>  2 files changed, 39 insertions(+), 18 deletions(-)
>
> --
> 2.34.1

Just following up on this series.
Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D3216=
1

--=20
Regards,
Arash Golgol
