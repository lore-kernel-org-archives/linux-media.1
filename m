Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA79438F92A;
	Fri, 19 Jun 2026 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781873924; cv=none; b=bxBceLyueddTIqUoldjuBZ2eL1ifatP9GR2WswaJC92VYLdPIhfhvikaw7anCnQYF+0Hfa2+KLzcvxIoZnmC6G8OVxFutnJi3IE1JHjbF07JGcCwNPbG7T/HWBF2Xd2aF8Sb0oczU8h9OERKTJBR0iEeTLeu3JE7jBcEqeTalks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781873924; c=relaxed/simple;
	bh=HiDREcldjFqrdrdp5Xlz4s4JZZQQ28o1nkYTsGqkkqo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=S19UhDTqGLGHkhCM7NzlcPqMQtVxin75rG5WY4VirYC+P4ediS+gChduqIhPeBiyt8KRz1OpxQv1ZrecLYOn4BCCOTdwC4foiodiP2B0fczu4cYnnbEnqS3ZZ4T2+6mJsDj3USTpc+QuwodeuEpPtWg3VmgOEaL7Dfa/t+lfVn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSqkhaxR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSqkhaxR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1A51F000E9;
	Fri, 19 Jun 2026 12:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781873917;
	bh=d0Pi+BMv6vNYyFoag1XFUtPquKbXVfT0i1yiV+bM+HU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=PSqkhaxR3FQBweBoWpSc2EorY9Pez8SIDdeV3sC6lRA+WQgDMLdZA+W2gA/jtTjk6
	 Ekiyp7acgu6TijirW2qXF2y9K6x5DYjccWRB1qYutK9TB9SpkY8pqSf95PdLaJhdxv
	 P5f1YgY2ouHTHsw3CjKy5MoE4mQ13d1RVh47iHECGArbDe2eqUIWgJ5fValDrya85S
	 tpAjHsJGrPe4YJhVtSDcMRrDjgy3FY4Rwgp4X7oIpo85wCXO9i/HHvvyVYHoIFYZFk
	 UFfbHcyA/Hy1+atRYojuEQTbX4GA9O0X8cwj42q17bLMl6r3H/nGzCBWRMndIBLwRJ
	 77oRCRWCJOa9g==
Message-ID: <755cf7c1-6bcc-45d1-afea-192d393256af@kernel.org>
Date: Fri, 19 Jun 2026 14:58:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 2/5] docs: media: add documentation for media client
 usage stats
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, Christopher Healy <healych@amazon.com>
References: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
 <20260617-v4l2-add-fdinfo-v2-2-d298e98ce06a@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <20260617-v4l2-add-fdinfo-v2-2-d298e98ce06a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Detlev,

Interesting, I had never heard of fdinfo, so if nothing else, I learned something new!

On 17/06/2026 20:10, Detlev Casanova wrote:
> From: Christopher Healy <healych@amazon.com>
> 
> Document the media fdinfo interface for per-file-descriptor usage
> statistics exposed by stateless V4L2 codec drivers via
> /proc/<pid>/fdinfo/<fd>.
> 
> This interface is designed for stateless (request API based) codec
> devices where the kernel driver has per-job visibility into hardware
> execution. Stateful codecs cannot support all of this because their
> firmware manages job scheduling opaquely.
> 
> The specification defines media- prefixed keys for engine utilization
> time, and operating frequency, following the same conventions as the DRM
> fdinfo mechanism documented in drm-usage-stats.rst.
> 
> More fields can be added later.
> 
> Signed-off-by: Christopher Healy <healych@amazon.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../userspace-api/media/drivers/index.rst          |  1 +
>  .../media/drivers/media-usage-stats.rst            | 85 ++++++++++++++++++++++
>  2 files changed, 86 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> index 02967c9b18d6..61879738836c 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -34,6 +34,7 @@ For more details see the file COPYING in the source distribution of Linux.
>  	imx-uapi
>  	mali-c55
>  	max2175
> +	media-usage-stats
>  	npcm-video
>  	omap3isp-uapi
>  	thp7312
> diff --git a/Documentation/userspace-api/media/drivers/media-usage-stats.rst b/Documentation/userspace-api/media/drivers/media-usage-stats.rst
> new file mode 100644
> index 000000000000..d3dc07002f62
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/media-usage-stats.rst
> @@ -0,0 +1,85 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _media-usage-stats:
> +
> +==========================
> +Media client usage stats

