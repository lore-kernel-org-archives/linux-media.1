Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19472E266C
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 16:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246269; cv=none; b=I2MOew8WHBo/pM+Wv/A+qNh03drQXFsewhZL9xLcM8R+N8kwGjirkyYSQSsOlAkeA1Fj0Iyj+lupMkreo9Dxu6WngWMWba34p4iaEUxosCz35xL9tU43g6AOZWHqomd8Z9dGxvwR9wVAfJ9ECgClU0xqNrrjSV/csBekZP1GrP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246269; c=relaxed/simple;
	bh=wyMPEHvT8e/M+GqCGNy1czl8whLL3CHaGifyoKChexM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjcFVKfATXKch6qZt8Ft8tPSHI7fu8pJgEDQWLBvqE/MMHRLy/f8e69Qis9bXJTtvuEFV+OQPH+/ruyuMcMofHU29sFHiHDA0FSeWhZYkSUo3njWwdcr3IaMhy9KVkLsCmVT5rR7y3MgHyUFLjN4gfr0WThigG8KrD+U/KLwy4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShxKEe5i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShxKEe5i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2371F00893
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780246267;
	bh=cle4Lm8eCkJyUbPSDsxDlvoL4NKCdhpSL1sM+5Y5rPQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ShxKEe5iwi9zfwQ3lChI+4y2crM7X2Yqe1HwYaHucAsGRbKB5V0o29xDjISPMJ6DC
	 yee6vdr65Gs5w9rxVojTWrWw0T+G92333THA5dtdxODMD6fGcV/UPKMZGeAB9r0d3q
	 4X5PLlRsF70a7ecLFECR8dEvVVBV2sjH+PLeC6SMimMMWGeVkCWmLrvNhpweZe6Ox1
	 c2IzR6dQbynnnFwm9DnDkxPO8D23aGZxGmrX0H/4Rsl2oUtkc1vndvmN1O8etPbL44
	 8lx7xzvw0S7I87DAckJxGrNUS/mDs97EUOjoIC5gdcsuDNxKB9H8MinptQNEujtw8M
	 GTMFdp0RrkNfA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3966388b388so14649941fa.1
        for <linux-media@vger.kernel.org>; Sun, 31 May 2026 09:51:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+DcQEVGjFz0bUXWaipV9OMZT+5X9L4YTs9W6BmOwF61eHk0hfJKBeOj5HpUEkcZ6Pt/IDIynKVY0g4xA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz51V09cI/Yr8OBfW+8mwN93uHQ8JctxEM21P51x9J5a38Zt68o
	drjd8/2Ct/+uNpY3syMhR6qHu24GsOk0e4wtkMp6V96NVfNPMg3HXH64YNS+ZeSabZmQs6Iy9C2
	ZwWvf3LSCDlY5RFFUZujjvfYOGrKbOwmxM4oqVN4RFg==
X-Received: by 2002:a05:651c:2229:b0:393:9cf1:78a with SMTP id
 38308e7fff4ca-39651e3ab64mr25663701fa.22.1780246266311; Sun, 31 May 2026
 09:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506082211.5624-1-bartosz.golaszewski@oss.qualcomm.com> <CAMRc=MeD3rDyGqqYC36FChx=SgDikPAXTr1i7-zMWnOnaK+xyg@mail.gmail.com>
In-Reply-To: <CAMRc=MeD3rDyGqqYC36FChx=SgDikPAXTr1i7-zMWnOnaK+xyg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Sun, 31 May 2026 18:50:53 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeXfApCLxhEmDind9pPRuzuTD5GHrzU8Ks1yecfqam8XQ@mail.gmail.com>
X-Gm-Features: AVHnY4L8gzJfm4s4B4U0pDKUyj1gzCXiRFuexEbrU1c5iA3KSgSCaLIWl7GnQJY
Message-ID: <CAMRc=MeXfApCLxhEmDind9pPRuzuTD5GHrzU8Ks1yecfqam8XQ@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: max96712: drop unneeded dependency on OF_GPIO
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 2:37=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, May 6, 2026 at 10:22=E2=80=AFAM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > OF_GPIO is selected automatically on all OF systems. Any symbols it
> > controls also provide stubs and are private to GPIOLIB anyway so there'=
s
> > really no reason to select it explicitly.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> > Changes in v3:
> > - Send the staging patch separately so that it can be picked up for v7.=
2
> > - Link to v2: https://patch.msgid.link/20260316-gpio-of-kconfig-v2-0-de=
2f4b00a0e4@oss.qualcomm.com
> >
> > Changes in v2:
> > - Make gpio-watchdog depend on OF && GPIOLIB
> > - Drop picked up patches
> > - Link to v1: https://patch.msgid.link/20260304-gpio-of-kconfig-v1-0-d5=
97916e79e7@oss.qualcomm.com
> >
> >  drivers/staging/media/max96712/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/m=
edia/max96712/Kconfig
> > index 117fadf81bd0..93a2d583e90d 100644
> > --- a/drivers/staging/media/max96712/Kconfig
> > +++ b/drivers/staging/media/max96712/Kconfig
> > @@ -2,7 +2,6 @@
> >  config VIDEO_MAX96712
> >         tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
> >         depends on I2C
> > -       depends on OF_GPIO
> >         depends on VIDEO_DEV
> >         select V4L2_FWNODE
> >         select VIDEO_V4L2_SUBDEV_API
> > --
> > 2.47.3
> >
>
> Gentle ping.
>
> Bart

Are there any objections to me queuing this through the GPIO tree for v7.2?

Bartosz
