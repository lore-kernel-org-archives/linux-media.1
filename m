Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CE949EC4A
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 11:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436568; cv=pass; b=Iby2uZcIAhrzc0/0vmANufJz7MyJ6EcSST5Wk8U2ML064CcsUQBJdmPdXVYoqQv0tccwehpkn/ag0Nhb82g3KbZdKY7WuzE+VbfGY7LrNhJLv82z/ECe1pzHAjRWt2ymTJqKFdN9ZeEKCbZCjwBHbX9Z9ouGeBWmCa2scC4SGb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436568; c=relaxed/simple;
	bh=Z8f1lYw8YSAp0NXR2PLP/QCz31/oSQWmPuMnoePqCp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfnFLLryzO4LMIJErtJAhp7gpsmI6j7xogWLhVjS05qGhGNHY0R9TjAud7oPlzlsuuFJM4Ap5WohZtvwRzMB4rU25aGwlpJeOvxvusjj4zvI1df0ETdATViQDEcpuImDHRZQoMBcaJrBRZaiDwWxzXUYoVVezcWqTARGXdQROTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fsxi3i+y; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fsxi3i+y"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f5934ba2a5so1027240a34.3
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 04:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788436560; cv=none;
        d=google.com; s=arc-20260327;
        b=Qrnu6DqWCVpFg9SXqqpz81FG8WghrjLOItWrnet658w6DhaaaFuDkFdMfRZKfB6PgB
         OFhXcvgAobGlT7N5leOLzB1g7kfO4XDKhO7Zh7OWcGHj+L81atOkMo7x6DC9FyD6jtBV
         5Vx2re6fHoHsvXzMcVmvm3uFntE6YHZpqEFez7jzGSPrqQneIEKz5ZGMl4zFzse6sGW4
         jQjBbdZnCN4yeV20dqSq+ae2bNfwpl450wfXdRqRlTAF7nlrAZJADiY6q7feo4ToMEcx
         Cly1ZUiYVaOJToAsGhRNG1t9Cm0KIZd96W3gMUD6PXqDFdA5RDnYBgZ3U/l0vNsx+1mf
         7v8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NYEZxpw9sUDkB/b/BTLw+VA6simRyFgSBVC6L/2gbWM=;
        fh=bwpohx+QL3h4cRnGt/0yWj1YLTCQMWzaIH2lvOWvfYs=;
        b=YjDhUNZ5XRpJrSTYIBtsG1oEhm0mFyuvmXDhfSYo06Kq/rGyeEc+mePshKF5u5jZK+
         33rOqTY/TiDSE91l+ghO8JbG4ZMQPeZOi9gb+P6mFTPnmj21jkD+MMCp1Gpkz0SwdYYa
         I9uutKnZI1PNCiSRxWR1pEYyXs5MkRP+QacpOfKdjM8wMySCtcrDQLuSluceEJ+aCcDO
         eQnRm8hafTNOF6fnpTjBwiTcAOlzHGceKsv186jyvTpLCS+r+GTo8dosZoQmUpQFkUtY
         WGpoylFav5kBZfxZBh+tQjGQtZmLpznnmIfABWz4o8Fi5z+6RiwhOTicFfpuaa6xMPqO
         MT8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1788436560; x=1789041360; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYEZxpw9sUDkB/b/BTLw+VA6simRyFgSBVC6L/2gbWM=;
        b=fsxi3i+yRr8FqwlIYmPiWBdxUTj4t2vpm6S8d8hSrVNvbyHQp+I3hqYPFxmCADmnhs
         ugGS+bbYfkhQBuUFzEx37prG1cZkB0pdWZXDy0gNrHXSwaFuDAeNYKDG+WIpmvP4POwH
         6QdeKASr7HWYWaS/wa/8y73UqfFy88Bbksb5MMBAv8UOTb4FWhCryOBW58yk7hu/zyFY
         f4kvYM47eeZ0FVyUTc/2I8HqeDcBkP8ErBcfGn1HFxdZSTAhsnWlQUQ9wDuT9ImVG4iH
         eGLHNqb573NOh1mnb1xhDd1u5B7anXc/hn6xu4o1oanwi9jamTNOib/mnt7TYToiuUuD
         Bwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436560; x=1789041360;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NYEZxpw9sUDkB/b/BTLw+VA6simRyFgSBVC6L/2gbWM=;
        b=sGJGvfcvo2qvqnnS4L9mToclVb269PYIyguDRZh5rlS9xfiMyFhvQUP6XcjAjFBrLg
         Kq25D57H3GFnRBs71OsBv0svD742aEbFuxqkKKbssUQhtG1st2QvnWxJJp3hbwPkOfph
         VPRxj9wH3RFS2jchDvdubOgH9SLZWmYrs2xSzKONmVotMgNfv9UZ2VhtN6m6M62ye7YZ
         mSn+VOO2niRajMrQqKrtSzRSJBmZtLDrxaQKLBO+0GhnSJ0e6xpJA0LK+HiBPrbY3Bgg
         kq7k1ZvB8CYvTAzHo+350PNv/k5clx6V8OwwkvczwFbCzgCa15AQMH6CQowoLcwdtUiT
         i1Hw==
X-Forwarded-Encrypted: i=1; AKwUvBwiHt+E/HCqIVNIicUuoo7y8NoXML8yFtMaxCNGAJBXvT1HiTsxWZ2cztlsIuOKlXVVHBsOTcoOlElMJA==@vger.kernel.org
X-Gm-Message-State: AFuF++kxAFpQArnQUCmRnYdV+zhWJ2cFvBK27OBDjCSt4NECcTcSR6LT
	U5akMG6KyXxkNujw/UQk1Huu1sdE5y1AZ560sBdyyI206GYNEU1MuQSBiUF7cN4wlYrmkwpsjhn
	G1EIGKHLZWR/5//eS+pZUseQmjBrei3G/BQG2WxbwHHsy+9tQj43ccrA=
X-Gm-Gg: AYBFou0lzx47n3fKifKgKup5A6bSfQ/K6Iq1IKf0/tebOSqQPpvzvCzY3N4hECd9aih
	py/O3EPYscEUDHleF0Jau973m5oYQq966q5qy5dAekJUCEvbTlo6Z1hX7conkUyqNUte2OmvZc+
	kOhyxgmql1YpFO6LuATR28Prw8V8rRT0slDVHtlsqZ9hJfqGRJWLbmt3AECXImLWLyApx/FhYKb
	ErAz0FG/Q7l7OmDT9+KmxCj4cCyIS3in176tZ6uqr35a8AvpjMS7591gMXzF8dZazmf2aBDh91u
	5IeO3OY/Sy3igbb10XTTlWcHqa2U3jAzIknO7jmx6dIqGynZ9A9H5aGIZPQoEhqfmGiHPALbnT7
	5wBv7KYU2J1ZhABiDLJn+6KD3DQ8TTmcA7WSRrw0+jtrl/5i4CZUUMvmrFcWZwdukcvpyv2P1+w
	==
X-Received: by 2002:a05:6830:258b:b0:7e9:cce4:803b with SMTP id
 46e09a7af769-7f78002427fmr11346560a34.8.1788436560160; Thu, 03 Sep 2026
 04:56:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com> <178840879109.11722.9212352209191978851@freya>
In-Reply-To: <178840879109.11722.9212352209191978851@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 3 Sep 2026 12:55:42 +0100
X-Gm-Features: AcwNN1ViaJDjIjQDa7Vs5xoi2HJS3rOgswfXSy4lZ1VLn3-O0UxK2SzpXn8uyrM
Message-ID: <CAPY8ntChzSsnbXcNi6rPhzWsrS-uL_odbVZoSpj0byFQnhYOZQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/4] Update imx678 to act as a common Sony Starvis 2 driver.
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jai

Thanks for looking at the series.

On Thu, 3 Sept 2026 at 05:13, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Thank you, I'm glad this turned out quite clean :-)
>
> Quoting Dave Stevenson (2026-08-05 21:39:15)
> > The IMX678 (8MPix) driver has been accepted.
> >
> > Whilst preparing a patchset for IMX662 (1080p), I observed such
> > commonality between the two that it seemed sensible to attempt
> > a common driver rather than submitting a separate IMX662 series
> > again.
> >
> > On checking my box of sensors, I found I had an IMX675 (5MPix) as
> > well, so that has been incorporated.
> >
> > This set proposes a common driver that is working with all 3 of
> > those sensors.
> > It's sent as an RFC to gather confirmation that the resulting driver
> > structure is acceptable as implied by [1].
> >
>
> Overall structure looks good to me, I was able to stream with the Soho
> IMX662 module I have.
>
> > If it is viewed as acceptable then there is still a modest amount
> > of tidying up required:
> > - DT binding updates for the extra compatibles.
> > - Rename the common functions so that the model references are
> >   only on the model specific parts.
> > - Add the Sony init sequence for IMX662.
>
> I added most of the registers I could see were different from the default
> values:
> https://github.com/jailuthra/linux/commit/9ecb2d905581e9cf7ca61aa45c3b440fe7042307

I just hadn't had the time to analyse the Sony docs when I sent the
first stab. I've now done so from their magic spreadsheet, so
hopefully our values match.

I've now got docs for all of them from Sony, so will check through them.
And I've just been told IMX832 (new 2MPix) also matches this scheme,
so that'll be another variant.

If you're on board with this, I'll do a wholesale replacement of
imx678 with starvis2 in common defines, function names, and the file
to starvis2.c as a first patch?

  Dave

> Thanks,
>     Jai
>
> > - Check the init sequence for IMX675 (I'm waiting on a datasheet).
> > - Update the 2 lane mode handling of HMAX. IMX662 can achieve the
> >   same maximum framerate in 2 lane mode with a link freq of 594MHz
> >   or greater, and I suspect others can do so too.
> > - Hopefully add IMX585 (8MPix) to the supported list, and Jai has
> >   mentioned IMX676 (12MPix) as well.
> >
> > I wanted to confirm that there aren't any major objections before
> > doing those cleanups though.
> >
> > For anyone testing on a Pi, I've thrown a branch at [2] which includes
> > overlays for each. I've tested with modules from Soho Enterprises,
> > but there seem to be a few different vendors around.
> >
> > [1] https://lore.kernel.org/linux-media/20260312150437.1091195-1-eagle.alexander923@gmail.com/T/#md6a186b4abd05fb035d020ce0bc562455ef5bed1
> > [2] https://github.com/6by9/linux/tree/rpi-7.2.y-starvis
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> > Dave Stevenson (4):
> >       media: i2c: imx678: Always program the sensor in window mode
> >       media: i2c: imx678: Parameterise the configuration to allow for other models
> >       media: i2c: imx678: Add imx662 support to the driver
> >       media: i2c: imx678: Add imx675 support to the driver
> >
> >  drivers/media/i2c/imx678.c | 451 +++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 393 insertions(+), 58 deletions(-)
> > ---
> > base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
> > change-id: 20260804-media-starvis2-65a5bc405b74
> >
> > Best regards,
> > --
> > Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
