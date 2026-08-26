Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EBD2F6577
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 06:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787726352; cv=none; b=KHf+CC4oxONlKrPUjCdWVVRzDlwCSloeCQfKZeAOBEtDXN/GTYtXNMIW3eq6U8taFV3AhLQK+GZ4im59Vci2m+dP4WdRkafk6cancTQhpJR5ioQpVj4m71STGAtHaT/qHYuIDGSuo2dtqXas9TaNS1qO9V7XmNbWJVnsPW0LVq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787726352; c=relaxed/simple;
	bh=V9mH4yeFBHfTaNX6/yy5YPdz7oiw0nls6nQEhPHh5Ls=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=KCDv30gOWo/pyudfGUYu272vRgOPLgnv91tZPF/NT4DZPl9rJTw4s/jV1e+sTmgDbQY3NcfccMeKykhzYcDgllEycciR/QYmzj0Y8VMBLCuCYWKrMIna/unpLShCYNGnqBOA+Ip74baSwxF8g6xnk9hGibWGx4tfjYpMSLI4uP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WZgfvlzJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WZgfvlzJ"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:56b2:8fe2:337f:8c01:dede])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDAEB19C;
	Wed, 26 Aug 2026 08:37:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787726263;
	bh=V9mH4yeFBHfTaNX6/yy5YPdz7oiw0nls6nQEhPHh5Ls=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WZgfvlzJw3u2Pt+8xe/F0qoJNZT1jmxnGH2Z5zYHCjNwIIYk69fiUaKto4K3QKyXQ
	 KpquCGBXT6RRvSuzL6hdDYg3Zel5yPnTZKIxXoAVHzFAVxkJSO+XRLOjdlmXIE9NJ3
	 c8mYGLjXbAR+ZHOEOxpJnaRjM62l9uyP8a5eVUXo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260824121451.3348583-28-sakari.ailus@linux.intel.com>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-28-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 27/29] media: cdns-csi2rc: Use v4l2_subdev_get_frame_desc()
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Wed, 26 Aug 2026 12:09:03 +0530
Message-ID: <178772634318.9142.5552152866003324032@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Sakari,

Quoting Sakari Ailus (2026-08-24 17:44:49)
> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> preferred over calling the get_frame_desc() pad operation directly.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> Subject: [PATCH v3 27/29] media: cdns-csi2rc: Use v4l2_subdev_get_frame_d=
esc()

s/csi2rc/csi2rx

With that fixed,

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai
