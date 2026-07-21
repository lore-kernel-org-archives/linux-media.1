Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D3A4D90A8;
	Tue, 21 Jul 2026 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646847; cv=pass; b=tmir+vByYLDlYFrr9AyK6mTT+nkU7ZTN0MC9Cc04RnrFCMdaFtnd2O5Cy1aRTjH4PhXCKJsap/ByPOlohApAt5msstkD2BU/kcupeha/Lxb4yuTb7jFSGD8re7jEYCtAyMCDdNcEt8Uh4YSZ7YgRlscVsdjuAk6oeKNiPexCBTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646847; c=relaxed/simple;
	bh=51pmERqw5iaGTwi5r1OVLeDPFU2/55Bu9bKpXW+PSqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAo80nWwJZJ+b8NOJB+X+HJYIDFNel//2Lod3SFO+RugA3gq1uBRymbZYlwbsRd6YR15muMAyW7UBVxk80vgtOScwBq0T9Afafl9EX8QMB4L9mRWYyDT+ojhnWiFOoprBhmjLYk1mmIEgVl4H+FaYTL4H83+5AyeSoC63+SoQoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=I99NizwO; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="I99NizwO"
ARC-Seal: i=1; a=rsa-sha256; t=1784646831; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BM6i/tiL2+014QDs3Ml7WVk4Awsod+45bJzb/c6fvbXgp3QDq6cxLhK57+9KyUQLDrzVio9UQExpX9SQvN7vrRTrxeUOqMCJQUwDxK+fk/W+/geXELhQesIn6LN2B8K4wupLjQznp7MCuQKkF5W3ytiLeQ9p4sXLGpvODZwrXHg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784646831; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/BYbRNMgnp3/dDIfLsTKCI/gdKDZZY/BwdbETB//oDo=; 
	b=mU8F9svZV0PJVVKUX8wo5fzR4cROLyriufK+1UqmhfjZWg5DnPdYtm7faBokiArRG+RwV8SkQB8QQAXjcNtJ6X6ZJfGr4UHB4GUu8EAcnuNNq/AIm+pGGQPtUBslVi/8HZnucDVNCvJFEcmhX9MNZcTqCMPGHy0S14TsON4sOPc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784646831;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=/BYbRNMgnp3/dDIfLsTKCI/gdKDZZY/BwdbETB//oDo=;
	b=I99NizwOppv19WgK0CBbGMRlnsWUwH6jjgvejiJJxPffaTOGGz8iRAcab77I4Ke3
	GqvwPABJI/2IuRV8cDvypg7lkLI1/6GowDQNjdOfDJ1ozgAkK66vt4UfvMy3y8URKO2
	e8EtgnwSAnN5iLYKCo43gbnLzxHTrEIrWMtWUB68=
Received: by mx.zohomail.com with SMTPS id 1784646828626561.5327912662239;
	Tue, 21 Jul 2026 08:13:48 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 7D2DF180765; Tue, 21 Jul 2026 17:13:44 +0200 (CEST)
Date: Tue, 21 Jul 2026 17:13:44 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: add HDMI RX audio on RK3588
Message-ID: <al-MkTXJRzHevxGb@venus>
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-4-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bcboel4cgdbdbfeu"
Content-Disposition: inline
In-Reply-To: <20260721064115.64809-4-royalnet026@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.638.57
X-ZohoMailClient: External


--bcboel4cgdbdbfeu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: add HDMI RX audio on RK3588
MIME-Version: 1.0

Hi,

