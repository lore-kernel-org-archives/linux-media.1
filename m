Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC368306746
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527560; cv=none; b=Ac5EmEU8N17E32ZbCez8oTf+0xJiL+gJvac7uUV5WVMboSLGi5f4aMEUwtnaNXSfywlLMiv10o7noxfZmq33xthTRl3QK7uX4Zxy8WofiZ0WigWr59yXrIKDUiVFOmTaoPgudFPkBZyk1+zZGEPQODgz16kG2P8Rq7F9WmBFJsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527560; c=relaxed/simple;
	bh=urjbHQZ0lMamc/GDi/en7nIKmSjLrS4EKHlUqu3XUWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjR/hSwxvaWuOzhl8t6IoRcKGgOazDasmEKlspBwS9A/OEf59L3csqOTq+2UjNbADMeCZ5MKpRGTqMmn9xRCAs6wLlRDsiH4TGgNMoVPo+LR2SRwRkR7SptnhCVePYVAevRPDBqkgfnEQ4OePYoC3EJnlTvBOQMVQuVMM66YqNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjgBo7IY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjgBo7IY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559B21F00AC4
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 13:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788527558;
	bh=bnCcgTHNesvli3pj5z9kcGygID1kyPGurM1qfl7KfNA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TjgBo7IYRGCB7Yogh74Brjtj6nc3rfet9omKvSB5y9+C9i3CHfJkJrbDONEFyNNOY
	 c74OAFE2hR1suo9gx3LW5qwVYidZDzntbTc5OKxE228RbxntjMRYJBaZT5YNjycgiS
	 0wkYskvYktKX6N/EGGVP4y1UjHVE8aWdRZXAtAgjdREg8Qt+xiNOYHX3HPPj5pXcj5
	 qvDASMkBV6acJqsmRrRyob5C6lLc2yuS/kmISt9KXgYD6HQVTIsi3RLsLVu/dEUhmu
	 Gq2sWeq6ijhfAbMTl5WylJsqwoAkD3Jng3qWuILgXCepg/fTydk4iRmCx1y9nCOfKD
	 y5djndiuIrXWw==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b1ab6d7239so823959eaf.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 06:12:38 -0700 (PDT)
X-Gm-Message-State: AFuF++kpfAHUZEMPeKJahyfND/KfBvxTE+I3T00sYUzIoXgG3FLLJHmK
	cj7wtDMKHfIL1wf3K7JXaCrOKL1GjbkZaf4vGRqldn99je0A/nyTEEQxMC9w5HJbtIRkqTFKkci
	G4s6hKCCaqZM8hVK8tC64Q8Y5A7xfx6Q=
X-Received: by 2002:a05:6820:616:b0:6b1:bdd9:45d with SMTP id
 006d021491bc7-6b6fcbdeb26mr4434360eaf.21.1788527554201; Fri, 04 Sep 2026
 06:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-23-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-23-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 15:12:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLm33oaLUmtKp4ZEYa9CvaKwvQ0rF1wWDU1QWLr2gYKsPA@mail.gmail.com>
X-Gm-Features: AcwNN1UEjeFlHbzaxDIpEzQ_5DyOYx1B39A0eAPXMGiBXuxrQtC9w-5RJ7WQWR0
Message-ID: <CAD++jLm33oaLUmtKp4ZEYa9CvaKwvQ0rF1wWDU1QWLr2gYKsPA@mail.gmail.com>
Subject: Re: [PATCH v3 22/29] media: rkisp1: Use v4l2_subdev_get_frame_desc()
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

> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
(...)
>         source_sd =3D media_entity_to_v4l2_subdev(source->entity);
> -       ret =3D v4l2_subdev_call(source_sd, pad, get_frame_desc,
> -                              source->index, &fd);
> -       if (ret) {
> +
> +       struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_des=
c) =3D
> +               v4l2_subdev_get_frame_desc(source_sd, source->index,
> +                                          V4L2_MBUS_FRAME_DESC_TYPE_CSI2=
);


This is one of those cases where this should be
TYPE_PARALLEL rather than TYPE_CSI2,
and I think you said you would look into that so it will
be fixed in the next iteration.

i.MX8MP uses the VeriSilicon ISP which is wrongly named
"rockchip" but actually used in i.MX8MP ... it's a big confusion
for the head...

Check for example this device tree overlay:
arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso:

&isp_0 {
        status =3D "okay";

        ports {
                port@1 {
                        isp0_in: endpoint {
                                bus-type =3D <MEDIA_BUS_TYPE_PARALLEL>;
                                remote-endpoint =3D <&mipi_csi_0_out>;
                        };
                };
        };
};

Whoa!

Yours,
Linus Walleij
