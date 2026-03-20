Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD321A6809
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773968783; cv=pass; b=IVzw0R0wKa8uovXv0l90tgK3M4ZWAZ3yv6a/04niDieOzitX6WfbgXsqBeB9T3kKKgFlVGqpUbR07BFg/WengQ5Qx+Q4o/r5EqNv/w+RwFwr3cTreASOmmo3nhSsx7cJ3wl7I8qzBZr0kYt8UAfXKej9OG1vzIrihO3VcEtpkFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773968783; c=relaxed/simple;
	bh=r69ExM9MAmSbi4Pa8SdsjkeGTV4p53z6YKYrX7qJXnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWsZJd4kOgeOlSups/afgNF9GE1PwX5o3YB//zcpbZH1C3s4CmTH3jbfyzNBeQnTyL+RRC5giHpVGTkm3BOUyh8epaFlLafXmyo+hF3oojCi3frZkzL4Q2OuRt7MLQtz02WR2/dXRfNmcMr0O29vTr7WxuFaapljBl4sjSyEU8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aea8OxWC; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aea8OxWC"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-661cfb9f3aaso1621230a12.2
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 18:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773968780; cv=none;
        d=google.com; s=arc-20240605;
        b=CkiF73iLtF6/2OH0ypQbm2wG2N20qjXFrcA7mOyDyNfneecCqxhDtClz4F7CNTDcD7
         g5pXYDhhM/Q0Pde2YQmusEN70e5Jpo18nCXIv73BP2b0Xw4VrSzK8BoDWP4aj5QhYKh8
         XqAlmLxFQ3asIsCGmvQEO18RymHcLBoySHWCcfRa9xYy8bjqoATfJ6uo/fEgqDJJNaOE
         hn+KbeTI2wtw2fLanqkDB2J5ocWvukbLIfLl0jxL8gVxmRmoOEkCpS7UXKMaghyCSMqc
         OUtFEYF0Ee8rxqgYWL9uATVE3V4GcZMpAwVwO9sriaHFbQ3/Ybu6bF4hXmhOLglKqtiE
         0UKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9SqJxw/G3C8Z+MfgxLYlgt9ClPmc6gVykGItWwhh0uU=;
        fh=To++y5S197ft6u1Cf/eyjYSEDQCinpbA2Esq9fluFcc=;
        b=RvClXQ1mrUPdzLtSR3BDGUqfc2zDMf4FfTtmNZQhULwlzIQhe1lloZgTQOmy78aK2H
         NHH9yVB0F20bgHbn8XIhAdGd+h8gc4Qr4QwMy9kCvLyXbSZjOOURiavkd5PXGreVUzhf
         ylLmhhylwmZ2+MLC8yuM4bMbi7H5PfZYqK3mzBIe3t67FbG8K0BcuqoRLice5a/gRe5D
         BEeuIYE8yq++HcWSBfdrX5dQOZnnZEtBI+e1RPbFxWW/QoT3le7TC9851YlXxpwpHbuo
         03C4tsy1nc5VvdVmf5xieLTglk2tO07cNJP6H2168yuxl+AqO1AhyWCOI13+zIXf32Gz
         7riQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773968780; x=1774573580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SqJxw/G3C8Z+MfgxLYlgt9ClPmc6gVykGItWwhh0uU=;
        b=aea8OxWC/odErtGCCX4J7mcTpqt9jO2ncAQV0vkQMOZhdvgz3cJGAX5Fu3UHok7p9I
         07W1c7RNOzfT/EVqcOJUGcVwX5jweupadgqXR7rfgP7xwNKGW0u7qQXBh8Ms7zZYERbT
         7TESvYS0sJth+05szHevFBqZr5zzJ20Dzvyj0naySrj6xF7ulQ45viHS0Urf8RmczdO9
         oZBRZ4dYss89/L2BZ4UAvD1Eb3UMkCHX7qgDGBZPObV++EslSrN1/jypg1llqZd5WgdA
         ZtoFtl/G/wD3eFvw/xPHZz2qTWpYD8hI3960pKFFN5n+FdCG6wCz/TRbuxw+xF7UERoq
         TsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773968780; x=1774573580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SqJxw/G3C8Z+MfgxLYlgt9ClPmc6gVykGItWwhh0uU=;
        b=e2b/Yawr09po98ZQYnYCFjlmSrzqfJHZmK8pKooTA0/UBNP9sWMoFSHuPVy1T3rfcX
         A88GsqXxcjxoWvbOiLORi7lw5FOS5psPHcOUPEy2wGBM/xAamIh9U+gimaYGvILAzPS9
         5w304CKMw8Y1TBTHNM4ajtPVMWiZMKQYhsTI/2CCxVGqZG4y11zxXgXFFfH5mA7ExKwu
         cCZNoIcAfKjZNawQ+q+5mxXNu3tCNSV6jF9R21BX7tsHAwGUxc8uF7EjZ3DJjnNsILRg
         /80vFT76I/E/4Z5efVS/UeLLFqZF+WrQt3SONUoTxoTRYzNkFYG+3FOGsZE44WNUXRjS
         amog==
