Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFCA382F25
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518624; cv=none; b=bkRiwfbm/BJD0A+kpVDhG9fmDwYV/c9Z+QgPJC+k4msuguIQN3RMWw/155HhxFarVq6ckUFgsCvemEN8Rl/Th600G+hzMm9h9uGTWutfPUAGCPKOi9oLeAZLjW1lAm0AycP/2ObrB+zz7OyK3AtPyXr0E2GGEFQW2TG84wgjliY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518624; c=relaxed/simple;
	bh=xZIdHWKMa1P/oJrjsmIfJBJNQmXTb3ayp0S6qW/BpXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQPdJl01cO85py7Jqtoi+hv28gGZLcK/dPbx1n0rO5Os6rkexCb+uXDFHxOryn0TX2j0bSKXgtCtpIXrciYQNRTIoUEyr/pRqhBxEzdnisOUclPbtB9qx/MxqeqobLPVaz+DMccJ9Jwcz4m76e4pFgCvMLlcx10O/wcmFZOGUuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8Y11qMs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8Y11qMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC4D1F00ADB
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518623;
	bh=WqSQcSfpGTaGjcfEGKzcH3DS+87Zxn6xD4nzxjKGCkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=L8Y11qMsuDFtwQ9OpTOh7yrOUbbPE7cmvHkGB6ebhBpNNmBeBjOSWhVlZuDGjMg53
	 CKq+jPdCvgrdDwUlmGKJq8C7Kdw4civkOzUisasRWLDolMWxK1bMnPIsT74/Ymh90S
	 MQgPHHLFzb6mC2ushWoP5aDJTouG9iHrbGp4tRvF2IZKDuQEPzbnQmnbC85dk8AQUm
	 JvST649hfNcDzt2oP+jGUZohK/CiRYrFeynhVSnMOd8dSfjOQTfY+DB7HjhmE9b/CC
	 LfyKuztlNSvL4yFkWnBDq98c+npJ5pORBFTwC18S9Ou1D8a/vpxRk1kpyQaYSBfOSB
	 Gpac3bF0np0Lw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so893008e87.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:43:43 -0700 (PDT)
X-Gm-Message-State: AFuF++kv6kF1f0XC5yk5OTrYBQi7GcWLrslrlOt+V7YqQxlmQGQ/lPqU
	XgCwTNavZ/UIEi74sk7Twtg21dEpMqAkFaZNDrOX1RdyOpG1R18HMmI0KylejYNyNZ5w/KMcp6m
	SF7QFDjaDmLfnnjj27qXkcLtTZ+Jy0/A=
X-Received: by 2002:ac2:5684:0:b0:5b6:1a7c:59e7 with SMTP id
 2adb3069b0e04-5b61a7c5b6bmr372840e87.65.1788518621788; Fri, 04 Sep 2026
 03:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-19-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-19-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 12:43:29 +0200
X-Gmail-Original-Message-ID: <CAD++jL==kKkqyN8j9-DxDOs0Z-oRXQx46jsvPOrQx2ohevc84w@mail.gmail.com>
X-Gm-Features: AcwNN1XnnKlfrhg2hfEkkZIsb0oUAG6BU5O6RHWYAv4EZKaZ_cjsLZwaCeC39LE
Message-ID: <CAD++jL==kKkqyN8j9-DxDOs0Z-oRXQx46jsvPOrQx2ohevc84w@mail.gmail.com>
Subject: Re: [PATCH v3 18/29] media: bcm2835-unicam: Remove frame descriptor workaround
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

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> As the v4l2_subdev_get_frame_desc() either returns a frame descriptor or
> returns an error, remove the workaround for drivers that didn't implement
> the get_frame_desc() pad op. Also handle v4l2_subdev_get_frame_desc()
> errors.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
(...)

> @@ -933,7 +933,11 @@ static void unicam_start_rx(struct unicam_device *un=
icam,
>         fmtinfo =3D unicam_find_format_by_code(fmt->code,
>                                              UNICAM_SD_PAD_SOURCE_IMAGE);
>         if (WARN_ON(!fmtinfo))
> -               return;
> +               return -EINVAL;
> +
> +       ret =3D unicam_get_image_vc_dt(unicam, state, &vc, &dt);
> +       if (ret)
> +               return ret;

vs

> -       ret =3D unicam_get_image_vc_dt(unicam, state, &vc, &dt);
> -       if (ret) {
> -               /*
> -                * If the source doesn't support frame descriptors, defau=
lt to
> -                * VC 0 and use the DT corresponding to the format.
> -                */
> -               vc =3D 0;
> -               dt =3D fmtinfo->csi_dt;
> -       }

I *think* what Frank is pointing out is that vc=3D0 and dt=3D0
needs to be in this patch so we see that
the new code works when using CCP2 data?

Like here:

static void unicam_cfg_image_id(struct unicam_device *unicam, u8 vc, u8 dt)
{
        if (unicam->bus_type =3D=3D V4L2_MBUS_CSI2_DPHY) {
                /* CSI2 mode  */
                unicam_reg_write(unicam, UNICAM_IDI0, (vc << 6) | dt);
        } else {
                /* CCP2 mode */
                unicam_reg_write(unicam, UNICAM_IDI0, 0x80 | dt);
        }
}

Other than that it LGTM (OK may not be worth much, I'm a bit
lost in the details here):
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
