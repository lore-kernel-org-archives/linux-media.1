Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22313546D0
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269465; cv=none; b=ansMNhPlnSkAlHsJV60QwLzkf15inVu5QXXo8LkOCFWtLYOkof4s6N0oj/NC5j4yxAGVrkkBb73olTMnphmZUYphw4M/QGv80vhZUTufOjzzrSUHtpbWq0qLSxpQ1jJBMztk1qVIiHEGhQZR3cQXKcnwZZQ+CgvhiIglsCDqvcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269465; c=relaxed/simple;
	bh=qCb34a4gOqdjrPD/RoPPh2ZKDd6K330IRRTsHAr1E1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gj9sqtjpOMyyxdLw6kGms9z9IfM0HdlnGEvcDW0aVkwUiQADtpGJPYI332X4Pg9WkhRwZuzA35/4jz0noY7Ff8kipwRhkXHo+bDjyzLZmurDhReTTgsoV3v6AjVr3Gh6jeCup3qOmIMf7mbIbnallpArKlssCtQK8LLt/khpS6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkO5Tg6Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkO5Tg6Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755401F00A3D
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 13:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788269463;
	bh=ZwV7Uq3vC/MU3+Z4fMSv0YR0wSo0Q655qKaiX/OVBuc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lkO5Tg6Y1XWPQ5A/CQzESnXqA963piEaF/O9HD7xJugOq6Jpe7YOpxQVf72AAkEdg
	 4kvSgZbYV6fiiSqKShYbwoY/OE2MiWNLYJLwa41Fz3qjMlOxWDQ+GtcBKHggpvmjCu
	 qi4RTxnWgOfkSdC0v9MsnsRaM8KYSfVMUmzJlw/oq3F1s7A0Qhr4ssyi132T/wTao0
	 m86UU4MBbadQpjiGuuhqDoVxxejn4Z0Go1xmf7/8Ni66nvk/7wk8gHexblpScwI2YB
	 H28dk2XGONSzU2+HRbYnzpS83rTbdYmHgRRf6Chzqg6zeVyaVkpskwL14GML7kuWkV
	 9vVVCln+/oY5A==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b6036e9c70so471005e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 06:31:03 -0700 (PDT)
X-Gm-Message-State: AFuF++mOsvjo7n8KkwLiDaAEyIbInp8jtrXbgTJDPOj58szgtIkCwmio
	HZ8zby2667C7EUadrayW7n9vJZN7S2CQwZjiyjrzy2rPL28DGw3YlyuqUQYITgacrZatwLYlix2
	pmB2qweb82+qPg9ayXRqOYMhW9bAtRdE=
X-Received: by 2002:a05:6512:3da5:b0:5b6:4ae:5b7e with SMTP id
 2adb3069b0e04-5b604ae5c5bmr711350e87.28.1788269462091; Tue, 01 Sep 2026
 06:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-11-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-11-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 15:30:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLkp2M3OfkxzjLdU4SwUpZMxSRaoQj=+kT1DvJJT+p09kA@mail.gmail.com>
X-Gm-Features: AcwNN1Ug0A0Ool0MPVQ6_JCdAdwknZByqhjpp2NXDWzyhXPh7xWq6_R_-Lmjvig
Message-ID: <CAD++jLkp2M3OfkxzjLdU4SwUpZMxSRaoQj=+kT1DvJJT+p09kA@mail.gmail.com>
Subject: Re: [PATCH v3 10/29] media: nxp: imx8-isi: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
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

> Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
> the frame descriptor type in the get_frame_desc() callback.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

(...)
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -462,7 +462,7 @@ static const struct v4l2_subdev_pad_ops mxc_isi_cross=
bar_subdev_pad_ops =3D {

This is a *crossbar* i.e. a mux selecting different inputs ...
OK I might be a bit biased as I worked a bit with muxes in my life.

> -       .get_frame_desc =3D v4l2_subdev_get_frame_desc_passthrough,
> +       .get_frame_desc =3D v4l2_subdev_get_frame_desc_passthrough_csi2,

I don't think this is universally true.

I would implement something local such as:

static int
mxc_isi_crossbar_get_frame_desc(struct v4l2_subdev *sd, unsigned int
pad, struct v4l2_mbus_frame_desc *fd)
{
(...)
    // get the sink pad
    switch (input_type_of_sink_pad) {
    case // whatever pad is CSI2 :
        fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
        break;
    case .....

I took a brief look and it seems not every pad is a CSI2 pad, sadly.

Yours,
Linus Walleij