stats -> statistics

But are these really statistics? Isn't it just the current status?
In many ways this feature looks to me similar to what VIDIOC_LOG_STATUS does,
except in a nicer format. When VIDIOC_LOG_STATUS was first added, fdinfo
didn't exist yet.

And I wouldn't call it 'Media client': it's specific to stateless V4L2
codec drivers.

> +==========================
> +
> +Stateless V4L2 codec drivers can optionally expose per-file-descriptor usage
> +statistics via ``/proc/<pid>/fdinfo/<fd>``. This is analogous to the DRM fdinfo
> +mechanism documented in :ref:`drm-client-usage-stats`, but uses the ``media-``
> +key prefix for V4L2 media devices.
> +
> +This interface is specific to stateless (request API based) codec devices,
> +including both decoders and encoders. With stateless codecs, the kernel driver
> +explicitly submits each frame to the hardware and receives a completion
> +interrupt, providing a clean per-job boundary that can be attributed to the
> +submitting file descriptor.
> +
> +Stateful codec devices cannot support this interface because their firmware
> +manages job scheduling internally. The kernel driver submits bitstream data
> +but has no visibility into per-frame hardware execution timing.
> +
> +Implementation
> +==============
> +
> +The V4L2 core provides the plumbing: drivers implement the ``show_fdinfo``
> +callback in ``struct v4l2_file_operations``, and the core wires it into the
> +kernel ``struct file_operations`` so that ``/proc/<pid>/fdinfo/<fd>`` output
> +includes the driver-provided keys.
> +
> +File format specification
> +=========================
> +
> +- File shall contain one key value pair per one line of text.
> +- Colon character (``:``) must be used to delimit keys and values.
> +- All standardised keys shall be prefixed with ``media-``.
> +- Driver-specific keys shall be prefixed with ``driver_name-``.
> +
> +Mandatory keys
> +--------------
> +
> +- media-driver: <valstr>

I'd pick 'v4l2-driver'. Since 'media-driver' is too generic for this
since that encompasses also DVB/CEC/RC drivers.

> +
> +  String shall contain the name of the media driver.

'V4L2 stateless codec driver'

> +
> +- media-type: <valstr>

Poor name.

> +
> +  String shall identify the type of media engine exposed through this file
> +  descriptor. Standard values are ``decoder`` and ``encoder``.

I think I would use 'stateless-decoder' and 'stateless-encoder'. It's more
specific than de/encoder since that can be stateful as well.

So I am missing the big picture here: right now this patch adds support for
this for stateless codecs, but what happens in the future if this is also
added for regular video capture devices, ISPs, etc.?

The naming here matters, it has to have some sort of scheme so it can be
extended to other types of drivers. So a 'media' prefix is too generic,
and it also looks like it refers to the /dev/mediaX device.

> +
> +Utilization keys
> +----------------
> +
> +- media-engine-usage: <uint> ns

'Media Engine': very vague.

> +
> +  Time in nanoseconds that the hardware engine spent busy processing work

Cumulative since creating the file handle? Or since the last read?

> +  belonging to this file descriptor. The engine being measured is identified
> +  by the ``media-type`` key.
> +
> +  Values are not required to be constantly monotonic if it makes the driver
> +  implementation easier, but are required to catch up with the previously
> +  reported larger value within a reasonable period.

Does this make sense for codecs?

I can tell that this is heavily influenced by the drm documentation, but that
does not necessarily translate to V4L2.

> +
> +Frequency keys
> +--------------
> +
> +- media-maxfreq: <uint> Hz
> +
> +  Maximum operating frequency of the main engine clock.
> +
> +- media-curfreq: <uint> Hz
> +
> +  Current operating frequency of the main engine clock.

'Main engine clock'?

> +
> +Example output
> +==============
> +
> +::
> +
> +  media-driver:           hantro-vpu
> +  media-type:             decoder
> +  media-engine-usage:     123456789 ns
> +  media-maxfreq:          600000000 Hz
> +  media-curfreq:          600000000 Hz
> 

Regards,

	Hans
