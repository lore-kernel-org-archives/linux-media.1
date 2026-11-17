Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953704;
	b=Q4nu9QP7htUROkuaXBUlXPwBjFFqckb0APiX+im+Ja0U2AD9zPo1wrXVq0HEV1z/5oTe
	 U7d8Hp7TZflxl2Jzucev8zWFC7jMDa/G64rie0xFlFokbQgig3ZSt5BA5CtstrQGtC4l2
	 eigOL1ctWqGZnqwqXFz6PwAg8oXe2iM41httQOb0iEIBt2SE8y/OPeje15y+9txoldwgN
	 0tniC+vaPUlH12JXYCd5ouq+vlaSjGyhJoxttBQaFDUKR7JSmQlmEQBnxEJjMug2oBnak
	 tLEDurS4b2ErZpE37vt6P81a+XQdH4e5SNr9na39oyf0ALtsBCZgsCOZeCUDl+09WYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953704;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=0ZGenTYhhhmk9ojD2HrCoiIy9IDBRXToYlx91iW/n0c=;
	b=na8BPoK12kETPOV2Gil/Iscjn+vzWggvonHO43Y+y1hLPKGBtmT54AEaLliSPiPyx4j0
	 bUQPBt2yMwBr0ttFBWKnbc3jzPfyHG6LN5BYRAWRA8DBcUs2d0c7bUzFQJF0F9dSs+qO+
	 NZ/mtb6a5I5qZzLLqlcJmPYhTKp26r+1rPS7RVXkLoF5WM35kIIXINbxuXQ3O29ylaWBV
	 apey41rEvK+tTFJco4OkCphUMFxBC2a+dGlPwK4iEPvNFE98zBpKbIHL1oC8y4yN30sjz
	 PaUaQ5oui1Fr23B3/XnRh8AKgmnwXSG3J8LQf7JEkNW5H4mSF7YzP7SV8l/ZV70TqWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Fqbr4M5D;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53010606A330;
	Tue, 17 Nov 2026 22:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53010606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Fqbr4M5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794953701;
	bh=Jp6lTkAnzzbNf+/NdEgoToYgR1t2Gdsu0x5UIbUA/nE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Fqbr4M5DcLUN5+ufNdjiUZjOBhaCCSlEQZ+Yf1cO8RIaW7C2nJPIRh4JFBfd+gAAw
	 dtUFSkJizDUyevdQ4gcppeM1HxCO/3WqUrLHt2hqAQTP1ia6KzleUf4qfOYaVs68Ll
	 d33ffm9Cyn098dBSEcH9xP9+lHt6CEwe1i0ksISb4XDPTB3GDUBipskl9nu8a+pguE
	 TMc2+5k52qz+cxDOXwV+dKVAH1ClvuQfGfEsogQMVWYbP7KB/S5yJtqhp0mz6spqmu
	 xJp2sq6x5VpGJtRy7UxD856oN3OeQAQrYB1Turb3zZzrfifuhp4s71sfXlcEPrBi51
	 duA6lrsvg9edA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F32717E0406;
	Tue, 17 Nov 2026 23:15:00 +0100 (CET)
Message-ID: <4e5f5669174657fdf3ae3298cc4eaecb5176bd30.camel@collabora.com>
Subject: Re: [PATCH v3 0/5] media: Add fdinfo support for v4l2 drivers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner	 <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, Christopher Healy <healych@amazon.com>
Date: Tue, 17 Nov 2026 17:14:59 -0500
In-Reply-To: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
References: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-SbHR3Iz8Jecq/hEvoD/N"
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

--=-SbHR3Iz8Jecq/hEvoD/N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 06 juillet 2026 =C3=A0 09:42 -0400, Detlev Casanova a =C3=A9crit=
=C2=A0:
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

Please rebase and address the CI issues please. Would be nice to have other
people comment.

https://gitlab.freedesktop.org/linux-media/users/patchwork/-/pipelines/1700=
504/

Nicolas

>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
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
>  drivers/media/platform/verisilicon/hantro.h        |   3 +
>  drivers/media/platform/verisilicon/hantro_drv.c    |  19 +++
>  drivers/media/platform/verisilicon/hantro_hw.h     |   1 +
>  .../platform/verisilicon/rockchip_vpu981_regs.h    |   1 +
>  .../media/platform/verisilicon/rockchip_vpu_hw.c   |   6 +
>  drivers/media/v4l2-core/Makefile                   |   2 +-
>  drivers/media/v4l2-core/v4l2-dev.c                 |  12 ++
>  drivers/media/v4l2-core/v4l2-fh.c                  |   3 +
>  drivers/media/v4l2-core/v4l2-metrics.c             |  78 ++++++++++++
>  include/media/v4l2-dev.h                           |   1 +
>  include/media/v4l2-fh.h                            |   2 +
>  include/media/v4l2-metrics.h                       |  47 +++++++
>  17 files changed, 461 insertions(+), 1 deletion(-)
> ---
> base-commit: 3c587e0b08bd3c4853a22792b9166b7457870165
> change-id: 20260610-v4l2-add-fdinfo-a790fceab329
>=20
> Best regards,
> -- =20
> Detlev Casanova <detlev.casanova@collabora.com>
>=20

--=-SbHR3Iz8Jecq/hEvoD/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzR4wAKCRDZQZRRKWBy
9C/0AP9RF0H01sdRh/eJRCsUAy8Q/aqr1DKXqin2GOcLmr/uzAEA9ouvtdSlhzQq
TSAuxOdPvh6OjRqo481dsz54XVxmIQc=
=aX0G
-----END PGP SIGNATURE-----

--=-SbHR3Iz8Jecq/hEvoD/N--
