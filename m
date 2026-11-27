Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750172;
	b=QH67BOgacpvudWLLl20YmojfmR+1bRDS5ijJ9/tOQ09onB4kb3sxCQnyehQwy6YlXVYa
	 lP8dIihe0hP038Zp1Tff0ea1Yp1gen901i3lOSgSBSQ/xLZiLZUiYqG8g9DHBloet/Shv
	 7AZzFDXkvryORnTxmvgkGDxd9Z52nzYrgOBdJIPr2mDRaCHVrI6dUogywCyS1wpjQIeKn
	 HrjlGO9N5Ccqzqny2Lp19nbdE7r3bkdJ053MglrUru01XwPz2wZ5KWl1DWKMes35Ej3Pj
	 c70ZPwKyGhMdaAWYBW3FcNnkleVYjI4GfY53At2hWBtrAPtZfeiGVKhP5HewTaHxwaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750172;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=hBFZyIMzTpRCClztXW2d7H8DbxXWA8BTfhf8v4D8rVo=;
	b=qwq4Ln93OzFTjUccM7QlqKqESBFYnvvrgf6tn2uG59Z8x1f++/jD20lW2J1RQcU5yj8G
	 0KUg+esDnpoIuoVaJgoQl4ItuhXDkjJhgChQ70hM3gJYNTODiXwjveCjqHTPDzaogoAm8
	 aT4Jgx1jTN11mVuQ8Z2iABgb5WfZxzsUxCJgbu+zFfKLSerqLR/DN913oGMPe9eX4Efx5
	 y/IBvEzn72jzEMuRxG8qYG+uAPcDxKq0dOvgmlQxCnNFM5Xd0TFC8UhfwVZuk/+rpA92P
	 07M5h9O685bxIJ5FVc1nYX82f39JRjmXyqWbKAXnC6Nm7oSj/CyMvqTkMyROCbWaPDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=LU4wVOAW;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1667606A31C;
	Fri, 27 Nov 2026 03:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1667606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=LU4wVOAW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795750169;
	bh=6hgTPZ4zy0eISHNyVPO+zkIjKtXrw/0PSMG7EQRo1SE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LU4wVOAWnPKkeebBDv587cHKEP/uG+yyEJOIQrZ/KK0ctY2Nn/SKtC4Q9QxGoU74v
	 sRoc2XDxgbRGgiz+03OablSFVT92/FVhb21rpwbJ/Yj9BMkjwStjouTU/0cL9IBr2c
	 FRDUHyDqPW+8kRa9Y4Zn7szzwvE5txv1iTPR4DPFbznroeOwSLcI2lUvnq9MTrjC+3
	 wDS9QBkCsF5RVDem3PNmt+Jp80VWxqwJNm3e3ltoTTIfIiILqe3sKY3V/oT5ErVgJ3
	 noHe8Qhq5rxfaZk1DT68Qs7/9JSQqH4xhaCVyU/gJV97OFEztjstXZ8/q0+L56o51G
	 p18WuL1LYolHw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D54D17E02F2;
	Fri, 27 Nov 2026 04:29:27 +0100 (CET)
Message-ID: <4cfa6a26c53daa3ab188c1cf8251888d176c0045.camel@collabora.com>
Subject: Re: [PATCH v4 0/5] media: Add fdinfo support for v4l2 drivers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner	 <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, Christopher Healy <healych@amazon.com>
Date: Thu, 26 Nov 2026 22:29:26 -0500
In-Reply-To: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
References: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-VcyGQLmGUJ6o2ePG/wFB"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-VcyGQLmGUJ6o2ePG/wFB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Detlev,

This series have sufficient valid sashiko report to be worth making a v5.

Nicolas

