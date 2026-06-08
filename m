Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B26F314A65;
	Mon,  8 Jun 2026 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938582; cv=none; b=D+kyI14CdAKTin/IP+e3ewc/EYGw5W43WOZY9qxQ+B7rQIXFyasvIzvvQ8lAVo+Hx2lL/GCIjQYQxjv3PBpQtI0yRja86SqfeBgnhUuHMGxuG0ogQqVq78mGc9Et/UeBpJfRyrIMt8Q7MscMI+c6DO3Wam9dXpi4us8z3YAR0MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938582; c=relaxed/simple;
	bh=/rGXKMy0EKXlIJqKLJTteJmFxYyrAHYf+W3IT+/b/Ro=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=MXpV7jckkXNbiOZmBTO2MFB/ev4lAdz499AEkED2Ofg7iKaQI6L3uouSIBT93Sj17+RVs6g93LWezAZatZBEx28oDDLey2BHbkPtzs1/zuboE88+W9lyszgwaFUjauf7x9HBEFy2Y08oLiRkMRDRC6Oj9BWCmzPvMIReNZvBU+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=puqo3BUS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="puqo3BUS"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C121AD0;
	Mon,  8 Jun 2026 19:09:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780938551;
	bh=/rGXKMy0EKXlIJqKLJTteJmFxYyrAHYf+W3IT+/b/Ro=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=puqo3BUSYOYRKpFdsuz8LXNY2kMSgY0+96QJ7xPJWEXSrDd59gqhEBAyB4A0nkmsA
	 FEp3NJ6pwheyTG9yd2biZVGqeMgNSE7mQlAHkHTUQkGlwPUUM9VdD7qO47Edp73wda
	 LzX2/91TKoGOUm+vHzvH/+2p1bq6tGbksvf1RaZY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260608142901.3971821-3-r-donadkar@ti.com>
References: <20260608142901.3971821-1-r-donadkar@ti.com> <20260608142901.3971821-3-r-donadkar@ti.com>
Subject: Re: [PATCH 2/4] media: i2c: ds90ub960: Support multi-channel sensors
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, vigneshr@ti.com, mchehab@kernel.org, tomi.valkeinen@ideasonboard.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev
Date: Mon, 08 Jun 2026 22:39:33 +0530
Message-ID: <178093857326.19620.7813941348588669670@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Rishikesh Donadkar (2026-06-08 19:58:59)
> From: Jai Luthra <me@jailuthra.in>
>=20

It's been many years since I wrote this, so I have no idea how that email
ended up here.

Please fix it in next revision to j-luthra@ti.com like the other patch, as
.mailmap should handle redirections from it.

Thanks,
    Jai

> Before this, the deserializer would ignore the virtual channel (VC) ID
> set in the incoming CSI packets, and set the ID to the RX port number in
> the outgoing packets. This was done to support multiple single-channel
> cameras, all sending packets with the same default VC ID =3D 0.
>=20
> Now we check which (and how many) channels are under use on any incoming
> FPDLink port, and map it to available channels on the outgoing CSI port.
>=20
> Signed-off-by: Jai Luthra <me@jailuthra.in>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
