Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844951EE03D
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775203345; cv=none; b=somMbVurz6NEZZwzzHBTeRELJTeiTHLBWtoKivdI0W6ljloEXhwmoKPF5dC0JNosDEutjKM134pRV1KcpakLRlYDlNgeKjUYw7S22MGTWWJ4+6zrhvKmkyqC/S7yi3iiNJFxMxyDdXhL0OpNWdkWYvfHLMdKs+FqVdLNysVqAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775203345; c=relaxed/simple;
	bh=air7HDTruFiZk5s6kbOXCol9U+9gpUPsdrDepBkXpoc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Gyt3bOTywJBn0KxJxJzQqF6qfORaGgmH3UyVeZGBENYdeeb5W0amdpJ5BU/CytquxXQ8+t41HpeGYnpoz92UZnUK1X0BcRcFVhs6K1wcEi8QcPh/43QM8s//kuQGUAKYJCTfH1X2b3dbX5Ks9fclcgFLlYesxuhWJYI67qHkJds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y6Nh5k60; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y6Nh5k60"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D840F143C;
	Fri,  3 Apr 2026 10:00:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775203257;
	bh=air7HDTruFiZk5s6kbOXCol9U+9gpUPsdrDepBkXpoc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Y6Nh5k60se9MvOYc/U8Nj4ooCn8RQd6pZBNXG7bQVWo6F1enpRcjH9TN0E9WRbLVE
	 8k/jZoYyz0EPN2klsiSZbMDPp3OfpGC4/2V1C0BXO+Y3CPNCth93Z8mjnbZlZox1cl
	 q4ZUuJbxtBDgFMK13luKIbwyI7bPeflp/GFiTzek=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260402214954.3827408-2-sakari.ailus@linux.intel.com>
References: <20260402214954.3827408-1-sakari.ailus@linux.intel.com> <20260402214954.3827408-2-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/6] media: imx274: Remove redundant kernel-doc comments
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Leon Luo <leonl@leopardimaging.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Fri, 03 Apr 2026 09:02:19 +0100
Message-ID: <177520333923.571732.12742438333720270866@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Sakari Ailus (2026-04-02 22:49:49)
> Remove kernel-doc comments from  regular callback functions. These
> comments have no information value.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  drivers/media/i2c/imx274.c | 38 --------------------------------------
>  1 file changed, 38 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index 8ec78b60bea6..241821572e03 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -897,14 +897,6 @@ static int imx274_regulators_get(struct device *dev,=
 struct stimx274 *imx274)
>                                         imx274->supplies);
>  }
> =20
> -/**
> - * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
> - * @ctrl: V4L2 control to be set
> - *
> - * This function is used to set the V4L2 controls for the imx274 sensor.
> - *
> - * Return: 0 on success, errors otherwise
> - */
>  static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct v4l2_subdev *sd =3D ctrl_to_sd(ctrl);
> @@ -1059,16 +1051,6 @@ static int __imx274_change_compose(struct stimx274=
 *imx274,
>         return 0;
>  }
> =20
> -/**
> - * imx274_get_fmt - Get the pad format
> - * @sd: Pointer to V4L2 Sub device structure
> - * @sd_state: Pointer to sub device state structure
> - * @fmt: Pointer to pad level media bus format
> - *
> - * This function is used to get the pad format information.
> - *
> - * Return: 0 on success
> - */
>  static int imx274_get_fmt(struct v4l2_subdev *sd,
>                           struct v4l2_subdev_state *sd_state,
>                           struct v4l2_subdev_format *fmt)
> @@ -1081,16 +1063,6 @@ static int imx274_get_fmt(struct v4l2_subdev *sd,
>         return 0;
>  }
> =20
> -/**
> - * imx274_set_fmt - This is used to set the pad format
> - * @sd: Pointer to V4L2 Sub device structure
> - * @sd_state: Pointer to sub device state information structure
> - * @format: Pointer to pad level media bus format
> - *
> - * This function is used to set the pad format.
> - *
> - * Return: 0 on success
> - */
>  static int imx274_set_fmt(struct v4l2_subdev *sd,
>                           struct v4l2_subdev_state *sd_state,
>                           struct v4l2_subdev_format *format)
> @@ -1423,16 +1395,6 @@ static void imx274_load_default(struct stimx274 *p=
riv)
>         priv->ctrls.test_pattern->val =3D TEST_PATTERN_DISABLED;
>  }
> =20
> -/**
> - * imx274_s_stream - It is used to start/stop the streaming.
> - * @sd: V4L2 Sub device
> - * @on: Flag (True / False)
> - *
> - * This function controls the start or stop of streaming for the
> - * imx274 sensor.
> - *
> - * Return: 0 on success, errors otherwise
> - */
>  static int imx274_s_stream(struct v4l2_subdev *sd, int on)
>  {
>         struct stimx274 *imx274 =3D to_imx274(sd);
> --=20
> 2.47.3
>
