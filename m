Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3693B1EF2
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511509; cv=pass; b=Y33CLIdQBKnBefdSCU2td/4wo8AtrTWjOoixqwOLBY5VfcILj7hCUba93EZQTXU0eO9ACQJWFdFGWABenI2sCyRVL2+xALupyMMZVwe8WxqKXloVAUSbiqH35whcZ2bsLMD89j2MSkhO/Q2LVbffwsR10vtuOX4Q2WGqCdqjwVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511509; c=relaxed/simple;
	bh=ddWQm3AZ6cvQ44lJc0rMjwwvQelTHxTzDdlLxm7fDVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sz/Batkr0U6IkO65I62NJdkfEXoI0pDa+gRbGAqChI6WARbw/rtxC57UrsUpAVuNf2M5p+ANDoC+hWKB7qudxa9E2y7c+OgTWvbQqAZjB2gRdtsxurnUAy2iMT8iLnrf1FfTT9J8XZXr/AduOyQjyVQ7kUvL1VpnyMo66QwLjTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hEJ7tXIo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OHq3BLB2; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hEJ7tXIo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OHq3BLB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788511506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5hWDcK1vRIq8wGKAJgDKooIThOZ4ktEKyx/Je8y3ptg=;
	b=hEJ7tXIoyHQC+/qdw9Ss1JUVsMBqkfA0a4hQFxAkypSVbxJjiSkOUGqi7xzoVswM50xoXz
	TRqHllIh+H0vK6UjGI05oh8GFJ3+y4QzVW18CeuJG1c704rO2dniz429yqiwO3PvevLqc8
	Jo7xUkwmz1S+H6fST01RogD6u333qCQ=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-LoTMZt17N9CuS0bS1oTo7Q-1; Fri, 04 Sep 2026 04:45:04 -0400
