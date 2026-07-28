Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D623BF695
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221708; cv=pass; b=aqKCQVz+iPfJ6kvjmm3Zvg9YWlvdAhcw7SCv47aN+HU0JIic3HdEA5YbfF0Tj9tl61YNM55OfY90mVOX7dAqS8Hq4qG1zwno6RSGtyJBO3dH1XYm420wAAA/sCqvlNJPg6tklqqBJ3LiN5aOA2TzWS9H8gd49DANQOdA5BiezE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221708; c=relaxed/simple;
	bh=WOODzCzK2OcJcvIHFjQN+VZt0dFaCVQ+Nmt/TDhQCZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTPg8bOmKgGEGTOVum85zEWUHbKx0ImffyGgWcn/1sKKBPLnEHq3jVZEd11+84Rp1D45hKrUPews4pRgG/Pf3tkuXC1ICa4AxwX5/rG5IBt2SoEDG0zTnn6UWASpHrZ1uaHShxgYyAE9YLY3Du8mM5sIPYq6dJuUw9UbpF+3CCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pz/vQu9B; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ed/CGDfd; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pz/vQu9B";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ed/CGDfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785221705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=13nm4rejPjHCBZBwe+lnnmmF3eK9JYyEjUkRCijGENs=;
	b=Pz/vQu9B1nhOX/IjtBexruJmR92fjBM8LDPzSkH+NVPrK0/IqCKw0o3oH544YH1mRwM2eh
	RF94PF2ctI+vWGN9ArjmZWS8TsHDttwSDdIHYU7r0fyGxc6EDVxtGW3zrxAPREP1ddiNFz
	Zn2tZpjX7c7nsmEt3kBk3foRH32lO0A=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-sK2BXNIFMniR6v8_eG-EsQ-1; Tue, 28 Jul 2026 02:55:03 -0400
