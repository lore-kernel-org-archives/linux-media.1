Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A1143F099;
	Sat, 18 Jul 2026 23:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417530; cv=pass; b=AzcSs5gRg7XtKM2+dhLiwodHVICZ+D5OAkAdDane4ZUaPTNiZcucExM3bqSEUoJj8KH1BhuZ0eACySUZqdNLXUKsALhOeXSL0GVoMmvC0DEjmPCURwp0+k6aCyWYReWsfwIPLXH5cJ3SQ/Bj2UcbUmDeWLdHoy5dnteDnaK4a/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417530; c=relaxed/simple;
	bh=RqtFYTexteQxVcWst3wcvuvjxFyI1jJyzw43+6a0XOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+4996PLlPV0izCrkr8tyaxG6FjNR39ICZJg5abWMLwPMJslWKmxsMbBsRtc/WNE1LDFwdX3xqzOSXandMhXqIYHu+LJM0Vom1b85dQ2yJ064gVfBpqpRkkbeWZxbX6wtS2eVDstjaR1zAOWs5TYEcpRXYe37SDLwzyi/qs4TqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=aW8DOYx1; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="aW8DOYx1"
ARC-Seal: i=1; a=rsa-sha256; t=1784417506; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mjlBT5fBOmj0puaOAj3NrQ4dZIxtuOA+NuCb2Yzp1io4uYKf/JLzyEvzPxyp6rpc1wznjzHszAc6K/k9XBPK9IYRPJpNKcqW9EeFoyUmzYdfXmJGYnUdPyBtti8FyWT/1duxip0xZ+Jdbm5BWJ8thayTrVTDNSZDEsos0oid4Po=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784417506; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oMGvRNkuFyXaMYeP4ES+8jelR30jNKVF+YZjl8fjH+c=; 
	b=TbfNsxKSpnNYMGfhpBfgeOqw7FcUXw62jOTFe/BZYXXiMdcvqp/HSlMIdMOl5yIckY69c1dXk/LiybPChgxtXLdAq1xBTCkMgk/6tl04QI4BAkfjCBzzzYFU19EdGkKMSmT2ntdnN5RLD/+SXe1m0S0yIFKIs8rNYhXmMYqxCFc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784417506;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=oMGvRNkuFyXaMYeP4ES+8jelR30jNKVF+YZjl8fjH+c=;
	b=aW8DOYx18xezxX/CNds+Jm5xao3XhXf0fOSTgrsWOjnRFZPS9yPLGz0G2STbaGGV
	SwdjbNK3dU0INwq+tHVxn5ZaaSIW9JhWVo246avHA7kdjEjND5cuOxR/hRhIMpnN3Me
	ZDffuyEhqnXqJEj8O/dh84qj58eb5Q9pYTHIoDUo=
Received: by mx.zohomail.com with SMTPS id 1784417504416910.5266533899085;
	Sat, 18 Jul 2026 16:31:44 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 2C8CE1804CF; Sun, 19 Jul 2026 01:31:39 +0200 (CEST)
Date: Sun, 19 Jul 2026 01:31:39 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio
 capture on Orange Pi 5 Plus
Message-ID: <alwKdkNsMi9L4ZiY@venus>
References: <20260718085728.6797-1-royalnet026@gmail.com>
 <20260718085728.6797-5-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5auwkjfiihzxz3ef"
Content-Disposition: inline
In-Reply-To: <20260718085728.6797-5-royalnet026@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.404.57
X-ZohoMailClient: External


--5auwkjfiihzxz3ef
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio
 capture on Orange Pi 5 Plus
MIME-Version: 1.0

Hi,

On Sat, Jul 18, 2026 at 10:57:28AM +0200, Igor Paunovic wrote:
> Route the HDMI receiver audio to i2s7_8ch, the receive-only I2S
> interface dedicated to HDMI RX, through a simple-audio-card with the
> receiver as bitclock and frame master. Together with the audio
> capture support in the snps_hdmirx driver this exposes a capture-only
> ALSA card fed by the HDMI input.
>=20
> Tested on the Orange Pi 5 Plus with multiple HDMI sources: capture
> follows the source sample rate and stays in sync via the FIFO-level
> clock tracking in the driver.
>=20
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> New in v3.
>=20
>  .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> index 9950d11..d5840e1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> @@ -37,6 +37,22 @@
>  		};
>  	};
> =20
> +	hdmiin-sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,name =3D "rockchip,hdmiin";

The name is exposed to userspace and visible to the user (e.g.
in alsamixer), but also used by Alsa UCM2. I suggest to use
"RK3588 HDMI-IN".

> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,bitclock-master =3D <&hdmiin_codec>;
> +		simple-audio-card,frame-master =3D <&hdmiin_codec>;
> +
> +		simple-audio-card,cpu {
> +			sound-dai =3D <&i2s7_8ch>;
> +		};
> +
> +		hdmiin_codec: simple-audio-card,codec {
> +			sound-dai =3D <&hdmi_receiver 0>;
> +		};
> +	};
> +

Move the whole card definition to rk3588-extra.dtsi with a new label
(e.g. hdmi_receiver_sound) and add status =3D "disabled"; Then just do

&hdmi_receiver_sound {
    status =3D "okay";
};

in the Orange Pi 5+ DT, i.e. just like the soundcards for HDMI
output. This reduces a lot of duplication as the soundcard is the
same on all boards considering there is a dedicated I2S channel for
it. It's disabled by default as some boards do not route the HDMI
receiver at all.

Greetings,

-- Sebastian

>  	ir-receiver {
>  		compatible =3D "gpio-ir-receiver";
>  		gpios =3D <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
> @@ -247,6 +263,10 @@
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

--5auwkjfiihzxz3ef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpcDNYACgkQ2O7X88g7
+przAxAAmp27ahike5cooDDpLsXCvhfzlAUohPcO39nvyh7GFLDhdFywIckmqKXe
UQnJTwlqRZ2YQank3VipcBojKahUe+fvYFM5RSo1A7qc4eGHryFmNxBwGGh14qCm
A+3dpyh7baCzsOPI/2rYib6Uncb/G6cQ/udYhE6le1dll3XnGTNq2iuBnFzxZd0U
p1Wg8F/XLnrytXM6+1QAh5XoGPkjGUNjDqyrM+P+rvS46DR2UE2+bGvl8ggROL+e
1ClG2mLugtFeV2VPpsdexirwUgqv0y4tRTv9Dw+XwzvweBE7EVz4mvZOVTphcHjL
LjrTcKzLw2ZEUslgwXuyuVYNIUjs7Q1MgWDivPS8BFFI3YVruhHiAu0f6/sJUokL
8mTNpE2b0N6VV+s85/W20LsHHAzdnJE+lERY1Zxw1ZT9ii+XXIn+N1VB0xBIGzMc
7epiBSwb3N5Z7d+XwQtHCsma42JsGXFCBpgbIswphhoq0rLndqiT4dTUdn0yfL1h
Y5Gm4dBH4h+yKioxzIrm3NZ6drbX3Eyd9TY7v0thdycAIGtuXtmLTnP9Fha98lb3
jLXxlCBDtZ0kIV964HslAqBjOaV7Q1QSMRJ11+sy64p3GV6YMt0AevWRWua5w0fT
qvGboGN2P6KsR85rLJ5ryFeEilUivC2nu3F/eId0Wpu+fUuCHEQ=
=1b/t
-----END PGP SIGNATURE-----

--5auwkjfiihzxz3ef--
