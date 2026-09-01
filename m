Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356C22C1584
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268337; cv=none; b=JzsZMd1dICqb8JGGz5ffifsVgR++pvxKewRlGud5MdCI64N7KBCra18oNszbw/PcD+pVoPO0s3sQiMQRQXClZQPS7WlaDJqsg0vTEYohBakzp1CACnbdI8sXxSEi5RF292AgdKT1frgVKIh89EM8kP8qdlIeYm7zCqhh14Xdi4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268337; c=relaxed/simple;
	bh=XddDe9FgK+NSRro6yB3FHBjXjKe4o1o6FQmLLCV5PY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WK9XJRrJ8aBToN8OlFt/tQbTFyzveLEvyqELcc3tgWx47YLl2OEuSg2L7utSCnnWDfnvjPN/AswjoefC7YmmUTmVYxdoJhEt3KMQpTPPGjIJC78CDxiuvMHO/e/SqwjzQsTJLN7yXr63HQEhR4AmJJaydnZAdYM3Bfvg52o62Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnUfB8Im; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnUfB8Im"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B291D1F00A3F
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788268335;
	bh=B+j2B3jNoIVi89gWFs0w9dwsVetLIZDz29pajK8FaEM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GnUfB8ImxlVkqX6x06TIGUpIbgXbuMBXUf/ppCMkTKrVtby3v/QvjPkG/MeCLII7I
	 csInKO0vmQZAUR5+KM9w26j+YskoQLMhrUQE6hms+qBZAwtIt+/Ycq5HfUoWAdpfbH
	 70rJSukGJjS7QRJjaJhlv75JSvIsQCXIAvzErisg6dOSjD/ln6K5UoTMwvUUvHKOzj
	 QpIo+Fh/I845Jmxm6HbkKCvbXCYfhNPutk2v+xM+LaCGCa3wCyXl6B0z/2Ih/bPqXc
	 HCrLkxdMXVpErpQlaOHaICDAHXaVIAPvRq0f5wgesKl+MLdAwCndGmO/p7+BebtzKT
	 1z+3UQP0hoqMA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b5e41fe5a4so439384e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 06:12:15 -0700 (PDT)
X-Gm-Message-State: AFuF++l+T2PU3advv5tnFW3YXwTb+0sQVVyykMH9lgvt6z6URMdyNi8t
	90zP8uIxCNj8RkDLowzgsihc5/6xutUBg7nThPtoev8Eneon4NiUIt/jnkutdG7PZiw000dHkYW
	9HPT9CY4p4JlLV0fWHFIGxATtjX9C5bw=
X-Received: by 2002:a05:6512:61a9:b0:5b5:e517:9cb9 with SMTP id
 2adb3069b0e04-5b5e68ca48dmr11458560e87.11.1788268334419; Tue, 01 Sep 2026
 06:12:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-9-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-9-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 15:12:02 +0200
X-Gmail-Original-Message-ID: <CAD++jL=5sGegH+cSxDocEVJnYMQ=ijsE45KOapHR0UNtQhjrVw@mail.gmail.com>
X-Gm-Features: AcwNN1X6C4ka1T7XijZkYUK1dWoI2iopk1m247vrTFVy_eNfMGmPKkoe4D9Z0iM
Message-ID: <CAD++jL=5sGegH+cSxDocEVJnYMQ=ijsE45KOapHR0UNtQhjrVw@mail.gmail.com>
Subject: Re: [PATCH v3 08/29] media: ds90ub913: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

thanks for your patch?

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
> the frame descriptor type in the get_frame_desc() callback.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
(...)
> -       .get_frame_desc =3D v4l2_subdev_get_frame_desc_passthrough,
> +       .get_frame_desc =3D v4l2_subdev_get_frame_desc_passthrough_csi2,

But is this right?
Shouldn't this be te _dvp (what I want to rename _parallel) version of
the callback?
I can't see anything CSI2-related in this driver.

Look at commit d6113cdd221964ebcfd479f56b1b7e9c4e28e7d4
"media: i2c: ds90ub913: Use v4l2_subdev_get_frame_desc_passthrough"
by Tomi:

-       ret =3D v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
-                              priv->source_sd_pad, &source_fd);
-       if (ret)
-               return ret;
-
-       fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
-
-       state =3D v4l2_subdev_lock_and_get_active_state(sd);

Yours,
Linus Walleij