X-MC-Unique: sK2BXNIFMniR6v8_eG-EsQ-1
X-Mimecast-MFC-AGG-ID: sK2BXNIFMniR6v8_eG-EsQ_1785221703
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-455d6f14efeso1801689fac.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 23:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785221703; cv=none;
        d=google.com; s=arc-20260327;
        b=qt2Tkyszz7c2ZqMiz2ORcMtE09qeRDJ7kj7GxnUGh3wpZQfUY/SqZ5sz6YJQDyS8Rs
         3f9w3a7I5DK6ssVKZpJ1B0SAgz907Ee5TpnCH3uMkoSbBA73W0RmTyn0FYkWz+FbEye5
         L2jTbo+nSsRI2jP67efp2BMX2+mULoiCQ3rYI7uF9mumO7UGt+ZVoO5Agwi2U6YDLybR
         /tRnCF+wp1GlM2UQ1CL7ZtY6pwBsMl4uZsf9aPwbYH0ykljINllRtAFkLJ5mJZF1/IX5
         EFb2dv+i/AEz6DDENkPsnn7TuLA+39eQc2gCLg6hqJPfflfttyA5n1EPOj/22TgEobA2
         6IcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=13nm4rejPjHCBZBwe+lnnmmF3eK9JYyEjUkRCijGENs=;
        fh=XGahRX3iXqyHEaW7SZvV7x6MSZniqG1vsBtZFKxuY6U=;
        b=SdW3GgSxPj0W8JdWJ7LMQstZLXYZ5CbnB4BONk6RjKMmVyN+fDH0KZ4UjVbKIV0A02
         lrNomRAuSN1s73KmM8cXbcj8UKkFVWUx7dF/rMbPrzT2szIFTivGWSGYu+ZGtqtZSCGB
         k3V8MTbkr6iS+861hpVgRKvAz6k8c/sQTc/oQWd72x0xOyR0eXyTSTogLbrDp4PwpQ1T
         f1BG4o7NWBp1rpnn04uMD4w9CQFFrkgYuY2R6DK5VAetjHRUlgm6q3qvSCloOsA63tuz
         Di+eYE59C4oJ88JxfB6E1Oun42FpB4jO4M3m1E9FuvzJhrUJsR3N1TCYkZCo4J2dB+WL
         rclw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785221703; x=1785826503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=13nm4rejPjHCBZBwe+lnnmmF3eK9JYyEjUkRCijGENs=;
        b=ed/CGDfdrfJPMv8MYbRKwx1rKlaNrcIH9KC4B34i2TbKsW2AZ75pVaumqPuY27RYfW
         8w3cMfScNMvl7hUoeJdOomt6dc4n4ZlRl1qDaH9yruidVoYTsvebNDybzh9uOr8M1cgj
         10Lorxgz1OW5tiLK5iY3xNiMyFTRz8pF93Mdpv2mK5ft5gQkhy6bK+07uxcw/M5mbsBU
         ja13SVXQknN7e+d1t63spZbhgk3bnl0rINznA27bzfYOlEgkPyW4eI9KEBQF4BRecA6G
         iJtpaUiLPu/kGDWiZ8Ge3/KhVxrUyK7Zd9r9EdH1WgsfArtNbT38zz+BbS/cGflKlYKv
         g63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785221703; x=1785826503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13nm4rejPjHCBZBwe+lnnmmF3eK9JYyEjUkRCijGENs=;
        b=bqi1EORCNklBLFXXOJS+4tPVRAMdI+vwnICsuypBxSVv16/8GJBFPwhyG8/ok1Govr
         n1jW6PovTXObdkua7YYeV8OcLyb9tVkQG7KmlhQifVN0ncuVqZEvZqrnHt6+xvpQnfjW
         s31E6QMWOiLIuYsAKtKKIHCmIxk/VWnxBNmewmnEZ2R/I/ZkMP7VbrNAOo1bJOg4Ygr8
         HJgfpmvuvookmqBxYPBEvI5e5PhgsrHmWCUADARA9M4uM0DrchR6z1YdULLNBdsEPFMf
         59GOof0T+IpC52ewigbaIsmqMTCdyAPMnxAOmZgrSdJwJLikLnCvYsdktqUgApCKBqFa
         XPHA==
X-Forwarded-Encrypted: i=1; AHgh+RrAU8rQAazQr1t/Gp+SSLpxu/zJcTtAZLOHJOFOWg1Z8SPM1e6FnuuMgazeladwZVV2TfoNSfnwCp64fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTW9V4qKFq6jYPzDJdpWS2yn4WMo2hug9MfZNXwf/iVUPwQG68
	RuaBWYXex2rYK7jkl0Z7UCqDhhkbktvBEauRa2Z3aXYCFQjiDsDNgltuzURY0MJ5kP5/EYxlTdG
	mTb00fn3byNcJqNqe7DGTWLopyf097qoqjIz1l+K3iPCasPQoSnSj7AgS+E/yOFExE02uK6jiWx
	CdkYlO74doJ97iwkn50dDlLE1DX4dGWgmDf/xMQGs=
X-Gm-Gg: AR+sD134PAupV5DSBhKSPiL5MgVjcOPLLSr06RawOgNPu9HJZ4lHB9c03E8k6aJpX53
	Y1AbGDaVuHDIdRR4OKtWkQ62ZK4A0NQhBDLygiEq63D6cMAkXXyvCUaWMOZytXrUp75P/te+Ryb
	fMUHSrN+JuZN0nrG1JaS7bWCLWj927mWpxneAVAw6bfYcXmiKaw7SlmjfO
X-Received: by 2002:a05:6820:1614:b0:6a1:4ffe:ed1f with SMTP id 006d021491bc7-6ac96972401mr720143eaf.1.1785221702942;
        Mon, 27 Jul 2026 23:55:02 -0700 (PDT)