Le mercredi 25 novembre 2026 =C3=A0 10:11 -0500, Detlev Casanova a =C3=A9cr=
it=C2=A0:
> fdinfo is useful to poll information from the driver.
> Unlike the ftrace interface, it lets userspace tools get a snapshot of
> the state of the driver at their own pace, instead of getting events for
> each driver status change.
>=20
> This works better to get information like HW usage time or clock
> frequencies, as well as memory usage.
> This patch set focuses on mem2mem drivers that are per-frame based and
> an implementation is proposed for the Verisilicon Hantro and Rockchip
> rkvdec drivers, limited to main clock frequency and HW usage time, as
> well as HW cycles counting in Hantro.
>=20
> Even though it is not used yet, per core fields are appended with=20
> `-<core_id>` to support multi-core drivers.
>=20
> To ease support in drivers, a v4l2_metrics struct is added.
> It stores metrics information and provides helper functions to write
> the fdinfo file in a standard way.
>=20
> An example of usage of this from userspace is implemented in v4l2top:
>=20
> https://github.com/cazou/v4l2top (Check the upstream branch)
>=20
> checkpatch.pl warning: The 2 arguments in the show_fdinfo callback
> definition are kept unnamed to match with the rest of the struct
> definition.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> Changes in v4:
> - Rebase on master branch
> - Add missing documenation fields
> - Fix missing indentation spaces
> - Link to v3: https://patch.msgid.link/20260706-v4l2-add-fdinfo-v3-0-d556=
568cf38e@collabora.com
>=20
> Changes in v3:
> - Rename the fdinfo key prefix from "media-" to "v4l2-", and "stats" to
>   "metrics"
> - Restructure the documentation to have mandatory and optional keys
> - Add core ID to fields
> - Add HW cycles count support
> - Add ABI documentation
> - Link to v2: https://patch.msgid.link/20260617-v4l2-add-fdinfo-v2-0-d298=
e98ce06a@collabora.com
>=20
> Changes in v2:
> - Simplify key/value pairs by removing repeated <eng> suffix
> - Add media type support
> - Add v4l2_stats helpers
> - Add support in rkvdec too
> - Link to v1: https://patch.msgid.link/20260612-v4l2-add-fdinfo-v1-0-7232=
11abc861@collabora.com
>=20
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Detlev Casanova <detlev.casanova@collabora.com>
> To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> To: Heiko Stuebner <heiko@sntech.de>
> Cc: kernel@collabora.com
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
>=20
> ---
> Christopher Healy (2):
>       docs: media: add documentation for V4L2 driver usage metrics
>       media: hantro: Add per-context fdinfo usage metrics
>=20
> Detlev Casanova (3):
>       media: v4l2: Add callback for show_fdinfo
>       media: v4l2-core: Add v4l2-metrics interface
>       media: rkvdec: Add per-context fdinfo usage metrics
>=20
>  Documentation/ABI/testing/procfs-fdinfo-v4l2       | 129 +++++++++++++++=
++++
>  .../userspace-api/media/drivers/index.rst          |   1 +
>  .../media/drivers/v4l2-usage-metrics.rst           | 137 +++++++++++++++=
++++++
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  19 +++
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |   1 +
>  drivers/media/platform/verisilicon/hantro.h        |   4 +
>  drivers/media/platform/verisilicon/hantro_drv.c    |  19 +++
>  drivers/media/platform/verisilicon/hantro_hw.h     |   1 +
>  .../platform/verisilicon/rockchip_vpu981_regs.h    |   1 +
>  .../media/platform/verisilicon/rockchip_vpu_hw.c   |   6 +
>  drivers/media/v4l2-core/Makefile                   |   2 +-
>  drivers/media/v4l2-core/v4l2-dev.c                 |  12 ++
>  drivers/media/v4l2-core/v4l2-fh.c                  |   3 +
>  drivers/media/v4l2-core/v4l2-metrics.c             |  78 ++++++++++++
>  include/media/v4l2-dev.h                           |   2 +
>  include/media/v4l2-fh.h                            |   3 +
>  include/media/v4l2-metrics.h                       |  47 +++++++
>  17 files changed, 464 insertions(+), 1 deletion(-)
> ---
> base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
> change-id: 20260610-v4l2-add-fdinfo-a790fceab329
>=20
> Best regards,
> -- =20
> Detlev Casanova <detlev.casanova@collabora.com>
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

--=-VcyGQLmGUJ6o2ePG/wFB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawj5FgAKCRDZQZRRKWBy
9J18AQDp3IR3pfQcKcnw6xF/dT5LdRqqiaES0m1nfecWo2kNDQD+PU71pmZPqO7l
9h7qqg6hjHADUqOEf75xVTKCdu68FQU=
=mSs1
-----END PGP SIGNATURE-----

--=-VcyGQLmGUJ6o2ePG/wFB--