X-MC-Unique: LoTMZt17N9CuS0bS1oTo7Q-1
X-Mimecast-MFC-AGG-ID: LoTMZt17N9CuS0bS1oTo7Q_1788511504
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b19eab8bso458089eaf.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 01:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788511504; cv=none;
        d=google.com; s=arc-20260327;
        b=mYmOVl0mUY+ArulPRmiMk8WMrPaf6m3kFdmdkocPfvHVUNWAJBBlm6OFfM8GZir2SC
         1gV6GXyxE9xvon02bd0y4WfHewkAFdE+AQk4yIxVgaqLF7oomxTskrfABQGSkSbiazE3
         rp0hmb6M2KKT1Y7n+f0aAn6iOfm3C2q+WKZqn60TgpEIvAXjOo/mYUVhQfecx6AUezcg
         pc8CHjsapFcNKYp5N9Y5aJVNlh395kZzyvt6l+h+dc19OYeZmBFAEv4m3Tv7DTIQO0F9
         NENKGf1hefn6hCKYSH3C2MOQ6Vu1GVLwEw742JFlcXy5UeMZ8LaikN/IlFuQzVlvnrVA
         LfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5hWDcK1vRIq8wGKAJgDKooIThOZ4ktEKyx/Je8y3ptg=;
        fh=eBNUDdJS+dMh59LOuIDayCUwOOPIXfgOiEgtMXlkdm4=;
        b=CPxwbv2oTHSxoKW9wbvwtuRATK5h+EvMyEi0lkldz5ZCQHfs5wtVcSuFnv9enVwVl5
         WEyQfDUxjKjCjzMxnq1AzsOjpW7R80qivQ8AJnVgZnHgNb/CUzQ2WsuD/UOneswOr54M
         C4wBPwpgWZhTm0v61wthth75ty+gN4kMIAUyRGe9quo6RMDu1bW7SGTfFf0X1bwf9S4m
         IRVF06Ftzxc92i9Je9qLOmMtgyICEAFSOD5qKjmOr2sD1sb76ArcJOM9avD00uNndG8Z
         g5Xe5lbpO8jrJfEJ4sZJWeNx4RklckW1yqaQTTjv+iuiwSDkzDbt5yvzgHE560Bedmjj
         Nk+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788511504; x=1789116304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5hWDcK1vRIq8wGKAJgDKooIThOZ4ktEKyx/Je8y3ptg=;
        b=OHq3BLB271y1jwP3b0ndufgr7TNvfUJRhjRvUJtosBavzp4H3EnvaTWaTVaNj0QGVU
         QPGrYH6sMFqC8aMe78wydXChgzhUWYC9YMo9XT6hss52aXFnX0hOddzkpwIKusXeEIho
         pMqklrdYX725vRVFRiqQE/VsOQA4xKFL4OQSKOwrepe50LRypCtcK0ismEzxo2VbHlDb
         o5McWZ0MvCr84UjS/MFTr3HrwImPkiTWO/n6F+EgCS7sFb2e3mPbLE4uHQS8r7r7P0BJ
         985x90yoOjZC/jCtnPB40nOeFMfqXYP78GnZ9FgFfELPH5pUvSURAey1x3c6NdglpSfk
         j1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511504; x=1789116304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hWDcK1vRIq8wGKAJgDKooIThOZ4ktEKyx/Je8y3ptg=;
        b=diggh1xdI5ByWAU/T/UH/Iwpuq/9bvcXk0Xzsq8AOz757GJ/LehUDKO9C5e6npXOP9
         bYFchxqHW/ISXW6IIDjxwaXGYaa/QX2KkuXXqReKhlSeXkHWdC7WBSH2YliHM1k+iAz5
         nR8tJrvbWGZ1fnwtxx9hrL3E04XvL4IH6zag3B4UNDWhrMKl2dePozFzAAj6qLZSJgow
         fKC5L7CEKgbbP1gPZnVR5Q+Egxmy4NW8K/DXke52IuxRowE7D1l53ld9HrOqXK0m9BQE
         PBBYtvgMGzYuBh01F35nNtVGpTQW7n3PU5Z8Ckr7pSBBqJb7ROZeWYfII9lrXmiqh1Jn
         RwrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwu1SbUWuWXYSiZk/67svseVVrAoyeb1u+V3uKFQsBsOutwa7FWtyRpCJEF8Iih3rV7hScfo87ohP46BQ==@vger.kernel.org
X-Gm-Message-State: AFuF++myw5V4xZ2uMyygSrFLR9kmFfSxrjvyVwEjEQKxKAqkd4tVmTH7
	pnjTPAumL78pkcsuHebSKFUPdF2QrXu6fnJ3XhiLpblOfJzFyckljNfqf755qdImpIVeE0NCM+0
	5O/4mg5YhQe0wXT6PRZF7yNC+B5bgHTrEpTm+rMPsGdXsq1Sw+x5IJfKDOJwBbRX28bYaYzZjak
	uZZOebaiK1aEytnsu75lwM4rdDUh26QwdPKCm7dCw=
X-Gm-Gg: AYBFou2qqYbA6bmdf/7HIPF/RfoEHtP8UrhmvnZ10OD2VtRfOhRPWrzUoLh9hbZVZdB
	J6FnLNI6iplpPp+Jc7w347jQObKLVFVA2+q5ScoOJ3u+9FUQ8oDOehFoo7kQ8fVHhy2bkIOyQrz
	UQTl9jovMhp3njT6zJuLv82mHWNIe4SlhmGNIZROGNZuHu3N5wljTtw4O7
X-Received: by 2002:a05:6820:16a2:b0:6b1:4280:9e18 with SMTP id 006d021491bc7-6b6fb8d26c1mr3436183eaf.13.1788511504175;
        Fri, 04 Sep 2026 01:45:04 -0700 (PDT)
