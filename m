Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B012433BBCD;
	Wed, 22 Jul 2026 06:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701173; cv=none; b=ItFiVFyhinmHZYvjfGQzrIXxQG2Um8UwnNVHMx+/bzW6gioscBWoXgTGOuDHce5n3Rgjt+2pYB3peLP+HajTG0hVoZbOmGOm/vvj82oGX9woRRiP83ARoSxUToPxZbtWrghVMMe6twIi35PKG3Wja22DOfgvmZcbimUH8i4QsHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701173; c=relaxed/simple;
	bh=xqpvfA0WLUaIHGyt23U1itcbS20V7/b242bSCICE/B4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=uWP3Sta4AQbJJ7Gu5peAFEBPh+VbprB2H+cI7RsZ3895I+xIaOdKN13LUa8NlpelxROcmK2fHj15BZZK7n6mAIsGrBz7KhRtSDkqCiBf7sWxYvW4Gaoam8jR0UiWtSRBz5TKvEodheHK5Mz9vTtArnsq7STWL1XY6IRODmGSoIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jBMMSDtA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jBMMSDtA"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21E6E838;
	Wed, 22 Jul 2026 08:18:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784701110;
	bh=xqpvfA0WLUaIHGyt23U1itcbS20V7/b242bSCICE/B4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jBMMSDtAhaK8jZs+nyqQ7tLIxXpoSdXxH7gRmLr3XTUB0LAVi04ImGqZi+AP5Ptm/
	 ECTl6mE/UhBpCcwJObA7JytBHXn9FMHAD5X4j5zw2wZpLKl8VZ/qdZUEhM1ahCOk2e
	 rdo/MUeVOG6bZ7jehwEWYuJixE5gJk75/womB/Ls=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <178470106909.3005206.2322043808025262811@freya>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io> <20260718200912.16001-10-tarang.raval@siliconsignals.io> <178470106909.3005206.2322043808025262811@freya>
Subject: Re: [PATCH v3 09/17] media: i2c: os05b10: update pixel rate on 10/12-bit mode switch
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Tarang Raval <tarang.raval@siliconsignals.io>, mehdi.djait@linux.intel.com, sakari.ailus@linux.intel.com
Date: Wed, 22 Jul 2026 11:49:24 +0530
Message-ID: <178470116466.3005206.11839379637753408198@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Jai Luthra (2026-07-22 11:47:49)
> Quoting Tarang Raval (2026-07-19 01:39:00)
> > After adding 12-bit RAW support, the pixel rate depends on the selected
> > mode bpp. Store the V4L2_CID_PIXEL_RATE control pointer and update its
> > range/value when the mode changes so 10/12-bit switching reports the
> > correct pixel rate.
> >=20
>=20
> Link frequency (output bus rate) and Pixel rate (sensor internal readout)
> can often be independent of each other. It would be good to verify that in
> the sensor documentation.
>=20
> A quick test would be different bpp and the same HTS/VTS and frame size
> registers if you get the same frame rate, it's likely that the sensor's
> internal PIXEL_RATE doesn't change due to bpp.
>=20

If this sensor indeed operates on different pixel rates just because of the
output width, I would suggest you squash this to the prior patch which
introduced the 12 bit support.

> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
>=20
> Thanks,
>     Jai
