Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE731A3172
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 05:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781156247; cv=none; b=srV7P8GLQNFg0aBRvWs4rOn2IZPcVM1nueGgyeUH3DEjtTtR2WwlH9/lQcWin+x2X+kLnYU9j5O0dsljlmtyGgfQWM5CClRN6LIpQUoSi4vOL7uxWOZ0HoaftfWEWy+qMmZun/rrudBMTH91lDGQ1p+hOw+VBbICFQRbbS6mTxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781156247; c=relaxed/simple;
	bh=Z0h3EmCf1+rEFr1KbjsG8LVQPkuTCzcHhND6OHFzKB4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=j4cnILsOZGVnI30rax/ZCG2FnQDJAbjHDdxkVOkEPz+cN5SBMqM4GwU2rtoDeFk5tfq5xS1b797oZbwsbhnzR3mvylN6qA54Zb/+UqM0RdpTTmaX+W/GTt8LpxjEfg3RKqw16468vRwgmsxtMkVpCNggQNf5THi72qUvIofbRAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BXF84Nbr reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BXF84Nbr"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2864497;
	Thu, 11 Jun 2026 07:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781156212;
	bh=Z0h3EmCf1+rEFr1KbjsG8LVQPkuTCzcHhND6OHFzKB4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BXF84Nbr5nALG7H7wKC6iLfk2BRtXW+6bfLzpNOJswGwtkZC7ztTypwBRfZkSfLd9
	 8q6o/n/Jv21QHZVlKLO6q4CdENnX08Noy24S+8nHx90/0TzjpEZvC/E25bAHib80v5
	 89odM1UgZ0sEzFkiCbSi0/Fdlx12j7fpPxgMgHi0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409201501.975242-34-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com> <20260409201501.975242-34-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v12 33/86] media: uapi: Add new controls for camera sensor FLL and LLP
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "
 Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Thu, 11 Jun 2026 11:07:16 +0530
Message-ID: <178115623672.1799417.2005627235315487289@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Sakari,

Quoting Sakari Ailus (2026-04-10 01:44:08)
> Add new controls for camera sensors, V4L2_CID_LINE_LENGTH_PIXELS and
> V4L2_CID_FRAME_LENGTH_LINES, to convey the combined size of the analogue
> crop rectangle and horizontal and vertical blanking.
>=20
> The reason for adding the new controls is that they're much easier to use
> as the user doesn't have to be concerned of the analogue crop in the same
> context. Secondarily, the newly added common raw sensor model uses
> different values for the same.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
>  include/uapi/linux/v4l2-controls.h                     |  3 +++
>  3 files changed, 15 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source=
.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 63e53c883db6..fb4dee1b4f94 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -201,3 +201,13 @@ For instance, a value of ``0x0001000300020003`` indi=
cates binning by 3
>      Sub-sampling is used to downscale an image, horizontally and vertica=
lly, by
>      discarding a part of the image data. Typically sub-sampling produces=
 lower
>      quality images than binning.
> +
> +.. _image_source_control_frame_length:
> +
> +``V4L2_CID_FRAME_LENGTH_LINES (integer)``
> +    Frame length in lines. The value of the control is the number of lin=
es
> +    captured in the sensor's pixel array added to the vertical blanking.
> +
> +``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
> +    Line length in pixels. The value of the control is the number of pix=
els per
> +    line captured in the sensor's pixel array added to the horizontal bl=
anking.

In IMX219 driver in this series, we are exposing frame length in two-lines
and two-line's length in pixels, which doesn't make sense with respect to
these control definitions.

Similarly, for sensors like IMX283, IMX678 and others, the register is line
length in internal clock units, while the control is line length in pixels.

So I think we should add a small note to prevent these awkward units from
propping up in the userspace:

``V4L2_CID_FRAME_LENGTH_LINES (integer)``
    Frame length in lines. The value of the control is the number of lines
    captured in the sensor's pixel array added to the vertical blanking.
    Some sensors may have an internal register for the total vertical size
    that is in units of 2 lines or some other unit. But the control value
    should always reflect the number of lines in a frame.

``V4L2_CID_LINE_LENGTH_PIXELS (integer)``
    Line length in pixels. The value of the control is the number of pixels
    per line captured in the sensor's pixel array added to the horizontal
    blanking. Some sensors may have an internal register for the total
    horizontal size in units of some internal clock instead of pixels, or
    the total pixel count for multiple lines. But the control value should
    always reflect the number of pixels in a line.

Thanks,
    Jai

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index 227bcb5a549d..bd23c5640722 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1163,6 +1163,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>         case V4L2_CID_BINNING_FACTORS:          return "Binning Factors";
>         case V4L2_CID_SUBSAMPLING_HORIZONTAL:   return "Sub-Sampling Fact=
or, Horizontal";
>         case V4L2_CID_SUBSAMPLING_VERTICAL:     return "Sub-Sampling Fact=
or, Vertical";
> +       case V4L2_CID_FRAME_LENGTH_LINES:       return "Frame Length in L=
ines";
> +       case V4L2_CID_LINE_LENGTH_PIXELS:       return "Line Length in Pi=
xels";
> =20
>         /* Image processing controls */
>         /* Keep the order of the 'case's the same as in v4l2-controls.h! =
*/
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index acb6f9ad4d1b..60f0fb599926 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1253,6 +1253,9 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_SUBSAMPLING_HORIZONTAL                (V4L2_CID_IMAGE_S=
OURCE_CLASS_BASE + 14)
>  #define V4L2_CID_SUBSAMPLING_VERTICAL          (V4L2_CID_IMAGE_SOURCE_CL=
ASS_BASE + 15)
> =20
> +#define V4L2_CID_FRAME_LENGTH_LINES            (V4L2_CID_IMAGE_SOURCE_CL=
ASS_BASE + 16)
> +#define V4L2_CID_LINE_LENGTH_PIXELS            (V4L2_CID_IMAGE_SOURCE_CL=
ASS_BASE + 17)
> +
>  /* Image processing controls */
> =20
>  #define V4L2_CID_IMAGE_PROC_CLASS_BASE         (V4L2_CTRL_CLASS_IMAGE_PR=
OC | 0x900)
> --=20
> 2.47.3
>
