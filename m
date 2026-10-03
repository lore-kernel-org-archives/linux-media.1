Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AB02882AB
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 20:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791059880; cv=none; b=K29eSlCT0k8qfvKe1+Rx3iR2683+8oy6nVAiHgyq6+9fo+zSUcPAt1mRjVSmz1xhemlGkSvrrVPdrsgJPNTB7gWe0qCSSravx+ZbboSq2cBGLWHUHAJpevH2I+ovYd3YgCy4x4m9+kFkvYlDPtOSL08yNeCCSM3zvy/XNCRRSNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791059880; c=relaxed/simple;
	bh=k2mTUTpUdMAFSqDKQLdBpRHYb2P/uyzM52lrqKTMx0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwEEbdFPizs1jYRikW15e5LTjkwUpcNrClkR+CCarBgGXqmHJ6zSEv7llpneBFc604XCWTXh2kJ3DSxzD0j9Cs+nEncXgtGoRvFhHwIj2Dewq29/E4xdzt1O6HAZlN2BWyMFoZEB7RpiLyrQIfzLyxYL7MytQ/YwGlCdPNhxsrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=IOLTODEu; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="IOLTODEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1791059870; bh=k2mTUTpUdMAFSqDKQLdBpRHYb2P/uyzM52lrqKTMx0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IOLTODEuikNTrfchifOgB2CjKP5Qh8gWca4QoCxGhL4z/50yl2Au3mogin2kBeVyj
	 SBWgk45TyAELvp/vv+UQU0JEGF+jJocI7nBCkDBjJJwWXQdr3LtgLmWoxtnp77Dnff
	 wwuZwxgP2qt/c1ulPzJnVpZUgmoljOQg6VT1YhYq1ie5w9MYZnWGFPOkLdwzVotuJI
	 YC2+WtsDWI8g/ac9nOratrS4XYQC77MG9e9tg454tqwNMs3tAOD9hi1+geusFfCOwI
	 eC1CEB5poBY2/L5ELsWFMO+BANaIF2+dHb0JOVnG2FGBhcf7sTaEcNDF4cAhHtpcRP
	 eClnE7P/zhrFQ==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id BF96C409E9; Sat, 03 Oct 2026 21:37:50 +0100 (BST)
Date: Sat, 3 Oct 2026 21:37:50 +0100
From: Sean Young <sean@mess.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH] rc: Add keymap for Ruwido Z3 RC-34 remote
Message-ID: <asFnnhXX67plUXU0@extorris.mess.org>
References: <20261003020309.11749-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003020309.11749-1-festevam@gmail.com>

