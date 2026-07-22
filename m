Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28032E737D;
	Wed, 22 Jul 2026 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700357; cv=none; b=KvIUELJ8uLD20dTT2NQORNj25JG96ppfKrrSY2z6p7N1iQsvVAjos+7uCtD2DRXj72HD0hkbH6yS5OnF3Yqlu1nME7qdwJwIqIDHpBWtGCPVaqwd/TbfIElNwdgHR4btPV407JjoKaeB43k2Ym4ldOwtlZb6ryiwj5XzD7Q/A7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700357; c=relaxed/simple;
	bh=EzcPdqp9whYHVE0fORYvQiagMk6XjZGQN8H/OaeWsXs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=DwOvPlEJOZdvw3hXQ7mCpwQo5Uo1HFrbnZaTe6EhjrUC7JbTfLmirqlVyd4bgYn2/z7EyOpVzZv9dwmwWIbEHxqCsBJdfHgRxXUt+42kRxnePim2uJ7FrlAuXYuBKkKUDGS9tC3SYF3ZiAj+oz9hruFlluIi/xrZRmzCTtxwxXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=olQhLDm4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="olQhLDm4"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAE4D838;
	Wed, 22 Jul 2026 08:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784700294;
	bh=EzcPdqp9whYHVE0fORYvQiagMk6XjZGQN8H/OaeWsXs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=olQhLDm4y6+BeHrZb4YEiqUJyTFC++OdNBosMVMfnC1FV3vluo5xEeixlid7fXUvG
	 +B5SY4SQpkqXOnrHtP1+i3V/N8UVUkQUZQLRHqLQcGTvAKmnkMx5pElNrDJ2Gbwbpl
	 XIP6ziaqfi6fgr+7FCDbWJFl9uhBZblUsZbjd3A8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260718200912.16001-11-tarang.raval@siliconsignals.io>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io> <20260718200912.16001-11-tarang.raval@siliconsignals.io>
Subject: Re: [PATCH v3 10/17] media: i2c: os05b10: Add 1080p and 2x2 binning 720p modes
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Tarang Raval <tarang.raval@siliconsignals.io>, mehdi.djait@linux.intel.com, sakari.ailus@linux.intel.com
Date: Wed, 22 Jul 2026 11:35:48 +0530
Message-ID: <178470034863.3005206.5742979563537645286@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Tarang,

Quoting Tarang Raval (2026-07-19 01:39:01)
> Add support for 1920x1080 and 1280x720 resolutions.
> The 1280x720 mode uses 2x2 binning.
>=20
> Both 10-bit and 12-bit pixel formats are supported.
>=20
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/os05b10.c | 120 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>=20
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 3fd788bd8b20..c54b466656aa 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -460,6 +460,78 @@ static const struct cci_reg_sequence mode_2592_1944_=
regs[] =3D {
>         { CCI_REG8(0x4837), 0x12 },
>  };
> =20
> +static const struct cci_reg_sequence mode_1920_1080_regs[] =3D {
> +       { OS05B10_REG_X_ADDR_START,     0x0280 },
> +       { OS05B10_REG_Y_ADDR_START,     0x01b4 },
> +       { OS05B10_REG_X_ADDR_END,       0x0a0f },
> +       { OS05B10_REG_Y_ADDR_END,       0x05f3 },
> +       { OS05B10_REG_X_OUTPUT_SIZE,    0x0780 },
> +       { OS05B10_REG_Y_OUTPUT_SIZE,    0x0438 },
> +       { OS05B10_REG_HTS,              0x06d0 },
> +       { OS05B10_REG_ISP_X_WIN,        0x0008 },
> +       { OS05B10_REG_ISP_Y_WIN,        0x0008 },
> +       { OS05B10_REG_X_INC_ODD,        0x01 },
> +       { OS05B10_REG_X_INC_EVEN,       0x01 },
> +       { OS05B10_REG_Y_INC_ODD,        0x01 },
> +       { OS05B10_REG_Y_INC_EVEN,       0x01 },

Mode-based sensor drivers are the last option, especially if the sensor has
known registers for configuring the crop size, which seems to me is
possible here?

There's the new common raw sensor model in the works too, which can even
handle separate userspace configuration for analogue and digital crop,
subsampling (INC_ODD/INC_EVEN), binning and output size.

Could you please explore that? Adding hard-coded modes would make this
driver a mess when we move to the new model.

Thanks,
    Jai
