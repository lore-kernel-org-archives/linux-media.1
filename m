Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE341368296;
	Wed, 22 Jul 2026 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738114; cv=none; b=YroiLJBADkKeWoqo0p0ev4SzwQr9bwCpAie8r0gpmZvL4GN9+zMmfdKgZzuBFK7WU5H2BOnrMmSIdLnAaamuIwORZ20jxVBsuILoCl1d6OivbxNpQCQXwt7XipuMWHTeYlXI1lnTGdS69jcXF/rx9le2t3AmDwUIGUuGs9z1ee0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738114; c=relaxed/simple;
	bh=7wFP9K+pglYWRXMA16/s/MXPE9LzK7SPeceThNnn3Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdawYclNuCtzlhpqRsI2w+tZOQqjaHEq2SaQjYGmcpXGx6db8bzVyCqHCoH4pfStwC8ZZwcCf4qYamy8kMiG/dfFWEl2qvegnOxZuSE4JhTvbEZJJRIORbH3bIq5TqCNJ0GSdG5FLKZclqkvXmcTsjhCnhjwLvwnjinDAejMcYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbmIH03g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbmIH03g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575931F00A3A;
	Wed, 22 Jul 2026 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738113;
	bh=7wFP9K+pglYWRXMA16/s/MXPE9LzK7SPeceThNnn3Jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mbmIH03gDK39nQlc76aqTqi3LO+NnKm6/028Alk5NUAhwV7VcVEdxk7BtVybeh1gD
	 xVvn6OTnGCOz5Jf5L3MpWb3YQPrUJVtXp8XMd7623lcaN8rjs9XMrneq2TAJvFxMxZ
	 8/oUVmbcIh5dKHDJDZdjPK2haG1eiP3diojXIhzh7W6gJmcU/BCvA8dTpuPpv2YmFh
	 97L6tyNg3mRpET4NIbcLltKkNfR3vaG3eWN2unMvgapSsKpuMx8Pl7K55tQPaJrdTi
	 wBv+k/UcrLIBy3N+Rl2gKEG9isy7z1m5j+M2WTluwn0KqIPsc/9COy4qSw+Mz5AYRG
	 LanN7J3rVCrMg==
Date: Wed, 22 Jul 2026 17:35:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Philippe Baetens <philippebaetens@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: media: i2c: Add mira220 image sensor
Message-ID: <20260722-overpower-sphere-b6ab35e10314@spud>
References: <20260722-mira220-v7-0-dd5f1de98cd4@ideasonboard.com>
 <20260722-mira220-v7-1-dd5f1de98cd4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CyUIdzytpsQqTs1v"
Content-Disposition: inline
In-Reply-To: <20260722-mira220-v7-1-dd5f1de98cd4@ideasonboard.com>

--CyUIdzytpsQqTs1v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--CyUIdzytpsQqTs1v
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCamDxPQAKCRB4tDGHoIJi
0vYVAP9g6NWGiXjvwMhnc1bb9xEZY1yWWOsc4BLoCoBtqeAiGwD+PCqEbgpw8eg3
5KDhSDiPt33gfTadDFeOAMrvwPBA6QI=
=qgZ3
-----END PGP SIGNATURE-----

--CyUIdzytpsQqTs1v--
