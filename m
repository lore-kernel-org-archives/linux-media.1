Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC3B3CC7CD
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535692; cv=pass; b=H6hdljEEhhZYvuOheMpJ5P72fZirgPd1nH6tAWpqtA2u84m8ixK1Mu0r//ixgY+BxM17egR+Ams4D+LGqsTPJiqlxz60V+ivGjbztBe6k3kKddBfs353mUAe0cbnSM7UO8gMx3pjsUSthz0HnpAq+Tgmzz2DTlMORRbs4Ch+M74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535692; c=relaxed/simple;
	bh=se3Jxd0AqNjjDU2EcYjSVPP4YTsEVakScFfDDBdapic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RfIDL2KKPeiv35A/Qx9gddETallPv+ga6Nqx4BUjwKijaCLASp5Q6Oe0WER/bCijUE5nZQcw9S2qOKUfUP03uopSuKjlto6RrQS4AkFmuSlGC3HX1tI7xjj39oYTLhMMvWMJ9pfCFGyWiPv0IST4PHtYpwbPBbRU4Zc7xu4t2zM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQMZ1hCA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TO/NhwQ0; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQMZ1hCA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TO/NhwQ0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RmRr1263161
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhUlovumkUwfn4D5uJvFV9NPolUvUpozpoQ8SLmfCFU=; b=CQMZ1hCA80V6cOHL
	cxNBNy7Vv3ltluLFowfYLwUfeUA9PblQp7gWuH6+gPsMxzHgefnLMvmoUsNWCe7h
	Jf76x0RrNbzHB4xvW5lxNhlO97NW+CssdUtRN5aDEjPbmnDOG8tdOGtBNQsMt4qQ
	GYbllZ+wNG0F5gfkbmf8EBP/QJ0937LIO0MQea5/k7Szlx+mUAvv7iQsCXHx7XPp
	VAE2bvC3eE8cPyxpW2HYa68u11afaIP29uJf3ex9m9nSuDNaJcVEjH/FdbHNIPO3
	JFw3E9QR8In5IxHAW62ZeLQRrUVzEp1/YIpUrJVS4bsjVKl9Y8GbVDcmseYNQdZS
	njsuMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhn557-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:21:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec91dc265so629673785a.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784535688; cv=none;
        d=google.com; s=arc-20260327;
        b=FPyRlgn/fbKv7fURbb9YoHqWKrwmQxx6fxJkv3U2AKs/ZSVLMI43/drKS9dK+M5VZT
         euic9J0pbBgZcpgNCq6b0AmrTjIbnzj23da+BtUIoQvzj9yVwtYopS8HxqTl0ju7J6cP
         j3mmWVqB4zM0XiPJtna9a6hJioyFuPvAhBSiLp8hIkGk0Bb/Bf7EJKlNSccGFFVZV2YE
         qtsk1JalTlrvmN3hzH5WbSkpou5BQBbR/Cao7C+afA8anZ5XphpSYAwDF0KcPqI9ISgP
         6wyoht3vrFLPJAeKtoWkJ8sfvwu6AjQ8fo5CYifBDq2j67rFehDPeruSRhwTu9EMdCpF
         HkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhUlovumkUwfn4D5uJvFV9NPolUvUpozpoQ8SLmfCFU=;
        fh=iDnqw9sGHRVowQGpxmy+hEYMUgVJ1KqRw3riF+qskR0=;
        b=GZPhp4p/0sHgg5/9unSJ4cyve45T3x1XI9Xb+IFy/GQDpbXRnJHB5SOHg+hOyGCMj4
         uxaIP25sFOI6bspGB1I6ALjSY7tNF5sl1fWg3vFKUP87WSUijGmhvBRN7+dgvWQoEHC7
         w6sPRfxHYQm0LMpgW+r1UcwVuuKmxm+JKwrqdKfJTj553uXGHzXiJyuYreX8B+KnpL/4
         IrCbL8mK/19XT+wDdo1solz59q0YeTPuygTpKIznXRXqlGGb/qH4WPPH/QZLXBMexepy
         UvZuorW2XteEl2TtRAyOzFJvUVl2E1uj3Kdhr+SKo/0DEMr6oqc7G05HdbIw6TJoExpk
         otYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535688; x=1785140488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhUlovumkUwfn4D5uJvFV9NPolUvUpozpoQ8SLmfCFU=;
        b=TO/NhwQ0ncZxeYlYr5weoVP5dvRvmG1/kue+L5O0kOOMlXqblBTuhw/MYvRcUGz0+t
         nGmFZ37GidNVzvR5KY67VrgJgVE79vNQqsO2ekonqi4PYx2lDh76A+NV3+mV87Z8wZsI
         /yXLlWcPo2HSVv4Ts5Y+Q52sTW9aqO8GKhtHb2TXIdng9hckXyjKvYS9MUI9cIkoAQTD
         3933+X8i194p29jdFgeNRERFhFFiUfwgZCt7frqAsztgWAnBCpg9CjyGKJ0Y4wlcBP1d
         SDLsRXODVKdJN23zSensw2iN7BqACBr2etlbaq29CpxFrJ0tLQCkmSbM6Ery5rfhqM7y
         YXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535688; x=1785140488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhUlovumkUwfn4D5uJvFV9NPolUvUpozpoQ8SLmfCFU=;
        b=Y1zKYOyW4Rh7P4rVIaA0If61miz1ubsvithw61Gv5SZm4XUwQHq+8gT9qgdM9YsD9K
         MtycaZZ2jQbBIZoiXpM7Fb6WpFp5u0rpervQDc664G1glbck5/HF03k7lY47l6N7RZ/g
         tG2/shqXRx8tQG4GlDsoo8TZ0pHvAzz2hElFbf1jcVuM//QJTk8PNuFnGF3LWcM9mc8D
         6RjTPY4Dw+HhAaoEZyQysUv96kmLXsFp0lsiFlKGZnSByvzmFvUVhjThrHTvxyofxkcE
         KJJyRsFMZUQRwHY0soIIWNqROMK6yVZ525V+6xVA+cRmlOqRxl+XPBKOlS4LQGYScXVU
         arcg==