X-Gm-Message-State: AOJu0YyVft+rCDDLXfdAaOS9duszkRNvO4oHh7bZHE78cbsDfZImdz91
	7joB9/LlKnH9cklodHXVVDWMht1Ln+4w4u38donjWNeg+/MwDenyvBpwjJFrv5eF2xrcB14tJg7
	AgUZLiyYf5RV504IkqgOT561+mVswHGQ=
X-Gm-Gg: ATEYQzzXn0NwjJgikws3IqJQcwGEcnjtOOfBpWnaMujyNQN6KaXww8xcgFaHRh9YCW/
	EiFfSOm8Y/RyjwmYQDVhb0nnnaLzzrUvQsY3XM16aK2SngR54TBEvY9B5NHEJ84rpXngVfbmc4W
	cIe9pmIPVOr4Yw7oJ9WnkJW1PwGNzHrBfH5aczHQiBaN9yjQ/KrGthG8+Pi9xK08BKX+R9Tjaw8
	oBKAzzxYndpWQfZPoYR7DmTlRK5rNcTeWf7bXhD8WyJWs96LrON62Ywu4UxyRL4sCMwe6pK1Le7
	RQgudAxkbk5P1Ne4/cHaFflrDp0MHZXwoZdnTMRixqiQQLwGphgzddi6gWx6QA37Tqw83fMRAHc
	P2YA7sw==
X-Received: by 2002:a17:907:8d85:b0:b97:f1a8:ecb7 with SMTP id
 a640c23a62f3a-b982f20c0b2mr81117866b.25.1773968779976; Thu, 19 Mar 2026
 18:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <20260319220901.GD950375@killaraus.ideasonboard.com>
 <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com> <20260320005737.GE950244@killaraus.ideasonboard.com>
In-Reply-To: <20260320005737.GE950244@killaraus.ideasonboard.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 19 Mar 2026 18:06:07 -0700
X-Gm-Features: AaiRm53rx05Tqdc9FwzZoPf5XXpIJZUGAo0qoy3HNuWTkbHSxfZxEG9QI9aaaDs
Message-ID: <CAKxU2N81WEMkAPOVRHUORWodc21oW7wqvUJYVhd3uBJdLxRW4w@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-hardening@vger.kernel.org, 
	gustavoars@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 5:57=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Mar 19, 2026 at 05:11:22PM -0700, Rosen Penev wrote:
