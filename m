Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8214040A95A
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 08:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227638; cv=pass; b=WbrSS+MCc4XxO4o8EjC+9WRTMzdKYMQDvj/efAx+t5JSY9BI3HJIv7vIsFQ1aBUA+UI+AJaPpIvNPvU3xPW76pMtIPvUWCQDzk7enjXeeVBx4VtVQ8U4Y+7xwF//6D1GZoQItkNBsu5VGdSh+wF5mRml/tvdb56dAuhhunDhr/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227638; c=relaxed/simple;
	bh=YtmrCKtADQ4fHPN75XgParICAfAmcm0oRnfwN1pFzE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGgZ1wtxNvLx7QEGFJ5zjCaCDCctpiBwaC8m31q8TMXsa2uA4OFuTlzjo0naTyZznpIECUc+crfRI+aeOJ6yrT+CgDTO9Uq4VzWV6g+ymj0dNo/WeqJjAv8R1aOz5dv2TgtaaAB8MFrxybowjbolxaL+a+o64OrfwF3lHA5oiXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FOJv2Liz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=n5CCvscr; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FOJv2Liz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="n5CCvscr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785227632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HSX5wJ5Fq1JuTaJWcXA1vtvSdOWhTP9fZPdZwT2lanw=;
	b=FOJv2LizUDbRbJ3X1DvxNqh3gpzMf9lFvlFBI3xwPD0muwnnf1oehlUgR/D7mkRGR8cDFq
	OXBtYFix2OIaAtZvtfOIVoJALAHUHO5VFR+t8j7IWbbPrc+b+AtInTEhwQIs6wsjkCmpsf
	zIuElfW+jOWTVBDpv2ztPP5nS5/9rz0=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-3kuP8ETfOhmg5a-3SlaW9g-1; Tue, 28 Jul 2026 04:33:51 -0400
X-MC-Unique: 3kuP8ETfOhmg5a-3SlaW9g-1
X-Mimecast-MFC-AGG-ID: 3kuP8ETfOhmg5a-3SlaW9g_1785227630
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a516afd714so3735519eaf.3
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 01:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785227630; cv=none;
        d=google.com; s=arc-20260327;
        b=Qq+Ba+0Tazn6TUtiiX0D1N5oHE0yiVpew/0znDrfJMfFHvJTxrdFs10/DUqMoQCG7n
         GEPFMe1wNYcWPpd2yRA8bpg9dprPSID4NCeNOvhCchu4cnisXb/i6DwaznxZ4JKOZT12
         yK8ZGYbhvkh+nje/C7u8JOlnMS++g1xif0naa332mvh/x3fcyApt8gDbfM5ZXpzG2CZM
         AgqSAKwo9pEG/ct4Goja8gPJtmcbXsEEC76RWN1l3kfrvXyTRx4VN8CH1nvSlgYB5jqf
         MonLeuOMRTvIyM+sG+4BLexzhQ4LOCTMQlkIxuHurNIAKqCgPMGGPXrDIjwriZ9xI+pt
         esqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HSX5wJ5Fq1JuTaJWcXA1vtvSdOWhTP9fZPdZwT2lanw=;
        fh=ZgXQu5H0/8n5TpcdUzb1MQjMFO4AFcJmmvXXkABARQQ=;
        b=MNBBBsBvGVSCWG+0dZo3hVJgbNBOUm3lnT9DcTm9uhmHFzG0XJAvxLkS2gF9svjQm0
         Lnu/qUZXEOj6R9UhpehI31F2YmNKML8iUH2OA4/wkXUzRRnBNLjfUh9jgPuMNZiLoEE3
         pT6oFmY7GWoQwl48Ip29AgvDb6LU64Eb71bOpaSeMmpbtp3cewydrKrDbXOQ5/ve8zcR
         MDAUIKqs2sopGj+Ir6OFWCfMwMCirMqqrMpg160zoioJu8Gj7lPu2SmOyikSG2M5vOoz
         ldfvvKoaQC4CFuHSWLb83Ji509Vj3IT4fFK1b5Hmyi/xup+ASb2GjxSAJnQLTKAp5pHg
         Mviw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785227630; x=1785832430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HSX5wJ5Fq1JuTaJWcXA1vtvSdOWhTP9fZPdZwT2lanw=;
        b=n5CCvscrqik2H4W0mFVhd+bZquNMpKRBtm7THSLWIFQmjd3uMLt297fbN//ZCHjJrZ
         5Ps1lnhLOuyHrFXhEkvWLgjS9VvLlzjC0/IlnSiTCy2r8mOtsF2KHgPfXDHT2T6ZdcWX
         SOUMcG/zUz2hb8PddRHbOyBxNePfi62GXST9h6tXapBm+1L00K7m3BSXIfZA/SYNovo3
         gBZe5ZHKp3ChUOjH2+7OGMu1kRohV65Ad4xqiRXxrifJfptCZ1tiIy5/fU6zUT/0uqYx
         s6R8130JDCODEG1XqTVm/11mC3psDbToUEsLhioPSsFguAIx+RtZWQ7icVubw/dK927Z
         DGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227630; x=1785832430;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSX5wJ5Fq1JuTaJWcXA1vtvSdOWhTP9fZPdZwT2lanw=;
        b=JlCUDX/5zKWIcBMDXo7zhAi/RzkB/0Gb2EPXnl6du/Bh/Up2PqlqXJolQm8yagPo4I
         4eYFhUfMX0Q+CUKjueDflfVVQVMOaoRh/qZ9/JamremajpHsH9Mj07dkFyPMbsfgfPVu
         c8nevu5thdP5ye3uDkKyEY5dBJghIOXuw5OiBNRx3TXA+XqAgvzpiylUx9UbO3UejaAN
         6JTdyXOY/3dIkDvJSzDpUcTVoYycyDMzEk4ufr0jIxLaP9XGdsPv3iYWU5KBFl4fu/yW
         tuuXMIX95jC4L2OwqTY2JzxpHDxOyNn60eCWrrygmnvyWU3671NR7d8unGdjvyLnTayI
         rvMw==
