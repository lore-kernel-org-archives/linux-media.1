Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C94E1CAA68;
	Thu, 16 Jul 2026 01:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784163844; cv=none; b=MUU77rPKqN0ZLmzRLd6g++oVD9hk2sNiJ3TFEBTJwZB3jMZffN4nMGZ0n5Kyc6uv6mLtq8eWYMZHpAhIwHfcu2owu+q+ILgJpk4Ov00748NzcXRdKXs2V3lGvPSs1nMjhjd5HikQ7Ouxd6W6INSUAns1aPjdzYT/CZu7wQRYQaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784163844; c=relaxed/simple;
	bh=rSe+LFDEd1+7MVvJ6Ye1PPXVlpLL+WpvrRc7nkPwrTE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tFv83cRuckqNaBY3MOZH3GIuwibEpClwEyWNaeB+LmohIq6aELOhkVLmc0jATU9e06nLKlOESvShB+h8B3ahLNa/qkD+n/EB26k+tyMOdlyBGJVLLBG7XNkH9mFqyeRhuymzRIyrsslJY5XDPxcYKmvwRUbvziHKuRpqZF1HNbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ouqd2DeR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ouqd2DeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784163840;
	bh=rSe+LFDEd1+7MVvJ6Ye1PPXVlpLL+WpvrRc7nkPwrTE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Ouqd2DeRRCdofNLDroEbBMpA4misDE6oXwmUyWW6Vk4XoIEpxHOcW6ud2Gd0NTkyo
	 J0kuoLLO/dNGI9IHkLUeP5+i4CX7WNxDfbmbdqbsWIhSSIldq5KKruHi4GHkxGqGh1
	 FJ3LzOyZPfxjALWA0VptgHYm0u7VSgFWCe7b0o5n7e+h8jVHnqzx7obqSkYUTfS8sn
	 xlwijR2/hjIRXn2QNpHBQfA+Y8viNgTlJGmsfYjB5+J/wAEJd9JUKCyQZyN4GSGHpx
	 QZDLjtpv0Wwox5598DENOAA4KSzebuJ4Spf1hXiKZMNycopmWXFtuLn94o58XTkXIC
	 Yp6wlQtLzaeoA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D60B717E0D7E;
	Thu, 16 Jul 2026 03:03:58 +0200 (CEST)
Message-ID: <90c559a54b31e4cd762b7091e83eb8f83d36419e.camel@collabora.com>
Subject: Re: [PATCH v3 0/9] media: bound stateless HEVC/AV1 tile counts
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Michael Bommarito <michael.bommarito@gmail.com>, Hans Verkuil	
 <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari
 Ailus	 <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Yunfei Dong <yunfei.dong@mediatek.com>,
 Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,  Kees
 Cook <kees@kernel.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 15 Jul 2026 21:03:57 -0400
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-xz6igzRMhRrbxieX/Qv8"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-xz6igzRMhRrbxieX/Qv8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

there was a problem with patchwork regarding that series. Mind trying to re=
sent
to see if it can fix it ?

Nicolas

Le mardi 16 juin 2026 =C3=A0 22:18 -0400, Michael Bommarito a =C3=A9crit=C2=
=A0:
> The stateless HEVC and AV1 controls carry tile counts that several SoC
> decoder drivers consume as loop bounds and array indices when laying out
> fixed-size hardware descriptor buffers. std_validate_compound() does not
> bound them, so a crafted HEVC PPS or AV1 frame control can drive
> out-of-bounds writes and an AV1 divide-by-zero in the rkvdec, hantro,
> rockchip and mediatek decoders.
>=20
> =C2=A0 1-2=C2=A0 reject out-of-range HEVC and AV1 tile counts in
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 std_validate_compound() (one patch p=
er codec). For AV1 the per-
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dimension bound is V4L2_AV1_MAX_TILE=
_{COLS,ROWS} and the total is
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_AV1_MAX_TILE_COUNT.
> =C2=A0 3=C2=A0=C2=A0=C2=A0 add <media/v4l2-hevc.h> with bounded tile-coun=
t helpers.
> =C2=A0 4-5=C2=A0 use the helpers in rkvdec and hantro instead of open-cod=
ing the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clamp; rkvdec also bails before inde=
xing the hardware
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parameter-set table with an out-of-r=
ange HEVC PPS id.
> =C2=A0 6=C2=A0=C2=A0=C2=A0 guard the rockchip VPU981 AV1 divisor against =
tile_cols =3D=3D 0 and
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 keep the descriptor writes inside th=
e AV1_MAX_TILES buffer.
> =C2=A0 7=C2=A0=C2=A0=C2=A0 reject a rockchip AV1 frame whose tile_cols * =
tile_rows exceeds the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 submitted tile group entry count or =
the AV1_MAX_TILES descriptor
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 capacity, which set_tile_info() woul=
d otherwise read past or leave
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 under-described while programming th=
e larger geometry.
> =C2=A0 8=C2=A0=C2=A0=C2=A0 bound the mediatek AV1 tile-start copy.
> =C2=A0 9=C2=A0=C2=A0=C2=A0 KUnit coverage for the tile-count validation.
>=20
> Changes since v2:
> =C2=A0 - Split the combined HEVC+AV1 validation into one patch per codec,=
 each
