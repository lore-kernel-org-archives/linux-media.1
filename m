Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B218493644
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 06:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787726194; cv=none; b=up4tZGYRP0IZGe+ylQjbJA6T08F2EU5Vjl5AkkRTSnALqMFfKz3EwRhZMcgJaZrbF7oFWjNxJwe9UrndT4qFDReySpQiuv+iewAfREpLaDYbY6tYsUUdAdnUOr0pW2rF+2sasWOVgfHGDt6VI63iW5mG8FT5XCJRqRfKNdA0Tug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787726194; c=relaxed/simple;
	bh=CY7NYRYbPUFlU1dv+JfhOUmzI7I7ffWyX927ajfg8k4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=sEe53dGXxMsqIlfPT7RwySNWUdaTuGgkMWfm6tYzWU8tV3J2GFZC8UXHN8utrQhPxaPknpgRzEQ8WWbNhooKGDVcwsQ4pvJx3OHOpSA94yYmS0aGXE6oVEOEwt1zT0NgJkrQ7Fhm45BcM4GY+JF2kQDeDPL0YzWT/tEzdML1o2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ktSGOLN0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ktSGOLN0"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:56b2:8fe2:337f:8c01:dede])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0760F19C;
	Wed, 26 Aug 2026 08:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787726105;
	bh=CY7NYRYbPUFlU1dv+JfhOUmzI7I7ffWyX927ajfg8k4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ktSGOLN0RMMcaJ6NU9nfi7jAJrK5Ic9uSqKjJ2WZRrZfrXX15jW/A+vQZr7EYVA39
	 P82dHadjdRzGQMcB6E5qjDgmN8ZMBTjyO9JkbFy6xvox/EeGc7kb2BFKfeELRFirgu
	 wD1KuWodRlM8zS1aZTW9ccm47nY2dBL58/oge4N8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260824121451.3348583-30-sakari.ailus@linux.intel.com>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-30-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 29/29] media: j721e-csi2rx: Use v4l2_subdev_get_frame_desc()
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Wed, 26 Aug 2026 12:06:26 +0530
Message-ID: <178772618606.9142.12903873900033648076@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Sakari Ailus (2026-08-24 17:44:51)
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai
