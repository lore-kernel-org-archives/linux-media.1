Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F082A37E2E2
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 22:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239420; cv=none; b=GX7tDb/yYP5S+YynjMtPQz7qAwueDIeQRR4TJVDZluSImzaiAfPkgMjhz1G8ZSPxaTRWfweI2R0GTwzcv1lREpvjapFsQBzHW9/JgEGEg4Hnz6XnycR9voY9A11wlf+3k5hn+62jpISiX+RBAYslizOAbh6sUsj27rM4wU1KQlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239420; c=relaxed/simple;
	bh=mucEdj1uqoLVSZBfuK1SF6FXby2PwwKZv5l3z18QNLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UM4RTh2mqH1DOKS3NAls3pn+W+rfav6E2eM2WY5W6XsNbpfzxF03FQTpSsf5qhnheHnvxCqJLsQr41uVr/SrrePcmIguryg9+sQMcET2tWgKuXFWWwuMQ8VqSnSR8zi8Q4YpTQYbiWq3nvtn2e01eMsYsGX2WaEftgY0tG3Swxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6dddc514bcdso1405559eaf.3
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 15:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239417; x=1791844217;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xb3yq1vtfACEwe75yrbB1CPQfwdI7baxuA1mRi57je4=;
        b=jBeSfbdxPX4F9VEteEYmmwDg+FWkpdrFVgltO927zMfoUkwwENzseZA0QzZ/AIjhrZ
         lcpgjU9gZI/SAsUDokjQ9ocqNbSt6zOH2Q29pNtkADHlBT1aebtipGsIvG25OjtCSVXm
         JzZe9Pnx5vuMk9uBvQ8dCILOmP0VMpX0tMbEelIwwllce99ExusAc3nuqG+jQxW6o6/s
         Y9NYiYra3ZLdxz3DhPDcMoUvvtncIaPH5QhqvV8e8R674jqxAnEyHuPBWUycU5l1p670
         78y5wLnM/q4IVdXH5VPoc7jT9wl1Lp8JVxu+5fIJtO5FgBV+jvcBE0r0DWpn3Q/ye+Up
         Mxsg==
X-Forwarded-Encrypted: i=1; AKwUvBx+9Yi5sL4LCI37jndBRVi1vPAl2h24dnajl003Yszf0DktceG1ChRC0m0IdVFiTJGf4+UTN8bHumkQqA==@vger.kernel.org
X-Gm-Message-State: AFuF++nIB8oAdNiiOgxkLObSk7iuf/Nggya14yGLHE/5rrqY/cr4WaNQ
	HtloMDv05MfRFMHa3piJRPOBws2YDhi7cABu5h7Tz3jiQ4gViNGO8ub1R3PSfVxI
X-Gm-Gg: AYBFou0p73PYRyYosFpIN+D/Cbzy6U9VGWHyFQLg9j8BbKFHLJ/xU5ENNI5przqZ/q+
	/TSsONbKtGStn667tKtv5yCgQRrM4085jz5ZuwQwikuI34LPoSu2EoIcFHit5vnUhYy+9/1gDJT
	ZncA5LJeWYU9BAk8sCv2Eq/x5PPI439J38BdChzAkA447S6xN9lmp2OFMU4xhLNJ63ADd9qLNpr
	NKgEX7l8TfynWCFuAUaFeoejuu5eGVmTfPw3SBiu0WoFRAMCMflpRC3+8vZoOVYaUGtYVGqHwKc
	b/IXahyMrc4BOUAKpfP8BRnSeUj/mckpqC1G+NZYzVxeC/NWuKP9xdh/nV028362XCAqJAiWtvy
	XRAOapF/5BIBxQPSq+p+eT6ZW9KH4qj7pJqIF4ts2jm6x0FD+EmEeHkJ36grUoc/pvqByTtM6Qc
	GbtKAn4s9rs3u8UbszqDBvHM8pKIM7KTXuEqJ06ya+fKfUMLzySdWztJwXTXsmM9Oqy3Ir+tySp
	jDmhLl804WsT3AcTcCGXOLkeQTsG7fHTEEllLCsHQ6F4eVKl+l4m6JxigQArriVJ9Zt51I335lt
	QV01uZpcFI1eX/vtMccpBcLRyU830iVywZcITQaeK4aohfIR9joJ6GZV
