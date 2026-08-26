Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83F63D4127
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738343; cv=none; b=J/oy1++qHOHC/ZRuipiPcD1uRB2wiTsl2k79Nfe6zhLJvdy5bAN/VQ4U3K6ARr/VigWQQ8Qxs5oF5drfzQNq9oXGjzOidLJCmos74IWb4rT9SkpzL0TPkpZO7BRUhAWqK61l2aAGPhbM8kgxDuxde9KWZvENOp4/vca2QGnXiak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738343; c=relaxed/simple;
	bh=ovVNX/08pIZqmRo2Y2mM+dXkdSFggvGn/D2SUWuzYBw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pKlEfeoaGKIXrxxID5h5wYUJeC/daNYofMDhxBFYYY5z51vd+/Vp9BST7yj/aPTmfR9BRAKWOBU9c/eX/wffPuV/ScyitPKncwwIzED8Oyo+zLiYESO3SEaSR3dxYJlueH1iV/ZRiDapRZGhz14yJGgLHiljw0R5F6ctMICm6uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wkn6w0Dg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wkn6w0Dg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095141F000E9;
	Wed, 26 Aug 2026 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787738339;
	bh=CMxYOD92DmIA30IIGjsmw003IQA+bC+cS8i2c1KCbEU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Wkn6w0DgJAziz3Im9HnXCCIhDGX1KvVxnt5pg2OiLDyw3ie8sao2TUYezBADAcQTi
	 Bfy/SAa7lD24Pts1XhUzUkTHvSG0UraPyZvh6mFi/e41l6XV+S0FeVWI6Z9F8qRX28
	 OpAvotzsFiD/6+y45OfXfDsbeIqQKeCYPn5J/IdgMDjfHXxgQnpxEfTKneCiHcLisj
	 07btCS5T/KzhCUgkDBI5d45e0phGSh/kaJsJ0sTBhAsNz/5yTlTTLMK67e32jzQNG/
	 dyw/nxH8edafJB9w8RkLvu6YqAXUUO3niiyIo1zg8WcGKltyNXm4DLRV91XuljGj9m
	 cU8oHi1ngZ+TQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Jai Luthra
 <jai.luthra@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v3 00/29] Rework frame descriptors
In-Reply-To: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
Date: Wed, 26 Aug 2026 11:58:56 +0200
Message-ID: <8733w1nqxr.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Sakari,

Thank you for the series.

On Mon, Aug 24, 2026 at 15:14, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> Hi folks,
>
> This smallish set makes frame descriptors dynamically allocated and
> implements a single-entry frame descriptor based on the device's format,
> using a new helper called v4l2_subdev_get_frame_desc(). All drivers that
> do not obtain their frame descriptor from upstream are converted. The
> helper also obtains a frame descriptor for the desired type (parallel or
> CSI-2) and checks there's at least one entry there. These checks are
> removed from drivers that currently perform them. (Some drivers also check
> there's exactly a single frame descriptor entry but I think in most cases
> this check could be loosened. That could be done after this set.)
>
> More formats can be added to df-to-mbus conversion as needed. These are
> meant to be initial formats that are enough for typical raw sensors (and
> one RGB format, too).
>
> In the long run this information should probably reside in sub-device
> state. This set however avoids having all receiver drivers to work with
> sub-device drivers (~ 100 of such exist) that have a single stream and so
> do not implement get_frame_desc() op.

With this series, I could sucessfully run a capture using a TI AM69-SK
with the Arducam FPD V3Link[1] using the following device tree overlays:
    ti/k3-am68-sk-v3link-fusion.dtbo ti/k3-v3link-imx219-0-0.dtbo

(See TI's doc [2] for the device tree overlays)

root@am69-sk:~# yavta --capture=10 --file='capture-#-srggb8.bin' --size 1920x1080 --format SRGGB8 /dev/video4
Device /dev/video4 opened.
Device `j721e-csi2rx' on `platform:4500000.ticsi2rx' (driver 'j721e-csi2rx') supports video, capture, without mplanes.
Video format set: SRGGB8 (42474752) 1920x1080 (stride 1920) field none buffer size 2073600
Video format: SRGGB8 (42474752) 1920x1080 (stride 1920) field none buffer size 2073600
8 buffers requested.
length: 2073600 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffff86a55000.
length: 2073600 offset: 32768 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffff8685a000.
length: 2073600 offset: 65536 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffff8665f000.
length: 2073600 offset: 98304 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffff86464000.
length: 2073600 offset: 131072 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffff86269000.
length: 2073600 offset: 163840 timestamp type/source: mono/EoF
Buffer 5/0 mapped at address 0xffff8606e000.
length: 2073600 offset: 196608 timestamp type/source: mono/EoF
Buffer 6/0 mapped at address 0xffff85e73000.
length: 2073600 offset: 229376 timestamp type/source: mono/EoF
Buffer 7/0 mapped at address 0xffff85c78000.
0 (0) [-] any 0 2073600 B 105.308050 105.308081 11.612 fps ts mono/EoF
1 (1) [-] any 1 2073600 B 105.341380 105.341435 30.003 fps ts mono/EoF
2 (2) [-] any 2 2073600 B 105.374708 105.374764 30.005 fps ts mono/EoF
3 (3) [-] any 3 2073600 B 105.408031 105.408079 30.009 fps ts mono/EoF
4 (4) [-] any 4 2073600 B 105.441357 105.441394 30.007 fps ts mono/EoF
5 (5) [-] any 5 2073600 B 105.474683 105.474721 30.007 fps ts mono/EoF
6 (6) [-] any 6 2073600 B 105.508009 105.508037 30.007 fps ts mono/EoF
7 (7) [-] any 7 2073600 B 105.541334 105.541368 30.008 fps ts mono/EoF
8 (0) [-] any 8 2073600 B 105.574664 105.574707 30.003 fps ts mono/EoF
9 (1) [-] any 9 2073600 B 105.607990 105.608044 30.007 fps ts mono/EoF
Captured 10 frames in 0.386114 seconds (25.899081 fps, 53704334.562154 B/s).
8 buffers released.

Base: commit 56c29fa3ee66 ("media: rzg2l-cru: Align bytesperline to hardware DMA stride requirement")

Tested-by: Mattijs Korpershoek <mkorpershoek@kernel.org> # am69-sk

[1] https://www.arducam.com/arducam-v3link-camera-kit-for-ti-development-boards.html
[2] https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-am69/11_00_10_01/exports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/Camera/CSI2RX.html

