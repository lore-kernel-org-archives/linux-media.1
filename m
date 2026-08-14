Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C4142DA29
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786695486; cv=none; b=jjYYrVWGgJ+WyaBDHINSpr9549B8RTGm8IyDVbcwaOowSHNR3Jf7UpIYkHz2o6CUofN5FmqwYqk+0ZSqhoVGZ6llmIbPO9PieYiHp+chrmtKd48P7PSGNKOtsEI5iMDk0+YA5jHv9Fbyc+h+BHEiCTdURO/i521zU2Ny2e/IF5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786695486; c=relaxed/simple;
	bh=aY/1bExoj5pvBrOIrCRMGBkSxbwgthc11ZcOCjFcGSY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HjsgGEtmznoUIqetG4eb+vfVuZFfVoQVnAC4o1jcItp5UC3kyArOP5oq0QTKRIWrM3mN/1RIrx7EKR/SBBfC8NBu7EAC4L2QXdFbgNnL+gDo0K1ylSmNWWdtG9Eb8c5zvLPq9v+vl5pSD/FHGk2wFvZXfORnB2j6sg6JpVknc7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzlzBF84; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzlzBF84"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7041F000E9;
	Fri, 14 Aug 2026 08:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786695482;
	bh=mKP7zgM8858Yd0t2ptZPUT8ioYR+Q1ATTYrOxbnqJGI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=YzlzBF84ZAQsmxCeHHTal8X77+zP/f1oIQ8ZHPl9Gx4qtDZ6Vprpe+wFS+GcQ4gCe
	 SpTyD/X2TZ8bKDKf6kmzlCzY3SN+7D9sZpvNdT1PbuYxQ449MdPdlIiSok/LjM8Np/
	 1abahmHeh7hL7OSAWqnEhNLo3ieUkmjynjdtK4k12WmdTxKkaXxA6aj1OFPLOA63ve
	 SXEyDumRUYJJ6fpW6+0o1dDlkhj1+7U0wtkIpG9jn8bpR8j/7Dd1bkgTSQyHWS+328
	 cjBZzL/aXhTJe0hqAUgcYK68Sc7Q+cvmJy2G9bCbUdWlv8f5E+8w25w6kCcUk/kiFD
	 G9Z4L+xAARxMA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Jai Luthra
 <jai.luthra@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v2 00/17] Rework frame descriptors
In-Reply-To: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
Date: Fri, 14 Aug 2026 10:17:59 +0200
Message-ID: <87pkzl15fs.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Sakari,

Thank you for the series.

On Mon, May 18, 2026 at 19:43, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

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
> On callee side these patches introduce no changes as the number of
> pre-allocated memory for 8 frame descriptors remains as-is. The
> get_frame_desc() pad op can return more than 8 frame descriptors by
> setting the num_entries to the desired number and returning -ENOSPC.
>
> If people prefer using cleanup.h / __free() to release the dynamically
> allocated array (I think I'd almost require that), I'll merge the
> now-separate __v4l2_subdev_get_frame_desc() into
> v4l2_subdev_get_frame_desc().
>
> More formats can be added to df-to-mbus conversion as needed. These are
> meant to be initial formats that are enough for typical raw sensors (and
> one RGB format, too).

I've tried this out on a AM69-SK with the Arducam FPD V3Link[1] using
the following device tree overlays:
  ti/k3-am68-sk-v3link-fusion.dtbo ti/k3-v3link-imx219-0-0.dtbo

See TI's documentation about this [2]

I (naively) assumed that this series would replace Tomi's patch [3], but
it did not. I see the following in dmesg:

[  286.686574] cdns-csi2rx 4504000.csi-bridge: collect_streams: "cdns_csi2rx.4504000.csi-bridge":1: found 0x1 enabled 0x0
[  286.686754] ds90ub953 7-0044: Failed to get frame desc from remote subdev imx219 10-0010
[  286.700147] ds90ub960 7-0030: Failed to get source frame desc for pad 0
[  286.712679] j721e-csi2rx 4500000.ticsi2rx: enable streams "ds90ub960 7-0030":4/0x1
[  286.712684] ds90ub960 7-0030: collect_streams: "ds90ub960 7-0030":4: found 0x1 enabled 0x0
[  286.712690] ds90ub953 7-0044: Failed to get frame desc from remote subdev imx219 10-0010
[  286.725884] j721e-csi2rx 4500000.ticsi2rx: enable streams 4:0x1 failed: -515

Here is my camera topology:
https://paste.debian.net/hidden/7f56f635

I also made the following patch to attempt to convert over j721e-csi2rx:
https://paste.debian.net/hidden/314f9c32

Is this series indeed aimed to replace all sensor-specific
implementations of .get_frame_desc() or are patches such as the one send
from Tomi [3] still useful?

Thanks
Mattijs

[1] https://www.arducam.com/arducam-v3link-camera-kit-for-ti-development-boards.html
[2] https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-am69/11_00_10_01/exports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/Camera/CSI2RX.html
[3] https://lore.kernel.org/all/20260611-imx219-frame-desc-v1-1-fe7e975bca6e@ideasonboard.com/

>
> since v1:
>
