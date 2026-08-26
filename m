Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75045399CF2;
	Wed, 26 Aug 2026 06:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787725220; cv=none; b=LTaKbOnaNF8i0vliddy7hZGIxQpta8rCGnd0ng1LgS2fyUHGEaL2KzRcE2QEeLs1Ew6qPYNAelaf4xJZ50j2LGAkEd6BAw8X0wztS6SYn7ijdgibguPvYPpWMPKm7sCOyHP4T5o4N614i/LEVBq1LLIeYa7vbgzcmLAjZEcrzw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787725220; c=relaxed/simple;
	bh=YkC2M9Z6OLWPb20rkX7wfM7sAKYsmRgYYuS2lgv8wXc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=N3LJ6RjqJQs2H+zcJGlSrjh1EtoNcbEvRLmbLhkG7c3Y3oFqcYuvZw4cYSuRFzD5o0fw18lpyAUyEe6u3l0HGVmRttWclS7GXGtxWN8KzfyyR9RDfGTYv4jqD19yRa7LyrzvBBqkO9KSX5PctmOsno70zuY25xJXi8iiUfWm+dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R1IAk/ad; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R1IAk/ad"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:56b2:8fe2:337f:8c01:dede])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBE6819C;
	Wed, 26 Aug 2026 08:18:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787725129;
	bh=YkC2M9Z6OLWPb20rkX7wfM7sAKYsmRgYYuS2lgv8wXc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=R1IAk/ad8JOOwRCfTS5wTXLCXTiFm54RngHgsUmAgSJr4Rhl/vBoEw37p9oTZcO23
	 ORaP5x8ctCd9/L14by3AGyDSh0jOUoZhIUVg/SVTGkMeoR0MZ2zjLYzovQCcetfddr
	 E2Vrsd44BLuzs7hiihQ3kaUyLQXTyKiC1S2WjKH8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260819-imx355-ccsify-v1-1-0b6cef77e340@ixit.cz>
References: <20260819-imx355-ccsify-v1-1-0b6cef77e340@ixit.cz>
Subject: Re: [PATCH RFC] media: imx355: reuse existing CCS defines
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, david@ixit.cz
Date: Wed, 26 Aug 2026 11:50:08 +0530
Message-ID: <178772520896.9142.15892216055046447878@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi David,

Quoting David Heidelberg via B4 Relay (2026-08-20 01:47:08)
> From: David Heidelberg <david@ixit.cz>
>=20
> The driver may not be MIPU CCS compliant, but does use same address and
> often set same values as compliant drivers. Do not define for every Sony
> imx* driver registers we already know and are standard.
>=20
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> I'm sending this as RFC, because we'll need to upstream at least 4 - 6
> drivers, which aren't compliant with MIPI CCS. Quirking these drivers in
> mipi-ccs would be pointless, thou we could at least simplify and unify
> what needs to be separate.
>=20

Indeed, while working on IMX708 I realized it was in the same bucket, and
ended up implementing a similar approach (of reusing register defines and
helpers from CCS).

> Thanks for the feedback, just did few lines for the idea how the final
> changes will look like. Anything ambiguous will be left as is.
> ---
>  drivers/media/i2c/imx355.c | 46 +++++++++++++++-------------------------=
------
>  1 file changed, 15 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 8eb8588cb71bb..57f7c70d18453 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -14,50 +14,34 @@
>  #include <linux/unaligned.h>
> =20
>  #include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
> =20
> -#define IMX355_REG_MODE_SELECT         CCI_REG8(0x0100)
> -#define IMX355_MODE_STANDBY            0x00
> -#define IMX355_MODE_STREAMING          0x01
> +#include "ccs/ccs-regs.h"
> =20
> -/* Chip ID */
> -#define IMX355_REG_CHIP_ID             CCI_REG16(0x0016)
>  #define IMX355_CHIP_ID                 0x0355
> =20
> -#define IMX355_REG_LANE_SEL            CCI_REG8(0x0114)
> -
>  /* PLL registers that depend on the external clock frequency */
>  #define IMX355_REG_EXTCLK_FREQ         CCI_REG16(0x0136)
>  #define IMX355_REG_PLL_OP_PREDIV       CCI_REG8(0x030d)
> -#define IMX355_REG_PLL_OP_MUL          CCI_REG16(0x030e)
>  #define IMX355_REG_PLL_IVT_PCK_DIV     CCI_REG8(0x0301)
>  #define IMX355_REG_PLL_IVT_SYSCK_DIV   CCI_REG8(0x0303)

I think rest of the PLL registers could also be reused here?

While they are defined as CCI_REG16, I think writing just a byte to it
should work okay.

You could also reuse the CCS PLL calculation helpers instead of hardcoding
the values.

[snip]

Thanks,
    Jai
