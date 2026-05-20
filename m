Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE26D3E9589;
	Wed, 20 May 2026 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287135; cv=none; b=EKUPp1WSHBU/VQTLS7WA7fTNEce0FPRxoaPrkjDRd98NOon5Zs+tc8hxGQDAm6pPGHLrDgvGW+zC0qfID8mDxj6ApGv9RkJgTO9Z1xyBBtcg8Z52i2m8m5POpXHzuZkHjyXVDH3DH1YD0lEFJLNEZFbwHgkJKhM8n/Da6fvRNlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287135; c=relaxed/simple;
	bh=W5Q270lT9n8aFetGo2fs+nPE15ogCp7ggK8Gm1VUA/4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=AMb/PRKknV+nBKixM8EAT1zwDURNZtSLGkXpoHJZXQTgSOWGpaoG03VZ804RUYavcOVatpdVt1V544wQKu4s2CLmvOJBqfyAreseZtWlbg1bxc+xfGEJa0HCFCj0KDk/NPn6OW0RYh6KJsMippGsmgNoF2SfAY0MYAwHolnfLHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BybcTaH7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BybcTaH7"
Received: from mail.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:ad48:920a:da6f:a034])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EE16D52;
	Wed, 20 May 2026 16:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779287117;
	bh=W5Q270lT9n8aFetGo2fs+nPE15ogCp7ggK8Gm1VUA/4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BybcTaH7Qb0CWcD/8BfbBDo7+9P4Cv185y/KSGYJSLWWpkFhTYzeC07d6UZqwAgVK
	 R3K34sVKST6chifzEj15T2HglZqJuKy/Y8Y5f/GZhh8C4c/FJZ3fi2LpTXClV2F6qH
	 6euB5GVfD0dPKX/qhoKrOGlHFpGH14JoCszVXrOM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260520120022.539913-10-r-donadkar@ti.com>
References: <20260520120022.539913-1-r-donadkar@ti.com> <20260520120022.539913-10-r-donadkar@ti.com>
Subject: Re: [PATCH v13 09/17] media: cadence: csi2rx: Add .get_frame_desc op
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Wed, 20 May 2026 16:25:27 +0200
Message-ID: <177928712705.2341049.8633476644742279288@selene>
User-Agent: alot/0.12.dev70+g31692a239

Quoting Rishikesh Donadkar (2026-05-20 14:00:14)
> The cdns-csi2rx subdev passes streams through without any
> modification
>=20
> Use v4l2_subdev_get_frame_desc_passthrough() helper and add the
> .get_frame_desc op
>=20
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media=
/platform/cadence/cdns-csi2rx.c
> index 2b25314ba6ab..bba0e4c0a34d 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -617,6 +617,7 @@ static const struct v4l2_subdev_pad_ops csi2rx_pad_op=
s =3D {
>         .set_fmt        =3D csi2rx_set_fmt,
>         .enable_streams         =3D csi2rx_enable_streams,
>         .disable_streams        =3D csi2rx_disable_streams,
> +       .get_frame_desc =3D v4l2_subdev_get_frame_desc_passthrough,
>  };
> =20
>  static const struct v4l2_subdev_core_ops csi2rx_core_ops =3D {
> --=20
> 2.34.1
>