> > On Thu, Mar 19, 2026 at 3:09=E2=80=AFPM Laurent Pinchart wrote:
> > > On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:
> > > > Use a flexible arraay member to combine allocations.
> > > >
> > > > It looks like pipes never gets freed anywhere. Meaning this effecti=
vely
> > > > fixes a memory leak.
> > > >
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 11 ++++-----=
--
> > > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
> > > >  2 files changed, 6 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/=
drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > index 16392420903a..657ffecc4d7e 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > @@ -459,25 +459,21 @@ static const struct dev_pm_ops mxc_isi_pm_ops=
 =3D {
> > > >
> > > >  static int mxc_isi_probe(struct platform_device *pdev)
> > > >  {
> > > > +     const struct mxc_isi_plat_data *pdata;
> > > >       struct device *dev =3D &pdev->dev;
> > > >       struct mxc_isi_dev *isi;
> > > >       unsigned int dma_size;
> > > >       unsigned int i;
> > > >       int ret =3D 0;
> > > >
> > > > -     isi =3D devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
> > > > +     pdata =3D of_device_get_match_data(dev);
> > > > +     isi =3D devm_kzalloc(dev, struct_size(isi, pipes, pdata->num_=
channels), GFP_KERNEL);
> > > >       if (!isi)
> > > >               return -ENOMEM;
> > > >
> > > >       isi->dev =3D dev;
> > > >       platform_set_drvdata(pdev, isi);
> > > >
> > > > -     isi->pdata =3D of_device_get_match_data(dev);
> > >
> > > I'd keep
> > >
> > >         isi->pdata =3D pdata;
> > >
> > > here and not below.
> >
> > Sure
> >
> > > > -
> > > > -     isi->pipes =3D kzalloc_objs(isi->pipes[0], isi->pdata->num_ch=
annels);
> > >
> > > Wouldn't it be simpler to just replace this with devm_kcalloc() ?
> >
> > That would only make sense if pipes remained a pointer. A flex array
> > member allows combining allocations since it doesn't take up extra
> > space.
>
> Yes, I understand that. My point was that with devm_kzalloc() here you
> won't need to change the mxc_isi_dev structure. The leak fix will be a
> one-liner patch.
Leak fix is not the point of the patch to be fair.
>
> > Technically kzalloc_flex is simpler but I assume a devm version of
> > that will be handled in another treewide commit.
> > >
> > >         isi->pipes =3D devm_kcalloc(dev, isi->pdata->num_channels,
> > >                                   sizeof(isi->pipes[0]), GFP_KERNEL);
> > >
> > > No other change would be needed.
> >
> > With a flex array member, that's a compile time error, which I use as
> > a hint to complete the conversion.
> >
> > > > -     if (!isi->pipes)
> > > > -             return -ENOMEM;
> > > > -
> > > >       isi->num_clks =3D devm_clk_bulk_get_all(dev, &isi->clks);
> > > >       if (isi->num_clks < 0)
> > > >               return dev_err_probe(dev, isi->num_clks, "Failed to g=
et clocks\n");
> > > > @@ -487,6 +483,7 @@ static int mxc_isi_probe(struct platform_device=
 *pdev)
> > > >               return dev_err_probe(dev, PTR_ERR(isi->regs),
> > > >                                    "Failed to get ISI register map\=
n");
> > > >
> > > > +     isi->pdata =3D pdata;
> > > >       if (isi->pdata->gasket_ops) {
> > > >               isi->gasket =3D syscon_regmap_lookup_by_phandle(dev->=
of_node,
> > > >                                                             "fsl,bl=
k-ctrl");
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/=
drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > index 3cbd35305af0..99532efa4e41 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > @@ -286,7 +286,6 @@ struct mxc_isi_dev {
> > > >       struct regmap                   *gasket;
> > > >
> > > >       struct mxc_isi_crossbar         crossbar;
> > > > -     struct mxc_isi_pipe             *pipes;
> > > >       struct mxc_isi_m2m              m2m;
> > > >
> > > >       struct media_device             media_dev;
> > > > @@ -294,6 +293,8 @@ struct mxc_isi_dev {
> > > >       struct v4l2_async_notifier      notifier;
> > > >
> > > >       struct dentry                   *debugfs_root;
> > > > +
> > > > +     struct mxc_isi_pipe             pipes[];
> > > >  };
> > > >
> > > >  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
>
> --
> Regards,
>
> Laurent Pinchart
