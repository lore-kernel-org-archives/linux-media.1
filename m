Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410DD3D0BE5;
	Wed, 27 May 2026 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779871754; cv=none; b=GjEVuUVAqP/xn1GZg6IXn7cPCCPgTBEiK3jx0Qcw/nSFIVNRmhREndl1tRc7IeK1Ps9cYx3MyGcDH9uOLA7OYFoUJrFpiJhkIYP7W3y66s2BLCJY4yAPBTgbazHGSl2AB4fsDGQnqTz3sdyNgDHg5WFypH+pVFLdElaVUytxE9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779871754; c=relaxed/simple;
	bh=vnMFODbc+LljT7eUBEEQawLt47/OgLwD8JHdSRnnDAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rikojWph9hcDHbX5GmlmzIRfVvuRLivwmdmWMQ3U/adhuAksC9LpjJgxtkmhdZMXwl2Au8wluCRWMpwYRZGP+LAUxDje1FKykZwDZ+mm/avWQHhOBgXz6p/w4OvVUq0HRdzZnB1cvkZlFJF7cR5lwNjmPYZMstP3vDzEr8npaDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aS/Y3c/2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aS/Y3c/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEDC1F000E9;
	Wed, 27 May 2026 08:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779871753;
	bh=vnMFODbc+LljT7eUBEEQawLt47/OgLwD8JHdSRnnDAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aS/Y3c/2krAHC8mOb1Mcxes6m5FDVlOQc6VRTrd4yb0jWg0E+fTAIr9V8KuSqacM9
	 SIbKkCn1wvlJlDFUj5AU0W7QFUSMx4r5jxxVIDwcmTK4z/7y4ySTtfMkftCqbjjQ/R
	 iw6WbgDW39eVcstSBGH1axuFDeW8urSBPHp7PEsHFNeQ4DS8kRG8UsGyG5+Vbzxlp1
	 1NHOkope50m9rEbE1J86KoQu0JBkgf8WCTF9fIc0fUbBpCcY6vApcQEIEUFpJRxlYZ
	 OSBSZxMHdKZTsy62UXtsvYlY+tmvCEULoPU9XtGMu8zXdEQf0IS+WN28HliJ/U7RQx
	 OhrLGfwNO4nQw==
Date: Wed, 27 May 2026 09:49:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 2/8] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260527-grimace-plausibly-c620ea58f197@spud>
References: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
 <20260522-rk3588-vicap-v5-2-d1d1f5265c56@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mp0q5jdAdl2wMqsR"
Content-Disposition: inline
In-Reply-To: <20260522-rk3588-vicap-v5-2-d1d1f5265c56@collabora.com>


--mp0q5jdAdl2wMqsR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 11:23:08PM +0200, Michael Riesch wrote:
> Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit. To
> that end, make the existing rockchip,rk3568-vicap documentation more
> general and introduce variant specific constraints.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Ah right I remember what Rob wanted changed now.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--mp0q5jdAdl2wMqsR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahawAgAKCRB4tDGHoIJi
0oypAQDd8ds975P1XLz5OPsVbwIIl4FFnLtrrNNKezd22scM1wEA0cwWA/v8lM9Y
tspAlrkx0Tv3bx0mhY4ZOay8xpcbbgY=
=8xBO
-----END PGP SIGNATURE-----

--mp0q5jdAdl2wMqsR--
