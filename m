Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1983436BF8
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427079; cv=none; b=UILAt+rNlKGQ8cei5z8mmMWypuGaEgnVHX0QfaB6OfC0M7SkmFp4+neleZSflDcdx7mAQkYhFXWI0rEZLy3I2Je6ykheDTimZqa2UyvZ1s7kQXDcUpZZC4bVcOKioT02H1u7UVlMUEaEo0eP9WKqDWuDdBpIjz4vt9mbnzguuWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427079; c=relaxed/simple;
	bh=2MsyHGQdRRAaW8af5Yxv8vSzSOx4GuG2KSm7AIP3kmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E999wZ/yDaagRk1DvdoyJiQ3DVUdEpGlNJqYEepHW5aDuwsOZvLnP49xh3/42fBAk32rpXPa3Vn0krZT/Y8uw1jwf71At5XSu9W1oPZ7Yh8GvWWXczrK3P1Oz7ZuvxZvVi+x2SFQw7sAjgA8a2kOvpyuIl85UE32Va8OsNLL0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDIAtmYj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bW80WKKg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDIAtmYj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bW80WKKg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQouJ2401496
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nnBoPIhK0MfV0poohP2Qsl1u
	9UxleiuJDghkLjdaq20=; b=WDIAtmYj25mvR1N+xvjCyQUUGfY1aYNEx8tCQYaJ
	yu0+iAxZaZbtJtyGqBiD0/W+q1iia7uF2fCEh+Xlty1AQOD2f3slKXuMKIGnF0JO
	1dyhhIZrjATRsobvBYiNVHbW5Wse8tUamJq8y7vyUxON5oFFoNrVJGFp0ZOzwK2n
	zTtN4NGUPetV8LIzygF34RGrs6ndnXnBZtfnlcOMVreIcqtbViOGqGgCXIaIrqPe
	9jAZweRNhVu3cJfL2CrkxFcYhZh9y+6G4TuLBprR0p5RxyAaozNh9IjGaGea0G5Q
	ljD9eJPXpQIFeZAS4DxTOg10lgwDRVYa88IPa+kzGonS7Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8168mbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:57:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e97889ac8aso210546d6.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427076; x=1786031876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nnBoPIhK0MfV0poohP2Qsl1u9UxleiuJDghkLjdaq20=;
        b=bW80WKKgJIF0Qtnyeq20BmcCzrEiNTO8YurPh7pl9TzNqJDam42HOEry7zJKGBljOX
         iihkW4piuaxcdaFnAbMF54KJxwiGYNpSAhzF+omr55fDEAoKtcmpP9LamzOZEiYmuRMm
         WrO9CVCqe/vdZ7OItNByWc7JJIdSisGwA6x8JexcTqNbuioSYkN4HRwVq14kL272hUdj
         6d/wRJrZDUckX2VitkEy5WyUw/bdivqAMRiHIE3K4LPUo+yCuU4O3CfBbwcAx99hRAcn
         cmR2xvxR34FjvEV7fywRukZVM9WZp+40NkdWUXrx80ubovLR5iPLA8+tAusgKeh4VV79
         9dAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427076; x=1786031876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnBoPIhK0MfV0poohP2Qsl1u9UxleiuJDghkLjdaq20=;
        b=Q3kwhBPzyuFtwMe0BEF9anwAJm6EjXU2FqX1LM60TY3vKdZXk2sVuqFLY42lnkAjbv
         9eJE140+wC6cC9+thO+uBb+QFHk0r8q4XX+7K+Hs8VLgS7Qa/PxjXSn9oUl+VOOxgnbz
         d4dSnX1H0SWdYtrY8cj9+GlZum+6LKymTLfY5QIu8bK/gKQ7UJF+I8kO7FIhicU0LkPo
         ustjJ7p/MiCi42mDcX38PSUP9FCDLmPFSNRA5g54TPJGJoNbMoglwvfg2szQnRtAkZ4w
         VoM2E6CWRQp/mbJ8NsQdpYUG5ThZCr9yzQTeY1NatevgSmvC1kU8KeL776jc2WrDQvjs
         fkkA==
X-Gm-Message-State: AOJu0YwSmnszRC2/GptJUI06yEOVrUWoM7f1zB17ZJoRmjVj0zMDLOlT
	pzumuZiHjkkatVL0wpEgM+Oufc3xEJMAZgyeo1DeaO2Rl0fLrm4yEzVtLPbVyDjujncFlbbV96A
	h+Cl1UO1gK5YuDStBpmcUupWashMcEecHPKu7r6aHmKmhPyiRi6MoxnlfZgBt8Cu/+g==