X-Received: by 2002:a05:6820:1501:b0:6dd:1d43:8cc9 with SMTP id 006d021491bc7-6e09f617b36mr7259319eaf.82.1791239416539;
        Mon, 05 Oct 2026 15:30:16 -0700 (PDT)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-828201c6e79sm696111a34.10.2026.10.05.15.30.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 15:30:15 -0700 (PDT)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6dde81a6820so1899364eaf.2
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 15:30:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0P/l1bER03seLdeeV3zH3xcjfnKy48kqPrO1Txhf0y6Vy7iYUqYdeXJF+T//xky23fEuqHOdw335V3g==@vger.kernel.org
X-Received: by 2002:a05:6820:2226:b0:6de:1788:c3af with SMTP id
 006d021491bc7-6e09db9eae9mr7389349eaf.43.1791239415075; Mon, 05 Oct 2026
 15:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
In-Reply-To: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 5 Oct 2026 18:29:38 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9OY45PLvj2BKyXVfnVo4+VpRL-iQXVvMUVohLYNfWGTA@mail.gmail.com>
X-Gm-Features: AclHuK9yFwOzqsj_JcPTvXfeG7bJIFye1-m4CrTXTFUfDaK1QknzW0JvhVf1j8M
Message-ID: <CAEg-Je9OY45PLvj2BKyXVfnVo4+VpRL-iQXVvMUVohLYNfWGTA@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] media: apple: add avd driver
To: Sofus Forstreuter <sofus.c@icloud.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 9:16=E2=80=AFAM Sofus Forstreuter <sofus.c@icloud.c=
om> wrote:
>
> Hi,
>
> This series enables hardware video decoding on Apple Silicon M1, M2 and
> M3 SoCs. It adds support for all the codecs AVD (Apple Video Decoder)
> supports, which is H264, H265, VP9 and AV1 (only on M3+).
>
> The AVD is a bit unique both as a video decoder and an IP block on Apple
> Silicon SoCs. Instead of following the normal "a register for each
> parameter", AVD is programmed through one single register. This means
> the order of the writes are important, but its also important to ensure
> we dont write faster than the hardware can process. To solve this, we
> use the included Cortex-M3 co-processor. The CM3 accepts unsigned code,
> which we take advantage off [1].
> The driver prepares the instructions and writes them into segments,
> which are submitted to the CM3. The CM3 then programs the hardware and
> notifies the AP when the job is done or if an error occurred.
>
> The driver implements the V4L2 M2M stateless decoder API. The driver's
> framework is based very heavy on rkvdecs driver. It therefore comes as
> no suprise that `v4l2-compliance` reports no errors:
> Total for avd device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings:=
 0