X-Forwarded-Encrypted: i=1; AHgh+RqewFYDIPa+O2FRLdbFusW+VcHIKB5Hk9h+ddk6Y08qAl0hNI4Aighhm7zLhRhKSN7bF1Atj0hVzaFbAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj78l1YQRhoMloH3q1gUfuJk+f3wkN5HOS4bwJszBiuaylvLdo
	KrnOIsZ8gyVx0iXrX2TsFU9WLcEAOxtxQrbmfzrpMrh1sq5eR1mvG+dwrZQ3I0PXK1GX7dg+RvK
	Mzd/Ff6OQUYRMJDpWbfNDydU10M6xE9XywyQr5yoZ3ILEKkJOYQ2XfOhdhT+FKaeGyohXXH1Pgq
	SVINwU99LGWo9qUPVDuwt28mtgHfLiMYqXr2VFIN/g
X-Gm-Gg: AfdE7clCojwx6CUdAGx/3z1cfpD9tA9XHSlwJ/RyqbjV465P+xHYOJ+/3MBZ7wH9py9
	2N6QEyPbXwEiCVy5VFOg1AWw76GQmXcN/32j4ML22QZ2tuWnz5gwZR2cNVa9LUDT10XHdoLq5vU
	c3a6WB89+xaMCDV1kJGGjEDj3YvHQA60XsbWKipQRQaFvxTeD/gB+ehtf1L4SMSl5BI7hYJu36H
	OHPNy1nrAWYqclh/EI/yxMld2LzVU+PrtIKH+sysW7DAiMK2Wu1D4zvpjzh
X-Received: by 2002:a05:620a:4109:b0:927:620f:d0b0 with SMTP id af79cd13be357-930b3e9a77fmr1190887285a.22.1784535687719;
        Mon, 20 Jul 2026 01:21:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4109:b0:927:620f:d0b0 with SMTP id
 af79cd13be357-930b3e9a77fmr1190884685a.22.1784535687000; Mon, 20 Jul 2026
 01:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org> <20260720-x1e-csi2-phy-v13-2-160c31958863@linaro.org>
In-Reply-To: <20260720-x1e-csi2-phy-v13-2-160c31958863@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:21:15 +0200
X-Gm-Features: AUfX_mwgNhn8iZvozq-DqLsrx02aB6cmmYy7nliwdI-2CgAgkECGLYs3FjocKI4
Message-ID: <CAFEp6-3sUpXSu10HaqE+TXRU64N6qKzBq_HEEtaV4io1MbsLxw@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5dda89 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=JfrnYn6hAAAA:8 a=Yv46vFh-8biGCWpq7RYA:9 a=F7_y8ekzJ88vJaNi:21
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: j88wSUcDy4fY6Hl6334cmo3XH6qSZQMq
X-Proofpoint-ORIG-GUID: j88wSUcDy4fY6Hl6334cmo3XH6qSZQMq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MCBTYWx0ZWRfX6XJaaIiW5Zvj
 YPkX5Ju2r7Pd9KayX06j/GjhuvU53RfsuVvJfLIp2T2cDxkdng0TMorEbtGsGNbdokZLQv584h3
 38Wgf+LuCMH6X+6qSkBqvWEKbpGf55C0MEHTC3MJva8cg7ckF1O7kRA5lZMluei2E2fnyEW9ZiG
 mfkGaZNoWizksq2N1hGX2aiyazSWrltXQbpXRQ7qeZS+bLUNq/5ecsiKzFTe5Smb1rt7WJ88Laq
 FBRU7h1+dxL/4TVGkjEb6Q8A5Zjlr28+KSAkQRmobxBQ+FOEY3L4Td7pC/I0NynENTDtoM5wBIJ
 pK0CrT7yjKkQsl30M2s2qVOQUz1+TkiDgENecHfeeZMXNQjOVZdxdUGnXSxYwumo7B2hF4rhl45
 eB465bYXo8aY65PlZDm60X49QDqI8RLGUN0HmaRHcafoZuF8TF4xADMqTAe1CquZ/dBacCaFcmI
 +wKdkTxXxEThpxaE3xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MCBTYWx0ZWRfX0bgr03DnJTkm
 pkMSkX9OySJwfDtTjI4lyzt36bcYpwjTX2uPUqSvy8jtkJa5uDdOtS2Fcdufgvbl3vGT/J77mN2
 CKWdxOTgkmZHgAZKKi2znsgNkUQAlp8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200090