X-Forwarded-Encrypted: i=1; AHgh+Rpv2ZHDho6yXHrPZbdX4leY/YJR42nwuoqxVJCt533vbDLRjcdGToAORmYWaWpFzjjwHig+SUO4NrDjJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyo9YNmsgQGy1nrKZx8qbwniiy+sJpx7ibKNvCle/cYVyW7umh
	as0cGjgbtDheX1TwILKnT4AMkzWthOUeh0ZhZqU2CpPcMT5kbkGBlczj1DMD3D1SLrwchKxjvyo
	l00JikeTCKtTCoHYybZrg3Om+BcW1v49Y8CIDlh+SHcGtPrvM9jtlgmGPLCIMU59OkSExgjdetl
	0s9JfrABnwtPIOByIk7V3+fy0NCui+TN+b2YotsQI=
X-Gm-Gg: AR+sD11VWnyTyinKbPLwcPjo24v5rRYHO9FObGfu6X16OjKEYqDJg4Jp6PxrjxKBVEv
	wX82Zv+m0NSAysN2PR765NG6mSrD22WN6op8GcmdQykBtfBExY0LOz9aG4XZHLifty+E9aOYbkg
	Izd3Qtc8x/RfDp2i4hsQy2GIRhe4mopN+HbJg8xBwv+ClpuFsKpdggCABR
X-Received: by 2002:a05:6820:80c2:b0:6a3:77b8:7115 with SMTP id 006d021491bc7-6ac96cacae6mr810205eaf.53.1785227630109;
        Tue, 28 Jul 2026 01:33:50 -0700 (PDT)
X-Received: by 2002:a05:6820:80c2:b0:6a3:77b8:7115 with SMTP id
 006d021491bc7-6ac96cacae6mr810191eaf.53.1785227629684; Tue, 28 Jul 2026
 01:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728042013.23707-1-hpa@redhat.com> <178521646078.4139729.8353081240992310969@freya>
 <CAEth8oHn7MqqZ1hN5EYazdiVmHPm8TToo07KfR8f0Rikm59ztQ@mail.gmail.com> <amhfibBuw6N0usWl@kekkonen.localdomain>