X-Received: by 2002:a05:6820:1614:b0:6a1:4ffe:ed1f with SMTP id
 006d021491bc7-6ac96972401mr720136eaf.1.1785221702545; Mon, 27 Jul 2026
 23:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728042013.23707-1-hpa@redhat.com> <178521646078.4139729.8353081240992310969@freya>
In-Reply-To: <178521646078.4139729.8353081240992310969@freya>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 28 Jul 2026 14:54:49 +0800
X-Gm-Features: AUfX_mzwi0p6n8PmQtHU9XfQ4-_Z64lqq-HyUHdtbDMc4qcqqYIK_bgr98otu9Q
Message-ID: <CAEth8oHn7MqqZ1hN5EYazdiVmHPm8TToo07KfR8f0Rikm59ztQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx471: Add line length PCK setting
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh <serin.yeh@intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jai,

Thank you for the review.

On Tue, Jul 28, 2026 at 1:27=E2=80=AFPM Jai Luthra <jai.luthra@ideasonboard=
.com> wrote:
>
> Hi Kate,
>
> Thank you for the patch.
>
> Quoting Kate Hsuan (2026-07-28 09:50:13)
> > Add the line length PCK setting to the IMX471 driver. This parameter
> > determines the horizontal line scan duration and is used for
> > controlling the frame rate.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  drivers/media/i2c/imx471.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> > index 6d358b11e96d..e661f5b78dcc 100644
> > --- a/drivers/media/i2c/imx471.c
> > +++ b/drivers/media/i2c/imx471.c
> > @@ -91,6 +91,7 @@
> >  #define IMX471_CSI_2_LANE_MODE                 1
> >  #define IMX471_CSI_4_LANE_MODE                 3
> >
> > +#define IMX471_REG_LINE_LENGTH_PCK             CCI_REG16(0x0342)
> >  #define IMX471_REG_X_ADD_STA                   CCI_REG16(0x0344)
> >  #define IMX471_REG_Y_ADD_STA                   CCI_REG16(0x0346)
> >  #define IMX471_REG_X_ADD_END                   CCI_REG16(0x0348)
> > @@ -240,6 +241,7 @@ static const struct cci_reg_sequence mode_1928x1088=
_regs[] =3D {
> >         { CCI_REG8(0x030d), 0x02 },
> >         { CCI_REG8(0x030e), 0x00 },
> >         { CCI_REG8(0x030f), 0x53 },
> > +       { IMX471_REG_LINE_LENGTH_PCK, 5008 },
>
> This does not match the mode->llp value (2328) used for 1928x1088, any id=
ea
> why?

I tried to resolve the horizontal line pattern on the moving objects
when the sensor runs with libcamera. (The image is better for 0.7.2
and more horizontal noise for 0.7.1)
https://bugzilla.redhat.com/show_bug.cgi?id=3D2502786
I guess the horizontal line pattern can be mitigated by reducing the
frame rate. (image is better but the issue still happens.) I'm trying
to figure out if the root cause is in the driver or SoftISP.
If this is not the right direction for the solution, this patch can be
drop. I'll try another way to resolve it.

>
> Aside from the patch, I also see that the value for the PIXEL_RATE contro=
l
> is derived using the link-frequency and output bit-depth.
>
> It is likely that the sensor's frame rate depends solely on the LLP and F=
LL
> timing registers, so it should be possible to derive a constant pixel rat=
e
> value (for a given PLL configuration) that is independent of link-freq an=
d
> bit-depth.
The datasheet mentioned the the link frequency determines the pixel
rate so that is why pixel rate is based on link frequency.



>
> Thanks,
>     Jai
>
> >         { IMX471_REG_PLL_MULT_DRIV, IMX471_PLL_DUAL },
> >         { CCI_REG8(0x3f4c), 0x81 },
> >         { CCI_REG8(0x3f4d), 0x81 },
> > --
> > 2.55.0
> >
> >
>


--=20
BR,
Kate

