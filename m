Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D5634A78E
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 03:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404902; cv=pass; b=kWP5nw66f7+oEjFIPxAB3SmZestGWNfajjFj7yvUnVwsFEKVoain3749pHeUzWnW5WJBK88Z1OKKrwOp/epbqH+vh0lBNCDPbZJNONsy3gJkPvHP/IomVNOQOg0GsbHxt/CB67WGxqATJAEWZsYWylw50psraPsBGsNhdt3BYLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404902; c=relaxed/simple;
	bh=ZQN9NJXDj89uzGf2iFwIqxTSP9mMueIpc4XZFDO0eY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jxKBUM4pDuiZmRC4xbZgJ+sxjraiyHEw2tSgc6nzaT/7cLkqvHa4i+WPtJcYENsUvODGI4Sd9GtdJmAkVe+ElLs8+K1qgB+JJHaN2wt7t3XG3/2dewTkjTCuhnPjBHWAB6Or38YJCT+jodm1pZCmtGVI4F0R2KzMp9vnGE4HizU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=edIi6KC9; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="edIi6KC9"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7dbcb505578so23544297b3.3
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 20:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788404899; cv=none;
        d=google.com; s=arc-20260327;
        b=Mk0/KvMZeGVbuXIdDjBvEq+uzGxN30vurMB7wjwjrTEjJZB/U++EWRpMFgzoN+CwYp
         r+mBkTdNz7zJpKXxlzn/LLgqpgHoEIgfaOJ012rYhmrT21mFTg8N3m7MGOJVvA+UiHbo
         XmbaWkqwA7/EG36iat8emc2vofb3SzgDJYzkGqevRmD/Y1sGZOGtZHzyHn8dGzjLNqZG
         xJqbKMb+TsLsMldYl+j7vVWGVvAKgBTAdXcAP+KdY/hp5n2YXG4g+bYRufM91xUhLTR3
         i7LHiWGWLJIsCf0/A1DfGQfj+4Pn7h22mr2ERtkhh13j99fs4gaWUYivXrWlGarn4QqP
         ieKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        fh=mAacc9MEnQZXsxwX4O5DK9tgOAGvreK24UpwppGyuUQ=;
        b=pnCZl7DrEaHvP4AV5C484JovBNUMkBnjODp1k79m5WHJD2oAK4M0Drcz+NHyk73gzQ
         H17n02tsmh+nosPxQYVxPiBa0cwMR1L4bngG+VG5PcPJfkPrKBQNQH7SUOehYxdIojpm
         AKTXSF2eEJI7WLXTO4oGXocBBDsIDGat9QFe7NLkcAD0DIvXai2XwHkxYPByQYr0koxB
         HRmU+xkzRtVhPuSUxf5oQMjgLSsHANCe4xMcO2T0cmooyBVX3Q4y2YK3sx4s2Jo6PF5H
         vHaNoppNaMlHwRz5kDEbx5TXhYL8LvGElMvg7OlxRRYICx66SmnxCeEK1vyrH0t+Ulgw
         UAQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788404899; x=1789009699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=edIi6KC9yYNwen0GpJRCJ2ZspPx6mDnY6a+sI9huuhM//DzzEv2pvKl9KKOGifg3PZ
         Y59P4cPKqMbIQ3YtjiVL10GiXKIEqMPbypwpk1wuVnFoLZuBcq9hMIl5cxl1Lb5vNjPo
         sueZ42RYmb1GV3dQ55G3ry8VujVeeM3V88ASQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404899; x=1789009699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SnzwBfRZpBf2cJeykyMmu4E583GVHfgU8A+PMrUbmFE=;
        b=Ve+amiZsh15KVpFTr/023FBT3ppoxlyw8VaMmdGjdwpM6eosw3bJIXU65dN34r4I5R
         11bwCrwc4IeQKtBOFTyIwugMbLmsbKqqSM8i7vVbLmSB+uWAFLwoag8AgMhmGE7wEvnH
         7Bf/mX2i3Mx5jJTdE0uD6yISQZuUPHEN5ytCSunQ8fUYfzUvljPtzkwlPnRyGWkHbny5
         JLzezv6fAQjCmBA9JbY+GyH+Zk0o0uMllNHzWlhS7ue/cwSqgfezHBA4rY59FCBDQxAz
         t4QOPnsnc2VM/5PIWcpmD3jfAHZZK2/WA7pg+zbuK+cURYVrylSFg58LVtC9SuxF3P9V
         h44Q==
X-Forwarded-Encrypted: i=1; AKwUvBxx2DdW+phhIyTQ1CDlra7k80e4WEilgP36ek/f7KOETKJDkyfa0vgSqA/cC83Bm2SerOztz7lllNdr9Q==@vger.kernel.org
X-Gm-Message-State: AFuF++n0Jd2hu4GN2IhPMPTPJ2hqFlSgzaG0UYKYRBNy1CZ79grEFvcU
	kzIw6Ee4UZbcXOOuOeCBHjdD1hhVk/yDK8oTBY073WQrib3iO5pFzcWB2RQPz/aNrpZuhILl8Ey
	ZU8/FUkEX7f5Ym/EOPszIvXpqDOmDVKYBo2fmkDIa
X-Gm-Gg: AYBFou2V2JxjqoLkZz2b4k9G6Pwk6C0VmA0isSN/TQ09ciXK9AvJJcC0ml8pjZEWEBD
	UtcWJoKrkWePd01Z6Cdvf2CNIUfuemI+3ypHAn8hLctlL2ZEF/H1gVuifYBdTowJzM21u4DRUmq
	73M466muM1mCD0Kl5ru7QcbU7RgsNtF8ac9chrWASp9nSDxB3PIsXUDl7HYNepp3pZYk/9X3UUb
	GEDoo+uyWanHeWAL9bh3u4Q0wARCSqt/FYyf51kNcfcW9pNACuxUOljMmJjdwWuL9B75bbKi2fE
	eaOj5lOk2wjc9l3O6I06/8T+vjMZAtHzuNyIzVjVtWehg5UpRyM9di1qM+++1/qTpEM2KpscTUQ
	=
X-Received: by 2002:a05:690e:400f:b0:66d:113a:3928 with SMTP id
 956f58d0204a3-66f9bb6f3famr3574226d50.12.1788404894746; Wed, 02 Sep 2026
 20:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com> <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 3 Sep 2026 11:08:02 +0800
X-Gm-Features: AcwNN1Wn32BWTc7gvrI5NCynGubfvPlrWgUmvLkoMfGnpAB8yTnTJoIOOvbhgBM
Message-ID: <CAGXv+5E9zs7LsK=d08NB6QcuHkaPw4GcifuDuMDz0CVB6gB=8A@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
	Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>, 
	Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 4:08=E2=80=AFAM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..557bffb2c2f1 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>         dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
>
>         if (vpu->enable_4GB) {
> -               ret =3D of_reserved_mem_device_init(dev);
> +               ret =3D devm_of_reserved_mem_device_init(dev);

There are non-devm calls before this. Inserting a devm call in here
messes up the unwind order and leads to confusion. In other words
this is a bad idea.


OOTH, the remove function is missing a release call.

>                 if (ret)
>                         dev_info(dev, "init reserved memory failed\n");
>                         /* continue to use dynamic allocation if failed *=
/
> @@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev=
)
>  free_d_mem:
>         vpu_free_ext_mem(vpu, D_FW);
>  remove_debugfs:
> -       of_reserved_mem_device_release(dev);
>  #ifdef CONFIG_DEBUG_FS
>         debugfs_remove(vpu_debugfs);
>  #endif
> --
> 2.55.0
>
>
