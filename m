Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017DF36E48E;
	Thu,  2 Jul 2026 19:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020103; cv=none; b=XL2vy9EiS9fnPC5xNBWjFdhzXlbY8uIdXkRfnquFodSWbThRLDu9Aff9Mg3OnF3zvMXHFsaGcuGpekeXc+peUT0AFKdiXDMeg0JMQQ8oGJ73i7/fc8v0YWsxFojjTnVO/i7/Kioz5wzMWe+yggbwQ50nMYCcg/eH1eT1rpboHUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020103; c=relaxed/simple;
	bh=k50U4zlsDGzT2KXPhlrmIfaS5AHmmXlOEjBNZpjjVMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoGHMfE7VcNiEeTP7TOFbEdXKl09Xrx2VvesWQBHj38TRNSetQeYfbpqxtt3bhCu5Ms3RGJjPJ67v/HreKiu1RkMO2QP1FIzClLv4YDt4GLfx/E2rbMQYPHEnajiRiRPP6lWVBKcntOOMFhaPCaVP5Zg0+vzJftpHd+QOlCJevQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtNszblP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtNszblP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9771F000E9;
	Thu,  2 Jul 2026 19:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783020102;
	bh=k50U4zlsDGzT2KXPhlrmIfaS5AHmmXlOEjBNZpjjVMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UtNszblPkgWzKj5vm2aSf30naBpgQqFI84gvMUhxhMBsGj/mzUuOo4s5Ypv0jnwmN
	 RJnD2pS6OttrfcftdhsI0vNgUn/jBEOgDKifPlw4yMGEKgtz0iw1Zivj8aOaN2MEQn
	 DvWPMvYuxuYKYyU1+qUmrTjMRwAKdn6DWJqm57MKanflG5+D3AWPaeuReTF7FBvBe4
	 XCOUeXz/Hfd7QOw0gS13tIVZ0kYhmtgfVoxDFehf9Nlc3d2He4yswoISsGxA44/tWH
	 slymMM9oFs70x4VsFRQA9h572GQHDpxQWTQ/dZiwFWfXD0ldkFCgPvLooHytJARlmw
	 QPj763+ompbFA==
Date: Thu, 2 Jul 2026 20:21:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
Message-ID: <20260702-judge-erased-99ecf9976be0@spud>
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
 <20260702-og0va1b-v2-1-0071442caa2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+ndhK0BzZGXmiKb2"
Content-Disposition: inline
In-Reply-To: <20260702-og0va1b-v2-1-0071442caa2a@oss.qualcomm.com>

--+ndhK0BzZGXmiKb2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--+ndhK0BzZGXmiKb2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaka6QgAKCRB4tDGHoIJi
0j6eAP9w2iL+rZx7al1VvdH6D2EMjyWTpQYcwIfVDpL5nDuNfQD/VyjO3APXkD6t
HXeQNBvpjYi882cs4bhwdvxA7yA4OwE=
=f5PB
-----END PGP SIGNATURE-----

--+ndhK0BzZGXmiKb2--