> =C2=A0=C2=A0=C2=A0 with a single Fixes tag (Benjamin Gaignard).
> =C2=A0 - Move the AV1 total-tile bound into validate_av1_tile_info() usin=
g the
> =C2=A0=C2=A0=C2=A0 uAPI V4L2_AV1_MAX_TILE_COUNT, instead of clamping tile=
_cols/tile_rows
> =C2=A0=C2=A0=C2=A0 in the rockchip driver, which would have corrupted the=
 values written
> =C2=A0=C2=A0=C2=A0 to the hardware registers (Benjamin Gaignard's NACK on=
 v2 4/6).
> =C2=A0 - Add <media/v4l2-hevc.h> with shared bounded tile-count helpers s=
o
> =C2=A0=C2=A0=C2=A0 rkvdec and hantro no longer duplicate the clamp (Benja=
min Gaignard).
> =C2=A0 - New patch 7: reject a rockchip AV1 frame that claims more tiles =
than
> =C2=A0=C2=A0=C2=A0 the submitted tile group entry array holds (set_tile_i=
nfo() indexes
> =C2=A0=C2=A0=C2=A0 it by tile_cols * tile_rows) or more than AV1_MAX_TILE=
S (the hardware
> =C2=A0=C2=A0=C2=A0 descriptor buffer), which would otherwise leave the ha=
rdware
> =C2=A0=C2=A0=C2=A0 programmed for more tiles than the buffer describes. m=
ediatek already
> =C2=A0=C2=A0=C2=A0 guards the entry count; rockchip now guards both.
>=20
> checkpatch --strict: 0 errors on all nine. Patches 3 and 9 each carry one
> "added file ... does MAINTAINERS need updating?" warning for the new
> <media/v4l2-hevc.h> and the KUnit test file; both already fall under the
> existing include/media/ and drivers/media/v4l2-core/ MAINTAINERS entries,
> so no MAINTAINERS change is needed. (checkpatch's SPDX sub-check did not
> run in my environment -- spdxcheck.py needs python3-ply -- but the SPDX
> headers are present on both new files.)
>=20
> The tile-count validation is exercised with KUnit (patch 9): in-range
> HEVC/AV1 counts pass, out-of-range per-dimension counts and an AV1 grid
> whose product exceeds V4L2_AV1_MAX_TILE_COUNT are rejected, and the
> zero-initialised AV1 frame control that v4l2-compliance and existing
> userspace submit still passes.
>=20
> v2:
> https://lore.kernel.org/all/20260614155609.3107600-1-michael.bommarito@gm=
ail.com/
>=20
> Michael Bommarito (9):
> =C2=A0 media: v4l2-ctrls: validate HEVC tile counts
> =C2=A0 media: v4l2-ctrls: validate AV1 tile counts
> =C2=A0 media: hevc: add bounded tile-count helpers
> =C2=A0 media: rkvdec: bound HEVC tile loops and PPS id to the array capac=
ity
> =C2=A0 media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer
> =C2=A0=C2=A0=C2=A0 capacity
> =C2=A0 media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile bu=
ffer
> =C2=A0 media: verisilicon: rockchip: reject AV1 frames exceeding the tile
> =C2=A0=C2=A0=C2=A0 capacity
> =C2=A0 media: mediatek: vcodec: bound AV1 tile-start copy to the array
> =C2=A0=C2=A0=C2=A0 capacity
> =C2=A0 media: v4l2-ctrls: add KUnit tests for compound control tile
> =C2=A0=C2=A0=C2=A0 validation
>=20
> =C2=A0.../vcodec/decoder/vdec/vdec_av1_req_lat_if.c |=C2=A0=C2=A0 5 +-
> =C2=A0.../rockchip/rkvdec/rkvdec-hevc-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 14 +-
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-hevc.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 7 +-
> =C2=A0.../rockchip/rkvdec/rkvdec-vdpu381-hevc.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +
> =C2=A0.../platform/verisilicon/hantro_g2_hevc_dec.c |=C2=A0=C2=A0 6 +-
> =C2=A0.../verisilicon/rockchip_vpu981_hw_av1_dec.c=C2=A0 |=C2=A0 57 +++++=
--
> =C2=A0drivers/media/v4l2-core/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 ++
> =C2=A0.../media/v4l2-core/v4l2-ctrls-core-test.c=C2=A0=C2=A0=C2=A0 | 145 =
++++++++++++++++++
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 36 +++++
> =C2=A0include/media/v4l2-hevc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 41 +++++
> =C2=A010 files changed, 306 insertions(+), 19 deletions(-)
> =C2=A0create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core-test.c
> =C2=A0create mode 100644 include/media/v4l2-hevc.h
>=20
>=20
> base-commit: e24a98d6884a6e4203a77a94f070a59fcab95208

--=-xz6igzRMhRrbxieX/Qv8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgt/QAKCRDZQZRRKWBy
9PzpAP4/29C0WKkNtUf/3qN6v06YE2Q3ByT5TeT9XoB1ZBWjjAD/cpH3ZB1wKPUb
xlEyxbY9ze47GrHfGa702izTnBAa9Ao=
=nAkS
-----END PGP SIGNATURE-----

--=-xz6igzRMhRrbxieX/Qv8--