X-Gm-Gg: AR+sD10cPbSKloDrqfB+BUX+T+fzUF283AqTWTKDfIegXSWRTiByiBvyw3jQe802Nk1
	O8F4JtE2cC3mQrm7vIoFHAKs0lRkUGYEmJ10evYcOlXLDBkSmVznbDgYGIXKJCFTai68WeO1kno
	lxhn3wsiKn6kAX/hhZglAySwW5w2SXqRtBQKS69601hjOVBDMGpvlQH8k+qbjXjRQ2rO/tbL8DB
	8w4cU+1BoGzbSZ5LBc64vpeevAvmkpe3oMI6t5eInN8KDsDu3sXsr6lZkzBpXqAHU5CtGJjz1/g
	XpuC22F2eCivmT0QlRjabDJIXcBzPsELejo2qL3T0qF/rOyIm8lRkXeYnL0MtktqyRbIE2oFrEr
	eCAu/TyfYJn719BkumXXGOGGdcDAHGvTewdK47l9qnpVbxqgGndeIIeduA6CjpIN/RKcZeAq+QX
	vfVL7GvwRbQrebZw==
X-Received: by 2002:ac8:7d84:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-52b384b22c1mr35457841cf.33.1785427075835;
        Thu, 30 Jul 2026 08:57:55 -0700 (PDT)
X-Received: by 2002:ac8:7d84:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-52b384b22c1mr35457481cf.33.1785427075075;
        Thu, 30 Jul 2026 08:57:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db94ff90sm454507e87.21.2026.07.30.08.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:57:53 -0700 (PDT)
Date: Thu, 30 Jul 2026 18:57:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <vz6a2qugu7kkci3fcdkd236axr3ur33ghrgoopbrz3isueml45@b4frwo4l2hfh>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-3-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730150524.2659577-3-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX9+D8xxRkIWuj
 M6LxF18J8EFHJeh/i0pvqIV07r5REIf5pPsf8yC9atAlWZt+7ZI052/1w6XYltDodUrEWN9PdAd
 aQEdED3n2ok7lR1H/w1hbeFgMir9af75kW3A7fG0vkXTVoiRXBnXxzJFEROPIFWk6muYSLerGUL
 4TrsgEmNDJhJtGkWtqmb5bqJfEQyXCWg0e7L0FEF+SSi8HSa5YTHtD1/sTO3O6uhkWmBeEqBV9q
 AIPEgzXPy7RuG6jSSWWf3CT3hujgKswfaSplBcwywXCBdR94sl8tWLaJqTG56xzdDmg16dlX54W
 egfDiS0bKhQ77Qg1z5/QrIhNt+I2JVCh3Xq7EOJnL6cMEct3bkKh9zlMu3gDpy0E+9jrsFG617z
 wyoG3u/u+wz2CG3L2Owu1pETCMh0chhgwpiv9PNRlBPGd1zy496p8UJlYLwlDcTL9FGpeIo7Gb6
 ncqloro2xynaOPlsdsQ==
X-Authority-Analysis: v=2.4 cv=LIlWhpW9 c=1 sm=1 tr=0 ts=6a6b7485 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=SSmOFEACAAAA:8
 a=EUspDBNiAAAA:8 a=NtNVCxxQ_ECJ4AUVcSUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: W342kNvPCyQoc2mTalbxk7LmPucoBQB0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX7YdTgy8oTHo/
 UN5itYKvWb5C2EsSE9RZJUd5ZrLGsdFyuHv/iwD4ydBlZNUZix1hNzcAWQ4Rz6ymCvGX9LvEdDm
 7+owGk3YmQHAQfoQJORqQMwvzAZBanY=
X-Proofpoint-GUID: W342kNvPCyQoc2mTalbxk7LmPucoBQB0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120

On Thu, Jul 30, 2026 at 06:05:23PM +0300, Atanas Filipov wrote:
> Add a Qualcomm JPEG encoder driver implemented on top of the
> V4L2 mem2mem framework.
> 
> The driver wires vb2 queue handling, format negotiation, JPEG header
> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> integration for the standalone JPEG encode hardware block.
> 
> This series targets SM8250 (Kona) platforms.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---

