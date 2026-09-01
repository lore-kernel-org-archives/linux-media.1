Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905F339CCFD
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 21:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788299033; cv=none; b=h/zCPviGQydESE2+SQ0uS0q9QdKuSjQZwtJ4WwTzfJ3362DAXO7SPaVekHCtuBL+GH/3lTpJlL4wP/gPxPe3MXAeFyrL8pT54l1m6FeyLaTfKqhMFTyIelqUrEa2653HqhbNReeGuLkkYegKCCdmxBU8qfj5DsmVm9uopJYEJNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788299033; c=relaxed/simple;
	bh=o5iNqdX/0V1yJ6Kw+hpYJmnFPo7J7jZecdVx6Sqew9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qg9Fm4CzZmeyYJoxatiSi/oRvWvDWWmFPFB1YUgVNze/E+diwpgW3Xy+P3mBO7mzkPI1z1x5EBKLxn+iUY+Y6IpaY9mDLMoGD38OaMDLdbP8ikh+quXFUiKcWNSX2jbxjkY4W1efJZDIwfIFV9qliIJ90uW2ZF71FIALwvMbKTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgfJpRID; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgfJpRID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FD41F00ACF
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 21:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788299032;
	bh=zUX0DiIL5lm2CyGOjAmDomJv0ocskxgA/ZxXj+GwXCA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lgfJpRIDsm4MFaL6VhWSC07/FXlPL0UEwxnodZiyT+6bDoyr2n0f3Q5l62bt18WIW
	 1HOHeHL5pNPpFZKwlWbUbvh1f6ehEeowab3XbhVy6Q+b/ZzCKU3b48ntGkEauKg9z5
	 IFh+xy5IS0jAAmb0k+9/42tK9VFopBePPn/AorBCGpyQZAiENFLSA0yM3DHy4O4WyK
	 qwiJn9ZXoaVU50ag/wC7rb1Oo7yx2JwCUERxglOpLhjPv/GnSMPy8dWHfvi5LupZ3G
	 h8uaw9/oJl9W8JAWN4IQpil7ZwJov/UOInYGwnUCtk9btCelzIr7gGmYRQqUwgu4Zq
	 1N1ZQ/AaystvQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b4a0e5aefeso266811e87.3
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 14:43:51 -0700 (PDT)
X-Gm-Message-State: AFuF++n0dGlImyOYCOcoPHzzhhOY1+ehCGiUs/W116P5XmWcICxeY3H8
	iUTZB+yjkbcSvy+FS2HIAvxUoGnMoENwUaILHuzMLqle97lvSX11Fr8bytFARwOhzQ5lVAMr8R8
	55XJ0n82T/Yp42uM83UhZ+Gd+5p4Plkg=
X-Received: by 2002:a05:6512:b23:b0:5b5:e57b:9126 with SMTP id
 2adb3069b0e04-5b60832cddcmr202213e87.2.1788299030622; Tue, 01 Sep 2026
 14:43:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-14-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-14-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 23:43:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLksx58CCswrGMOerNzKcF_uYgrH2Ykvi3YY8wqV5S6J5Q@mail.gmail.com>
X-Gm-Features: AcwNN1XkkDX8Vem0fWX1iqhSTUgZGuJWMLBd6vp16ed2PN9HekoBwtnBsTP6ZOw
Message-ID: <CAD++jLksx58CCswrGMOerNzKcF_uYgrH2Ykvi3YY8wqV5S6J5Q@mail.gmail.com>
Subject: Re: [PATCH v3 13/29] media: cdn-csi2rc: media: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

thanks for your patch!

Subject has media twice, is that intentional?

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to allow
> compatibility with drivers that do not implement get_frame_desc() pad op.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
(...)
> -       .get_frame_desc         =3D v4l2_subdev_get_frame_desc_passthroug=
h,
> +       .get_frame_desc         =3D v4l2_subdev_get_frame_desc_passthroug=
h_csi2,

This looks right, but elsewhere in this driver we have this:

static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
                                             struct v4l2_mbus_frame_desc *f=
d)
{
        struct media_pad *remote_pad;

        remote_pad =3D
media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
        if (IS_ERR(remote_pad)) {
                dev_err(csi2rx->dev, "No remote pad found for sink\n");
                return PTR_ERR(remote_pad);
        }

        return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
                                remote_pad->index, fd);
}

Is it really all right for this helper to still call get_frame_desc() throu=
gh
v4l2_subdev_call() like this, or should it rather call
v4l2_subdev_get_frame_desc() in some way?

(maybe this is fixed elsewhere in the series, I'm admittedly
a bit unfamiliar with the code...)

Yours,
Linus Walleij
