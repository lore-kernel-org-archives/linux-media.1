Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D04372EF5
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218440; cv=none; b=GQDodQ/uNpGId1Nc2OmjopfML3Qks4WhzwkIRXcRQer6wzhpPb3s2zPHlYyeIhHnGffDt55v3Cq8n0FAtT3pMO6bOYnAx35eFNkMeJ08BNZYbJbg1i+OxbisqAThK2HMAXvXbeU+JdG1VWOmzebkMFmcYCUCVfmScT7QuWVncyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218440; c=relaxed/simple;
	bh=OhMyBcS9yWTtYjFmByEzh1vTnw1NAZtqpqQNzTLllqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiIMp5ph0bGrjHvONiCElVC1F/ajd/DXX3r4PwM6D0UKc/tBT5ck34Gf0lg+CTQQjdFfMKSNAx28zjWf3h5EcKlFpVy6vta/TIeQfW9lG3VAgn8ru6KBT1iDp+ldDfCEhnTvcWdu1oz1XbIuUiRZPSP9ZVNfQnP8kBHBUYL7psQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Jl0fINxZ; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Jl0fINxZ"
Date: Tue, 28 Jul 2026 11:30:08 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785218431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YhtegfG7mjeyERRXD3wh8w0uttXZitYhq7NJjRZGeZk=;
	b=Jl0fINxZ46Ht9v2XLt+4nhWvyRFm3SWREslwEdBk+c+eRC0fnpiopWZWcpjnQgjzHGlYXI
	5PfpgBZeGaRMKHITK2zi/krSY1VdGVFFnvprDpDpC3JGYKPw8IYEN8foMRU33Ny+wIUoAO
	kWUirmGEN7t1s0DuNJTd6NWouQOPcJg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCHv2 16/19] media: ti: j721e-csi2rx: use
 vb2_video_unregister_device
Message-ID: <amhFRkfFmcn8G1sW@freya>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <cover.1785157986.git.hverkuil+cisco@kernel.org>
 <afdd67b43f0bed88d897927c28c6f478106f2011.1785157986.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ecmsqsldml2xrqko"
Content-Disposition: inline
In-Reply-To: <afdd67b43f0bed88d897927c28c6f478106f2011.1785157986.git.hverkuil+cisco@kernel.org>
X-Migadu-Flow: FLOW_OUT


--ecmsqsldml2xrqko
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCHv2 16/19] media: ti: j721e-csi2rx: use
 vb2_video_unregister_device
MIME-Version: 1.0

Hi Hans,

Thank you for the patch.

On Mon, Jul 27, 2026 at 03:13:03PM +0200, Hans Verkuil wrote:
> The vb2_queue_release() function should not be called directly from a
> driver. Leave that to the helper functions.
>=20
> Replace the vb2_queue_release/video_unregister_device pair by
> a single vb2_video_unregister_device call.
>=20
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Jai Luthra <jai.luthra@linux.dev>

Acked-by: Jai Luthra <jai.luthra@linux.dev>

Thanks,
    Jai


--ecmsqsldml2xrqko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmpoRWcACgkQQ96R+SSa
cUUvfQ//drLKmwiM9AUIL2jFX1dPQNHY96NaRE/r3PzGSmBj9zrBWlS1YFpoLeS2
GCBzn4vB+7psbE4vms7tTx1nOytoIrEJiGTlpwFX2SZ1mQeCmS1IxHwSemzRDfa5
uCmcWZE+pmP/aEz6OfgzRt2gbaTYRUfiq30GTaMSy7TN+wcpEKNGNYMCbgUSK4eF
5jQPp1so9A9L/9OKG1LfxuMUEsez3Ngw0jU/KI76DQkQzl/TAMdZZGZnfrav+ffH
p/gv8VTd3qjGHF+pE+rbUjoMDi0lDEw32gYgF/DouAWtK7pWgbFeths3uFxIy2oZ
Hkm0el04c2icICbLb7ba/BjPzHdm9ciNjMJyRcD6yI+msg6gOb4WaocRgmn+91bN
AjZA65WX32pf5ru57ezBTquHmhbKH+bgFpYp0+J+x81V2ve9tT9fZUFD74gOhx20
w1y3G4B3DeubHMW1ANHIYIi/lFAambys25usGMNC3BDuh3kuGea8Nriu7kgp1KAj
qM3lvpzfMYq/wZ+uhlQdKCra7HY/2wuNmK0erXHXsn1kjRyQT0WrsJwr9arUgzS5
oZf6HEsXHA2p5+CP3qvR7tXbGjsU9uWCid9lJ7e2/mZ/0nUqiwT5N30O49Nyu8D2
AbVH1jQUL+3CQpJNAMh5uVuU/RfMUINNnUw7HZl2Px397PeysKQ=
=wpA8
-----END PGP SIGNATURE-----

--ecmsqsldml2xrqko--
