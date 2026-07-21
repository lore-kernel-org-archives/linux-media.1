Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9894D98FC;
	Tue, 21 Jul 2026 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646927; cv=pass; b=R3q6E0WRA8Pt05in8yWi6odEujfh5f0ZixEgxd9ZataH3n1f5s/keHI+riclvJXiMWzFMMueOw4oqOl895GmatFx0AyU62AX0tJj6xMLLqAfsvRErElr26pLoCEKykz9a1t4sRWEf4AUtMDsFH6Ygo10z1Itm+RuKVb67c6Bv3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646927; c=relaxed/simple;
	bh=ETzqqR3X/WZ5qERWLgLEx7zSVM0/qbeiDGTqT07iscM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxzpyI99p9GuglKbRKBYR17CZ+O+apnlD7f/qzoBcg7iPDjJSg8dXp3N7PAAuuzim0zcP7DhLmhv3q8DLb/wxwMHeL+1/LA7edJfJb5FlKp4kv5asv/CvmdxU+r/AfJn6Tqf/2uBLMJID8Ho123VHCNxeHYqRx2DhM1nbO//Q44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=XgYrilH0; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="XgYrilH0"
ARC-Seal: i=1; a=rsa-sha256; t=1784646910; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DVQQFaeaXJsErpXSmalKDRjp1wKLGpoTBMShl9q+/nye75MohNH2vJacaVILCqfr1zGO+0MfGqIXw3HyFytabBbyIBIfEvhPtXB8BhNR0R0WrrrrGOzIDpzKU5Rg5k0kQl0dolSQGGPBimFH35/1rw8MYMWSkDPApOGl8TLQ7f0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784646910; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Am4FBLquimoXLofVW39R5TXiLDXR3ax8a+vHWlboXD8=; 
	b=GVdE9TgLfuxGwU5xYXs662IyQhf7y0C0Ae7WeaIAjeBq6SXSjxPlOsA8smbmhsQyE0lMK0S7xq1XetyGwwIV+EBWKpt0yEg0HRBtw+Y7TCKAcepXEb3WYiCMLxfTp77OFUDXAReixhD5o4KM05H95U+FTch55sOUeTCexXn+obo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784646910;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Am4FBLquimoXLofVW39R5TXiLDXR3ax8a+vHWlboXD8=;
	b=XgYrilH0DhdO3/Apsdp2g/O94Wepv5AWFeY2GH3ivNF+yasnIYsV//q+IhhMT5bx
	/VuyhjGZlNp5DxV6ZYRpypl4J4TMBoW80UMpoKqPhX1ABTrnP+fba/GkG4uoDMCOOwH
	j5W1bQ4IdMOz3i2CfGUc3RL5OwfJTkzKWm0hLVhQ=
Received: by mx.zohomail.com with SMTPS id 178464690796118.531816677270967;
	Tue, 21 Jul 2026 08:15:07 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 04A7C180765; Tue, 21 Jul 2026 17:15:04 +0200 (CEST)
Date: Tue, 21 Jul 2026 17:15:03 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: enable HDMI RX audio
 capture on Orange Pi 5 Plus
Message-ID: <al-M4gZ4cZwpEF_H@venus>
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-5-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iv6yyu46n7brq5vz"
Content-Disposition: inline
In-Reply-To: <20260721064115.64809-5-royalnet026@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.638.57
X-ZohoMailClient: External


--iv6yyu46n7brq5vz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: enable HDMI RX audio
 capture on Orange Pi 5 Plus
MIME-Version: 1.0

Hi,

On Tue, Jul 21, 2026 at 08:41:15AM +0200, Igor Paunovic wrote:
> Enable the shared HDMI RX sound card and the i2s7_8ch interface it
> uses. Together with the audio capture support in the snps_hdmirx
> driver this exposes a capture-only ALSA card fed by the HDMI input.
>=20
> Tested on the Orange Pi 5 Plus with multiple HDMI sources: capture
> follows the source sample rate and stays in sync via the FIFO-level
> clock tracking in the driver.
>=20
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> Changes in v4:
> - only enable the shared hdmi_receiver_sound card and i2s7_8ch, now
>   that the card definition lives in rk3588-extra.dtsi (Sebastian
>   Reichel)
>=20
> New in v3.
>  arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> index 9950d11..9f9a303 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> @@ -171,6 +171,10 @@
>  	status =3D "okay";
>  };
> =20
> +&hdmi_receiver_sound {
> +	status =3D "okay";
> +};
> +
>  &hdptxphy0 {
>  	status =3D "okay";
>  };
> @@ -247,6 +251,10 @@
>  	status =3D "okay";
>  };
> =20
> +&i2s7_8ch {
> +	status =3D "okay";
> +};
> +
>  &led_blue_gpio {
>  	gpios =3D <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
>  	status =3D "okay";
> --=20
> 2.53.0
>=20

--iv6yyu46n7brq5vz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpfjPcACgkQ2O7X88g7
+pqFLRAAkmIPl5/P8Z94H28WY+soiwfSEDNsLAiSGJlJVS8FgREkVhPImsKSVjR3
4o3c4JrrBdq9xWtsdrGrMq3CpCGJ1DJo9OtHO0XMVMWs9d9ubkjM0ob/usXXhjxU
OAzf5GLrUiNsMj8w149tKjXpYF1whrUVPN6ZXmhRpcKkzlsGPhFiD766yx//N0ty
yeh8uFvXqYA5IrRy0G3ZOnUl9bxnqJ/DumiW414ps5KGfdkx51psOGE7y5L//MhS
MhDrmU1MzPRNzo+GUaVahydIG8WA5LHI52fTRSeausAuuuzrgKlIyQWCnjAPxA5X
9MiD4rdNpUZRjPiddyT1AiezcSqHtL4e6KcRhnRjuMDne/32jNsBZnCfSeCdpk3A
5dWp60RnpVzYYGp93F7BRe25Urj3ik5HVmGVMUkSJ4bwSVP2RWSX+GiPTjlAe2IK
x63SwNOF++ZZSXd0VX2tP2mm1Ih2LvD5NI0R2Az8pzfmpwPST2UfgSvVfOfp7mMI
HSUOh6hFH8XlAg2rz8Ny4u25SzmyCa6wQbf6t9n1Fzoeam47sfuEcH9BaexoX/B4
RcU4y9M5N3ZmsQf0z2rhP6fkyFv/ifDrl7wMrCnScB0wtKoBluIt3wzJ+zKFn3z4
8pudmmYwXa7d6tb+SfCxNtEh7SbqGZWhHZmJtYy6V9uJdbBQk7w=
=d36M
-----END PGP SIGNATURE-----

--iv6yyu46n7brq5vz--
