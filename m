Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3A33D79E2;
	Mon, 27 Jul 2026 06:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133886; cv=none; b=eK0MZBXbg+99Z3iEgfY28lGxjg6T3+v+1t8hFVXj+ntiEEO9ukIYn9P3JTQvWrOaiC5TH5hoaxS7XcgZbcqR+4hz2p84H901fgpevwlh0gaEzHC8itsvZGBqdQMQmsHsJLlGGWhwBO7Vj2+Jeg/po5UdqkybBz2fZCzSuTuzy2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133886; c=relaxed/simple;
	bh=luf33Xe1QgS8rFPj1SfvlMo83qJqeesqjk/JtCOmOpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTJBLQCNMNWpGoB3hUwSYIfqDSBq2nKMsBGSQ9ffZ6xKPsse10drNONJhb0ikv4B0CV4iDcREFm1FWTK33VIm8hyik9VoDSz6HC8Trfw/9e8wXfHdBmsAwSKV0YHGhzm/dZucoMIm2fdCGEe4tlI9FxmF6XVYaofqdmsnYPg/24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3SrILAt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3SrILAt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D9D1F000E9;
	Mon, 27 Jul 2026 06:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785133885;
	bh=wzbvqpwJ4tVuHha4a/AUKgG69FWQ3lB+QJyk93qBqRI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=A3SrILAtExo6jZZFlwXryvbkBVFyefolqGPkrnFgmuCpyQN7shK7QEt8dhioS/JMh
	 9TJn2G06MG0bXeG+SYEFr442F6HT7zCZ2fftpCvnDGlMAmZUKY6r6Dx4Yx7nld1fjL
	 6KMTSgvSMkPVQuY7aUiSa4CyrLu/dBIHmh3nd+1JjelM1WMqnOOgRaPDNxTkZUJy4F
	 Lx0S8+2BoGyef2AvcPlIu1whkrABG6iYjnCe5albf4fMH4bQHXM0gWxC1KpnWSmtmM
	 tX0MmMsZ4Ma4P1/vOTsYHA5uClvpr+A/QYdh7+sJUiFyyY7UJbWRX5eWb3C5rpMyuI
	 XWgA4OER3zlLQ==
Message-ID: <0ce72645-aec6-478d-afad-b5c9f838d7ea@kernel.org>
Date: Mon, 27 Jul 2026 08:31:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] decoder: Add V4L2 stateless H.264 decoder driver
To: zhentao.guo@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-4-6072a7ee7428@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-4-6072a7ee7428@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/07/2026 09:04, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
> 
> Add initial support for V4L2 stateless video decoder
> driver on Amlogic S4(S805X2) platform. In phase 1,
> it supports 8bit H.264 bitstreams decoding. Currently
> only progressive streams are supported.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>  MAINTAINERS                                        |    7 +
>  drivers/media/platform/amlogic/Kconfig             |    1 +
>  drivers/media/platform/amlogic/Makefile            |    1 +
>  drivers/media/platform/amlogic/vdec/Kconfig        |   18 +
>  drivers/media/platform/amlogic/vdec/Makefile       |    4 +
>  drivers/media/platform/amlogic/vdec/TODO           |    7 +
>  drivers/media/platform/amlogic/vdec/aml_vdec.c     |  736 +++++++
>  drivers/media/platform/amlogic/vdec/aml_vdec.h     |   33 +
>  drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  239 +++
>  drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  172 ++
>  drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  538 +++++
>  drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  157 ++
>  .../platform/amlogic/vdec/aml_vdec_platform.c      |   81 +
>  .../platform/amlogic/vdec/aml_vdec_platform.h      |   46 +
>  .../media/platform/amlogic/vdec/aml_vdec_tee_fw.c  |  240 +++
>  .../media/platform/amlogic/vdec/aml_vdec_tee_fw.h  |   27 +
>  drivers/media/platform/amlogic/vdec/h264.c         | 2067 ++++++++++++++++++++
>  drivers/media/platform/amlogic/vdec/h264.h         |  299 +++
>  drivers/media/platform/amlogic/vdec/reg_defines.h  |  177 ++
>  19 files changed, 4850 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a112ce9f0fa0..a27ea19907f9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1423,6 +1423,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
>  F:	drivers/spi/spi-amlogic-spisg.c
>  
> +AMLOGIC VDEC DRIVER
> +M:	Zhentao Guo <zhentao.guo@amlogic.com>
> +L:	linux-media@vger.kernel.org