On Tue, Jul 21, 2026 at 08:41:14AM +0200, Igor Paunovic wrote:
> The Synopsys HDMI RX controller exposes two digital audio interfaces,
> one for I2S (0) and one for S/PDIF (1). Add the #sound-dai-cells
> property so audio cards can reference them as a codec, as documented
> by the snps,dw-hdmi-rx binding.
>=20
> Add a shared simple-audio-card routing the receiver I2S DAI to
> i2s7_8ch, the receive-only I2S interface dedicated to HDMI RX, with
> the receiver as bitclock and frame master. The card is named
> "RK3588 HDMI-IN", which is what users see in alsamixer and what ALSA
> UCM matches on. It mirrors the existing HDMI TX sound cards in this
> file and is disabled by default, since not every RK3588 board routes
> HDMI RX audio; boards that do only need to flip its status.
>=20
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> Changes in v4 (both suggested by Sebastian Reichel):
> - define the whole sound card here as a shared, disabled-by-default
>   node mirroring the HDMI TX cards, instead of per board
> - name the card "RK3588 HDMI-IN": the name is user-visible in
>   alsamixer and matched by ALSA UCM
>=20
> New in v3 (as "add #sound-dai-cells to the RK3588 HDMI receiver").
>  arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/=
boot/dts/rockchip/rk3588-extra.dtsi
> index a264001..e0dce15 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -23,6 +23,23 @@
>  		};
>  	};
> =20
> +	hdmi_receiver_sound: hdmi-receiver-sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,name =3D "RK3588 HDMI-IN";
> +		simple-audio-card,bitclock-master =3D <&hdmiin_codec>;
> +		simple-audio-card,frame-master =3D <&hdmiin_codec>;
> +		status =3D "disabled";
> +
> +		hdmiin_codec: simple-audio-card,codec {
> +			sound-dai =3D <&hdmi_receiver 0>;
> +		};
> +
> +		simple-audio-card,cpu {
> +			sound-dai =3D <&i2s7_8ch>;
> +		};
> +	};
> +
>  	reserved-memory {
>  		#address-cells =3D <2>;
>  		#size-cells =3D <2>;
> @@ -338,6 +355,7 @@
>  		reset-names =3D "axi", "apb", "ref", "biu";
>  		rockchip,grf =3D <&sys_grf>;
>  		rockchip,vo1-grf =3D <&vo1_grf>;
> +		#sound-dai-cells =3D <1>;
>  		status =3D "disabled";
>  	};
> =20
> --=20
> 2.53.0
>=20

--bcboel4cgdbdbfeu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpfjKgACgkQ2O7X88g7
+pr5Mw//bxtkMAOuV4cl66B7/9tK092jBaJ9bwyKt1Ymq5iR688uw65eLTBv3cWz
KQ0g/lKGEkFk7hnm493ziK4at736FjvAzHqw0QMlwjMQDq52gDkYDPlSdm1xmdqZ
X7RlqEGfslXyD0FiZiDeGIzRCTiAw5gGsW0Y/oKiC3U0gh/MXzQGnH52UtKirAtD
LauBlJftBRDWdO+73rIcmYsHinHY+KuN7fv095XeHEl/dShTAE5mE/lp/nPQ5dUr
D7yHAVNbLtix1PxK/UyrjQMp2cuyzaRb0r3CiDl2GiTS4/K9n80n9+Rypdcv1bC4
Bjv5dlK8fNjHvf3EU3gAThBv/wAkwOcn+O6p+DCMJniyMahOXT3wblb1c9fvBgCe
fU6erPXRgUqVbAqLZhUm9sVtya0UZrM9HXVrlo6bdolQL0AKxR+03nNrWpU3dku0
yEd0fBdk59YYzcv7qbMtkAUcXlSlkpdRtiVkrDb9AOB5bdpSbbPEUrjQx2ZgcSx0
EgzmKBJJ2Df2KyHB0QIi0XkkWaDi2GLMqS44IYR3MnZgz8ByReFijex7gK/iaUZ3
teluJ5DD2TFSAA9fYzAD4sZfI4A6ZR3hbA4uBn1LuwTsEddyLaQ8Slnvk7+BsHdf
onbEwbG8P15ymNUS0SFbrF2m44aklVMuWZFF71ILSLfLBcAs6HE=
=46OZ
-----END PGP SIGNATURE-----

--bcboel4cgdbdbfeu--
