Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0893C3F52;
	Wed, 15 Jul 2026 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138439; cv=none; b=gVkr1k+yGuduklT5n8IKwnDKtOE25o2r+HLFrWKFtYpvvSMpTA8eu86RFi4+xS5I88y7Rlmy+GUzrCe8q89fQcusRrxQdw6gfB/8n5lALPMjixPmq4vvkV+yjarKKeq55I/qn85FBFXDM2iyGc905BKK3tNqnJg5t1+0swtMlCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138439; c=relaxed/simple;
	bh=EWUG+zyynMbmEfBJjU10RCC3M9PgA4IBJueoMoIboIg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=brYoQdQ22LWeJgu79BBs+ZlzyE+XvEFP61ZEe7tpucpQL4A7VvrPLffdJezGf3nR3cebBXgNVJLPvXcxbM948RTP9lfFYvPqNnjpRJ4X3FCaqXCQZ8UwNDUqwRuXfWY3u2a1+j2NLtYiiDq6sRWcadKNVNUyQ4VYRgWOq7cyaY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QpgrnLI6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QpgrnLI6"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17742104C;
	Wed, 15 Jul 2026 19:59:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784138376;
	bh=EWUG+zyynMbmEfBJjU10RCC3M9PgA4IBJueoMoIboIg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QpgrnLI6TrcHa31tEO0OR7LNX+Y05btD7OQfSuyqdvsjoX79Zfznq3F6O6ke8E9sG
	 b9eGLi0okjtHD58KBX6C+RqQcmHH6fQOH+zkwuRlk6Nh4USVDgJ1TuR3rvXedUdurt
	 Vs/BzrheFMPYphY5+0/ovbgKny2X/01+N/f5/YLU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260715-imx708-v1-1-1f36f54e14d4@ideasonboard.com>
References: <20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com> <20260715-imx708-v1-1-1f36f54e14d4@ideasonboard.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add imx708 image sensor
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, David Plowman <david.plowman@raspberrypi.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 23:30:26 +0530
Message-ID: <178413842630.1426769.14095686086162764899@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Dave,=20

Quoting Jai Luthra (2026-07-15 23:01:28)
> Sony IMX708 is an 11.9 Megapixel CMOS sensor, that can output pixels
> over MIPI CSI-2 bus. Add bindings for it.
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx708.yaml | 120 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 127 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> new file mode 100644
> index 000000000000..bc346730e1f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx708.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX708 Sensor
> +
> +maintainers:
> +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> +  - Jai Luthra <jai.luthra@ideasonboard.com>
> +

[...]

> diff --git a/MAINTAINERS b/MAINTAINERS
> index febe918d6316..b0e3abfd88a9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25269,6 +25269,13 @@ S:     Maintained
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
>  F:     drivers/media/i2c/imx678.c
> =20
> +SONY IMX708 SENSOR DRIVER
> +M:     Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>

I've kept "kernel-list@raspberry.com" here from the downstream tree.

Given you maintain other sensors used by Raspberry Pi modules, let me know
in case you prefer I drop this or replace it with your email in v2.

Thanks,
    Jai

> +M:     Jai Luthra <jai.luthra@ideasonboard.com>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:     Maxim Levitsky <maximlevitsky@gmail.com>
>  M:     Alex Dubov <oakad@yahoo.com>
>=20
> --=20
> 2.54.0
>