In-Reply-To: <amhfibBuw6N0usWl@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 28 Jul 2026 16:33:38 +0800
X-Gm-Features: AUfX_myu-AYIMw21L3VkZ7uMVH1M9DZ5Rrzj-yI623_Nx0qoxnLc0ZiboQNdr8U
Message-ID: <CAEth8oEhDR_2UqNiiW2EaUYGGeR9NbkFWidQBXB0Hc+m4sbTbQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx471: Add line length PCK setting
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Tue, Jul 28, 2026 at 3:51=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> On Tue, Jul 28, 2026 at 02:54:49PM +0800, Kate Hsuan wrote:
> > Hi Jai,
> >
> > Thank you for the review.
> >
> > On Tue, Jul 28, 2026 at 1:27=E2=80=AFPM Jai Luthra <jai.luthra@ideasonb=
oard.com> wrote:
> > >
> > > Hi Kate,
> > >
> > > Thank you for the patch.
> > >
> > > Quoting Kate Hsuan (2026-07-28 09:50:13)
> > > > Add the line length PCK setting to the IMX471 driver. This paramete=
r
> > > > determines the horizontal line scan duration and is used for
> > > > controlling the frame rate.
> > > >
> > > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > > > ---
> > > >  drivers/media/i2c/imx471.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.=
c
> > > > index 6d358b11e96d..e661f5b78dcc 100644
> > > > --- a/drivers/media/i2c/imx471.c
> > > > +++ b/drivers/media/i2c/imx471.c
> > > > @@ -91,6 +91,7 @@
> > > >  #define IMX471_CSI_2_LANE_MODE                 1
> > > >  #define IMX471_CSI_4_LANE_MODE                 3
> > > >
> > > > +#define IMX471_REG_LINE_LENGTH_PCK             CCI_REG16(0x0342)
> > > >  #define IMX471_REG_X_ADD_STA                   CCI_REG16(0x0344)
> > > >  #define IMX471_REG_Y_ADD_STA                   CCI_REG16(0x0346)
> > > >  #define IMX471_REG_X_ADD_END                   CCI_REG16(0x0348)
> > > > @@ -240,6 +241,7 @@ static const struct cci_reg_sequence mode_1928x=
1088_regs[] =3D {
> > > >         { CCI_REG8(0x030d), 0x02 },
> > > >         { CCI_REG8(0x030e), 0x00 },
> > > >         { CCI_REG8(0x030f), 0x53 },
> > > > +       { IMX471_REG_LINE_LENGTH_PCK, 5008 },
> > >
> > > This does not match the mode->llp value (2328) used for 1928x1088, an=
y idea
> > > why?
> >
> > I tried to resolve the horizontal line pattern on the moving objects
> > when the sensor runs with libcamera. (The image is better for 0.7.2
> > and more horizontal noise for 0.7.1)
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2502786
> > I guess the horizontal line pattern can be mitigated by reducing the
> > frame rate. (image is better but the issue still happens.) I'm trying
> > to figure out if the root cause is in the driver or SoftISP.
> > If this is not the right direction for the solution, this patch can be
> > drop. I'll try another way to resolve it.
>
> My guess is that there's something wrong with the sensor configuration if
> there are obvious systematic image defects that don't exist on other
> sensor, given the same SoftISP. Something to check indeed is the horizont=
al
> blanking as you've already found out. Very likely the other parameters su=
ch
> as vertical blanking could still be changed without affecting the issue.

Good suggestion. I'll try to tune vblank and possible configs and hope it w=
orks.
I scratched my head trying to find the solutions and now I can focus
on tuning the parameter to fix the issue.

>
> >
> > >
> > > Aside from the patch, I also see that the value for the PIXEL_RATE co=
ntrol
> > > is derived using the link-frequency and output bit-depth.
> > >
> > > It is likely that the sensor's frame rate depends solely on the LLP a=
nd FLL
> > > timing registers, so it should be possible to derive a constant pixel=
 rate
> > > value (for a given PLL configuration) that is independent of link-fre=
q and
> > > bit-depth.
> > The datasheet mentioned the the link frequency determines the pixel
> > rate so that is why pixel rate is based on link frequency.
>
> The PIXEL_RATE control refers to the pixel read rate in the pixel array a=
nd
> configurations where pixel rate on the CSI-2 bus differs from that are
> possible on all but the most trivial sensors (typically VGA).
>
> In this case the PLL configuration could be used to find the actual
> PIXEL_RATE (on the pixel array) as Jai mentioned.

Got it. I'll try to find a pixel rate based on the PLL settings.
Perhaps that can resolve the issue.

Thank you :)

>
> --
> Regards,
>
> Sakari Ailus
>


--=20
BR,
Kate

