Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5BC379EDC;
	Wed,  1 Jul 2026 17:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925605; cv=none; b=LEX0f49HasjzzqnS/bO4vvTh+JMMG/5EvZrKsbn7T3TCQsYZyDlYXN3wjHezOT90FxXjVUpUjBnKjutPqwpVHA93WWs5HeMos6lauMOjKo1q1V9WW///iT+VgdIMOQ1yyuqTG06S8q4pMU3vuC+4xrEt715awHaZbdLg5An5wLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925605; c=relaxed/simple;
	bh=21H7aoLhZHneFF0SXyyRN9vo3BQfDQoYg4sqYzX4QPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZHo+AjW0RzqdoMNfor4E971yxNN+gsVNhu21pz7lkjWQxAvIUJSwJBq7KarBIILQqVBn2o8xEwSIgcPWIxujqY761yrGk5I2TndfTmvzh+0gUiwlqg2l0Dj2hMYVFhl1mWb/cP20ugZF2uXIH8ggXhi23wbUOo3821cpswsBGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6NVltWq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6NVltWq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED6D1F00A3A;
	Wed,  1 Jul 2026 17:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925604;
	bh=21H7aoLhZHneFF0SXyyRN9vo3BQfDQoYg4sqYzX4QPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E6NVltWqWbvIUpRDtHaBUrZBc4dttdN9on4CFmxs6qgHofyIjEKwJYBqJ4wK+qY/B
	 yem+6USo5kwgvRBMybOP/HAW5QfpANLwKI0rqBvEIY/y1seEhf4ahhgPRPsu1zJFsK
	 rp8C9MGc3IqfV+O6Kv2gI74Z+tWFh0bHo+tiZaRbb+j0ayRYV+g9O6Romx3MVSBt+k
	 FwZc4eiko1JdRv0UQlf7P8QvOGNyYu3n5W2DTFSYi2lyglOgLAhqbCrLCFSAN75ldU
	 tC4nwWKLTBfQ22HoBmSZqo73kPb/vUWMrCALH/oqyoPsX3DcHSdE9V3XcUTW/1O8Xg
	 f67dV+3MIqCuQ==
Date: Wed, 1 Jul 2026 18:06:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Ramshouriesh R <rshouriesh@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Message-ID: <20260701-clay-sleeve-c133875faa1d@spud>
References: <20260701-hm1092-driver-v1-0-d1bd81e233b5@gmail.com>
 <20260701-hm1092-driver-v1-1-d1bd81e233b5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hXiR048/qsb0TuVm"
Content-Disposition: inline
In-Reply-To: <20260701-hm1092-driver-v1-1-d1bd81e233b5@gmail.com>

--hXiR048/qsb0TuVm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 02:25:23PM +0530, Ramshouriesh R wrote:
> Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
> near-infrared CMOS image sensor used as the face-authentication IR
> camera on laptops. The sensor streams 10-bit RAW over a single MIPI
> CSI-2 data lane.
>=20
> Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--hXiR048/qsb0TuVm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVJHwAKCRB4tDGHoIJi
0jvFAQCbcADycv3e56G0sQFpf0YBUNgRtDjHzw7R1gu4252gNwD7BEuLlafP59xz
cs8dpydvrjX5VL0xn+rDDLa+O/LX8w0=
=9pEg
-----END PGP SIGNATURE-----

--hXiR048/qsb0TuVm--
