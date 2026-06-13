Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153B837F011;
	Sat, 13 Jun 2026 18:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781376212; cv=none; b=rmTbQR6GLGUcwN5LvXu5KPC4lfVQPY1prn/PD1P9EWdrPlnn/dASr2PuSnOp48ySB7w2AAGgczdPlC+LGhy93l0XlXTYECcTjtxDcOdDspzqtXYH7XP85mGkh/FXp8MUNs3fZz1TaS2XCTJt6W0UgRaEaft9BsyeG+jTKjQmK1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781376212; c=relaxed/simple;
	bh=8wP4sVNIakxniupzxJRszXC4bYyJrcvPnWKv6+dS7Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0wyiptuFIaT2WRuJnaL6TFtwi/F/ZMNZJmz55Im11e0CoC+bcxd0Moh50rKchWFJCBNaNvfQ3KbWiEUR+Mm4+gNJ830Sv/YoP2rMKr1Z9KwPzkWqqWacpcyZpMxGXjUxCnCXyR9o11QfDwXMXWbGVVy45tizZqkOZdkBHsmP3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGjkI/W6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGjkI/W6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75141F000E9;
	Sat, 13 Jun 2026 18:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781376210;
	bh=E5OxYVxEnxPSINP+iLBTBhgmbmiSGilAnYAH4qvmbE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bGjkI/W6lMNGFSpuvwSRT8HTDobzdQpCXKMAapFqK7VY1w9akhx1bwFn2Q/m5gs0c
	 77v+ecfSratNxmtN1YJAAfZ0gM+qRNCY1hNFq/jWjNZbplPCnmnVPvn6ootWIsRope
	 FEtt4iU9lW02PToqdBKWtxKKcsfR33VMkpiBxhfZ7i63IcPHr4A1Hf92BoX9d6FfZw
	 jNgVRimfalwQ24ieRO+GECgVnGvNRtsyJiTUez6DHn2MRXuaTSPEqYR++0ynR0Qzh0
	 qpbzm4z+zuY5+pVXDZNt2/YCCyowbzsm5AXfc1tTdCkgysY++3luLitztjCNCZqz/A
	 bGM2aR0jELEiw==
Date: Sat, 13 Jun 2026 20:43:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <20260613-eccentric-statuesque-centipede-5f8d8a@quoll>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-5-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612194417.1737009-5-atanas.filipov@oss.qualcomm.com>

On Fri, Jun 12, 2026 at 10:44:17PM +0300, Atanas Filipov wrote:
> Add a Qualcomm JPEG encoder driver implemented on top of the
> V4L2 mem2mem framework.
> 
> The driver wires vb2 queue handling, format negotiation, JPEG header
> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> integration for the standalone JPEG encode hardware block.
> 
> Initial support in this series targets SM8250, QCM6490, and SM8550
> class platforms.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/Kconfig           |    1 +
>  drivers/media/platform/qcom/Makefile          |    1 +
>  drivers/media/platform/qcom/jpeg/Kconfig      |   18 +
>  drivers/media/platform/qcom/jpeg/Makefile     |    9 +
>  .../media/platform/qcom/jpeg/qcom_jenc_defs.h |  244 +++
>  .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  336 ++++
>  .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  107 ++
>  .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  360 ++++
>  .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
>  .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1658 +++++++++++++++++
>  .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
>  .../media/platform/qcom/jpeg/qcom_jenc_res.c  |  226 +++
>  .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   54 +
>  .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  529 ++++++
>  .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1109 +++++++++++
>  .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   25 +
>  16 files changed, 4848 insertions(+)
>  create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
>  create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
> 
> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
> index 4f4d3a68e6e5..f33d53a754a0 100644
> --- a/drivers/media/platform/qcom/Kconfig
> +++ b/drivers/media/platform/qcom/Kconfig
> @@ -5,3 +5,4 @@ comment "Qualcomm media platform drivers"
>  source "drivers/media/platform/qcom/camss/Kconfig"
>  source "drivers/media/platform/qcom/iris/Kconfig"
>  source "drivers/media/platform/qcom/venus/Kconfig"
> +source "drivers/media/platform/qcom/jpeg/Kconfig"
> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
> index ea2221a202c0..30c94949e9de 100644
> --- a/drivers/media/platform/qcom/Makefile
> +++ b/drivers/media/platform/qcom/Makefile
> @@ -2,3 +2,4 @@
>  obj-y += camss/
>  obj-y += iris/
>  obj-y += venus/
> +obj-y += jpeg/

Same comments.

It seems you ignored entire v1 review and just ask us to do the same
work twice.

NAK, please address review you received.

Best regards,
Krzysztof

