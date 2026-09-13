Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A181638333C
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789287863; cv=none; b=BVOrGr5mbzCxiCBQpWF45kpLVZ/q46q26QutDvPSavGewIBBeaDknrBP2GiPyezNKf4sY3VEYMquWTg84qLS/Fckn27magrSa0eVqzumVtTesaQOsjfDEy33D5rlKFcmCHHVb2qS9OBD4JaOZHboOTRh2Jzm4xx+jmRNdVXN0CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789287863; c=relaxed/simple;
	bh=9kj2JCRiOIxwjell61Q8X8MUlFTUvaNtNZAb+3ef+Rs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IIYcLrINC4ThnEVemL9RNOPFFyvcMllaNPpMsGnd4oMKIA7VefY74estl7f555jcVb0V/DlFXQZhuMJRc6hgESwo18G4G3vgYHfLZUN4Tblqh3O6Jo8Pe2NIGI33gxwSVUfx7s5+9/Ce2DhCmtDi8bEbIJdx93ipAW1vUW9n7Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=HOU9iF/7; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="HOU9iF/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789287854; x=1789547054;
	bh=4kLm7HjKOi8BGXribagvS0TBdkovONxi55JdRs2TqRU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HOU9iF/7N2xqcJFEBbAip7HlkhlmHn1IZLr8q5yfxUY7p+mvG7mH5DdhIyyrV+nnW
	 D4gYIm5P4vBtDVwJXXne+nKLX3oaMOeYihaLwaoyHUUG7qnA6ms5oayLEImPCRSfd/
	 orxXqRrG5n4iv1ceCoBeliQ9HB7u5VrI6HtmhJfgEQFUFVPLj5ITFweuFSeFmgFN50
	 xYkbCGu67wn2MIkuwlRQ6KWDimkRfkws6xRWBCt5RxPow3iE2uXuCuXsKs2rhwAhGg
	 xYr4sPB+kNMjgvEssWOvtx+HrxTbbfDh0BWd39u5fmbXKrmh/Be6DRLPeN9POoyxBV
	 V2JCa9CcRrwlQ==
Date: Sun, 13 Sep 2026 08:24:08 +0000
To: German Pablo Lindo <germanpapulindez@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org
Subject: Re: cause of the image error in Gnome Snapshot [PATCH v3 0/3] media: Add support for the Sony IMX681
Message-ID: <20260913082400.29504-1-lsa.uz@pm.me>
In-Reply-To: <20260912161614.93775-1-germanpapulindez@gmail.com>
References: <20260909203717.90605-1-lsa.uz@pm.me> <20260912161614.93775-1-germanpapulindez@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: fa0c76b2789a2179a044f8bd8df74107cacf05ec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

German, thank you - two lists of resolutions beats "the picture is wrong" b=
y a
long way, and formatting it to paste was thoughtful. I ran all six here, in
daylight, against a sheet of printed text, on the same driver you are runni=
ng.
I cannot reproduce it. Below is what I measured, one fact that is real but =
does
not explain your case, and one thing for you to try that I think is the mos=
t
likely answer.

What I measured
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Same driver as the series under review (the sensor reports analogue_gain
max=3D960, so this is v2/v3 and not the old one), 110 frames per resolution=
 so
the AGC had settled, all six held against the same target in the same light=
:

  resolution   stride   pad    R/G    B/G   row shear
  1280x720       5120     0   0.91   0.88     none      works for you
  640x480        2560     0   0.87   0.82     none      works for you
  3836x2640     15360    16   0.90   0.88     none      works for you
  1920x1080      7680     0   0.93   0.91     none      fails for you
  1440x810       5888   128   0.92   0.90     none      fails for you
  960x540        3840     0   0.88   0.84     none      fails for you

Your two sets overlap completely. No violet cast anywhere - B/G is below 1 =
in
all six, which is blue sitting under green, the ordinary case and the oppos=
ite
of purple. No systematic row shear either: I looked for the x-offset at whi=
ch
adjacent rows best match, and it is zero in every one.

One real fact that is not your answer
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Of the six, 1440x810 is the only one where libcamera pads the line stride -
5760 to 5888, because 1440*4 is the only width*4 that is not a multiple of =
256.
A consumer assuming stride =3D=3D width*4 reads every row 128 bytes late, w=
hich is
exactly what draws diagonal lines.

But it cannot be your explanation, for two reasons. 1920x1080 and 960x540 h=
ave
no padding at all and you say they fail. And the native 3836x2640 *is* padd=
ed,
by 16 bytes, and you say it works. So padding neither predicts your failure=
s
nor your successes. I am telling you the number because it is true, not bec=
ause
it is the cause.

What I would try next, and it is one command
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

libcamera's software ISP debayers on the GPU by default - here it goes thro=
ugh
EGL and Mesa. That path depends on your graphics driver, which is the one b=
ig
thing that differs between your machine and mine even with identical camera
code. It can be switched off:

  LIBCAMERA_SOFTISP_MODE=3Dcpu qcam --stream "width=3D1920,height=3D1080"

I verified the switch does something: with `gpu` the log carries EGL lines,
with `cpu` it carries none and the frames still arrive. (libcamera's own er=
ror
message misspells the variable as LIBCAMERA_SOFISP_MODE - the spelling abov=
e is
the one that works.)

If the artefact disappears with `cpu`, it is in the GPU debayer and not in =
the
camera at all, which would also explain why two machines with the same driv=
er
disagree. If it survives, it is in the pipeline and libcamera-devel is the
place for it.

The other half of the same question: qcam decodes *and displays* through Qt=
 and
GL, while `cam --file` writes the buffer straight to disk with no display p=
ath.

  cam -c 1 --capture=3D30 --file=3D/tmp/f_#.bin --stream "width=3D1920,heig=
ht=3D1080"

If those files are fine and only qcam looks wrong, the fault is in display.

Two things that would help me match you: your libcamera version (`cam
--version`; I am on 0.7.0) and your Mesa version.

Either way, none of this is the kernel driver. The sensor has exactly one m=
ode,
3836x2640, and every resolution in your list is libcamera scaling that
afterwards - so nothing here asks for a change to the patches under review.

Sergey

