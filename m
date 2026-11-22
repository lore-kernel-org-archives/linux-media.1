Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.243.27.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380363;
	b=fWwxqDHR2UfCWMZuBC66XINPF8FH7kztUwzwQyNPwe2T6HeGaJBPCTvCkqFS7eQjTvlu
	 7G1yjk1jvkdFYfk+Q9Fw0z8t3bKDTBKHpqj2GMGtTURnbFnZiSCvBcYGoL59ywXoFodV6
	 /AczN7MBhInO+6fjdfT711VnphhP5xTJgkbUSfq/vLwKB+hU6PsbA1lezM9AvBh2CzQLZ
	 KT95nfOIeXk/WC8x0nakhbuklCgAZhIWU9z62uCPgaxAelkRR6FNzSexg6A83DMpA4ACj
	 ZwqPis4l+8A6R6fISzpnDp5X5wARUNGH74+yQ0e8eAqgTUdolYfA4cB+uRgaPleGMOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380363;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=r0pq03pbZTXIuJBoHRgYc0ck8lyzjEHfUvyP9RtMNj4=;
	b=kZQAmGa7xVe6HJDVa+ad9dodrGM8S1osX4w6rwpT+HBX88cTta+ttuaqziq2221Um+lx
	 xzyW1OaMf+Bi8ElFhbIx+VRspQbnZzCnYmI3umf6aRbYOeDXL1B2M+f1B8AQLwnRPXh3c
	 zlDv13xJYwc+yVOeFIZJOZntyBaD2sYiPcJExT2y/shwYNfBEfY5BaP5lOz1SN5IKWLzD
	 AeFEoRPkQVN8Ruuz7e+F+I907j3d+d8+o2sGNSlTO9yCDDzKk5W8Z91SdHpDh9oXUUeKR
	 QTjfvusH9Z9TbUg18f5BiP5Cwkw6/MOuWi7Rsz02EwpgZONcXvMt8pBTqIPm+zMX0Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mess.org;
	spf=pass smtp.mailfrom=mess.org;
	dkim=pass header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=IRveC386;
	arc=none smtp.remote-ip=92.243.27.206
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F54606A31D;
	Sun, 22 Nov 2026 20:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F54606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mess.org header.i=@mess.org header.a=rsa-sha256 header.s=2020 header.b=IRveC386
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1795380360; bh=Dqafq+lPIh7TL8+bt692my7vJhcK4oDNzgXGaeDpzNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRveC386cYXHh2DtYqESsr53zNa3sQi42NtNWdBG85RFQPytWkovqjttmNPlR5Spi
	 SCLKWXf8Me1xr9rzPxJCTQUbNaCCVStvSOAWrljPFIcwM3SHxiQIt0s2pPMPIe+Fba
	 XN+0jwL1dz0PT6t9XcE/il+FbCRvD3Mw2WqLppzjrArbpWF4Hsz1QS/Z496zwp+YYF
	 t3wuRfCklp67jpz6sEkK+KPnALpvA6WNqS2FGdLymRsBsLYsYv41veF9uhnkhXeggC
	 fh4DR5erefYcM9G3uso+LEQ+3+WKY1yIlEKv5Y63p0H5WmZt7yd6k4wviHYI1XJIHY
	 5ZudeV6vBvnyQ==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 8066C41828; Sun, 22 Nov 2026 20:46:00 +0000 (GMT)
Date: Sun, 22 Nov 2026 20:46:00 +0000
From: Sean Young <sean@mess.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH v3 2/2] media: rc: Add keymap for Ruwido Z3 RC-34 remote
Message-ID: <awNUiFvhjdaz9BXl@extorris.mess.org>
References: <20261004121931.6746-1-festevam@gmail.com>
 <20261004121931.6746-2-festevam@gmail.com>
 <CAOMZO5DFgk66C=+eNepzWwrNHa-t8KQ47wstPZRGW+tf548rOQ@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5DFgk66C=+eNepzWwrNHa-t8KQ47wstPZRGW+tf548rOQ@mail.gmail.com>

On Fri, Nov 20, 2026 at 06:16:12PM -0300, Fabio Estevam wrote:
> Hi Sean,
> 
> On Sun, Oct 4, 2026 at 9:19 AM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > From: Fabio Estevam <festevam@nabladev.com>
> >
> > Add keymap for the Ruwido Z3 RC-34 remote control.
> >
> > Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> > ---
> > Changes since v2:
> > - None.
> 
> A gentle ping.

Sorry about the delay. It's now been merged into media-committers/next

Thanks

Sean

