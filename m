Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C303624C2;
	Wed, 24 Jun 2026 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306527; cv=none; b=YRJkx/y6MJ0qOUCj1Ag2ljHiAqTkrzfGYCHbAszANPUXp2IiKu4Rr/ShZ1Gr2N5av6knpYHwwWESHID2JVaz54rR7yvw5cXQx6Brhjh08WG8rTfsK7bGSz9IetxQqzJZ5zVV4a4MrtPp7Pj+yKBropYRFxnSxcNO82fyG1RQNYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306527; c=relaxed/simple;
	bh=CCuY1+mylfuXQ2RUE/4t7zQjpsEXoDIYCxY82xMIaiQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=LNwRSk2C7hgoXFOSl3/wHI9J0lwX7TTaAnP4uOKp5pAJLNSxXGkLjlxJPllg8Yjb9HoafRrI21Eo+KW2kkai4PzXVUTCu/e0+wfKmmSDcG21Rc5M2pp4C34GOijRDt6wiWI6ekP1M4UxbuLIn2TuefW2jC/NF+vkg2HEzZs5V2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i3tkFoZa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i3tkFoZa"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59B8B236;
	Wed, 24 Jun 2026 15:08:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782306483;
	bh=CCuY1+mylfuXQ2RUE/4t7zQjpsEXoDIYCxY82xMIaiQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i3tkFoZauGBIB/s/joSkMA+0rtAtfW+8DPYwwc6iwu2RqXYm12wtrbIr9aP8ny9xs
	 O0lWZdsfFs4z6R5JfH6lB6aFCahR3TR5TagWt874WXehSRXWwGGGt5xrLA70T6ae/S
	 p91rxBMkEkP7SEhvW0EC3uAsuaouArxCgSFwBUug=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260624033508.27391-4-hpa@redhat.com>
References: <20260624033508.27391-1-hpa@redhat.com> <20260624033508.27391-4-hpa@redhat.com>
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kate Hsuan <hpa@redhat.com>
To: Damjan Georgievski <gdamjan@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh <serin.yeh@intel.com>, Tarang Raval <tarang.raval@siliconsignals.io>
Date: Wed, 24 Jun 2026 14:08:40 +0100
Message-ID: <178230652068.3075020.18062205400239666843@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi Kate,

Quoting Kate Hsuan (2026-06-24 04:35:08)
> Add a new driver for Sony imx471 camera sensor. It is based on
> Jimmy Su <jimmy.su@intel.com> implementation and the driver can be found
> in the following URL.
> https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/im=
x471.c
>=20
> This sensor can be found on Lenovo X1 Carbon G14, X9-14 and X9-15 laptops
> and it is a part of IPU7 solution. The driver was tested on Lenovo X1
> Carbon G14, X9-14 and X9-15 laptops.
>=20
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---

... <snip>

> +#define IMX471_REG_EXCK_FREQ                   CCI_REG16(0x0136)
> +#define IMX471_EXCK_FREQ(n)                    ((n) * 256)     /* n in M=
Hz */
>=20

<snip>

> +
> +static const struct cci_reg_sequence imx471_global_regs[] =3D {
> +       { IMX471_REG_EXCK_FREQ, IMX471_EXCK_FREQ(19.2) },


Does this work? Is this a compile time constant multiplying floating
point with the compiler, or something happening in the kernel?

I'll be happy if it does, but it catches my attention as something I
thought we couldn't do.

--
Kieran