> +static int qcom_jpeg_clk_on(struct qcom_jenc_dev *jenc)
> +{
> +	struct dev_pm_opp *opp;
> +	int rc;
> +
> +	rc = clk_bulk_prepare_enable(jenc->num_clks, jenc->clks);
> +	if (rc)
> +		return rc;
> +
> +	/* setup the OPP according to the calculated optimal frequency */
> +	opp = dev_pm_opp_find_freq_ceil_indexed(jenc->dev, &jenc->opt_freq, JPEG_OPP_CORE_IDX);

clk_bulk_prepare_enable starts ticking on a certain freq. Why does it
happen _before_ setting the performance points (including voltage rails)
which those clocks require?

> +	if (IS_ERR(opp)) {
> +		rc = PTR_ERR(opp);
> +		goto err_clk_disable;
> +	}
> +
> +	rc = dev_pm_opp_set_opp(jenc->dev, opp);
> +	dev_pm_opp_put(opp);
> +	if (rc)
> +		goto err_clk_disable;
> +
> +	return 0;
> +
> +err_clk_disable:
> +	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
> +
> +	return rc;
> +}
> +
> +static void qcom_jpeg_clk_off(struct qcom_jenc_dev *jenc)
> +{
> +	dev_pm_opp_set_opp(jenc->dev, NULL);
> +	clk_bulk_disable_unprepare(jenc->num_clks, jenc->clks);
> +	jenc->opt_freq = jenc->max_freq;
> +}
> +

[...]

> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
> new file mode 100644
> index 000000000000..c9959518c64d
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/string.h>
> +
> +#include <media/jpeg.h>
> +#include <media/v4l2-jpeg.h>
> +
> +#include "qcom_jenc_dev.h"
> +#include "qcom_jenc_hdr.h"
> +
> +/*
> + * The elements defined in this header are specified
> + * in the ITU-T T.81 / JPEG specification.
> + *
> + * https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> + */
> +
> +#define JFIF_HEADER_WIDTH_OFFS		0x07
> +#define JFIF_HEADER_HEIGHT_OFFS		0x05

And you've ignored feedback here. PLEASE move all standard-related
defines and code to the common helpers. Are there any other drivers
which construct JPEG files manually? If not, you are lucky and you can
just push you code. If they are, find a way to unify the codebase.

At the very least, it would make you split this commit into at least
two, making them more readable.

> +#define JFIF_APP0_LENGTH_HI		0x00
> +#define JFIF_APP0_LENGTH_LO		0x10
> +#define JFIF_IDENT_TERM		0x00
> +#define JFIF_VERSION_MAJOR		0x01
> +#define JFIF_VERSION_MINOR		0x01
> +#define JFIF_DENSITY_HI			0x00
> +#define JFIF_DENSITY_LO			0x01
> +#define JFIF_THUMBNAIL_SIZE		0x00
> +
> +#define JPEG_SEG_LEN_HI			0x00
> +#define JPEG_LEN_DQT_LUMA_LO		0x43
> +#define JPEG_LEN_DQT_CHROMA_LO		0x43
> +#define JPEG_LEN_SOF0_MONO_LO		0x0b
> +#define JPEG_LEN_SOF0_COLOR_LO		0x11
> +#define JPEG_LEN_DHT_MONO_LO		0xd2
> +#define JPEG_LEN_DHT_COLOR_HI		0x01
> +#define JPEG_LEN_DHT_COLOR_LO		0xa2
> +#define JPEG_LEN_SOS_MONO_LO		0x08
> +#define JPEG_LEN_SOS_COLOR_LO		0x0c
> +

[...]

> +
> +static inline u32 jpeg_io_read(struct qcom_jenc_dev *jenc, u32 offset)
> +{
> +	return readl(jenc->jpeg_base + offset);
> +}

Ugh.

