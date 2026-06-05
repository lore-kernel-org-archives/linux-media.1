Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B32C256C84
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698099; cv=none; b=EhTTsx+4rt8HlVlEeFMEcQj0eLI3wn1bPWXwpV3WCJ2nZVWxuYsW4EKzVCOS+hEOkEYhJ3ZXwvYW9JO+UcPbI+eEMxTXH57onjrOqneOPGeW0K5IUKblSxasJBk4rifTvIsMvSLsazs5wO0ydfnPOSRfGPLHuvVENnmdBqXJ2lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698099; c=relaxed/simple;
	bh=QdqZnCGVDYyovcL9g9YAQ0kiXwtRuZrd8KayjVwOtek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DzzSZ6zYXUGMktX91IZ4irGIs2EFQPKeqw8YjW4C0CGeDR0dcBlx4AIdOoSbZlyaGhyFZ3ZBpNcQwGXVXT124ZtP7K8amELKKc7sLJx5VCn5D0Sg4KaeiYKKgbq0LJYvjQyT6fB7xLGLAjK18NSscVFFfysNkjMq7BTOhruPCKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DII5j3R7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DII5j3R7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D571F00893;
	Fri,  5 Jun 2026 22:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780698098;
	bh=HZmEjA80Mdy47d9Afs5Uq99dHoDuc0gDCwW4fytz8iQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DII5j3R7mu2SvFLATWNKdYKwKxpM6XCWS55SX5H7q1HS9cj2SJ0oUprLzBaFtGPrA
	 JgIYiFV0/X5TKgHhBZQVPYrWFvMLE7XUJ8CPFO9Hdb4V7WigIMXj0vJ09AYCy7HFlj
	 RW4cW0LayfHXcJkybRJhSiOSjneqMzFOR+xhcPMNL2IB7rcRJ4xj+T2EEZuKXjEBIO
	 utZYasIZdQ8T9FNpd5xWeyh98LfXW3TtunaCVd4i/V2sX0j3gAGjTMZplEVnnZO/Tx
	 kMesBqZLlOcXSyrzhhpf/ik+nUdwKcjs/tWeU+o8EXPIdrbIaFjaTq/VQnOPFfIDZz
	 MYakWqjhk1w+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/17] media: rockchip: rga: move video device to the
 master
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606-spu-rga3multicore-v1-11-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-11-3ec2b15675f7@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:21:37 +0000
Message-Id: <20260605222138.04D571F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The master component bind function (`rga_bind`) fails to unbind pr=
eviously bound components when a subsequent V4L2 initialization step fails.
- [High] Improper coupling of component lifecycle and devres managed alloca=
tions leads to potential resource leaks or use-after-free upon master probe=
 failure.
- [Low] The `rga_core_bind` function uses an unregistered `v4l2_device` for=
 logging, resulting in a missing device name prefix.

Pre-existing issues:
- [High] The driver conditionally uses a shared interrupt (`IRQF_SHARED`) b=
ut lacks necessary PM runtime synchronizations, risking invalid hardware ac=
cess.
--

commit f2c043582ae1f347c444077ff268ed480a98b5bf
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: move video device to the master

This commit moves the video device allocation and registration to the master
component bind function. This prepares the driver for binding multiple cores
to the master device, ensuring the v4l2 device is only registered after all
cores have successfully bound.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 11912bf5b6906..952377ae467f5 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
[ ... ]
> @@ -789,33 +788,11 @@ static int rga_core_bind(struct device *dev, struct=
 device *master, void *data)
>  		goto err_put_clk;
>  	}
> =20
> -	ret =3D v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
> -	if (ret)
> -		goto err_put_clk;
[ ... ]
>  	ret =3D pm_runtime_resume_and_get(core->dev);
>  	if (ret < 0)
> -		goto rel_m2m;
> +		goto err_put_clk;

[Severity: High]
This is a pre-existing issue, but the driver appears to use IRQF_SHARED
conditionally for its interrupts. Does rga_isr() need to use
pm_runtime_get_if_active() to ensure the device is not runtime-suspended
before accessing hardware registers?

Additionally, does rga_runtime_suspend() need to call synchronize_irq()
before disabling clocks to prevent in-flight shared IRQs from executing
while hardware is powered down?

[ ... ]
> @@ -937,6 +892,7 @@ static struct platform_driver rga_core_pdrv =3D {
>  static int rga_bind(struct device *dev)
>  {
>  	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> +	struct video_device *vfd;
>  	int ret;
> =20
>  	ret =3D component_bind_all(dev, rga);
> @@ -945,11 +901,59 @@ static int rga_bind(struct device *dev)
>  		return ret;
>  	}
> =20
> +	ret =3D v4l2_device_register(dev, &rga->v4l2_dev);

[Severity: Low]
Since component_bind_all() executes rga_core_bind() before
v4l2_device_register() initializes rga->v4l2_dev.name, does the v4l2_info()
logging call inside rga_core_bind() end up printing an empty device name
prefix?

[Severity: High]
Since rga_core_probe() allocates the shared IRQ using devm_request_irq(),
the IRQ remains active and tied to the core device's devres lifecycle.

If rga_bind() returns an error, the master probe fails and its devres
unwinds, freeing the master's rga structure. If the shared IRQ fires
after this point, could rga_isr() trigger a use-after-free or NULL pointer
dereference when accessing core->rga?

[ ... ]
> +rel_m2m:
> +	v4l2_m2m_release(rga->m2m_dev);
> +rel_vdev:
> +	video_device_release(vfd);
> +unreg_v4l2_dev:
> +	v4l2_device_unregister(&rga->v4l2_dev);
> +	return ret;
>  }

[Severity: High]
If initialization fails at v4l2_device_register() or later, the function
jumps to these error paths. Should component_unbind_all() be called here
to prevent leaving the child cores in a bound state and leaking resources
acquired during their bind callbacks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-spu-rga3mu=
lticore-v1-0-3ec2b15675f7@pengutronix.de?part=3D11
