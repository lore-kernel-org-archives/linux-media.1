Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885A72CCC5;
	Wed, 22 Jul 2026 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700865; cv=none; b=gvBxgveyz9Hd9QjS6YnY1sxHk5pLgRjiQZwmtNooNAknWsqOKE8VX3H8V9Ef07A1d2BTFQ98RzF4nQ4sgyymdqAj8wLqa2dkjq+tr+uvy2QKzh9HzXKY/rWzi/joaT7pHzplMoI9ehm9UHu+JdUj9xaNHzZFbFbK4LHIU9ErZxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700865; c=relaxed/simple;
	bh=+jTuTgyrmYJmzCVs0EbD5n0wPAx2v93cx8g8xCYa1Ts=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Zs1X6T5zPlbnFBO4VHnARPj2NrwMVqm0GLl0u5n1XDRNvWoBrnIV0i48P5yNROb82UfbwGAdW06L5keDeKJn9K6SGPXRFa8wgTomwA7wt1VhDI/eGTwH3ckFb1OMJMdNIRwqrbDilmJ+zw2UHr4Q73mFRf2IQQdInZzkCtqIy4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pVt8pSef; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pVt8pSef"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48507838;
	Wed, 22 Jul 2026 08:13:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784700802;
	bh=+jTuTgyrmYJmzCVs0EbD5n0wPAx2v93cx8g8xCYa1Ts=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pVt8pSefdZWLzbcu4If/dvF1PhoIkdTCj6IPS1RvPHzr9fkDcj96C28IjO/g1xh+L
	 6ooixTLuTobUMuQa17w7DDfYmx3fC9GUBbbMmt4chTCAqNag2B+zY6c/T2uOxdf4rt
	 +OXei3sHIZl9BJ3vpG8vHc+xQ6TSilul5je61HSY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260718200912.16001-16-tarang.raval@siliconsignals.io>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io> <20260718200912.16001-16-tarang.raval@siliconsignals.io>
Subject: Re: [PATCH v3 15/17] media: i2c: os05b10: fix negative hblank calculation
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Tarang Raval <tarang.raval@siliconsignals.io>, mehdi.djait@linux.intel.com, sakari.ailus@linux.intel.com
Date: Wed, 22 Jul 2026 11:44:16 +0530
Message-ID: <178470085696.3005206.11254594678743972885@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Tarang Raval (2026-07-19 01:39:06)
> hblank is computed as "mode->hts - mode->width", but both are u32.
> For every mode hts < width (e.g. 1744 vs 2592 for 2592x1944), so the
> subtraction wraps in unsigned 32-bit arithmetic instead of going
> negative. That wrapped value ends up in the control's s64 min/max,
> which v4l2-compliance flags as out of range:
>=20
>     fail: v4l2-test-controls.cpp(413): returned control value out of range
>     fail: v4l2-test-controls.cpp(476): invalid control 009e0902
>=20
> and v4l2-ctl shows:
>=20
>     horizontal_blanking 0x009e0902 (int): min=3D4294966448 max=3D42949664=
48
>     step=3D1 default=3D4294966448 value=3D-848 flags=3Dread-only, has-min=
-max
>=20
> The same bug exists in os05b10_init_controls(), which sets the
> control's default before os05b10_set_framing_limits() runs.
>=20
> Fix both sites by casting to a signed type before subtracting, so the
> real (possibly negative) value is computed directly.
>=20

While the framework accepts negative blankings, IMHO they physically don't
make much sense.

Many sensors scale their HTS register by some constant factor, so increment
of 1 in HTS does not mean 1 pixel on a line, but 4 or 8 or n pixels.
This also affects the internal "pixel rate" for framerate calculation.

Please look at imx283, imx678 etc.

Thanks,
    Jai

> Fixes: 3aa9296a23ec4 ("media: i2c: add os05b10 image sensor driver")
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
