Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEA21C84DC;
	Wed,  3 Jun 2026 06:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469309; cv=none; b=o7EL5FJTvsYMPxQn3a8RHKi1fc0bpr7A7kxsS5H2e/GbzT1rTQHl93hmz3p+yw8+bQiVg5lOpfNw49EgR18ZBhp3/SrZqBc1EYLB0O3FzCSyHMHH3MsjrjMqHvm8bs2Aa162nsvyyKBV8/f77yAC4yELV6szu0pS9ahpqvrbLUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469309; c=relaxed/simple;
	bh=5k/c6VDEVBRdhrNJr2zMBa0bQcPXUXjROhDeuMYMBL4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=m4yZOE+UwhjYOSk17fFgv4y01xvbiZE4Xv8mA/u4GT1YDsEEnNko4JFZhvs7fgteVeKT6lbsFDxrzf0OewZfCBlmBhpQbL7mnfntYK5hb67qRRcjnh6RvSx9Crc6jA+cW02K3Lhn1wD/RK1tkaKvLHfkoZ09sb4pMvNG8Yuq3io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b1WT6sF5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b1WT6sF5"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 803C1DF3;
	Wed,  3 Jun 2026 08:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780469283;
	bh=5k/c6VDEVBRdhrNJr2zMBa0bQcPXUXjROhDeuMYMBL4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=b1WT6sF5L3UHoF+qviCSWaAPOP2lD4F5sKKcFpTel2EM9d1g17KoZyLMUy1yF/wiD
	 yyrCHguxL+ODDXnrII7WucqSKuEhlWn/Ea5kdgfUx4M0R0a/vvED+ERBaG7ZEzeNo7
	 YrE6DTLCHdlGiGBaz41A4fY1x8tTkJBUGuKPC6So=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
References: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
Subject: Re: [PATCH] media: bcm2835-unicam: Fix pipeline wrong validation for unpacked formats
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eugen Hristev <ehristev@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@redhat.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Scott Branden <sbranden@broadcom.com>
Date: Wed, 03 Jun 2026 12:18:20 +0530
Message-ID: <178046930079.1525445.16102733967737177325@freya>
User-Agent: alot/0.13.dev20+g31692a239

Hi Eugen,

Quoting Eugen Hristev (2026-05-20 21:07:00)
> The commit
> 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code associat=
ion")
> introduced a check to see whether the format requested is the same as the
> fourcc in the format list.
>=20
> However, this breaks the case when userspace requested an unpacked fourcc,
> e.g. RG10.
>=20
> Unicam can work with or without unpacking pixels, e.g. pRAA or RG10, depe=
nding
> on what userspace requests.
> In the unpacking case, a dedicated register is being set.
>=20
> If the userspace requests pRAA, this works, because the check validates t=
he
> pipeline:
>=20
> v4l2-ctl -d /dev/video0 --set-fmt-video=3Dwidth=3D3280,height=3D2464,pixe=
lformat=3DpRAA \
>  --stream-mmap --stream-count=3D1 --stream-to=3Dframe.raw
>=20
> but, with
> v4l2-ctl -d /dev/video0 --set-fmt-video=3Dwidth=3D3280,height=3D2464,pixe=
lformat=3DRG10 \
> --stream-mmap --stream-count=3D1 --stream-to=3Dframe.raw
>=20
> unicam complains at validation level:
>=20
> image: format mismatch: 0x300f <=3D> RG10 little-endian (0x30314752)
>=20
> This should work, because MEDIA_BUS_FMT_SRGGB10_1X10 can be packed into e=
ither
> RG10 or pRAA depending on the packing register.
>=20
> To fix this, modified the condition check to also allow in the case when
> requested format (fmt->pixelformat) is equal to fmtinfo->unpacked_fourcc.
>=20
> Fixes: 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code a=
ssociation")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/m=
edia/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..cc7627e9a51a 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2158,7 +2158,8 @@ static int unicam_video_link_validate(struct media_=
link *link)
>                  * In order to allow the applications using the old behav=
iour to
>                  * run, let's accept the old combination, but warn about =
it.
>                  */
> -               if (fmtinfo->fourcc !=3D fmt->pixelformat) {
> +               if (fmt->pixelformat !=3D fmtinfo->fourcc &&
> +                   fmt->pixelformat !=3D fmtinfo->unpacked_fourcc) {
>                         if ((fmt->pixelformat =3D=3D V4L2_PIX_FMT_BGR24 &&
>                              format->code =3D=3D MEDIA_BUS_FMT_BGR888_1X2=
4) ||
>                             (fmt->pixelformat =3D=3D V4L2_PIX_FMT_RGB24 &&
>=20

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
Jai

> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260520-bcmpi-2c4850314e21
>=20
> Best regards,
> -- =20
> Eugen Hristev <ehristev@kernel.org>
>=20
>
