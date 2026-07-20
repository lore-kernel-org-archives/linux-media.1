Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9317041CB29;
	Mon, 20 Jul 2026 12:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552268; cv=none; b=LOhLEYvUb44bDhD5K9U5uoV4uHZSVR61fr2a59sbXX9d2gH98/NcOJ/rOffrq4DiUg5tkHAaf4Jl+hsNs26P7S4Gbbi4GuQHKv1hWt0edEeaoUDPwZsetZSMbRID9NbfQBN3+jHYxJ6+MuKs6rOm9N+h4CXCMDcpcyEdRQ/wJGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552268; c=relaxed/simple;
	bh=XOI3UUYupPLCpWBSsQqfHAr1CvdI1f8l2o6lC3lZts8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JetJ9C8pUGAOwxF7OnSJd8ZCatsbUJi6WwgsXYZHUxEtPQdBVOuyfIz19eKr57Ehs4b/Lo5MlfxuJjavSXdoYkov8HKOV/buCvpFtAT9+MWZ181mU4+lvxGb81iW7VRbbkTDvr4nerJIM4r+vfCpSXGbAhWb9KfOpBB/ecvhdZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GcsDs6pX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GcsDs6pX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784552264;
	bh=XOI3UUYupPLCpWBSsQqfHAr1CvdI1f8l2o6lC3lZts8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GcsDs6pXd8s+gYeiCf1aPHpsTsHzPGRXDF8gFw2vnN1tpI2/CE5100GRmRE2F0STD
	 ub3LkI/Zl8ccKKkTxEX/RMTHc2HJ08vZk0ltMY2Hs9ZpCArkfyBn+QpGVwAIdN0ynP
	 XIXOIf+KaOCwTB7yyLriQC40VF3ze+sT3bfi06surBpjPZdZzgnLH1CdMF/6P1+RXq
	 VfaWKfamhcRA+RsgWqpoNBivuIOmGwD+BXslJPU4vUO+po42gLI9/7N/SC8ZBkoRdS
	 ut4iXdcu2wkYmLPcI/+BCAAAWZX2NnSI8o4SiLYg2McNTGnjkttZr1gI9aLPApQrH5
	 1cwdaaz7EkBtA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 783B317E0CF1;
	Mon, 20 Jul 2026 14:57:41 +0200 (CEST)
Message-ID: <c3abd49fc12e8cfab6993feb60b361ba07b6fb7d.camel@collabora.com>
Subject: Re: [PATCH v6 01/14] media: mediatek: vcodec: support vcp
 architecture
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Ricardo Ribalda	
 <ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil	
 <hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li	
 <haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart	 <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
 <tfiga@chromium.org>,  Sebastian Fricke <sebastian.fricke@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Qianfeng Rong <rongqianfeng@vivo.com>, 
 Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Fan Wu	 <fanwu01@zju.edu.cn>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 20 Jul 2026 08:57:39 -0400
In-Reply-To: <20260720012056.1026551-2-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
	 <20260720012056.1026551-2-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-KtTi+1OEhpzib4UJmvnN"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-KtTi+1OEhpzib4UJmvnN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 20 juillet 2026 =C3=A0 09:20 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> Some platforms expose the video codec through the VCP coprocessor.
> Use the VCP architecture when the VCP coprocessor is found.
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> =C2=A0drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h=C2=A0=
 | 1 +
> =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A02 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> index 300363a40..c1642fb09 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> @@ -14,6 +14,7 @@ struct mtk_vcodec_enc_dev;
> =C2=A0enum mtk_vcodec_fw_type {
> =C2=A0	VPU,
> =C2=A0	SCP,
> +	VCP,
> =C2=A0};
> =C2=A0
> =C2=A0enum mtk_vcodec_fw_use {
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index e936ed8df..d220b645e 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -379,6 +379,9 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
> =C2=A0	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp"=
,
> =C2=A0					 &rproc_phandle)) {
> =C2=A0		fw_type =3D SCP;
> +	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
> +					 &rproc_phandle)) {
> +		fw_type =3D VCP;

I know I gave an rb a while ago, but then we reviewed the 8189 code, and we
underlined that this makes little sense, and that fw_type should simply be =
set
in the pdata. Same applies to mtk_vcodec_dec_get_chip_name(), the chip "nam=
e",
or integer form of, is clearly a 1 to 1 match for pdata.

Nicolas

> =C2=A0	} else {
> =C2=A0		dev_dbg(&pdev->dev, "Could not get vdec IPI device");
> =C2=A0		return -ENODEV;

--=-KtTi+1OEhpzib4UJmvnN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCal4bQwAKCRDZQZRRKWBy
9L56AP9HNuiSW6OKBf4FGIVzPFeY7CiBhatTIUOtX2+AES3SNAD+OZwDqsqo0HW1
/HGx/dzNoYGc/t27JkKvtPVz+/iVhgM=
=f1cM
-----END PGP SIGNATURE-----

--=-KtTi+1OEhpzib4UJmvnN--