> 
> >
> > Changes since v1:
> > - Use RC_PROTO_NECX. (Sean)
> > - Use media prefix in the Subject.
> >
> >  drivers/media/rc/keymaps/Makefile             |  1 +
> >  .../media/rc/keymaps/rc-nec-ruwido-z3-rc34.c  | 80 +++++++++++++++++++
> >  include/media/rc-map.h                        |  1 +
> >  3 files changed, 82 insertions(+)
> >  create mode 100644 drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
> >
> > diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> > index 38b84e34b225..525d203c0a94 100644
> > --- a/drivers/media/rc/keymaps/Makefile
> > +++ b/drivers/media/rc/keymaps/Makefile
> > @@ -86,6 +86,7 @@ obj-$(CONFIG_RC_MAP) += \
> >                         rc-msi-tvanywhere-plus.o \
> >                         rc-mygica-utv3.o \
> >                         rc-nebula.o \
> > +                       rc-nec-ruwido-z3-rc34.o \
> >                         rc-nec-terratec-cinergy-xs.o \
> >                         rc-norwood.o \
> >                         rc-npgtech.o \
> > diff --git a/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c b/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
> > new file mode 100644
> > index 000000000000..8a090772446d
> > --- /dev/null
> > +++ b/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
> > @@ -0,0 +1,80 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +//
> > +// Keytable for the Ruwido Z3 RC-34 remote
> > +
> > +#include <media/rc-map.h>
> > +#include <linux/module.h>
> > +
> > +static struct rc_map_table nec_ruwido_z3_rc34[] = {
> > +       /* Ruwido Z3 RC-34, NECX address 0xe310 */
> > +       { 0xe3100f, KEY_POWER },
> > +       { 0xe31016, KEY_MENU },
> > +       { 0xe3100a, KEY_UP },
> > +       { 0xe3100b, KEY_DOWN },
> > +       { 0xe3100d, KEY_LEFT },
> > +       { 0xe3100c, KEY_RIGHT },
> > +       { 0xe31019, KEY_OK },
> > +       { 0xe3106a, KEY_BACK },
> > +       { 0xe31033, KEY_INFO },
> > +       { 0xe31066, KEY_DISPLAYTOGGLE },
> > +       { 0xe3101a, KEY_VOLUMEUP },
> > +       { 0xe31010, KEY_VOLUMEDOWN },
> > +       { 0xe31013, KEY_MUTE },
> > +       { 0xe31032, KEY_CHANNELUP },
> > +       { 0xe31031, KEY_CHANNELDOWN },
> > +       { 0xe31069, KEY_HP },
> > +       { 0xe31000, KEY_NUMERIC_1 },
> > +       { 0xe31001, KEY_NUMERIC_2 },
> > +       { 0xe31002, KEY_NUMERIC_3 },
> > +       { 0xe31003, KEY_NUMERIC_4 },
> > +       { 0xe31004, KEY_NUMERIC_5 },
> > +       { 0xe31005, KEY_NUMERIC_6 },
> > +       { 0xe31006, KEY_NUMERIC_7 },
> > +       { 0xe31007, KEY_NUMERIC_8 },
> > +       { 0xe31008, KEY_NUMERIC_9 },
> > +       { 0xe31030, KEY_NUMERIC_0 },
> > +       { 0xe31065, KEY_RED },
> > +       { 0xe31063, KEY_GREEN },
> > +       { 0xe31064, KEY_YELLOW },
> > +       { 0xe3106b, KEY_OPTION },
> > +       { 0xe31050, KEY_PLAY },
> > +       { 0xe31057, KEY_REWIND },
> > +       { 0xe31058, KEY_FASTFORWARD },
> > +       { 0xe31060, KEY_PROG1 },
> > +       { 0xe31061, KEY_PROG2 },
> > +       { 0xe31062, KEY_PROG3 },
> > +
> > +       /* RC-34 remote volume keys */
> > +       { 0x3506, KEY_VOLUMEUP },
> > +       { 0x3507, KEY_VOLUMEDOWN },
> > +
> > +       /* McIntosh HR070 remote volume keys */
> > +       { 0xca5542, KEY_VOLUMEUP },
> > +       { 0xca5543, KEY_VOLUMEDOWN },
> > +};
> > +
> > +static struct rc_map_list nec_ruwido_z3_rc34_map = {
> > +       .map = {
> > +               .scan     = nec_ruwido_z3_rc34,
> > +               .size     = ARRAY_SIZE(nec_ruwido_z3_rc34),
> > +               .rc_proto = RC_PROTO_NECX,
> > +               .name     = RC_MAP_NEC_RUWIDO_Z3_RC34,
> > +       }
> > +};
> > +
> > +static int __init init_rc_map_nec_ruwido_z3_rc34(void)
> > +{
> > +       return rc_map_register(&nec_ruwido_z3_rc34_map);
> > +}
> > +
> > +static void __exit exit_rc_map_nec_ruwido_z3_rc34(void)
> > +{
> > +       rc_map_unregister(&nec_ruwido_z3_rc34_map);
> > +}
> > +
> > +module_init(init_rc_map_nec_ruwido_z3_rc34)
> > +module_exit(exit_rc_map_nec_ruwido_z3_rc34)
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Fabio Estevam <festevam@gmail.com>");
> > +MODULE_DESCRIPTION("Ruwido Z3 RC-34 remote keytable");
> > diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> > index f167c37179c8..290919a7247e 100644
> > --- a/include/media/rc-map.h
> > +++ b/include/media/rc-map.h
> > @@ -289,6 +289,7 @@ struct rc_map *rc_map_get(const char *name);
> >  #define RC_MAP_MSI_TVANYWHERE_PLUS       "rc-msi-tvanywhere-plus"
> >  #define RC_MAP_MYGICA_UTV3               "rc-mygica-utv3"
> >  #define RC_MAP_NEBULA                    "rc-nebula"
> > +#define RC_MAP_NEC_RUWIDO_Z3_RC34        "rc-nec-ruwido-z3-rc34"
> >  #define RC_MAP_NEC_TERRATEC_CINERGY_XS   "rc-nec-terratec-cinergy-xs"
> >  #define RC_MAP_NORWOOD                   "rc-norwood"
> >  #define RC_MAP_NPGTECH                   "rc-npgtech"
> > --
> > 2.43.0
> >
