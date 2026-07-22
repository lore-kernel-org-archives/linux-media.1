Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1C6348C66;
	Wed, 22 Jul 2026 06:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701088; cv=none; b=qnjauC7c5vLoh7V6H8IRRsgkeSQW2UVqgdg8Rh0XoLwXSbIgqKs4MhSovFkNL8H19RCebZDp4bHJ/kVpsa9jSnIUyL7sMK8e6BZ0KdALBAuDJM3WxucuI5YNhnrTE+yd7MPvpDODr4Upy4ZmITQeBrGIKmvaIJIkZROBnOsRnDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701088; c=relaxed/simple;
	bh=/RwJ4etSk5sgYJ35kB3DreGfNLApsXmmKa1zEbDpEMA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=cIniNUWoYk5wpQRRmTMfFErSpr3s2blr/YXaHTwHQSPn+frdN2lJ9MSYjjfzb/nTXwZI3X5Gu/rp2YKvdjwnUPXfWM22VdgA32KDwDVZ+HmxcjIa5wCPb/CUeBLPPoJweuHJ0cN0PliIFLHSIOFZDYf7ICzywA2iuVX+esjHMQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RwaBLKKi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RwaBLKKi"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5046B838;
	Wed, 22 Jul 2026 08:16:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784701014;
	bh=/RwJ4etSk5sgYJ35kB3DreGfNLApsXmmKa1zEbDpEMA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RwaBLKKiw2ExineLDLsPcS6dv5LpeKcnlXBDAUCxwtaOME0t0n3U45M9oznc2kWye
	 DASLhFkZ/NfUMbUUUKXCeV7U0KlNtVuPVlC/doF5cpjTuE4VMNw9Yg//W9Kc2t7jBK
	 ofoifmj91H3gOicx3h/L0rTGRXZDTFIBVpYSFcB8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260718200912.16001-10-tarang.raval@siliconsignals.io>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io> <20260718200912.16001-10-tarang.raval@siliconsignals.io>
Subject: Re: [PATCH v3 09/17] media: i2c: os05b10: update pixel rate on 10/12-bit mode switch
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Tarang Raval <tarang.raval@siliconsignals.io>, mehdi.djait@linux.intel.com, sakari.ailus@linux.intel.com
Date: Wed, 22 Jul 2026 11:47:49 +0530
Message-ID: <178470106909.3005206.2322043808025262811@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Tarang Raval (2026-07-19 01:39:00)
> After adding 12-bit RAW support, the pixel rate depends on the selected
> mode bpp. Store the V4L2_CID_PIXEL_RATE control pointer and update its
> range/value when the mode changes so 10/12-bit switching reports the
> correct pixel rate.
>=20

Link frequency (output bus rate) and Pixel rate (sensor internal readout)
can often be independent of each other. It would be good to verify that in
the sensor documentation.

A quick test would be different bpp and the same HTS/VTS and frame size
registers if you get the same frame rate, it's likely that the sensor's
internal PIXEL_RATE doesn't change due to bpp.

> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

Thanks,
    Jai
