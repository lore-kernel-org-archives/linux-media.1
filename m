Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222100;
	b=oIe5WRmDGROKVNFSgUq8ZyroCHQnem69WBefkHOPkEHREk6s5Zy5G3i8t3JZxwtdtg2N
	 GG3bgitYpniZOqvxbIciPAbwiBOxWsMsjq379i/4lvYYqHm0F2ogixULjXS+HjQzz2eM2
	 R3imW0FyEX6cyAhn48SnUk8etAdh7NDdQsynX1wA3wKlhB2KxFG2/foy89uKLTZj5qT4M
	 DDQTga6mS4q7WVZ/BUyqTv6Ukn1nJjSUFWZpHv9D7VAhYyZQkqPCM3jzmvhFS8JSBraSR
	 LD40ibQYvvKNUnqV/0sd5VUlFS+aPTIP+ikYm1l8LTQFsycyyw1jdK6cTte5rl+tzSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222100;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:In-Reply-To:References:Subject:From:Cc:To:
	 Date:Message-ID:User-Agent;
	bh=r0jvpkMwIDIEwKQrqX0VQfM5r4t5N3lS/mxVLAKRxxA=;
	b=TVU6JfL1+As01zwFdvg+x3Zgmhpk6L1nLst61PgdU011WBGxC9zY7FBmnQmE5SxDXleV
	 VKkneSlVn/yHyrs3VWpnqFQ+ySkeT9zwHDnzotYPEoZffQ82tyhVAJZdfxtQvJxNapmD5
	 2hGZO/n1TKhcHsRku8f/W+hoMEgdRe9D2h1gOtrASKWoNIFVbsJHq/8BLzD5RkOzx7lfo
	 aZlSKk6sazMsSQhJMvhVBs+q7fTRJYwtl8tpVowhhfkNBik+6dYplJQ1S9lb0uEHALJ6h
	 my7qniA/NvX3Uc1Xb8+J/nZdoULjgDljJBif9ru3FlOnEU/Nmfc5IfIsoeA1uk3GsqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qXhsemFn;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FD2606A333
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 11:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53FD2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qXhsemFn
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50796981;
	Mon,  9 Nov 2026 11:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794221953;
	bh=ovk7PJPDnwb0OuzE+Px9pclh6O7F7pvF3dmPA5hB8x0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qXhsemFnxfuHtZnuyr4XaHZ1oNIP+tlUaiXhIf16yxGqURTCnpIyLGoMUDUBn/bro
	 Tao+n5J51i6zt2YHTPUhThDiYbDWk+5XqLMpSkIgUEf53tAhsGwwxOExvJ0Oa1KZDC
	 w7cOu6echYkmnDplXdb7kGW4n7qqlxRoqOcI74rE=
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261109095656.1939-1-sakari.ailus@linux.intel.com>
References: <20261109095656.1939-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 1/1] media: ipu6: Improve Kconfig help text
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Mon, 09 Nov 2026 11:01:31 +0000
Message-ID: <179422209178.3205399.13142186171954095368@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Sakari Ailus (2026-11-09 09:56:56)
> Add IPU 7.5 to the menu item name and list the supported variants and the
> SoCs they're found in.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Not that this is a complicated change, but this has already proved
useful to me!

So=20

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

I can add another to keep up with Andy if it helps :D



> ---
> since v1:
>=20
> - Add Oxford comma. :-)
>=20
>  drivers/media/pci/intel/ipu6/Kconfig | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/int=
el/ipu6/Kconfig
> index 3d3c7778be38..721597bfce2a 100644
> --- a/drivers/media/pci/intel/ipu6/Kconfig
> +++ b/drivers/media/pci/intel/ipu6/Kconfig
> @@ -1,5 +1,5 @@
>  config VIDEO_INTEL_IPU6
> -       tristate "Intel IPU 6/7/8 driver"
> +       tristate "Intel IPU 6/7/7.5/8 driver"
>         depends on ACPI || COMPILE_TEST
>         depends on VIDEO_DEV
>         depends on X86 && HAS_DMA
> @@ -11,9 +11,18 @@ config VIDEO_INTEL_IPU6
>         select VIDEOBUF2_DMA_SG
>         select V4L2_FWNODE
>         help
> -         This is the driver for 6th, 7th and 8th Gen Intel Image
> -         Processing Units, found in Intel SoCs since Tiger lake and used
> -         for capturing images and video from camera sensors.
> +         This is the driver for 6th generation and newer Intel IPUs (Ima=
ge
> +         Processing Units). The following IPU variants, found in SoCs li=
sted
> +         below, are supported:
> +
> +         - IPU 6 (Tiger Lake)
> +         - IPU 6 SE (Jasper Lake)
> +         - IPU 6 EP (Alder Lake, Raptor Lake, and Meteor Lake)
> +         - IPU 7 (Lunar Lake)
> +         - IPU 7.5 (Panther Lake)
> +         - IPU 8 (Nova Lake)
> +
> +         Currently the CSI-2 receiver functionality is supported.
> =20
>           To compile this driver, say Y here! The two modules will be
>           called intel_ipu6 and intel_ipu6_isys.
>=20
> base-commit: 06d48a18b0ef9f24e79a668b4f864734eefd2ba6
> --=20
> 2.47.3
>
