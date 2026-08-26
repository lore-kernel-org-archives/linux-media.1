Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD218382381
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787726472; cv=none; b=Tw12iyfvvhy9kI9x4SQoPiizY3aRHVa43KHbgSZynCt40B1PCO5oRa1C9GItCFLh/J2TEqWe/dt2TWXQiHU0CILRwdE9MgsBDNwU/9wa+beUn22Ed1m0Drp8X60nn7OMPLy58IOlL/TcrILyIFSmTSlRYqZ4SDn+nErNS2fxsHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787726472; c=relaxed/simple;
	bh=C9QeB6DhuNjtZTJNDqffp3R/CmaQBdAokFHLWfpLQvE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=U58eAHXax5VDQXfMUJRPfNS7H3JKs/3lT7G8ICKL9i15bHVf4vSZTGe6RHzg2rCOwGrrqDT0YG82yXhirHADRcZJ2sG6OgloLzhd200Jp3yGeo0oBQCkBCS8PUrDHJOUbGhDcbN0Jo3EhuAz0KINTQ4NrdtRXRN+yFTKN2Vfr6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oZpZlGnQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oZpZlGnQ"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:56b2:8fe2:337f:8c01:dede])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73A7519C;
	Wed, 26 Aug 2026 08:39:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787726382;
	bh=C9QeB6DhuNjtZTJNDqffp3R/CmaQBdAokFHLWfpLQvE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oZpZlGnQUt5CCu6rEYTxqHlpZa9tqpw4Yljq9+7BPVckGdNe6B7WDU5VDGGvzTPrQ
	 HHctU1nvTLlppGUmjZQ1DxzId/i/WE8wd7aypHhZnXl71e7CEM5E6CUoBPXgQ6lKpk
	 YfuQ7WR1y/Bg8hnHbDlrTxdmJ99PW0v3Pp4iYSQU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260824121451.3348583-14-sakari.ailus@linux.intel.com>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-14-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 13/29] media: cdn-csi2rc: media: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Wed, 26 Aug 2026 12:11:02 +0530
Message-ID: <178772646263.9142.14766414512535562167@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Sakari Ailus (2026-08-24 17: 44:35)
> [PATCH v3 13/29] media: cdn-csi2rc: media: Use v4l2_subdev_get_frame_desc=
_passthrough_csi2()

s/cdn-csi2rc/cdns-csi2rx

With that,
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai

> Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to allow
> compatibility with drivers that do not implement get_frame_desc() pad op.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media=
/platform/cadence/cdns-csi2rx.c
> index 1ff2d8f78d5b..e31cdcd9ce8e 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -722,7 +722,7 @@ static const struct v4l2_subdev_pad_ops csi2rx_pad_op=
s =3D {
>         .enum_mbus_code         =3D csi2rx_enum_mbus_code,
>         .get_fmt                =3D v4l2_subdev_get_fmt,
>         .set_fmt                =3D csi2rx_set_fmt,
> -       .get_frame_desc         =3D v4l2_subdev_get_frame_desc_passthroug=
h,
> +       .get_frame_desc         =3D v4l2_subdev_get_frame_desc_passthroug=
h_csi2,
>         .set_routing            =3D csi2rx_set_routing,
>         .enable_streams         =3D csi2rx_enable_streams,
>         .disable_streams        =3D csi2rx_disable_streams,
> --=20
> 2.47.3
>