>
> The fluster scores are:
> JVT-AVC_V1: 77/135
> JVT-FR-EXT: 42/69
> VP9-TEST-VECTORS: 216/305
> VP9-TEST-VECTORS-HIGH: 1/6
> JCT-VC-HEVC_V1: 143/147
> AV1-TEST-VECTORS: 238/242
>
> Since not all unsupported H264 streams are rejected, the scores
> depend on the reset working, this only works with a patch to the
> apple-dart driver so that the IOMMU attach/detach trick works.
>
> All codecs support 4:2:2, 4:2:0, in 10 and 8 bit. By default, AVD
> outputs in NV12, NV16, P010 and P210. Support for 4:4:4 and 12 bit
> formats has not been added yet.
>
> Internally the AVD uses an Apple specific compressed and tiled format
> called Interchange to store reference image data. This is stored after
> image data across all codecs. Apple Interchange is used for sharing
> buffers with other hardware blocks (GPU, display controller), support
> for this is on its way [2].
> The V4L2 pixel formats have been added to help with calculating sizes.
>
> This driver has been tested on most Apple Silicon SoCs in our downstream
> tree [3]. Its expected this driver will work on M4, M5, M6 and the Neo,
> with firmware already being written for all except the M6 SoCs [4].
>
> The groundwork for this was laid many years ago by Jamie, R and Eileen,
> who through a combined effort managed to reverse engineer many core
> parts of the AVD block.
> This driver would not have been possible without the work done by
> Eileen, who wrote initial support for H264, H265, VP9 and excellent
> tooling [5], allowing me to reverse engineer AV1 and make the driver
> conformant.
>
> [1] https://github.com/sofus13/avd-fw/tree/avd-next-fw
> [2] https://patch.msgid.link/20260917-apple-interchange-modifier-v1-1-875=
294689c48@gmail.com
> [3] https://github.com/AsahiLinux/linux
> [4] https://github.com/AsahiLinux/avd-fw
> [5] https://github.com/eiln/avd/tree/main
>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
> Changes in v2:
> - Patch order
> - Fixed dt-bindings by constraining all properties
> - Fixed dts, add interrupts, iommus and regs. Drop labels, fix names
> - Add Apple Interchange format
> - Add more av1 and vp9 validation to v4l2-ctrls
> - Validate more codec parameters
> - Use the new CM3 firmware (drop avd-hw, drop submission loops)
> - Updated cover to reflect changes
> - Link to v1: https://patch.msgid.link/20260918-avd-v1-0-49977931f455@icl=
oud.com
>
> To: Sven Peter <sven@kernel.org>
> To: Janne Grunau <j@jannau.net>
> To: Neal Gompa <neal@gompa.dev>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sofus Forstreuter <sofus.c@icloud.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Heiko Stuebner <heiko@sntech.de>
> Cc: asahi@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
>
> ---
> Sofus Forstreuter (17):
>       dt-bindings: media: add apple,avd
>       media: v4l2: Add P210 pixel format
>       media: v4l2: Add Apple interchange pixel formats
>       media: v4l2-ctrls: validate av1 tile info
>       media: v4l2-ctrls: validate vp9 tile_rows_log2
>       media: apple: add avd driver
>       media: apple: avd: add h264 support
>       media: apple: avd: add vp9 support
>       media: apple: avd: add hevc support
>       media: apple: avd: add av1 support
>       arm64: dts: apple: t8103: add avd nodes
>       arm64: dts: apple: t8112: add avd nodes
>       arm64: dts: apple: t8122: add avd nodes
>       arm64: dts: apple: t600x: add avd nodes
>       arm64: dts: apple: t602x: add avd nodes
>       arm64: dts: apple: t6030: add avd nodes
>       arm64: dts: apple: t6031: add avd nodes
>
>  .../devicetree/bindings/media/apple,avd.yaml       |  127 +
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   14 +-
>  MAINTAINERS                                        |    2 +
>  arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |   32 +
>  arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |   32 +
>  arch/arm64/boot/dts/apple/t6030.dtsi               |   32 +
>  arch/arm64/boot/dts/apple/t6031-dieX.dtsi          |   32 +
>  arch/arm64/boot/dts/apple/t8103.dtsi               |   32 +
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   32 +
>  arch/arm64/boot/dts/apple/t8122.dtsi               |   32 +
>  drivers/media/platform/Kconfig                     |    1 +
>  drivers/media/platform/Makefile                    |    1 +
>  drivers/media/platform/apple/Kconfig               |    5 +
>  drivers/media/platform/apple/Makefile              |    3 +
>  drivers/media/platform/apple/avd/Kconfig           |   18 +
>  drivers/media/platform/apple/avd/Makefile          |    5 +
>  .../media/platform/apple/avd/avd-av1-entropymode.c | 4698 ++++++++++++++=
++++++
>  .../media/platform/apple/avd/avd-av1-entropymode.h |  284 ++
>  drivers/media/platform/apple/avd/avd-av1.c         | 1432 ++++++
>  drivers/media/platform/apple/avd/avd-drv.c         |  776 ++++
>  drivers/media/platform/apple/avd/avd-h264.c        |  862 ++++
>  drivers/media/platform/apple/avd/avd-hevc.c        | 1340 ++++++
>  drivers/media/platform/apple/avd/avd-inst.h        |  210 +
>  drivers/media/platform/apple/avd/avd-v4l2.c        |  992 +++++
>  drivers/media/platform/apple/avd/avd-vp9.c         | 1054 +++++
>  drivers/media/platform/apple/avd/avd.h             |  299 ++
>  drivers/media/v4l2-core/v4l2-common.c              |    8 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |   17 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c               |    7 +
>  include/uapi/linux/v4l2-controls.h                 |    2 +-
>  include/uapi/linux/videodev2.h                     |    9 +
>  31 files changed, 12386 insertions(+), 4 deletions(-)
> ---
> base-commit: 4efa625593e1e9c76346232413997556dea1d89f
> change-id: 20260917-avd-7ee5474b468c
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