On Mon, Jul 20, 2026 at 3:14=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
>
> The following devices are supported in this drop:
> "qcom,x1e80100-csi2-phy"
>
> In-line with other PHY drivers the process node is included in the name.
> Data-lane and clock lane positioning and polarity selection via newly
> amended struct phy_configure_opts_mipi_dphy{} is supported.
>
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now on=
ly
> DPHY is supported.
>
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
>
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
>
> The PHY sequences and a lot of the logic that goes with them are well
> proven in CAMSS and mature so the main thing to watch out for here is how
> to get the right sequencing of regulators, clocks and register-writes.
>
> The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  MAINTAINERS                                        |  10 +
>  drivers/phy/qualcomm/Kconfig                       |  15 +
>  drivers/phy/qualcomm/Makefile                      |   5 +
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 385 +++++++++++++++=
+++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 449 +++++++++++++++=
++++++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  97 +++++
>  6 files changed, 961 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a99..a203b41475ea4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22296,6 +22296,16 @@ S:     Maintained
>  F:     Documentation/devicetree/bindings/media/qcom,*-iris.yaml
>  F:     drivers/media/platform/qcom/iris/
>
> +QUALCOMM MIPI CSI2 PHY DRIVER
> +M:     Bryan O'Donoghue <bod@kernel.org>
> +L:     linux-phy@lists.infradead.org
> +L:     linux-media@vger.kernel.org
> +L:     linux-arm-msm@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/phy/qcom,*-csi2-phy.yaml
> +F:     drivers/phy/qualcomm/phy-qcom-mipi-csi2*.c
> +F:     drivers/phy/qualcomm/phy-qcom-mipi-csi2*.h
> +
>  QUALCOMM NAND CONTROLLER DRIVER
>  M:     Manivannan Sadhasivam <mani@kernel.org>
>  L:     linux-mtd@lists.infradead.org
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 60a0ead127fa9..cd6959e69bef7 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -28,6 +28,21 @@ config PHY_QCOM_EDP
>           Enable this driver to support the Qualcomm eDP PHY found in var=
ious
>           Qualcomm chipsets.
>
> +config PHY_QCOM_MIPI_CSI2
> +       tristate "Qualcomm MIPI CSI2 PHY driver"
> +       depends on ARCH_QCOM || COMPILE_TEST
> +       depends on OF
> +       depends on PM
> +       depends on PM_OPP
> +       depends on COMMON_CLK
> +       select GENERIC_PHY
> +       select GENERIC_PHY_MIPI_DPHY
> +       help
> +         Enable this to support the MIPI CSI2 PHY driver found in variou=
s
> +         Qualcomm chipsets. This PHY is used to connect MIPI CSI2
> +         camera sensors to the CSI Decoder in the Qualcomm Camera Subsys=
tem
> +         CAMSS.
> +
>  config PHY_QCOM_IPQ4019_USB
>         tristate "Qualcomm IPQ4019 USB PHY driver"
>         depends on OF && (ARCH_QCOM || COMPILE_TEST)
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefil=
e
> index b71a6a0bed3f1..382cb594b06b6 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -6,6 +6,11 @@ obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)     +=3D phy-qcom-ipq=
4019-usb.o
>  obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)    +=3D phy-qcom-ipq806x-sata.o
>  obj-$(CONFIG_PHY_QCOM_M31_USB)         +=3D phy-qcom-m31.o
>  obj-$(CONFIG_PHY_QCOM_M31_EUSB)                +=3D phy-qcom-m31-eusb2.o
> +
> +phy-qcom-mipi-csi2-objs                        +=3D phy-qcom-mipi-csi2-c=
ore.o \
> +                                          phy-qcom-mipi-csi2-3ph-dphy.o
> +obj-$(CONFIG_PHY_QCOM_MIPI_CSI2)       +=3D phy-qcom-mipi-csi2.o
> +
>  obj-$(CONFIG_PHY_QCOM_PCIE2)           +=3D phy-qcom-pcie2.o
>
>  obj-$(CONFIG_PHY_QCOM_QMP_COMBO)       +=3D phy-qcom-qmp-combo.o phy-qco=
m-qmp-usbc.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> new file mode 100644
> index 0000000000000..966d79c98f9b2
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -0,0 +1,385 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - CSIPHY Module 3phase v1.0
> + *
> + * Copyright (c) 2011-2015, The Linux Foundation. All rights reserved.
> + * Copyright (C) 2016-2026 Linaro Ltd.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/time64.h>
> +
> +#include "phy-qcom-mipi-csi2.h"
> +
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)     ((offset) + 0x4 *=
 (n))
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET   BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE     BIT(7)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID    BIT(1)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)   ((offset) + 0xb0 =
+ 0x4 * (n))
> +
> +#define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)             ((0x200 * (n)) + =
0x24)
> +
> +/*
> + * 3 phase CSI has 19 common status regs with only 0-10 being used
> + * and 11-18 being reserved.
> + */
> +#define CSI_COMMON_STATUS_NUM                          11
> +/*
> + * There are a number of common control registers
> + * The offset to clear the CSIPHY IRQ status starts @ 22
> + * So to clear CSI_COMMON_STATUS0 this is CSI_COMMON_CONTROL22, STATUS1 =
is
> + * CONTROL23 and so on
> + */
> +#define CSI_CTRL_STATUS_INDEX                          22
> +
> +/*
> + * There are 43 COMMON_CTRL registers with regs after # 33 being reserve=
d
> + */
> +#define CSI_CTRL_MAX                                   33
> +
> +#define CSIPHY_DEFAULT_PARAMS                          0
> +#define CSIPHY_SETTLE_CNT_LOWER_BYTE                   2
> +#define CSIPHY_SKEW_CAL                                        7
> +
> +/* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
> +static const struct
> +mipi_csi2phy_lane_regs lane_regs_x1e80100[] =3D {
> +       /* Power up lanes 2ph mode */
> +       {.reg_addr =3D 0x101c, .reg_data =3D 0x7a, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x1018, .reg_data =3D 0x01, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +
> +       {.reg_addr =3D 0x0094, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x00a0, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0090, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0098, .reg_data =3D 0x08, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0094, .reg_data =3D 0x07, .delay_us =3D 0x01, .p=
aram_type =3D CSIPHY_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0030, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0000, .reg_data =3D 0x8e, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0038, .reg_data =3D 0xfe, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x002c, .reg_data =3D 0x01, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0034, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x001c, .reg_data =3D 0x0a, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0014, .reg_data =3D 0x60, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x003c, .reg_data =3D 0xb8, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0004, .reg_data =3D 0x0c, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0020, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0008, .reg_data =3D 0x10, .param_type =3D CSIPHY=
_SETTLE_CNT_LOWER_BYTE},
> +       {.reg_addr =3D 0x0010, .reg_data =3D 0x52, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0094, .reg_data =3D 0xd7, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x005c, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0060, .reg_data =3D 0xbd, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0064, .reg_data =3D 0x7f, .param_type =3D CSIPHY=
_SKEW_CAL},
> +
> +       {.reg_addr =3D 0x0e94, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0ea0, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e90, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e98, .reg_data =3D 0x08, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e94, .reg_data =3D 0x07, .delay_us =3D  0x01, .=
param_type =3D CSIPHY_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e30, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e28, .reg_data =3D 0x04, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e00, .reg_data =3D 0x80, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e0c, .reg_data =3D 0xff, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e38, .reg_data =3D 0x1f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e2c, .reg_data =3D 0x01, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e34, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e1c, .reg_data =3D 0x0a, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e14, .reg_data =3D 0x60, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e3c, .reg_data =3D 0xb8, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e04, .reg_data =3D 0x0c, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e20, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e08, .reg_data =3D 0x10, .param_type =3D CSIPHY=
_SETTLE_CNT_LOWER_BYTE},
> +       {.reg_addr =3D 0x0e10, .reg_data =3D 0x52, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +
> +       {.reg_addr =3D 0x0494, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x04a0, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0490, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0498, .reg_data =3D 0x08, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0494, .reg_data =3D 0x07, .delay_us =3D  0x01, .=
param_type =3D CSIPHY_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0430, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0400, .reg_data =3D 0x8e, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0438, .reg_data =3D 0xfe, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x042c, .reg_data =3D 0x01, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0434, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x041c, .reg_data =3D 0x0a, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0414, .reg_data =3D 0x60, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x043c, .reg_data =3D 0xb8, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0404, .reg_data =3D 0x0c, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0420, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0408, .reg_data =3D 0x10, .param_type =3D CSIPHY=
_SETTLE_CNT_LOWER_BYTE},
> +       {.reg_addr =3D 0x0410, .reg_data =3D 0x52, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0494, .reg_data =3D 0xd7, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x045c, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0460, .reg_data =3D 0xbd, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0464, .reg_data =3D 0x7f, .param_type =3D CSIPHY=
_SKEW_CAL},
> +
> +       {.reg_addr =3D 0x0894, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x08a0, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0890, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0898, .reg_data =3D 0x08, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0894, .reg_data =3D 0x07, .delay_us =3D  0x01, .=
param_type =3D CSIPHY_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0830, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0800, .reg_data =3D 0x8e, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0838, .reg_data =3D 0xfe, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x082c, .reg_data =3D 0x01, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0834, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x081c, .reg_data =3D 0x0a, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0814, .reg_data =3D 0x60, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x083c, .reg_data =3D 0xb8, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0804, .reg_data =3D 0x0c, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0820, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0808, .reg_data =3D 0x10, .param_type =3D CSIPHY=
_SETTLE_CNT_LOWER_BYTE},
> +       {.reg_addr =3D 0x0810, .reg_data =3D 0x52, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0894, .reg_data =3D 0xd7, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x085c, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0860, .reg_data =3D 0xbd, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0864, .reg_data =3D 0x7f, .param_type =3D CSIPHY=
_SKEW_CAL},
> +
> +       {.reg_addr =3D 0x0c94, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0ca0, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c90, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c98, .reg_data =3D 0x08, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c94, .reg_data =3D 0x07, .delay_us =3D  0x01, .=
param_type =3D CSIPHY_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c30, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c00, .reg_data =3D 0x8e, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c38, .reg_data =3D 0xfe, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c2c, .reg_data =3D 0x01, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c34, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c1c, .reg_data =3D 0x0a, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c14, .reg_data =3D 0x60, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c3c, .reg_data =3D 0xb8, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c04, .reg_data =3D 0x0c, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c20, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c08, .reg_data =3D 0x10, .param_type =3D CSIPHY=
_SETTLE_CNT_LOWER_BYTE},
> +       {.reg_addr =3D 0x0c10, .reg_data =3D 0x52, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c94, .reg_data =3D 0xd7, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0c5c, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0c60, .reg_data =3D 0xbd, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0c64, .reg_data =3D 0x7f, .param_type =3D CSIPHY=
_SKEW_CAL},
> +};
> +
> +static inline const struct mipi_csi2phy_device_regs *
> +csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
> +{
> +       return &csi2phy->soc_cfg->reg_info;
> +}
> +
> +static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_devic=
e *csi2phy)
> +{
> +       const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_re=
gs(csi2phy);
> +       u32 tmp;
> +
> +       writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID, csi2phy->base=
 +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
6));
> +
> +       tmp =3D readl_relaxed(csi2phy->base +
> +                           CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->commo=
n_regs_offset, 12));
> +       csi2phy->hw_version =3D tmp;
> +
> +       tmp =3D readl_relaxed(csi2phy->base +
> +                           CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->commo=
n_regs_offset, 13));
> +       csi2phy->hw_version |=3D (tmp << 8) & 0xFF00;
> +
> +       tmp =3D readl_relaxed(csi2phy->base +
> +                           CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->commo=
n_regs_offset, 14));
> +       csi2phy->hw_version |=3D (tmp << 16) & 0xFF0000;
> +
> +       tmp =3D readl_relaxed(csi2phy->base +
> +                           CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->commo=
n_regs_offset, 15));
> +       csi2phy->hw_version |=3D (tmp << 24) & 0xFF000000;
> +
> +       dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version =3D 0x%08x\n", =
csi2phy->hw_version);
> +}
> +
> +/*
> + * phy_qcom_mipi_csi2_reset - Perform software reset on CSIPHY module
> + * @phy_qcom_mipi_csi2: CSIPHY device
> + */
> +static void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy=
)
> +{
> +       const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_re=
gs(csi2phy);
> +
> +       writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET,
> +              csi2phy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->comm=
on_regs_offset, 0));
> +       usleep_range(5000, 8000);
> +       writel(0x0, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
0));
> +}
> +
> +/*
> + * phy_qcom_mipi_csi2_settle_cnt_calc - Calculate settle count value
> + *
> + * Helper function to calculate settle count value. This is
> + * based on the CSI2 T_hs_settle parameter which in turn
> + * is calculated based on the CSI2 transmitter link frequency.
> + *
> + * Return settle count.
> + */
> +static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_cl=
k_rate)
> +{
> +       u32 t_hs_prepare_max_ps;
> +       u32 timer_period_ps;
> +       u32 t_hs_settle_ps;
> +       u8 settle_cnt;
> +       u32 ui_ps;
> +
> +       ui_ps =3D div64_u64(PSEC_PER_SEC, link_freq);
> +       ui_ps /=3D 2;
> +       t_hs_prepare_max_ps =3D 85000 + 6 * ui_ps;
> +       t_hs_settle_ps =3D t_hs_prepare_max_ps;
> +
> +       timer_period_ps =3D div_u64(PSEC_PER_SEC, timer_clk_rate);
> +
> +       if ((t_hs_settle_ps / timer_period_ps) < 6)
> +               return 0;
> +
> +       settle_cnt =3D t_hs_settle_ps / timer_period_ps - 6;
> +
> +       return settle_cnt;
> +}
> +
> +static void
> +phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy=
,
> +                                    u8 settle_cnt)
> +{
> +       const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_re=
gs(csi2phy);
> +       const struct mipi_csi2phy_lane_regs *r =3D regs->init_seq;
> +       int i, array_size =3D regs->lane_array_size;
> +       u32 val;
> +
> +       for (i =3D 0; i < array_size; i++, r++) {
> +               switch (r->param_type) {
> +               case CSIPHY_SETTLE_CNT_LOWER_BYTE:
> +                       val =3D settle_cnt & 0xff;
> +                       break;
> +               case CSIPHY_SKEW_CAL:
> +                       /* TODO: support application of skew from dt flag=
 */
> +                       continue;
> +               default:
> +                       val =3D r->reg_data;
> +                       break;
> +               }
> +               writel(val, csi2phy->base + r->reg_addr);
> +               if (r->delay_us)
> +                       udelay(r->delay_us);
> +       }
> +}
> +
> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *c=
si2phy,
> +                                          struct mipi_csi2phy_stream_cfg=
 *cfg)
