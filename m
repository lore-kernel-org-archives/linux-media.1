Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7D938887E
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 20:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788553311; cv=none; b=LOGxJyFl9leELBqw9or79z/GGesOfdnGvWwsXUJNiJcNheq8texh2wQxDmBauD4+dkLA6tOEUPRJsi+F4VR1X/ETUIEekznTU97X/D04DbsRb2UdII4xknD/37dPJc3cDSrvf+4hPy6v8rZkvX/zE4XCl9tlKXZN6+iKFamMd40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788553311; c=relaxed/simple;
	bh=Bzqg0RZ0XnEi5aVXImdNMYKWYrjNoSPKd/XJO0XB2dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B02qCSYSPBZBCOR8dc7SjySLe1jjHIKzU8NHESEYHpOeo/Yk2RLQEvgrDmo2uKQT5iXN0B0i2KqCLWh+ZlZwhpJzjb6wfHG+U2zYpe3xglq4hl2eRsjYuRnwkkU2GYX1ymV6Ot2Rr4TInLSdOm1IJmIgaCZYFclqBQ1kfksGRU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxNRo+fe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxNRo+fe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A9E1F00AC4
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788553305;
	bh=EFsUWT+aYgeDxTLMLcHBhHz3DzU3/sPyQkKRjVs9Z0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AxNRo+fefBCpcwEvy7cPi1evnhueJNCl1tqIog0ap7c6We+WQcnXUOz1y7Ka8ryGq
	 81NHlOfsSi5A7gsI1tBe+doilJUMJXxEEhSums0O6jFHlL+DjxpXbVPoYW7XzS/cQY
	 CHDbYIg+c7WrQ/krkJu2RYtQXJtzm4tejCPfSzFNUZctuVUE79Gzqjk64eM4UEwNag
	 Yf9IXYCKtA+eaOaS7CvvLUqSzW37q9zANA8b/S4hMqH31FY6P/aCM8RX8TNz1j5Qx7
	 2K+NTd/HreOSsMnalaLN5E9RqhQ+fkpTZ4Ew18NzFe0THLo8RpaZ7llg7JIi12W6oA
	 W2p7nizNE7Aow==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b5e5ab03afso1229914e87.3
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 13:21:44 -0700 (PDT)
X-Gm-Message-State: AFuF++lu8Q4VzGSg14Y29tO5tBQ6IdTzjqwcDUDmECyO2P3aQeeIdxTW
	XmxegqXpPOcWO7NIDYtkHAwoL1XqpUxOOjzGjv8aAVJE48R0VXuHF0s2RsM8JYtQ2buJhfIIX80
	9cutExQ5Qe68zv5odAhivTIuvAS9hATg=
X-Received: by 2002:a05:6512:4405:b0:5b6:1a7c:fd95 with SMTP id
 2adb3069b0e04-5b61a7cfde7mr994061e87.59.1788553303553; Fri, 04 Sep 2026
 13:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-26-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-26-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 22:21:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLkPuVcNEdJkk3eRzoHCLzNiaSrifXRMeHVnEYt4SmjbPg@mail.gmail.com>
X-Gm-Features: AcwNN1W4GMtZsmwuhm987CfH9rynte6MB0p9pcTdAzGSXTsrp_r8ZoPhKsyoKyA
Message-ID: <CAD++jLkPuVcNEdJkk3eRzoHCLzNiaSrifXRMeHVnEYt4SmjbPg@mail.gmail.com>
Subject: Re: [PATCH v3 25/29] media: ipu6: Use v4l2_subdev_get_frame_desc()
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

> -       ret =3D v4l2_subdev_call(source, pad, get_frame_desc, pad->index,=
 &desc);
> -       if (ret)
> -               return ret;

This will have the subdev do the desc and type conversion IIUC.

In the current IPU6 subdev in ipu6-isys-subdev.c there is this big table
to do this:

unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
{
    switch (code) {
    case MEDIA_BUS_FMT_RGB565_1X16:
        return MIPI_CSI2_DT_RGB565;
    case MEDIA_BUS_FMT_RGB888_1X24:
        return MIPI_CSI2_DT_RGB888;
(...)
    case MEDIA_BUS_FMT_META_8:
    case MEDIA_BUS_FMT_META_10:
    case MEDIA_BUS_FMT_META_12:
    case MEDIA_BUS_FMT_META_16:
    case MEDIA_BUS_FMT_META_24:
        return MIPI_CSI2_DT_EMBEDDED_8B;
}

And now we have this:

> +       struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_d=
esc) =3D
> +               v4l2_subdev_get_frame_desc(source, pad->index,
> +                                          V4L2_MBUS_FRAME_DESC_TYPE_CSI2=
);

I suppose this will invoke instead the big lookup table from patch 1?

Is there any point in keeping the old IPU6 lookup table around after this,
it looks vaguely confusing to me.

But removing it might be better as a separate cleanup, so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