> +
> +static inline void jpeg_io_write(struct qcom_jenc_dev *jenc, u32 offset, u32 value)
> +{
> +	writel(value, jenc->jpeg_base + offset);
> +}
> +
> +/*
> + * Runtime bitfield helpers (for non-constant masks).

Why are the masks non-constant? They typically are, for register access.
Use FIELD_GET and FIELD_PREP.

> + *
> + * Requirements:
> + *  - mask must be non-zero
> + *  - mask must be contiguous (e.g. 0x7u << n)
> + */
> +
> +static inline u32 jpeg_bits_get(u32 mask, u32 val)
> +{
> +	/* __ffs(0) is undefined; fail-safe on invalid masks. */
> +	if (WARN_ON_ONCE(!mask))
> +		return 0;
> +
> +	return (val & mask) >> __ffs(mask);
> +}
> +
> +static inline u32 jpeg_bits_set(u32 mask, u32 val)
> +{
> +	/* __ffs(0) is undefined; fail-safe on invalid masks. */
> +	if (WARN_ON_ONCE(!mask))
> +		return 0;
> +
> +	return (val << __ffs(mask)) & mask;
> +}
> +
> +static inline u32 jpeg_rd_bits(struct qcom_jenc_dev *jenc, u32 offs, u32 mask)
> +{
> +	u32 reg = jpeg_io_read(jenc, offs);
> +
> +	return jpeg_bits_get(mask, reg);
> +}
> +
> +/*
> + * Read-modify-write (for R/W registers)
> + */
> +static inline void jpeg_rw_bits(struct qcom_jenc_dev *jenc, u32 offs, u32 mask, u32 val)
> +{
> +	u32 reg = jpeg_io_read(jenc, offs);
> +
> +	reg &= ~mask;
> +	reg |= jpeg_bits_set(mask, val);
> +
> +	jpeg_io_write(jenc, offs, reg);

And if you switch to regmap, you'd have gotten a nice function for this
too.

> +}
> +
> +/*
> + * Write-only variant (for write only registers)
> + */
> +static inline void jpeg_wo_bits(struct qcom_jenc_dev *jenc, u32 offs, u32 mask, u32 val)
> +{
> +	jpeg_io_write(jenc, offs, jpeg_bits_set(mask, val));

Ugh.

> +}
> +
> +

[...]

> +const struct qcom_jpeg_hw_ops qcom_jpeg_default_ops = {
> +	.hw_get_cap	= op_jpeg_get_hw_caps,
> +	.hw_acquire	= op_jpeg_acquire,
> +	.hw_release	= op_jpeg_release,
> +	.hw_prepare	= op_jpeg_prepare,
> +	.get_queue	= op_jpeg_get_buff_queue,
> +	.queue_setup	= op_jpeg_queue_setup,
> +	.src_fmt_update	= op_jpeg_src_fmt_update,
> +	.buf_prepare	= op_jpeg_buffer_prepare,
> +	.process_exec	= op_jpeg_process_exec,
> +	.hw_irq_top	= op_jpeg_irq_top,
> +	.hw_irq_bot	= op_jpeg_irq_bot

Function names should start with qcom_jpeg_

> +};
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
> new file mode 100644
> index 000000000000..5a64e33a28b0
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_OPS_H
> +#define QCOM_JENC_OPS_H
> +
> +#include <linux/device.h>
> +#include <linux/types.h>
> +#include <media/videobuf2-core.h>
> +
> +#include "qcom_jenc_dev.h"
> +
> +/*
> + * JENC encoder hardware operations.
> + */
> +struct qcom_jpeg_hw_ops {
> +	void (*hw_get_cap)
> +		(struct qcom_jenc_dev *jenc_dev, u32 *hw_caps);
> +
> +	int (*hw_acquire)
> +		(struct jenc_context *ectx, struct vb2_queue *queue);
> +
> +	int (*hw_release)
> +		(struct jenc_context *ectx, struct vb2_queue *queue);
> +
> +	int (*hw_prepare)
> +		(struct qcom_jenc_dev *jenc);
> +
> +	struct qcom_jenc_queue * (*get_queue)
> +		(struct jenc_context *ectx, enum qcom_enc_qid id);
> +
> +	int (*queue_setup)
> +		(struct jenc_context *ectx, enum qcom_enc_qid id);
> +
> +	int (*src_fmt_update)
> +		(struct jenc_context *ectx, u32 old_fourcc, u32 new_fourcc);
> +
> +	int (*buf_prepare)
> +		(struct jenc_context *ectx, struct vb2_buffer *vb2);
> +
> +	int (*process_exec)
> +		(struct qcom_jenc_dev *jenc, struct jenc_context *ectx, struct vb2_buffer *vb2);
> +
> +	irqreturn_t (*hw_irq_top)(int irq_num, void *data);
> +	irqreturn_t (*hw_irq_bot)(int irq_num, void *data);

How many non-default platforms do you support? Zero?

Drop the call table.

> +};
> +
> +extern const struct qcom_jpeg_hw_ops qcom_jpeg_default_ops;
> +
> +#endif /* QCOM_JENC_OPS_H */
> diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
> new file mode 100644
> index 000000000000..ebf69128cc2b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
> @@ -0,0 +1,410 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef QCOM_JENC_V420_HW_INFO_H
> +#define QCOM_JENC_V420_HW_INFO_H
> +
> +#include "qcom_jenc_defs.h"
> +
> +#define JPEG_V420_HW_VER_STEP_POS 0
> +#define JPEG_V420_HW_VER_STEP_MSK \
> +	(0xffffu << JPEG_V420_HW_VER_STEP_POS)

