Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E400444AB8A;
	Wed, 22 Jul 2026 06:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700508; cv=none; b=CxC5qZTMpcknpmO8yFzhtNFDwclqMiyl2CwD44cvkqWr+8KjusuV0UFHSTPUzhpGDc4nQTZ2dkUkeOKfuvUDT9FLmdi1HNqqYNGKcnH1blqPNGRYgdEQ92YVm5LGZBPsEo3SzyRipCBYuMjI11WJ/sbUMBp7g+K0FLAPqR43cpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700508; c=relaxed/simple;
	bh=yV9F3Gcxct4fnuaXcTvPjWSQU4FqHzL+1EHR69UeMAg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VZ7BKQzwIPOLa80A1JMCSOlwSJgD7ONinMb1PY2xAlwpsagZQ7ZQYSPlhm4AP0GCMAyT6Do3JgK9d9Q/1vYiinkcdAzWPGrBYO8ceEBCuOGRls4wwxpsMZsqi/7dyn2tuRLGQ1uDPYCU9cdrv4ucrQx1mxZpBy3XQM3FB1jndzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=up/TtpdR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="up/TtpdR"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62C05838;
	Wed, 22 Jul 2026 08:07:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784700445;
	bh=yV9F3Gcxct4fnuaXcTvPjWSQU4FqHzL+1EHR69UeMAg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=up/TtpdRl3hz1AL6Iy5pn5jNqkISP71SyEt7iNkpivBGL0ouDMgznuYomfEJxSnNc
	 zpSIA4Nb0wWdToo+sW4fg2ho25Y0Z6mpUwb91VavuY6gAwZBFgox3xdqn6P+LBV6Gn
	 vhNm7xNfb4v9dW2zUEZQSY1GTqHHy1Ex5Op0dmoM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260718200912.16001-17-tarang.raval@siliconsignals.io>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io> <20260718200912.16001-17-tarang.raval@siliconsignals.io>
Subject: Re: [PATCH v3 16/17] media: i2c: os05b10: Enable runtime PM autosuspend
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Tarang Raval <tarang.raval@siliconsignals.io>, mehdi.djait@linux.intel.com, sakari.ailus@linux.intel.com
Date: Wed, 22 Jul 2026 11:38:20 +0530
Message-ID: <178470050057.3005206.9371104705812276156@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Tarang,

Quoting Tarang Raval (2026-07-19 01:39:07)
> Use pm_runtime_put_autosuspend() instead of pm_runtime_put()
> to allow autosuspend. Set a 1000ms autosuspend delay.
>=20
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/os05b10.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 59097eb96561..b4dd3137ad5c 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -1057,7 +1057,7 @@ static int os05b10_enable_streams(struct v4l2_subde=
v *sd,
>         return 0;
> =20
>  err_rpm_put:
> -       pm_runtime_put(os05b10->dev);
> +       pm_runtime_put_autosuspend(os05b10->dev);
> =20
>         return ret;
>  }
> @@ -1077,7 +1077,7 @@ static int os05b10_disable_streams(struct v4l2_subd=
ev *sd,
>         __v4l2_ctrl_grab(os05b10->vflip, false);
>         __v4l2_ctrl_grab(os05b10->hflip, false);
> =20
> -       pm_runtime_put(os05b10->dev);
> +       pm_runtime_put_autosuspend(os05b10->dev);
> =20
>         return 0;
>  }
> @@ -1455,6 +1455,8 @@ static int os05b10_probe(struct i2c_client *client)
> =20
>         pm_runtime_set_active(os05b10->dev);
>         pm_runtime_enable(os05b10->dev);
> +       pm_runtime_set_autosuspend_delay(os05b10->dev, 1000);
> +       pm_runtime_use_autosuspend(os05b10->dev);

These two calls are easier to understand (for both humans and sashiko)
moved to the end of the probe, when you're done configuring the sensor and
call pm_runtime_idle().

Thanks,
    Jai

> =20
>         ret =3D v4l2_async_register_subdev_sensor(&os05b10->sd);
>         if (ret < 0) {
> --=20
> 2.34.1
>=20
>