You can drop the L:. Subsystem defines it.

> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
> +F:	drivers/media/platform/amlogic/vdec/
> +
>  AMPHENOL CHIPCAP 2 DRIVER
>  M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
>  L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
> index 458acf3d5fa8..7c541ac0d0c3 100644
> --- a/drivers/media/platform/amlogic/Kconfig
> +++ b/drivers/media/platform/amlogic/Kconfig
> @@ -4,3 +4,4 @@ comment "Amlogic media platform drivers"
>  
>  source "drivers/media/platform/amlogic/c3/Kconfig"
>  source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
> +source "drivers/media/platform/amlogic/vdec/Kconfig"
> diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
> index c744afcd1b9e..7409de674c0b 100644
> --- a/drivers/media/platform/amlogic/Makefile
> +++ b/drivers/media/platform/amlogic/Makefile
> @@ -2,3 +2,4 @@
>  
>  obj-y += c3/
>  obj-y += meson-ge2d/
> +obj-y += vdec/
> diff --git a/drivers/media/platform/amlogic/vdec/Kconfig b/drivers/media/platform/amlogic/vdec/Kconfig
> new file mode 100644
> index 000000000000..d392967c7743
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/vdec/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +config VIDEO_AMLOGIC_VDEC
> +    tristate "Amlogic Video Decoder Driver"
> +    depends on ARCH_MESON || COMPILE_TEST
> +    depends on VIDEO_DEV
> +    depends on V4L_MEM2MEM_DRIVERS
> +    depends on TEE
> +    select VIDEOBUF2_DMA_CONTIG
> +    select V4L2_H264
> +    select V4L2_MEM2MEM_DEV
> +    select MESON_CANVAS
> +    select MESON_SM
> +    help
> +      This is a v4l2 driver for Amlogic video decoder driver.
> +	  This driver is designed to support V4L2 M2M STATELESS
> +	  interface.

Somehow messed indentation.

...

> +err_media_dev_register:
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
> +error_m2m_mc_register:
> +	media_device_cleanup(&dev->mdev);
> +err_vid_dev_register:
> +	v4l2_m2m_release(dev->m2m_dev_dec);
> +err_hw_init:
> +	dev->dec_hw = NULL;
> +err_dec_mem_init:
> +	video_device_release(vfd_dec);
> +err_device_alloc:
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +	return ret;
> +}
> +
> +static void aml_vdec_drv_remove(struct platform_device *pdev)
> +{
> +	struct aml_vdec_dev *dev = platform_get_drvdata(pdev);
> +
> +	vdec_disable(dev->dec_hw);
> +
> +	if (media_devnode_is_registered(dev->mdev.devnode)) {
> +		media_device_unregister(&dev->mdev);
> +		media_device_cleanup(&dev->mdev);
> +	}
> +
> +	if (dev->m2m_dev_dec)
> +		v4l2_m2m_release(dev->m2m_dev_dec);
> +	if (dev->vfd)
> +		video_unregister_device(dev->vfd);
> +	if (dev->dec_hw) {

I do not understand why do you release resources conditionally. Where
they allocated conditionally? Why probe is not releasing them the same
way in error paths?

> +		dev->pvdec_data->destroy_hw_resource(dev);
> +		dev->dec_hw = NULL;

What's the purpose of this? If this is needed, then your driver has
serious concurrency issues which are not solved with it.


> +	}
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +}
> +
> +static const struct of_device_id aml_vdec_match[] = {
> +	{.compatible = "amlogic,s4-vdec", .data = &aml_vdec_s4_pdata},

Fix the style, so you will not re-introduce issue Uwe is fixing.


Best regards,
Krzysztof