X-Received: by 2002:a05:6820:16a2:b0:6b1:4280:9e18 with SMTP id
 006d021491bc7-6b6fb8d26c1mr3436163eaf.13.1788511503655; Fri, 04 Sep 2026
 01:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904075113.125751-1-hpa@redhat.com> <20260904075113.125751-2-hpa@redhat.com>
 <app-yOyzA32vQE7e@valkosipuli.retiisi.eu> <apqCH5zmpHdgr7cT@valkosipuli.retiisi.eu>
In-Reply-To: <apqCH5zmpHdgr7cT@valkosipuli.retiisi.eu>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 4 Sep 2026 16:44:50 +0800
X-Gm-Features: AcwNN1XTYKXi-Mg7NPCpn9KaqgTU2gMB3DRT1LOh7pBu5pPrgKf8OCjGK4zxtSc
Message-ID: <CAEth8oGi2funBOGaG71SpyGoSnPbvxuobmWV+Ay3Hqc46PM+vg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: i2c: imx471: Add line length PCK setting
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Thank you for reviewing this.

On Fri, Sep 4, 2026 at 4:32=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.fi> w=
rote:
>
> On Fri, Sep 04, 2026 at 11:18:16AM +0300, Sakari Ailus wrote:
> > Hi Kate,
> >
> > On Fri, Sep 04, 2026 at 03:51:11PM +0800, Kate Hsuan wrote:
> > > Add the line length PCK setting to the IMX471 driver. This parameter
> > > determines the horizontal line scan duration and is used to calculate
> > > and control the sensor frame rate.
> > > Set the line length PCK value to 0x0a00 (matching the original value
> > > in ipu6-drivers), which maintains a frame rate close to the datasheet
> > > spec (~150 FPS in 2328x1304 binning mode).
> >
> > This fits on fewer lines, please rewrap.
Okay

> >
> > >
> > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > > ---
> > >  drivers/media/i2c/imx471.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> > > index 4053aed84340..3c939f2a9056 100644
> > > --- a/drivers/media/i2c/imx471.c
> > > +++ b/drivers/media/i2c/imx471.c
> > > @@ -91,6 +91,7 @@
> > >  #define IMX471_CSI_2_LANE_MODE                     1
> > >  #define IMX471_CSI_4_LANE_MODE                     3
> > >
> > > +#define IMX471_REG_LINE_LENGTH_PCK         CCI_REG16(0x0342)
> > >  #define IMX471_REG_X_ADD_STA                       CCI_REG16(0x0344)
> > >  #define IMX471_REG_Y_ADD_STA                       CCI_REG16(0x0346)
> > >  #define IMX471_REG_X_ADD_END                       CCI_REG16(0x0348)
> > > @@ -240,6 +241,7 @@ static const struct cci_reg_sequence mode_1928x10=
88_regs[] =3D {
> > >     { CCI_REG8(0x030d), 0x02 },
> > >     { CCI_REG8(0x030e), 0x00 },
> > >     { CCI_REG8(0x030f), 0x53 },
> > > +   { IMX471_REG_LINE_LENGTH_PCK, 2560 },
> >
> > The register definition is nice but there's already a control for this.
> > Could you do this via s_ctrl()?
okay. I'll update the value when set V4L2_CID_HBLANK.

The original driver in the ipu6-drivers sets this register with 2560
and I found that a larger value slows down the fps. I try to make the
fps close to the datasheet.

> >
> > There's also another set addressing related issues here
> > <URL:https://lore.kernel.org/linux-media/20260904075113.125751-1-hpa@re=
dhat.com/T/#t>.
>
> Wrong URL, I meant this one
> <URL:https://patchwork.linuxtv.org/project/linux-media/patch/ede568ada430=
4d2dc92cd43986fc07aa68628154.1788377269.git.christian@themurphys.eu/>.
It's ok :)
Ah yes, I noticed that. We can discuss the pixel rate there.

>
> --
> Sakari Ailus
>


--=20
BR,
Kate

