Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3193252D2D1
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651917; cv=none; b=pml7gUxNQ07BID2oLtMz/qLP4cQdB7HGRRNt4lQkoqzONHe5cFEhYSxm7Ob7ZYGXtuz6MbK3YV/YvGu2GyFliNhmvbLt+hzhZKUK6MpBPzqx4FBgzhIvwFIb2S6nekYTW/XYAkCxnEdcnADie9HMlpBoAH/9oxBj5JDRIiuxnxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651917; c=relaxed/simple;
	bh=Bvdv0+zm/krMaXE5JC5wv0NoWpGhf3Dxn1zM5T4g7OM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=aIU01Y+Xcft0irV5fdJMVIO2Wz1KnFbirj1RNuLZTRbTxlxE8FjyJVFsPBjMH2ovXA/qkKDuCFw8OM4tHz1UvyZKgyW5LMk+VxGwO4ZmWG++JJOi3gCAn20KqPqjoBimVNn63w1yWtWcAWuUY27B248xUgZ2IlWVDb47x04T2dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cRjyCnx3 reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cRjyCnx3"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8729E22B;
	Thu, 17 Sep 2026 15:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789651794;
	bh=Bvdv0+zm/krMaXE5JC5wv0NoWpGhf3Dxn1zM5T4g7OM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cRjyCnx33SJQL60iEwdUcFVIxWzyO4tXT5GtJ4lnIw0toKdo1p0O6CdlJXfZj0jhS
	 JSY+q7R0q41tpMlPlpXAUefMY6BokliPzrqKlxzBO5APTZKsYcIEjath4na3xvcaWj
	 jrWrPmAG9UrZsc44QcqpmtA7aMIgb4PQrbYs0R5g=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409201501.975242-57-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com> <20260409201501.975242-57-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v12 56/86] media: imx219: Add internal pads, routes for common raw sensor model
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "
 Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Thu, 17 Sep 2026 19:01:31 +0530
Message-ID: <178965189125.330213.6064483316758700306@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Sakari,

Quoting Sakari Ailus (2026-04-10 01:44:31)
> Support internal pads, routing, formats and selections for the newly added
> common raw sensor model, with compatibility interface provided for the
> existing users.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 230 +++++++++++++++++++++++++++----------
>  1 file changed, 171 insertions(+), 59 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 67b02fa338d0..b4aa62cbb826 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -139,13 +139,19 @@
>  #define IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED     363000000
>  #define IMX219_DEFAULT_LINK_FREQ_4LANE 364000000
> =20
> +/* For compatibility with the old UAPI. */
> +#define IMX219_COMPAT_VISIBLE_TOP      8U
>  /* IMX219 native and active pixel array size. */
> -#define IMX219_NATIVE_WIDTH            3296U
> -#define IMX219_NATIVE_HEIGHT           2480U
> +#define IMX219_NON_VISIBLE_HEIGHT      42U
>  #define IMX219_VISIBLE_LEFT            8U
> -#define IMX219_VISIBLE_TOP             8U
> +#define IMX219_VISIBLE_TOP             (IMX219_NON_VISIBLE_HEIGHT + 8U)
>  #define IMX219_VISIBLE_WIDTH           3280U
>  #define IMX219_VISIBLE_HEIGHT          2464U
> +#define IMX219_PIXEL_ARRAY_LEFT                0U
> +#define IMX219_PIXEL_ARRAY_TOP         IMX219_NON_VISIBLE_HEIGHT
> +#define IMX219_PIXEL_ARRAY_WIDTH       3296U
> +#define IMX219_PIXEL_ARRAY_HEIGHT      2480U
> +#define IMX219_NATIVE_FORMAT           MEDIA_BUS_FMT_SRGGB10_1X10
> =20
>  /* Mode : resolution and related config&values */
>  struct imx219_mode {

[...]

>  static int imx219_get_selection(struct v4l2_subdev *sd,
>                                 const struct v4l2_subdev_client_info *ci,
>                                 struct v4l2_subdev_state *state,
>                                 struct v4l2_subdev_selection *sel)
>  {
> -       switch (sel->target) {
> -       case V4L2_SEL_TGT_CROP:
> -               sel->r =3D *v4l2_subdev_state_get_crop(state, 0);
> -               return 0;
> +       if (!(ci &&
> +             ci->client_caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR)=
) {
> +               if (sel->pad !=3D IMX219_PAD_SOURCE)
> +                       return -EINVAL;
> +
> +               switch (sel->target) {
> +               case V4L2_SEL_TGT_CROP:
> +                       sel->r =3D *v4l2_subdev_state_get_crop(state,
> +                                                            IMX219_PAD_I=
MAGE);
> +                       sel->r.top -=3D IMX219_VISIBLE_TOP;

This leads to sel->r.top =3D 0, when before this patch it reported 8 to
userspace.

It caused a segfault in the VC4 IPA's lens shading algorithm when running
libcamera without CLIENT_CAP_COMMON_RAW_SENSOR because it was trying to set
cropY =3D -8 and underflowing (not a very fun debug :)


> +                       return 0;
> +
> +               case V4L2_SEL_TGT_NATIVE_SIZE:
> +                       sel->r.top =3D 0;
> +                       sel->r.left =3D 0;
> +                       sel->r.width =3D IMX219_VISIBLE_WIDTH;
> +                       sel->r.height =3D IMX219_VISIBLE_HEIGHT;
> +

Same here, shouldn't TGT_NATIVE_SIZE width/height remain 3296x2480 like it
was before? The current version makes NATIVE_SIZE smaller than CROP_BOUNDS
below.

> +                       return 0;
> +
> +               case V4L2_SEL_TGT_CROP_DEFAULT:
> +               case V4L2_SEL_TGT_CROP_BOUNDS:
> +                       sel->r.top =3D IMX219_COMPAT_VISIBLE_TOP;
> +                       sel->r.left =3D IMX219_VISIBLE_LEFT;
> +                       sel->r.width =3D IMX219_VISIBLE_WIDTH;
> +                       sel->r.height =3D IMX219_VISIBLE_HEIGHT;
> +
> +                       return 0;
> +               }

I have applied the following changes in my local tree:

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 9d5479e00886..a30bd4247c8d 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1287,14 +1287,14 @@ static int imx219_get_selection(struct v4l2_subdev =
*sd,
                case V4L2_SEL_TGT_CROP:
                        sel->r =3D *v4l2_subdev_state_get_crop(state,
                                                             IMX219_PAD_IMA=
GE);
-                       sel->r.top -=3D IMX219_ACTIVE_AREA_TOP;
+                       sel->r.top -=3D IMX219_INACTIVE_AREA_HEIGHT;
                        return 0;

                case V4L2_SEL_TGT_NATIVE_SIZE:
                        sel->r.top =3D 0;
                        sel->r.left =3D 0;
-                       sel->r.width =3D IMX219_ACTIVE_AREA_WIDTH;
-                       sel->r.height =3D IMX219_ACTIVE_AREA_HEIGHT;
+                       sel->r.width =3D IMX219_PIXEL_ARRAY_WIDTH;
+                       sel->r.height =3D IMX219_PIXEL_ARRAY_HEIGHT;

                        return 0;

Thanks,
Jai

> =20
> -       case V4L2_SEL_TGT_NATIVE_SIZE:
> -               sel->r.top =3D 0;
> -               sel->r.left =3D 0;
> -               sel->r.width =3D IMX219_NATIVE_WIDTH;
> -               sel->r.height =3D IMX219_NATIVE_HEIGHT;
> +               return -EINVAL;
> +       }
> =20
> -               return 0;
> +       if (sel->pad !=3D IMX219_PAD_IMAGE)
> +               return -EINVAL;
> =20
> -       case V4L2_SEL_TGT_CROP_DEFAULT:
> +       switch (sel->target) {
>         case V4L2_SEL_TGT_CROP_BOUNDS:
>                 sel->r.top =3D IMX219_VISIBLE_TOP;
>                 sel->r.left =3D IMX219_VISIBLE_LEFT;
>                 sel->r.width =3D IMX219_VISIBLE_WIDTH;
>                 sel->r.height =3D IMX219_VISIBLE_HEIGHT;
> -
>                 return 0;
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +               sel->r.top =3D IMX219_VISIBLE_TOP;
> +               sel->r.left =3D IMX219_VISIBLE_LEFT;
> +               sel->r.width =3D IMX219_VISIBLE_WIDTH;
> +               sel->r.height =3D IMX219_VISIBLE_HEIGHT;
> +               return 0;
> +       case V4L2_SEL_TGT_CROP:
> +               sel->r =3D *v4l2_subdev_state_get_crop(state, sel->pad);
> +               return 0;
> +       case V4L2_SEL_TGT_COMPOSE:
> +               sel->r =3D *v4l2_subdev_state_get_compose(state, sel->pad=
);
> +               return 0;
> +       default:
> +               return -EINVAL;
>         }
> -
> -       return -EINVAL;
>  }
> =20

[...]