On Fri, Oct 02, 2026 at 11:03:09PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Add keymap for the Ruwido Z3 RC-34 remote control.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
>  drivers/media/rc/keymaps/Makefile             |  1 +
>  .../media/rc/keymaps/rc-nec-ruwido-z3-rc34.c  | 80 +++++++++++++++++++
>  include/media/rc-map.h                        |  1 +
>  3 files changed, 82 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
> 
> diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> index 38b84e34b225..525d203c0a94 100644
> --- a/drivers/media/rc/keymaps/Makefile
> +++ b/drivers/media/rc/keymaps/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_RC_MAP) += \
>  			rc-msi-tvanywhere-plus.o \
>  			rc-mygica-utv3.o \
>  			rc-nebula.o \
> +			rc-nec-ruwido-z3-rc34.o \
>  			rc-nec-terratec-cinergy-xs.o \
>  			rc-norwood.o \
>  			rc-npgtech.o \
> diff --git a/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c b/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
> new file mode 100644
> index 000000000000..97d416cf0441
> --- /dev/null
> +++ b/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Keytable for the Ruwido Z3 RC-34 remote
> +
> +#include <media/rc-map.h>
> +#include <linux/module.h>
> +
> +static struct rc_map_table nec_ruwido_z3_rc34[] = {
> +	/* Ruwido Z3 RC-34, NECX address 0xe310 */
> +	{ 0xe3100f, KEY_POWER },
> +	{ 0xe31016, KEY_MENU },
> +	{ 0xe3100a, KEY_UP },
> +	{ 0xe3100b, KEY_DOWN },
> +	{ 0xe3100d, KEY_LEFT },
> +	{ 0xe3100c, KEY_RIGHT },
> +	{ 0xe31019, KEY_OK },
> +	{ 0xe3106a, KEY_BACK },
> +	{ 0xe31033, KEY_INFO },
> +	{ 0xe31066, KEY_DISPLAYTOGGLE },
> +	{ 0xe3101a, KEY_VOLUMEUP },
> +	{ 0xe31010, KEY_VOLUMEDOWN },
> +	{ 0xe31013, KEY_MUTE },
> +	{ 0xe31032, KEY_CHANNELUP },
> +	{ 0xe31031, KEY_CHANNELDOWN },
> +	{ 0xe31069, KEY_HP },
> +	{ 0xe31000, KEY_NUMERIC_1 },
> +	{ 0xe31001, KEY_NUMERIC_2 },
> +	{ 0xe31002, KEY_NUMERIC_3 },
> +	{ 0xe31003, KEY_NUMERIC_4 },
> +	{ 0xe31004, KEY_NUMERIC_5 },
> +	{ 0xe31005, KEY_NUMERIC_6 },
> +	{ 0xe31006, KEY_NUMERIC_7 },
> +	{ 0xe31007, KEY_NUMERIC_8 },
> +	{ 0xe31008, KEY_NUMERIC_9 },
> +	{ 0xe31030, KEY_NUMERIC_0 },
> +	{ 0xe31065, KEY_RED },
> +	{ 0xe31063, KEY_GREEN },
> +	{ 0xe31064, KEY_YELLOW },
> +	{ 0xe3106b, KEY_OPTION },
> +	{ 0xe31050, KEY_PLAY },
> +	{ 0xe31057, KEY_REWIND },
> +	{ 0xe31058, KEY_FASTFORWARD },
> +	{ 0xe31060, KEY_PROG1 },
> +	{ 0xe31061, KEY_PROG2 },
> +	{ 0xe31062, KEY_PROG3 },
> +
> +	/* RC-34 remote volume keys */
> +	{ 0x3506, KEY_VOLUMEUP },
> +	{ 0x3507, KEY_VOLUMEDOWN },
> +
> +	/* McIntosh HR070 remote volume keys */
> +	{ 0xca5542, KEY_VOLUMEUP },
> +	{ 0xca5543, KEY_VOLUMEDOWN },
> +};
> +
> +static struct rc_map_list nec_ruwido_z3_rc34_map = {
> +	.map = {
> +		.scan     = nec_ruwido_z3_rc34,
> +		.size     = ARRAY_SIZE(nec_ruwido_z3_rc34),
> +		.rc_proto = RC_PROTO_NEC,

RC_PROTO_NECX

> +		.name     = RC_MAP_NEC_RUWIDO_Z3_RC34,
> +	}
> +};
> +
> +static int __init init_rc_map_nec_ruwido_z3_rc34(void)
> +{
> +	return rc_map_register(&nec_ruwido_z3_rc34_map);
> +}
> +
> +static void __exit exit_rc_map_nec_ruwido_z3_rc34(void)
> +{
> +	rc_map_unregister(&nec_ruwido_z3_rc34_map);
> +}
> +
> +module_init(init_rc_map_nec_ruwido_z3_rc34)
> +module_exit(exit_rc_map_nec_ruwido_z3_rc34)
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Fabio Estevam <festevam@gmail.com>");
> +MODULE_DESCRIPTION("Ruwido Z3 RC-34 remote keytable");
> diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> index f167c37179c8..290919a7247e 100644
> --- a/include/media/rc-map.h
> +++ b/include/media/rc-map.h
> @@ -289,6 +289,7 @@ struct rc_map *rc_map_get(const char *name);
>  #define RC_MAP_MSI_TVANYWHERE_PLUS       "rc-msi-tvanywhere-plus"
>  #define RC_MAP_MYGICA_UTV3               "rc-mygica-utv3"
>  #define RC_MAP_NEBULA                    "rc-nebula"
> +#define RC_MAP_NEC_RUWIDO_Z3_RC34        "rc-nec-ruwido-z3-rc34"
>  #define RC_MAP_NEC_TERRATEC_CINERGY_XS   "rc-nec-terratec-cinergy-xs"
>  #define RC_MAP_NORWOOD                   "rc-norwood"
>  #define RC_MAP_NPGTECH                   "rc-npgtech"

We also need an entry for devicetree/bindings/media/rc.yaml

Thanks,

Sean