> +{
> +       const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_re=
gs(csi2phy);
> +       struct mipi_csi2phy_lanes_cfg *lane_cfg =3D &cfg->lane_cfg;
> +       u8 settle_cnt;
> +       u8 val;
> +       int i;
> +
> +       if (cfg->link_freq <=3D 0)
> +               return -EINVAL;
> +
> +       settle_cnt =3D phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq,=
 csi2phy->timer_clk_rate);
> +       if (!settle_cnt)
> +               return -ENODEV;
> +
> +       /*
> +        * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
> +        * - Bits [0,2,4,6] =E2=86=92 D-PHY data lanes(LN0, LN2, LN4, LN6=
)
> +        * - Bits [1,3,5] =E2=86=92 C-PHY trio lanes(LN1, LN3, LN5)
> +        * - Bit [7] =E2=86=92 D-PHY clock lane(LNCK) dedicated clock ena=
ble
> +        */
> +       val =3D BIT(lane_cfg->clk.pos);
> +       for (i =3D 0; i < cfg->num_data_lanes; i++)
> +               val |=3D BIT(lane_cfg->data[i].pos * 2);
> +
> +       writel(val, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
5));
> +
> +       /* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
> +       for (i =3D 0; i < cfg->num_data_lanes; i++) {
> +               if (lane_cfg->data[i].pol) {
> +                       u8 pos =3D lane_cfg->data[i].pos;
> +
> +                       writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_=
2PHASE_CTRL9n(pos * 2));
> +               }
> +       }
> +
> +       if (lane_cfg->clk.pol)
> +               writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_C=
TRL9n(lane_cfg->clk.pos));
> +
> +       val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
> +       writel(val, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
6));
> +
> +       val =3D 0x02;
> +       writel(val, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
7));
> +
> +       val =3D 0x00;
> +       writel(val, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
0));
> +
> +       phy_qcom_mipi_csi2_gen2_config_lanes(csi2phy, settle_cnt);
> +
> +       /* IRQ_MASK registers - disable all interrupts */
> +       for (i =3D CSI_COMMON_STATUS_NUM; i < CSI_CTRL_STATUS_INDEX; i++)=
 {
> +               writel(0, csi2phy->base +
> +                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_=
offset, i));
> +       }
> +
> +       return 0;
> +}
> +
> +static void
> +phy_qcom_mipi_csi2_lanes_disable(struct mipi_csi2phy_device *csi2phy,
> +                                struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +       const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_re=
gs(csi2phy);
> +
> +       writel(0, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
5));
> +
> +       writel(0, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
6));
> +}
> +
> +static const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_1_0 =
=3D {
> +       .hw_version_read =3D phy_qcom_mipi_csi2_hw_version_read,
> +       .reset =3D phy_qcom_mipi_csi2_reset,
> +       .lanes_enable =3D phy_qcom_mipi_csi2_lanes_enable,
> +       .lanes_disable =3D phy_qcom_mipi_csi2_lanes_disable,
> +};
> +
> +static const char * const x1e_clks[] =3D {
> +       "core",
> +       "timer",
> +       "ahb"
> +};
> +
> +static const char * const x1e_supplies[] =3D {
> +       "vdda-0p9",
> +       "vdda-1p2"
> +};
> +
> +static struct mipi_csi2_genpd x1e_genpds[] =3D {
> +       { .name =3D "top", .scaled =3D false },
> +       { .name =3D "mmcx", .scaled =3D true },
> +       { .name =3D "mx", .scaled =3D true },
> +};
> +
> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e =3D {
> +       .ops =3D &phy_qcom_mipi_csi2_ops_3ph_1_0,
> +       .reg_info =3D {
> +               .init_seq =3D lane_regs_x1e80100,
> +               .lane_array_size =3D ARRAY_SIZE(lane_regs_x1e80100),
> +               .common_regs_offset =3D 0x1000,
> +       },
> +       .supply_names =3D (const char **)x1e_supplies,
> +       .num_supplies =3D ARRAY_SIZE(x1e_supplies),
> +       .clk_names =3D (const char **)x1e_clks,
> +       .num_clk =3D ARRAY_SIZE(x1e_clks),
> +       .genpds =3D x1e_genpds,
> +       .num_genpds =3D ARRAY_SIZE(x1e_genpds),
> +};
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> new file mode 100644
> index 0000000000000..aae049f0ec160
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -0,0 +1,449 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026, Linaro Ltd.
> + */
> +
> +#include <dt-bindings/phy/phy.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_opp.h>
> +#include <linux/phy/phy.h>
> +#include <linux/phy/phy-mipi-dphy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include "phy-qcom-mipi-csi2.h"
> +
> +static int
> +phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
> +                                  s64 link_freq)
> +{
> +       struct device *dev =3D csi2phy->dev;
> +       unsigned long opp_rate =3D link_freq / 4;
> +       struct dev_pm_opp *opp;
> +       long timer_rate;
> +       int i, pstate;
> +       int ret;
> +
> +       opp =3D dev_pm_opp_find_freq_ceil(dev, &opp_rate);
> +       if (IS_ERR(opp)) {
> +               dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\=
n",
> +                       link_freq);
> +               return PTR_ERR(opp);
> +       }
> +
> +       pstate =3D 0;
> +       for (i =3D 0; i < csi2phy->pd_list->num_pds; i++) {
> +               unsigned int perf;
> +
> +               if (!csi2phy->soc_cfg->genpds[i].scaled)
> +                       continue;
> +
> +               perf =3D dev_pm_opp_get_required_pstate(opp, pstate);
> +               pstate +=3D 1;
> +
> +               ret =3D dev_pm_genpd_set_performance_state(csi2phy->pd_li=
st->pd_devs[i], perf);
> +               if (ret) {
> +                       dev_err(csi2phy->dev, "Couldn't set perf state %u=
\n",
> +                               perf);
> +                       dev_pm_opp_put(opp);
> +                       goto unset_pstate;
> +               }
> +       }
> +       dev_pm_opp_put(opp);
> +
> +       ret =3D dev_pm_opp_set_rate(dev, opp_rate);
> +       if (ret) {
> +               dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
> +               goto unset_opp_rate;
> +       }
> +
> +       timer_rate =3D clk_round_rate(csi2phy->timer_clk, link_freq / 4);
> +       if (timer_rate <=3D 0) {
> +               ret =3D -ENODEV;
> +               goto unset_opp_rate;
> +       }
> +
> +       ret =3D clk_set_rate(csi2phy->timer_clk, timer_rate);
> +       if (ret)
> +               goto unset_opp_rate;
> +
> +       csi2phy->timer_clk_rate =3D timer_rate;
> +
> +       return 0;
> +
> +unset_opp_rate:
> +       dev_pm_opp_set_rate(dev, 0);
> +
> +unset_pstate:
> +       while (i--) {
> +               if (!csi2phy->soc_cfg->genpds[i].scaled)
> +                       continue;
> +
> +               dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_d=
evs[i], 0);
> +       }
> +
> +       return ret;
> +}
> +
> +static int phy_qcom_mipi_csi2_configure(struct phy *phy,
> +                                       union phy_configure_opts *opts)
> +{
> +       struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
> +       struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &opts->mipi_dph=
y;
> +       struct mipi_csi2phy_stream_cfg *stream_cfg =3D &csi2phy->stream_c=
fg;
> +       int ret;
> +
> +       ret =3D phy_mipi_dphy_config_validate(dphy_cfg);
> +       if (ret)
> +               return ret;
> +
> +       if (dphy_cfg->lanes < 1 || dphy_cfg->lanes > CSI2_MAX_DATA_LANES)
> +               return -EINVAL;
> +
> +       stream_cfg->link_freq =3D dphy_cfg->hs_clk_rate;
> +
> +       return 0;
> +}
> +
> +static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
> +{
> +       struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
> +       const struct mipi_csi2phy_hw_ops *ops =3D csi2phy->soc_cfg->ops;
> +       int i, ret;
> +
> +       ret =3D regulator_bulk_enable(csi2phy->soc_cfg->num_supplies,
> +                                   csi2phy->supplies);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D pm_runtime_resume_and_get(csi2phy->dev);
> +       if (ret < 0)
> +               goto disable_regulators;
> +
> +       ret =3D phy_qcom_mipi_csi2_set_clock_rates(csi2phy, csi2phy->stre=
am_cfg.link_freq);
> +       if (ret)
> +               goto poweroff_phy;
> +
> +       ret =3D clk_bulk_prepare_enable(csi2phy->soc_cfg->num_clk,
> +                                     csi2phy->clks);
> +       if (ret) {
> +               dev_err(csi2phy->dev, "failed to enable clocks, %d\n", re=
t);
> +               goto unset_rate;
> +       }
> +
> +       ops->reset(csi2phy);
> +
> +       ops->hw_version_read(csi2phy);
> +
> +       ret =3D ops->lanes_enable(csi2phy, &csi2phy->stream_cfg);
> +       if (ret)
> +               goto unset_clocks;
> +
> +       return 0;
> +
> +unset_clocks:
> +       clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
> +                                  csi2phy->clks);
> +
> +unset_rate:
> +       dev_pm_opp_set_rate(csi2phy->dev, 0);
> +
> +       for (i =3D 0; i < csi2phy->pd_list->num_pds; i++) {
> +               if (!csi2phy->soc_cfg->genpds[i].scaled)
> +                       continue;
> +
> +               dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_d=
evs[i], 0);
> +       }
> +
> +poweroff_phy:
> +       pm_runtime_put_sync(csi2phy->dev);
> +
> +disable_regulators:
> +       regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +                              csi2phy->supplies);
> +
> +       return ret;
> +}
> +
> +static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
> +{
> +       struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
> +       const struct mipi_csi2phy_hw_ops *ops =3D csi2phy->soc_cfg->ops;
> +       int i;
> +
> +       ops->lanes_disable(csi2phy, &csi2phy->stream_cfg);
> +
> +       clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
> +                                  csi2phy->clks);
> +
> +       dev_pm_opp_set_rate(csi2phy->dev, 0);
> +
> +       for (i =3D 0; i < csi2phy->pd_list->num_pds; i++) {
> +               if (!csi2phy->soc_cfg->genpds[i].scaled)
> +                       continue;
> +
> +               dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_d=
evs[i], 0);
> +       }
> +
> +       pm_runtime_put_sync(csi2phy->dev);
> +
> +       regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +                              csi2phy->supplies);
> +
> +       return 0;
> +}
> +
> +static const struct phy_ops phy_qcom_mipi_csi2_ops =3D {
> +       .configure      =3D phy_qcom_mipi_csi2_configure,
> +       .power_on       =3D phy_qcom_mipi_csi2_power_on,
> +       .power_off      =3D phy_qcom_mipi_csi2_power_off,
> +       .owner          =3D THIS_MODULE,
> +};
> +
> +static struct phy *qcom_csi2_phy_xlate(struct device *dev,
> +                                      const struct of_phandle_args *args=
)
> +{
> +       struct mipi_csi2phy_device *csi2phy =3D dev_get_drvdata(dev);
> +
> +       if (args->args_count < 1 || args->args[0] !=3D PHY_TYPE_DPHY) {
> +               dev_err(csi2phy->dev, "invalid phy mode in DTB\n");
> +               return ERR_PTR(-EOPNOTSUPP);
> +       }
> +
> +       csi2phy->phy_mode =3D args->args[0];
> +
> +       return csi2phy->phy;
> +}
> +
> +static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_devi=
ce *csi2phy)
> +{
> +       struct dev_pm_domain_attach_data pd_data =3D { 0 };
> +       const char **pd_names;
> +       int i;
> +
> +       pd_names =3D devm_kzalloc(csi2phy->dev,
> +                               sizeof(char *) * csi2phy->soc_cfg->num_ge=
npds,
> +                               GFP_KERNEL);
> +       if (!pd_names)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < csi2phy->soc_cfg->num_genpds; i++)
> +               pd_names[i] =3D csi2phy->soc_cfg->genpds[i].name;
> +
> +       pd_data.pd_names =3D pd_names;
> +       pd_data.num_pd_names =3D csi2phy->soc_cfg->num_genpds;
> +
> +       return devm_pm_domain_attach_list(csi2phy->dev, &pd_data,
> +                                         &csi2phy->pd_list);
> +}
> +
> +static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *=
csi2phy)
> +{
> +       struct mipi_csi2phy_stream_cfg *stream_cfg =3D &csi2phy->stream_c=
fg;
> +       u32 lane_polarities[CSI2_MAX_DATA_LANES + 1];
> +       u32 data_lanes[CSI2_MAX_DATA_LANES];
> +       struct device *dev =3D csi2phy->dev;
> +       struct fwnode_handle *ep;
> +       int num_polarities;
> +       int num_data_lanes;
> +       int i, ret;
> +
> +       ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 1, 0);
> +       if (ep) {
> +               fwnode_handle_put(ep);
> +               dev_err(dev, "DPHY split mode is not supported\n");
> +               return -EOPNOTSUPP;
> +       }
> +
> +       ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> +       if (!ep) {
> +               dev_err(dev, "Missing port@0\n");
> +               return -ENODEV;
> +       }
> +
> +       num_data_lanes =3D fwnode_property_count_u32(ep, "data-lanes");
> +       if (num_data_lanes < 1 || num_data_lanes > CSI2_MAX_DATA_LANES) {
> +               ret =3D -EINVAL;
> +               dev_err(dev, "Invalid data-lanes count: %d\n", num_data_l=
anes);
> +               goto out_put;
> +       }
> +       stream_cfg->num_data_lanes =3D num_data_lanes;
> +
> +       ret =3D fwnode_property_read_u32_array(ep, "data-lanes", data_lan=
es,
> +                                            stream_cfg->num_data_lanes);
> +       if (ret) {
> +               dev_err(dev, "Failed to read data-lanes: %d\n", ret);
> +               goto out_put;
> +       }
> +
> +       /* lane-polarities: optional, up to num_data_lanes + 1 entries */
> +       memset(lane_polarities, 0x00, sizeof(lane_polarities));
> +       num_polarities =3D fwnode_property_count_u32(ep, "lane-polarities=
");
> +       if (num_polarities > 0) {
> +               if (num_polarities !=3D stream_cfg->num_data_lanes + 1) {
> +                       ret =3D -EINVAL;
> +                       dev_err(dev, "clock+data-lane %d/polarities %d mi=
smatch\n",
> +                               stream_cfg->num_data_lanes + 1, num_polar=
ities);
> +                       goto out_put;
> +               }
> +
> +               ret =3D fwnode_property_read_u32_array(ep, "lane-polariti=
es", lane_polarities,
> +                                                    num_polarities);
> +               if (ret) {
> +                       dev_err(dev, "Failed to read lane-polarities: %d\=
n", ret);
> +                       goto out_put;
> +               }
> +       }
> +
> +       csi2phy->stream_cfg.lane_cfg.clk.pos =3D CSI2_DEFAULT_CLK_LANE;
> +       csi2phy->stream_cfg.lane_cfg.clk.pol =3D lane_polarities[0];
> +
> +       for (i =3D 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
> +               if (data_lanes[i] >=3D CSI2_MAX_DATA_LANES) {
> +                       dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
> +                       ret =3D -EINVAL;
> +                       goto out_put;
> +               }
> +               csi2phy->stream_cfg.lane_cfg.data[i].pos =3D data_lanes[i=
];
> +               csi2phy->stream_cfg.lane_cfg.data[i].pol =3D lane_polarit=
ies[i + 1];
> +       }
> +
> +       ret =3D 0;
> +
> +out_put:
> +       fwnode_handle_put(ep);
> +
> +       return ret;
> +}
> +
> +static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
> +{
> +       unsigned int i, num_clk, num_supplies;
> +       struct mipi_csi2phy_device *csi2phy;
> +       struct phy_provider *phy_provider;
> +       struct device *dev =3D &pdev->dev;
> +       struct phy *generic_phy;
> +       int ret;
> +
> +       csi2phy =3D devm_kzalloc(dev, sizeof(*csi2phy), GFP_KERNEL);
> +       if (!csi2phy)
> +               return -ENOMEM;
> +
> +       csi2phy->dev =3D dev;
> +       dev_set_drvdata(dev, csi2phy);
> +
> +       csi2phy->soc_cfg =3D device_get_match_data(&pdev->dev);
> +
> +       if (!csi2phy->soc_cfg)
> +               return -EINVAL;
> +
> +       num_clk =3D csi2phy->soc_cfg->num_clk;
> +
> +       ret =3D phy_qcom_mipi_csi2_parse_routing(csi2phy);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
> +       if (ret < 0 || csi2phy->pd_list =3D=3D NULL) {
> +               if (ret =3D=3D 0)
> +                       ret =3D -ENODEV;
> +               return dev_err_probe(dev, ret, "Failed to attach power-do=
main list\n");
> +       }
> +
> +       ret =3D devm_pm_runtime_enable(dev);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "Failed to enable pm runti=
me\n");
> +
> +       ret =3D devm_clk_bulk_get_all(dev, &csi2phy->clks);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "Failed to get clocks\n");
> +
> +       if (num_clk !=3D ret) {
> +               return dev_err_probe(dev, -ENODEV, "clock count %d expect=
ed %d\n",
> +                                    ret, num_clk);
> +       }
> +
> +       for (i =3D 0; i < num_clk; i++) {
> +               if (!csi2phy->clks[i].id)
> +                       return dev_err_probe(dev, -EINVAL, "Missing clock=
-names\n");
> +
> +               if (!strcmp(csi2phy->clks[i].id, "timer")) {
> +                       csi2phy->timer_clk =3D csi2phy->clks[i].clk;
> +                       break;
> +               }
> +       }
> +       if (!csi2phy->timer_clk)
> +               return dev_err_probe(dev, -ENODEV, "no timer clock\n");
> +
> +       ret =3D devm_pm_opp_set_clkname(dev, "core");
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to set opp clkname=
\n");
> +
> +       ret =3D devm_pm_opp_of_add_table(dev);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "invalid OPP table in devi=
ce tree\n");
> +
> +       num_supplies =3D csi2phy->soc_cfg->num_supplies;
> +       csi2phy->supplies =3D devm_kzalloc(dev, sizeof(*csi2phy->supplies=
) * num_supplies,
> +                                        GFP_KERNEL);
> +       if (!csi2phy->supplies)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < num_supplies; i++)
> +               csi2phy->supplies[i].supply =3D csi2phy->soc_cfg->supply_=
names[i];
> +
> +       ret =3D devm_regulator_bulk_get(dev, num_supplies, csi2phy->suppl=
ies);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "failed to get regulator supplies\n"=
);
> +
> +       csi2phy->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(csi2phy->base))
> +               return PTR_ERR(csi2phy->base);
> +
> +       generic_phy =3D devm_phy_create(dev, NULL, &phy_qcom_mipi_csi2_op=
s);
> +       if (IS_ERR(generic_phy)) {
> +               ret =3D PTR_ERR(generic_phy);
> +               return dev_err_probe(dev, ret, "failed to create phy\n");
> +       }
> +       csi2phy->phy =3D generic_phy;
> +
> +       phy_set_drvdata(generic_phy, csi2phy);
> +
> +       phy_provider =3D devm_of_phy_provider_register(dev, qcom_csi2_phy=
_xlate);
> +       if (!IS_ERR(phy_provider))
> +               dev_dbg(dev, "Registered MIPI CSI2 PHY device\n");
> +
> +       return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] =3D=
 {
> +       { .compatible   =3D "qcom,x1e80100-csi2-phy", .data =3D &mipi_csi=
2_dphy_4nm_x1e },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
> +
> +static struct platform_driver phy_qcom_mipi_csi2_driver =3D {
> +       .probe          =3D phy_qcom_mipi_csi2_probe,
> +       .driver =3D {
> +               .name   =3D "qcom-mipi-csi2-phy",
> +               .of_match_table =3D phy_qcom_mipi_csi2_of_match_table,
> +       },
> +};
> +
> +module_platform_driver(phy_qcom_mipi_csi2_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm MIPI CSI2 PHY driver");
> +MODULE_AUTHOR("Bryan O'Donoghue <bod@kernel.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qual=
comm/phy-qcom-mipi-csi2.h
> new file mode 100644
> index 0000000000000..7e55ae0073704
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -0,0 +1,97 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + *
> + * Qualcomm MIPI CSI2 CPHY/DPHY driver
> + *
> + * Copyright (C) 2025 Linaro Ltd.
> + */
> +#ifndef __PHY_QCOM_MIPI_CSI2_H__
> +#define __PHY_QCOM_MIPI_CSI2_H__
> +
> +#include <linux/phy/phy.h>
> +
> +#define CSI2_MAX_DATA_LANES    4
> +#define CSI2_DEFAULT_CLK_LANE  7
> +
> +struct mipi_csi2phy_lane {
> +       u8 pos;
> +       u8 pol;
> +};
> +
> +struct mipi_csi2phy_lanes_cfg {
> +       struct mipi_csi2phy_lane data[CSI2_MAX_DATA_LANES];
> +       struct mipi_csi2phy_lane clk;
> +};
> +
> +struct mipi_csi2phy_stream_cfg {
> +       s64 link_freq;
> +       u8 num_data_lanes;
> +       struct mipi_csi2phy_lanes_cfg lane_cfg;
> +};
> +
> +struct mipi_csi2phy_device;
> +
> +struct mipi_csi2phy_hw_ops {
> +       void (*hw_version_read)(struct mipi_csi2phy_device *csi2phy_dev);
> +       void (*reset)(struct mipi_csi2phy_device *csi2phy_dev);
> +       int (*lanes_enable)(struct mipi_csi2phy_device *csi2phy_dev,
> +                           struct mipi_csi2phy_stream_cfg *cfg);
> +       void (*lanes_disable)(struct mipi_csi2phy_device *csi2phy_dev,
> +                             struct mipi_csi2phy_stream_cfg *cfg);
> +};
> +
> +struct mipi_csi2phy_lane_regs {
> +       const s32 reg_addr;
> +       const s32 reg_data;
> +       const u32 delay_us;
> +       const u32 param_type;
> +};
> +
> +struct mipi_csi2phy_device_regs {
> +       const struct mipi_csi2phy_lane_regs *init_seq;
> +       const int lane_array_size;
> +       const u32 common_regs_offset;
> +};
> +
> +struct mipi_csi2_genpd {
> +       const char *name;
> +       bool scaled;
> +};
> +
> +struct mipi_csi2phy_soc_cfg {
> +       const struct mipi_csi2phy_hw_ops *ops;
> +       const struct mipi_csi2phy_device_regs reg_info;
> +
> +       const char ** const supply_names;
> +       const unsigned int num_supplies;
> +
> +       const char ** const clk_names;
> +       const unsigned int num_clk;
> +
> +       const struct mipi_csi2_genpd *genpds;
> +       const unsigned int num_genpds;
> +};
> +
> +struct mipi_csi2phy_device {
> +       struct device *dev;
> +       u8 phy_mode;
> +
> +       struct phy *phy;
> +       void __iomem *base;
> +
> +       struct clk_bulk_data *clks;
> +       struct clk *timer_clk;
> +       u32 timer_clk_rate;
> +
> +       struct regulator_bulk_data *supplies;
> +       struct dev_pm_domain_list *pd_list;
> +
> +       const struct mipi_csi2phy_soc_cfg *soc_cfg;
> +       struct mipi_csi2phy_stream_cfg stream_cfg;
> +
> +       u32 hw_version;
> +};
> +
> +extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
> +
> +#endif /* __PHY_QCOM_MIPI_CSI2_H__ */
>
> --
> 2.54.0
>
>
