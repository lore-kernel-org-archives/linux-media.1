Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0524420495;
	Wed, 15 Jul 2026 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121155; cv=none; b=NgnTl6pu6g4bNXSV767+kCNB5VEOJVUNYJq3Q8+GXkpRlLXXmZABk6qt9sjeVtMbwxvnvxqz5RuhhdcM2yCzyxSlTFcfwmR53oeSNzTCe9lEDFjvkOE7RvtMvmB4KXWyUKzK9EzmxbKCJqSUglrUsabCLCyCfMIDO7o0fWevQYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121155; c=relaxed/simple;
	bh=XGN7BFdS/LKkpUJc5roZeNjnZBPNOwT8tOyFySVQXgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMqjFFcOJ+NCR5CDRF9snog/iL/xp8Mg7Re8PP5oEBcj6hX0wj/TS/Dnxin7kqXuKA6k9qHLdcVpCXS83yMk2GTOGZrJGwIcNybx99k2CTTAwWH0J+7QnSbS9FxfLmKp0gVN8S2yoyfRoJ3Km+RQJjlFkUN2kBXZtTPih8FvMJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQ7/42Kt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQ7/42Kt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE211F000E9;
	Wed, 15 Jul 2026 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784121153;
	bh=eJfLN6lP6BmE/q1ec6OtOvBc/jqSsPl91sQ88cQ37pU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XQ7/42KtY5fIHwEjV3B8fD9uyEQPTkjAsISyyqKBf8OxZjFCFJmryCLKbBg7frI6w
	 Ci5XEszRpI/Vu58SU8iEFeCw9Y/gVLkXrjYiuI+xEyeTrEyCnqCEQe3B65SB0zhhcJ
	 s8+oN/ec4/W4vFR8QHfhjwtWRJGx03l3r/YSbh84rhRH1Z3LGsP/X+LWSELhN771yt
	 ptPhbqioo/FPbmqAaBXHZLtfGUkdCoL+ShgJpb83wN92Xn+rAFnirVNESrdrhKzYiW
	 xF0TTUup7o6flml8wRTyYfFHv5pwqOdk4ZZPw9BbRI+JuhEbE98LGz1Yc6F0pJZslg
	 GXPa2qmi5nVfA==
Date: Wed, 15 Jul 2026 08:12:32 -0500
From: Rob Herring <robh@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Lachlan Michael <Lachlan.Michael@sony.com>,
	Ryuichi Tadano <Ryuichi.Tadano@sony.com>,
	Kengo Hayasaka <Kengo.Hayasaka@sony.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/2] media: Add bindings and driver for Sony IMX678
Message-ID: <20260715131232.GA1106419-robh@kernel.org>
References: <20260703-imx678-v5-0-0523dbed0dad@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-imx678-v5-0-0523dbed0dad@ideasonboard.com>

On Fri, Jul 03, 2026 at 02:49:15PM +0530, Jai Luthra wrote:
> Hi,
> 
> This series adds dt-bindings and a basic V4L2 driver for Sony IMX678
> camera sensor.
> 
> More details about the sensor and features supported in the driver are
> in the relevant patches.
> 
> Support for binning and cropping has been dropped from this series, in
> favor of implementing it with the new raw sensor model proposed by
> Sakari. [1]
> 
> I have a WIP branch [2] that uses the new raw sensor model to implement
> the following features for this sensor driver:
> 
> - Internal pads
> - Streams
> - Generic raw formats
> - Embedded line data
> - Configurable analogue crop
> - Configurable binning mode
> - RAW10 output
> 
> [1]: https://lore.kernel.org/all/20260409201501.975242-1-sakari.ailus@linux.intel.com/
> [2]: https://github.com/jailuthra/linux/commits/imx678-meta
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> Changes in v5:
> - Rebase on v7.2-rc1
> - Drop note about the fallback name in the bindings commit message
> - Drop unnecessary code like set_pad_format() or set_framing_limits(),
> those will be added later when we use them for cropping and binning
> - Explicitly set format in init_state()
> - No need to track rpm_in_use flag, so drop it
> - Drop SUBDEV_FL_HAS_EVENTS flag
> - Drop unused format parameter from program_window()
> - Use container_of_const()
> - Add missing media-bus-format.h header
> - Cleanup comments
> - Link to v4: https://lore.kernel.org/r/20260605-imx678-v4-0-58e57c67143d@ideasonboard.com
> 
> Changes in v4:
> - Drop support for freely-configurable resolution through cropping and binning
> - Expect both specific and generic device name in device tree compatible
> - Reduce analogue gain maximum to 100 (30dB) as the gain register
>   includes digital gain from 101 (30.3dB) -> 240 (72dB)
> - Minor bug fixes and cleanups following review comments from Sakari,
>   Tarang on v3
> - Link to v3: https://lore.kernel.org/r/20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com
> 
> Changes in v3:
> - Use `reset-gpios`, mentioning the sensor XCLR acts like RESETN, instead of `xclr-gpios`
> - Update minimum crop width and height according to the PIX_[HV]WIDTH
>   register limits
> - Expect the user to first select a crop rectangle using S_SELECTION,
>   and then choose one of two sizes (non-binned or binned) in S_FMT. This
>   matches what IMX296 already does, simplifying the selection logic
>   quite a bit.
> - Enumerate only the frame sizes possible for the current crop rectangle
>   in ENUM_FRAMESIZES
> - Link to v2: https://lore.kernel.org/r/20260516-imx678-v2-0-4854ac61d6fb@ideasonboard.com
> 
> Changes in v2:
> PATCH 1:
>     - Add per-variant compatibles for mono and colour, alongside the
>       generic fallback, so the variant can be declared without powering
>       the sensor at probe.
>     - Rename reset GPIO to xclr as that's what it's called in the
>       datasheet, and how it behaves.
>     - Reference the generic video interface devices schema and switch to
>       unevaluatedProperties.
>     - Drop "link-frequencies: true"
>     - Drop the T: entry for media.git from MAINTAINERS.
> PATCH 2:
>     - Treat the pixel rate as a fixed sensor property rather than deriving
>       it from link frequency and bit depth. Removes the iclk<->pixel
>       conversion helpers, instead using a fixed 8x ratio.
>     - Express HBLANK in pixels with a step of 8.
>     - Make VBLANK step = 2 and rewrite the exposure register when VBLANK
>       changes, so the effective exposure does not silently shift.
>     - Fix power sequencing: hold the sensor in reset until power_on, add the
>       missing post-reset delay, and disable the clock before the regulators
>       on power_off.
>     - Drop the "common regs written" flag, program them in power_on.
>     - Add variant match data and cross-check the register-reported type
>       against DT; rename detect() to identify_model().
>     - Use v4l2_link_freq_to_bitmap() and expose the full link frequency menu
>       with the configured one as the selected RO option.
>     - Drop unused includes and defines, misc cleanups
>     - Kconfig: depend on OF_GPIO
> - Link to v1: https://lore.kernel.org/r/20260513-imx678-v1-0-30fc593ed8fa@ideasonboard.com
> 
> ---
> Jai Luthra (2):
>       dt-bindings: media: i2c: Add Sony IMX678
>       media: i2c: imx678: Add driver for Sony IMX678

Media maintainers, it seems the driver was applied, but not the binding.

Rob