No need to define _POS. Use GENMASK to define bitfields.

> +
> +#define JPEG_V420_HW_VER_MINOR_POS 16
> +#define JPEG_V420_HW_VER_MINOR_MSK \
> +	(0x0fffu << JPEG_V420_HW_VER_MINOR_POS)
> +
> +#define JPEG_V420_HW_VER_MAJOR_POS 28
> +#define JPEG_V420_HW_VER_MAJOR_MSK \
> +	(0xfu << JPEG_V420_HW_VER_MAJOR_POS)
> +
> +#define JPEG_V420_HW_CAP_ENCODE_MSK BIT_U32(0)
> +#define JPEG_V420_HW_CAP_DECODE_MSK BIT_U32(1)
> +
> +#define JPEG_V420_HW_CAP_UPSCALE_POS 4
> +#define JPEG_V420_HW_CAP_UPSCALE_MSK \
> +	(0x7u << JPEG_V420_HW_CAP_UPSCALE_POS)
> +
> +#define JPEG_V420_HW_CAP_DOWNSCALE_POS 8
> +#define JPEG_V420_HW_CAP_DOWNSCALE_MSK \
> +	(0x7u << JPEG_V420_HW_CAP_DOWNSCALE_POS)
> +
> +#define JPEG_V420_RST_CMD_FE_RESET_MSK			BIT_U32(0)

What is wrong with the standard BIT()?

> +#define JPEG_V420_RST_CMD_WE_RESET_MSK			BIT_U32(1)
> +#define JPEG_V420_RST_CMD_ENCODER_RESET_MSK		BIT_U32(4)
> +#define JPEG_V420_RST_CMD_DECODER_RESET_MSK		BIT_U32(5)
> +#define JPEG_V420_RST_CMD_BLOCK_FORMATTER_RST_MSK	BIT_U32(6)
> +#define JPEG_V420_RST_CMD_SCALE_RESET_MSK		BIT_U32(7)
> +#define JPEG_V420_RST_CMD_REGISTER_RESET_MSK		BIT_U32(13)
> +#define JPEG_V420_RST_CMD_MISR_RESET_MSK		BIT_U32(16)
> +#define JPEG_V420_RST_CMD_CORE_RESET_MSK		BIT_U32(17)
> +#define JPEG_V420_RST_CMD_JPEG_V420_DOMAIN_RESET_MSK	BIT_U32(29)
> +#define JPEG_V420_RST_CMD_RESET_BYPASS_MSK		BIT_U32(31)
> +

> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index affec0ab4781..6408d3da29d4 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -234,6 +234,27 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
>  
> +/* Qualcomm JPEG encoder controls */
> +#define V4L2_CID_USER_QCOM_JENC_BASE		(V4L2_CID_USER_BASE + 0x1240)

Separate these to their own commit, making it easier for others to
review uAPI additions. How are these being handled by the other drivers?

> +
> +/*
> + * V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO - enable adaptive performance scaling.
> + *
> + * When set to 1 the driver selects the core clock OPP level based on the
> + * encoded frame resolution and fps target. When set to 0 (default) the
> + * driver always runs at NOMINAL (highest) OPP level.
> + */
> +#define V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO	(V4L2_CID_USER_QCOM_JENC_BASE + 0)
> +
> +/*
> + * V4L2_CID_QCOM_JPEG_FPS_TARGET - target encode rate in frames per second.
> + *
> + * Used together with V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO to select the lowest
> + * OPP level whose throughput is sufficient for the requested frame rate.
> + * Has no effect when perf_level_auto is 0. Range: 1-240, default: 30.

I assume 1-240 is only applicable to your driver.

> + */
> +#define V4L2_CID_QCOM_JPEG_FPS_TARGET		(V4L2_CID_USER_QCOM_JENC_BASE + 1)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
