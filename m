Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39BB320CBE
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468107; cv=none; b=ObvY8Z65VPmCyLK3tJsxn6J8Eif0vigkMNajbiV5+oki0DpSAXgBUdO6UOrXNnA0sZXnqK/n6x8jhNiJIVfSUdyIK1YfuW+vMy0MZbIvxPctHcELj74Twoow8WwZBXGadGFb7+YeSV+QcyWi3q9Mc/2e58GrsCeRCYqboKUr3DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468107; c=relaxed/simple;
	bh=MmUj6NzUyhX0yvMFd5WP2WydDJofZ33KYgy8JUtO468=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uatg48ZV54Os+35Cv+/Y3FUOnCaQEkGW1H+3ehTVbZQixD7nZGj8FZiTSXG7ylKgf9KdXf31D8kjv6ekWGTtzfiGF7UG1IfGbK7Rv64VNVmS+7HZ+bgdzFspOBmtOUH0FiQm4DDJRbTU6918xN6rKlcdai4gnPYb2mzRi4CNG1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUaVbMtB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2xCIst8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUaVbMtB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2xCIst8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2MKYT2921562
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 03:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Mmu24/lCQtFhgaH7klUEF4abB+k5jpYkiaZ+sRw9tc=; b=jUaVbMtBA0jHM6Z+
	DnPBYi94kUA3cesbXKekLCyXISbjupiI689jJJPiUQ2Eo3S5016cx7tihXWTGj6J
	Km8+5hfdVwdhVefk9RY3ky1O0SZaTXnJGYecsa3urouwEQwBCTCwzxc8ve5OvbPJ
	GpqgDz23dKGfvnXE8SSNYxG73vw7xU7V7w34cDMdDGstBS4LkkOQFx5SkcwpTIwv
	L+q1NZADEr6zkGFFs+fj2IS7wyYmCEKLLrUdyqPk9JVFBTrMOWBS6RxtMR5Cey5X
	qgBJIGLS0Cc/9lZc4iIZDj1N65dF/IGfwGGBNzQCp5uRhczoRxU8sFereAagXlN1
	6xiQhA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frjv585vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 03:21:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ee2847cbd4so5660906d6.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 20:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785468103; x=1786072903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Mmu24/lCQtFhgaH7klUEF4abB+k5jpYkiaZ+sRw9tc=;
        b=J2xCIst8UDTV/p5daE0xQLXlh36gHFwK7UAufyY/0qdIgnpOEIqrRFGbjKpadeEO+3
         BYkYqfTgzRNVU0LtjvXZaDCyVsfzu4um5I/CG7mTJQSSk7mH4LUJ7ZawWGPkILio0WQw
         0dq1o7hEQGZfYcTXuH3c4B11/PE2srBZio7ylN32Bxkl2czo4De+n4sM53uVW2Lu2NTn
         YahhukT9cI8q3VA2d5pKHIHY0zSlFHMNR3WpslUCb/IO6CTHV8Y1ack6WMuGWYt3DZ6r
         Kyhe3dFVIc2eo54Zbee30BBYpXkV+gKuzwI1/Mg82N2JsWLP2LhAsEwKTdR/IDWJeysn
         BM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785468103; x=1786072903;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Mmu24/lCQtFhgaH7klUEF4abB+k5jpYkiaZ+sRw9tc=;
        b=szTyHuRHl9FTpv7xIxnVFftDwEMA8l/2zvF7EHz/5tMt1+XuXLdS6W0/5x5Ld06Go7
         wpCO2uG39smN+uQTUaWHiZWAfhm3qcVcQNW61oYI/wukHfzk7ZVe/+mWqL1h6RM+UPrp
         JOJbvQiCGX6exh6rxw1QRXrUGJ4yJy/EgCZjH6XmQOqDo5y8TxEN0Ra0bexHY4cl5y8f
         g/giIEe0fNkLv0z/zkoY2TvQRBK4sXgH23V7qO2K/x5sWGR8dGctKev+RekViuUM59fj
         YERK0Dbc8a42XO4JEKPi8ZO8EmAM14eTmGt8PXYZTTUrPDybdiRbsadQHzLfFycXPL2H
         RnQw==
X-Forwarded-Encrypted: i=1; AHgh+RqUEe0gVAffLKTy6KLujiexZ64p6mhb66cFgwAzOUceZuok9WmJQqv8C+Wqzrrag7GauA4SagawQnfVSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNA4DCjB7/YpcKS2aIq3waADb0swjDHKBQnfLZpF0eiEmxolkz
	iwkFyzQ/Z+LoWW9l1CP7Ftm9Big8rS8IqwnEjT0L/ldMzSVlpALXS40H5y/nU8zPXJtDXBz+27R
	U4IXYbfEVgm0EyMaFOSQRUp44jl2sWbcFW3A9jITWWHeo9OXKgWe9cbwp/Fv7TQhOgw==
X-Gm-Gg: AR+sD13d0dPgig5ExdwcBuHkSwTYkh9jEQggAcgwQaYfO7u2Gy4hNFe6TQL23facb4l
	QYR/LZPzGo0hbTbWqyXMrqI2SxvoeyhzaFfZoJJ5WLlASGayML5Mx40qMXfVC/9Ct+xHpzEdyOd
	ydVEpz7aJ1bLa2ed7i7GOpIsluo117Tcb4D8jR9OPspZIQr7l+QRhG7QkWiTw6YPwucmRBAu/fo
	nqY+61eGM1k8x20FC6X6Xp4tZRoCcWwqNzVRkhrBTnKc20qRER/0td5a5eBa7hzIEeE+J8hf/N/
	CMwbzhPMkzCva4E17vW42opBjToUa10IT/7aoeIgKDS1AKKSmu7zLpcK6BhUX62QmAwYuc9iCEh
	oECG9QPIFkcNHB1jz+jd0ywgG6tox66RhfgZbLUhoCYZrQ8ydkzOtI5e1vgfXnkI=
X-Received: by 2002:a05:6214:4345:b0:8ef:4ed2:316 with SMTP id 6a1803df08f44-908421964a8mr7341146d6.1.1785468102357;
        Thu, 30 Jul 2026 20:21:42 -0700 (PDT)
X-Received: by 2002:a05:6214:4345:b0:8ef:4ed2:316 with SMTP id 6a1803df08f44-908421964a8mr7340596d6.1.1785468101415;
        Thu, 30 Jul 2026 20:21:41 -0700 (PDT)
Received: from [10.111.170.77] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435b6778sm982336d6.30.2026.07.30.20.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 20:21:40 -0700 (PDT)
Message-ID: <08ddabf4-f517-4fff-83e6-118344d3a05a@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:21:34 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730-x1e-csi2-phy-v15-0-f284131de1fa@linaro.org>
 <20260730-x1e-csi2-phy-v15-2-f284131de1fa@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260730-x1e-csi2-phy-v15-2-f284131de1fa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PVz_Ap2t8JL8A6-bOGpr9cBDqulcX44Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxOCBTYWx0ZWRfX/S0ViJYCkBVa
 mb+dD5MOdhuCTN4PH8eify+Fzi7L1s5vVALkeokUmwbBFyAjPdv3RFjgao51orhMFDSTvUPyxPK
 I+06BzZe0ofBAsyn4fzf0fHs6I/+zy4=
X-Proofpoint-ORIG-GUID: PVz_Ap2t8JL8A6-bOGpr9cBDqulcX44Y
X-Authority-Analysis: v=2.4 cv=co2rVV4i c=1 sm=1 tr=0 ts=6a6c14c7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=ZjqFK26dgpC9wsLx8QAA:9 a=F7_y8ekzJ88vJaNi:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxOCBTYWx0ZWRfX+L5WQeDXF68O
 JSdrz6x2XmmHKY6WQOLCRrZ9cih3TwbGtg3pSl3kAzVJg5HjXogroB00uYWpQUTiD7XAT5LQK8o
 /viaYZsZq99fbmU+RFNW96oVtGor65FYlhYA8AQ0Zlcw3pY5Kn+v23zZqrqy/XN9SAKrnY6/FJd
 HhRoGYL+kDs2Okg/nlOW28ZoLXNngd2ZgBOOUhu/pjHOP6kIHHXafeNtuS5tRSNGJMLZHNrLSoW
 9PBWaD7enczga18+bSxgLNlAR5AI/PTwzilQr+hy3m81jmLbsrVtEx+/MF0yTn77HnWyeoa+lCN
 h6/D8819/Cx1q9AXArgJawPmbXjEH5WxNS2XWUOyhk0MPJwNKc8bFme+hp5NxNIrUqSRerzX/5T
 20dQ8xxtMl0Sf8yhLFnRr6XlVDVeUP4NjUoBCAZwGtXih5FvoP/dNrv6ffy6ef2MaCOB/BVF9jE
 gOsj6sMu8vwEBm3H/YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310018



On 7/30/2026 8:02 PM, Bryan O'Donoghue wrote:
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
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now only
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
> ---
>   MAINTAINERS                                        |  10 +
>   drivers/phy/qualcomm/Kconfig                       |  15 +
>   drivers/phy/qualcomm/Makefile                      |   5 +
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 385 +++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 460 +++++++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  97 +++++
>   6 files changed, 972 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a99..a203b41475ea4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22296,6 +22296,16 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
>   F:	drivers/media/platform/qcom/iris/
>   
> +QUALCOMM MIPI CSI2 PHY DRIVER
> +M:	Bryan O'Donoghue <bod@kernel.org>
> +L:	linux-phy@lists.infradead.org
> +L:	linux-media@vger.kernel.org
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/phy/qcom,*-csi2-phy.yaml
> +F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.c
> +F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.h
> +
>   QUALCOMM NAND CONTROLLER DRIVER
>   M:	Manivannan Sadhasivam <mani@kernel.org>
>   L:	linux-mtd@lists.infradead.org
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 60a0ead127fa9..cd6959e69bef7 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -28,6 +28,21 @@ config PHY_QCOM_EDP
>   	  Enable this driver to support the Qualcomm eDP PHY found in various
>   	  Qualcomm chipsets.
>   
> +config PHY_QCOM_MIPI_CSI2
> +	tristate "Qualcomm MIPI CSI2 PHY driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on OF
> +	depends on PM
> +	depends on PM_OPP
> +	depends on COMMON_CLK
> +	select GENERIC_PHY
> +	select GENERIC_PHY_MIPI_DPHY
> +	help
> +	  Enable this to support the MIPI CSI2 PHY driver found in various
> +	  Qualcomm chipsets. This PHY is used to connect MIPI CSI2
> +	  camera sensors to the CSI Decoder in the Qualcomm Camera Subsystem
> +	  CAMSS.
> +
>   config PHY_QCOM_IPQ4019_USB
>   	tristate "Qualcomm IPQ4019 USB PHY driver"
>   	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index b71a6a0bed3f1..382cb594b06b6 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -6,6 +6,11 @@ obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
>   obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
>   obj-$(CONFIG_PHY_QCOM_M31_USB)		+= phy-qcom-m31.o
>   obj-$(CONFIG_PHY_QCOM_M31_EUSB)		+= phy-qcom-m31-eusb2.o
> +
> +phy-qcom-mipi-csi2-objs			+= phy-qcom-mipi-csi2-core.o \
> +					   phy-qcom-mipi-csi2-3ph-dphy.o
> +obj-$(CONFIG_PHY_QCOM_MIPI_CSI2)	+= phy-qcom-mipi-csi2.o
> +
>   obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
>   
>   obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o phy-qcom-qmp-usbc.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
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
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)	((offset) + 0x4 * (n))
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET	BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
> +
> +#define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
> +
> +/*
> + * 3 phase CSI has 19 common status regs with only 0-10 being used
> + * and 11-18 being reserved.
> + */
> +#define CSI_COMMON_STATUS_NUM				11
> +/*
> + * There are a number of common control registers
> + * The offset to clear the CSIPHY IRQ status starts @ 22
> + * So to clear CSI_COMMON_STATUS0 this is CSI_COMMON_CONTROL22, STATUS1 is
> + * CONTROL23 and so on
> + */
> +#define CSI_CTRL_STATUS_INDEX				22
> +
> +/*
> + * There are 43 COMMON_CTRL registers with regs after # 33 being reserved
> + */
> +#define CSI_CTRL_MAX					33
> +
> +#define CSIPHY_DEFAULT_PARAMS				0
> +#define CSIPHY_SETTLE_CNT_LOWER_BYTE			2
> +#define CSIPHY_SKEW_CAL					7
> +
> +/* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
> +static const struct
> +mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
> +	/* Power up lanes 2ph mode */
> +	{.reg_addr = 0x101c, .reg_data = 0x7a, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x1018, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +
> +	{.reg_addr = 0x0094, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x00a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0090, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0098, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0094, .reg_data = 0x07, .delay_us = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0030, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0000, .reg_data = 0x8e, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0038, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x002c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0034, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x001c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0014, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x003c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0004, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0020, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0008, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0010, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0094, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL},
> +	{.reg_addr = 0x005c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
> +	{.reg_addr = 0x0060, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL},
> +	{.reg_addr = 0x0064, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
> +
> +	{.reg_addr = 0x0e94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0ea0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e90, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e98, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e94, .reg_data = 0x07, .delay_us =  0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e30, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e28, .reg_data = 0x04, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e00, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e0c, .reg_data = 0xff, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e38, .reg_data = 0x1f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e2c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e34, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e1c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e14, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e3c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e04, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e20, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0e08, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0e10, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
> +
> +	{.reg_addr = 0x0494, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x04a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0490, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0498, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0494, .reg_data = 0x07, .delay_us =  0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0430, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0400, .reg_data = 0x8e, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0438, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x042c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0434, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x041c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0414, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x043c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0404, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0420, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0408, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0410, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0494, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL},
> +	{.reg_addr = 0x045c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
> +	{.reg_addr = 0x0460, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL},
> +	{.reg_addr = 0x0464, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
> +
> +	{.reg_addr = 0x0894, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x08a0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0890, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0898, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0894, .reg_data = 0x07, .delay_us =  0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0830, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0800, .reg_data = 0x8e, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0838, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x082c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0834, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x081c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0814, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x083c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0804, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0820, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0808, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0810, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0894, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL},
> +	{.reg_addr = 0x085c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
> +	{.reg_addr = 0x0860, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL},
> +	{.reg_addr = 0x0864, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
> +
> +	{.reg_addr = 0x0c94, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0ca0, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c90, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c98, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c94, .reg_data = 0x07, .delay_us =  0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c30, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c00, .reg_data = 0x8e, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c38, .reg_data = 0xfe, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c2c, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c34, .reg_data = 0x0f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c1c, .reg_data = 0x0a, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c14, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c3c, .reg_data = 0xb8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c04, .reg_data = 0x0c, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c20, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c08, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0c10, .reg_data = 0x52, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0c94, .reg_data = 0xd7, .param_type = CSIPHY_SKEW_CAL},
> +	{.reg_addr = 0x0c5c, .reg_data = 0x00, .param_type = CSIPHY_SKEW_CAL},
> +	{.reg_addr = 0x0c60, .reg_data = 0xbd, .param_type = CSIPHY_SKEW_CAL},
> +	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
> +};
> +
> +static inline const struct mipi_csi2phy_device_regs *
> +csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
> +{
> +	return &csi2phy->soc_cfg->reg_info;
> +}
> +
> +static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2phy)
> +{
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> +	u32 tmp;
> +
> +	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
> +
> +	tmp = readl_relaxed(csi2phy->base +
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
> +	csi2phy->hw_version = tmp;
> +
> +	tmp = readl_relaxed(csi2phy->base +
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
> +	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
> +
> +	tmp = readl_relaxed(csi2phy->base +
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
> +	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
> +
> +	tmp = readl_relaxed(csi2phy->base +
> +			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
> +	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
> +
> +	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
> +}
> +
> +/*
> + * phy_qcom_mipi_csi2_reset - Perform software reset on CSIPHY module
> + * @phy_qcom_mipi_csi2: CSIPHY device
> + */
> +static void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy)
> +{
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> +
> +	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET,
> +	       csi2phy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 0));
> +	usleep_range(5000, 8000);
> +	writel(0x0, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 0));
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
> +static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
> +{
> +	u32 t_hs_prepare_max_ps;
> +	u32 timer_period_ps;
> +	u32 t_hs_settle_ps;
> +	u8 settle_cnt;
> +	u32 ui_ps;
> +
> +	ui_ps = div64_u64(PSEC_PER_SEC, link_freq);
> +	ui_ps /= 2;
> +	t_hs_prepare_max_ps = 85000 + 6 * ui_ps;
> +	t_hs_settle_ps = t_hs_prepare_max_ps;
> +
> +	timer_period_ps = div_u64(PSEC_PER_SEC, timer_clk_rate);
> +
> +	if ((t_hs_settle_ps / timer_period_ps) < 6)
> +		return 0;
> +
> +	settle_cnt = t_hs_settle_ps / timer_period_ps - 6;
> +
> +	return settle_cnt;
> +}
> +
> +static void
> +phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
> +				     u8 settle_cnt)
> +{
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> +	const struct mipi_csi2phy_lane_regs *r = regs->init_seq;
> +	int i, array_size = regs->lane_array_size;
> +	u32 val;
> +
> +	for (i = 0; i < array_size; i++, r++) {
> +		switch (r->param_type) {
> +		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
> +			val = settle_cnt & 0xff;
> +			break;
> +		case CSIPHY_SKEW_CAL:
> +			/* TODO: support application of skew from dt flag */
> +			continue;
> +		default:
> +			val = r->reg_data;
> +			break;
> +		}
> +		writel(val, csi2phy->base + r->reg_addr);
> +		if (r->delay_us)
> +			udelay(r->delay_us);
> +	}
> +}
> +
> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
> +					   struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> +	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
> +	u8 settle_cnt;
> +	u8 val;
> +	int i;
> +
> +	if (cfg->link_freq <= 0)
> +		return -EINVAL;
> +
> +	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
> +	if (!settle_cnt)
> +		return -ENODEV;
> +
> +	/*
> +	 * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
> +	 * - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
> +	 * - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
> +	 * - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
> +	 */
> +	val = BIT(lane_cfg->clk.pos);
> +	for (i = 0; i < cfg->num_data_lanes; i++)
> +		val |= BIT(lane_cfg->data[i].pos * 2);
> +
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> +
> +	/* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
> +	for (i = 0; i < cfg->num_data_lanes; i++) {
> +		if (lane_cfg->data[i].pol) {
> +			u8 pos = lane_cfg->data[i].pos;
> +
> +			writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(pos * 2));
> +		}
> +	}
> +
> +	if (lane_cfg->clk.pol)
> +		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cfg->clk.pos));
> +
> +	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
> +
> +	val = 0x02;
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 7));
> +
> +	val = 0x00;
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 0));
> +
> +	phy_qcom_mipi_csi2_gen2_config_lanes(csi2phy, settle_cnt);
> +
> +	/* IRQ_MASK registers - disable all interrupts */
> +	for (i = CSI_COMMON_STATUS_NUM; i < CSI_CTRL_STATUS_INDEX; i++) {
> +		writel(0, csi2phy->base +
> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, i));
> +	}
> +
> +	return 0;
> +}
> +
> +static void
> +phy_qcom_mipi_csi2_lanes_disable(struct mipi_csi2phy_device *csi2phy,
> +				 struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> +
> +	writel(0, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> +
> +	writel(0, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
> +}
> +
> +static const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_1_0 = {
> +	.hw_version_read = phy_qcom_mipi_csi2_hw_version_read,
> +	.reset = phy_qcom_mipi_csi2_reset,
> +	.lanes_enable = phy_qcom_mipi_csi2_lanes_enable,
> +	.lanes_disable = phy_qcom_mipi_csi2_lanes_disable,
> +};
> +
> +static const char * const x1e_clks[] = {
> +	"core",
> +	"timer",
> +	"ahb"
> +};
> +
> +static const char * const x1e_supplies[] = {
> +	"vdda-0p9",
> +	"vdda-1p2"
> +};
> +
> +static struct mipi_csi2_genpd x1e_genpds[] = {
> +	{ .name = "top", .scaled = false },
> +	{ .name = "mmcx", .scaled = true },
> +	{ .name = "mx", .scaled = true },
> +};
> +
> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
> +	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
> +	.reg_info = {
> +		.init_seq = lane_regs_x1e80100,
> +		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
> +		.common_regs_offset = 0x1000,
> +	},
> +	.supply_names = (const char **)x1e_supplies,
> +	.num_supplies = ARRAY_SIZE(x1e_supplies),
> +	.clk_names = (const char **)x1e_clks,
> +	.num_clk = ARRAY_SIZE(x1e_clks),
> +	.genpds = x1e_genpds,
> +	.num_genpds = ARRAY_SIZE(x1e_genpds),
> +};
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> new file mode 100644
> index 0000000000000..02f34b7de05f5
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -0,0 +1,460 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026, Linaro Ltd.
> + */
> +
> +#include <dt-bindings/media/video-interfaces.h>
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
> +				   s64 link_freq)
> +{
> +	struct device *dev = csi2phy->dev;
> +	unsigned long opp_rate = link_freq / 4;
> +	struct dev_pm_opp *opp;
> +	long timer_rate;
> +	int i, pstate;
> +	int ret;
> +
> +	opp = dev_pm_opp_find_freq_ceil(dev, &opp_rate);
> +	if (IS_ERR(opp)) {
> +		dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
> +			link_freq);
> +		return PTR_ERR(opp);
> +	}
> +
> +	pstate = 0;
> +	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
> +		unsigned int perf;
> +
> +		if (!csi2phy->soc_cfg->genpds[i].scaled)
> +			continue;
> +
> +		perf = dev_pm_opp_get_required_pstate(opp, pstate);
> +		pstate += 1;
> +
> +		ret = dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], perf);
> +		if (ret) {
> +			dev_err(csi2phy->dev, "Couldn't set perf state %u\n",
> +				perf);
> +			dev_pm_opp_put(opp);
> +			goto unset_pstate;
> +		}
> +	}
> +	dev_pm_opp_put(opp);
> +
> +	ret = dev_pm_opp_set_rate(dev, opp_rate);
> +	if (ret) {
> +		dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
> +		goto unset_opp_rate;
> +	}
> +
> +	timer_rate = clk_round_rate(csi2phy->timer_clk, link_freq / 4);
> +	if (timer_rate <= 0) {
> +		ret = -ENODEV;
> +		goto unset_opp_rate;
> +	}
> +
> +	ret = clk_set_rate(csi2phy->timer_clk, timer_rate);
> +	if (ret)
> +		goto unset_opp_rate;
> +
> +	csi2phy->timer_clk_rate = timer_rate;
> +
> +	return 0;
> +
> +unset_opp_rate:
> +	dev_pm_opp_set_rate(dev, 0);
> +
> +unset_pstate:
> +	while (i--) {
> +		if (!csi2phy->soc_cfg->genpds[i].scaled)
> +			continue;
> +
> +		dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], 0);
> +	}
> +
> +	return ret;
> +}
> +
> +static int phy_qcom_mipi_csi2_configure(struct phy *phy,
> +					union phy_configure_opts *opts)
> +{
> +	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> +	struct phy_configure_opts_mipi_dphy *dphy_cfg = &opts->mipi_dphy;
> +	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
> +	int ret;
> +
> +	ret = phy_mipi_dphy_config_validate(dphy_cfg);
> +	if (ret)
> +		return ret;
> +
> +	if (dphy_cfg->lanes < 1 || dphy_cfg->lanes > CSI2_MAX_DATA_LANES)
> +		return -EINVAL;
> +
> +	stream_cfg->link_freq = dphy_cfg->hs_clk_rate;
> +
> +	return 0;
> +}
> +
> +static int phy_qcom_mipi_csi2_set_mode(struct phy *phy,
> +				       enum phy_mode mode, int submode)
> +{
> +	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> +
> +	if (mode != PHY_MODE_MIPI_DPHY)
> +		return -EOPNOTSUPP;
> +
> +	csi2phy->phy_mode = mode;
> +	return 0;
> +}
> +
> +static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
> +{
> +	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> +	const struct mipi_csi2phy_hw_ops *ops = csi2phy->soc_cfg->ops;
> +	int i, ret;
> +
> +	ret = regulator_bulk_enable(csi2phy->soc_cfg->num_supplies,
> +				    csi2phy->supplies);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(csi2phy->dev);
> +	if (ret < 0)
> +		goto disable_regulators;
> +
> +	ret = phy_qcom_mipi_csi2_set_clock_rates(csi2phy, csi2phy->stream_cfg.link_freq);
> +	if (ret)
> +		goto poweroff_phy;
> +
> +	ret = clk_bulk_prepare_enable(csi2phy->soc_cfg->num_clk,
> +				      csi2phy->clks);
> +	if (ret) {
> +		dev_err(csi2phy->dev, "failed to enable clocks, %d\n", ret);
> +		goto unset_rate;
> +	}
> +
> +	ops->reset(csi2phy);
> +
> +	ops->hw_version_read(csi2phy);
> +
> +	ret = ops->lanes_enable(csi2phy, &csi2phy->stream_cfg);
> +	if (ret)
> +		goto unset_clocks;
> +
> +	return 0;
> +
> +unset_clocks:
> +	clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
> +				   csi2phy->clks);
> +
> +unset_rate:
> +	dev_pm_opp_set_rate(csi2phy->dev, 0);
> +
> +	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
> +		if (!csi2phy->soc_cfg->genpds[i].scaled)
> +			continue;
> +
> +		dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], 0);
> +	}
> +
> +poweroff_phy:
> +	pm_runtime_put_sync(csi2phy->dev);
> +
> +disable_regulators:
> +	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +			       csi2phy->supplies);
> +
> +	return ret;
> +}
> +
> +static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
> +{
> +	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> +	const struct mipi_csi2phy_hw_ops *ops = csi2phy->soc_cfg->ops;
> +	int i;
> +
> +	ops->lanes_disable(csi2phy, &csi2phy->stream_cfg);
> +
> +	clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
> +				   csi2phy->clks);
> +
> +	dev_pm_opp_set_rate(csi2phy->dev, 0);
> +
> +	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
> +		if (!csi2phy->soc_cfg->genpds[i].scaled)
> +			continue;
> +
> +		dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], 0);
> +	}
> +
> +	pm_runtime_put_sync(csi2phy->dev);
> +
> +	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +			       csi2phy->supplies);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops phy_qcom_mipi_csi2_ops = {
> +	.configure	= phy_qcom_mipi_csi2_configure,
> +	.set_mode	= phy_qcom_mipi_csi2_set_mode,
> +	.power_on	= phy_qcom_mipi_csi2_power_on,
> +	.power_off	= phy_qcom_mipi_csi2_power_off,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2phy)
> +{
> +	struct dev_pm_domain_attach_data pd_data = { 0 };
> +	const char **pd_names;
> +	int i;
> +
> +	pd_names = devm_kzalloc(csi2phy->dev,
> +				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
> +				GFP_KERNEL);
> +	if (!pd_names)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < csi2phy->soc_cfg->num_genpds; i++)
> +		pd_names[i] = csi2phy->soc_cfg->genpds[i].name;
> +
> +	pd_data.pd_names = pd_names;
> +	pd_data.num_pd_names = csi2phy->soc_cfg->num_genpds;
> +
> +	return devm_pm_domain_attach_list(csi2phy->dev, &pd_data,
> +					  &csi2phy->pd_list);
> +}
> +
> +static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
> +{
> +	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
> +	u32 lane_polarities[CSI2_MAX_DATA_LANES + 1];
> +	u32 data_lanes[CSI2_MAX_DATA_LANES];
> +	struct device *dev = csi2phy->dev;
> +	struct fwnode_handle *ep;
> +	int num_polarities;
> +	int num_data_lanes;
> +	u32 bus_type;
> +	int i, ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 1, 0);
> +	if (ep) {
> +		fwnode_handle_put(ep);
> +		dev_err(dev, "DPHY split mode is not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> +	if (!ep) {
> +		dev_err(dev, "Missing port@0\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = fwnode_property_read_u32(ep, "bus-type", &bus_type);
> +	if (ret) {
> +		dev_err(dev, "Failed to read bus-type: %d\n", ret);
> +		goto out_put;
> +	}
> +
> +	if (bus_type != MEDIA_BUS_TYPE_CSI2_DPHY) {
> +		ret = -EOPNOTSUPP;
> +		dev_err(dev, "Unsupported bus-type %u\n", bus_type);
> +		goto out_put;
> +	}
> +
> +	num_data_lanes = fwnode_property_count_u32(ep, "data-lanes");
> +	if (num_data_lanes < 1 || num_data_lanes > CSI2_MAX_DATA_LANES) {
> +		ret = -EINVAL;
> +		dev_err(dev, "Invalid data-lanes count: %d\n", num_data_lanes);
> +		goto out_put;
> +	}
> +	stream_cfg->num_data_lanes = num_data_lanes;
> +
> +	ret = fwnode_property_read_u32_array(ep, "data-lanes", data_lanes,
> +					     stream_cfg->num_data_lanes);
> +	if (ret) {
> +		dev_err(dev, "Failed to read data-lanes: %d\n", ret);
> +		goto out_put;
> +	}
> +
> +	/* lane-polarities: optional, up to num_data_lanes + 1 entries */
> +	memset(lane_polarities, 0x00, sizeof(lane_polarities));
> +	num_polarities = fwnode_property_count_u32(ep, "lane-polarities");
> +	if (num_polarities > 0) {
> +		if (num_polarities != stream_cfg->num_data_lanes + 1) {
> +			ret = -EINVAL;
> +			dev_err(dev, "clock+data-lane %d/polarities %d mismatch\n",
> +				stream_cfg->num_data_lanes + 1, num_polarities);
> +			goto out_put;
> +		}
> +
> +		ret = fwnode_property_read_u32_array(ep, "lane-polarities", lane_polarities,
> +						     num_polarities);
> +		if (ret) {
> +			dev_err(dev, "Failed to read lane-polarities: %d\n", ret);
> +			goto out_put;
> +		}
> +	}
> +
> +	csi2phy->stream_cfg.lane_cfg.clk.pos = CSI2_DEFAULT_CLK_LANE;
> +	csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];
> +
> +	for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
> +		if (data_lanes[i] >= CSI2_MAX_DATA_LANES) {
> +			dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
> +			ret = -EINVAL;
> +			goto out_put;
> +		}
> +		csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i];
> +		csi2phy->stream_cfg.lane_cfg.data[i].pol = lane_polarities[i + 1];
> +	}
> +
> +	ret = 0;
> +
> +out_put:
> +	fwnode_handle_put(ep);
> +
> +	return ret;
> +}
> +
> +static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
> +{
> +	unsigned int i, num_clk, num_supplies;
> +	struct mipi_csi2phy_device *csi2phy;
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct phy *generic_phy;
> +	int ret;
> +
> +	csi2phy = devm_kzalloc(dev, sizeof(*csi2phy), GFP_KERNEL);
> +	if (!csi2phy)
> +		return -ENOMEM;
> +
> +	csi2phy->dev = dev;
> +	dev_set_drvdata(dev, csi2phy);
> +
> +	csi2phy->soc_cfg = device_get_match_data(&pdev->dev);
> +
> +	if (!csi2phy->soc_cfg)
> +		return -EINVAL;
> +
> +	num_clk = csi2phy->soc_cfg->num_clk;
> +
> +	ret = phy_qcom_mipi_csi2_parse_routing(csi2phy);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
> +	if (ret < 0 || csi2phy->pd_list == NULL) {
> +		if (ret == 0)
> +			ret = -ENODEV;
> +		return dev_err_probe(dev, ret, "Failed to attach power-domain list\n");
> +	}
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to enable pm runtime\n");
> +
> +	ret = devm_clk_bulk_get_all(dev, &csi2phy->clks);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get clocks\n");
> +
> +	if (num_clk != ret) {
> +		return dev_err_probe(dev, -ENODEV, "clock count %d expected %d\n",
> +				     ret, num_clk);
> +	}
> +
> +	for (i = 0; i < num_clk; i++) {
> +		if (!csi2phy->clks[i].id)
> +			return dev_err_probe(dev, -EINVAL, "Missing clock-names\n");
> +
> +		if (!strcmp(csi2phy->clks[i].id, "timer")) {
> +			csi2phy->timer_clk = csi2phy->clks[i].clk;
> +			break;
> +		}
> +	}
> +	if (!csi2phy->timer_clk)
> +		return dev_err_probe(dev, -ENODEV, "no timer clock\n");
> +
> +	ret = devm_pm_opp_set_clkname(dev, "core");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
> +
> +	ret = devm_pm_opp_of_add_table(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
> +
> +	num_supplies = csi2phy->soc_cfg->num_supplies;
> +	csi2phy->supplies = devm_kzalloc(dev, sizeof(*csi2phy->supplies) * num_supplies,
> +					 GFP_KERNEL);
> +	if (!csi2phy->supplies)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_supplies; i++)
> +		csi2phy->supplies[i].supply = csi2phy->soc_cfg->supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, num_supplies, csi2phy->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get regulator supplies\n");
> +
> +	csi2phy->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(csi2phy->base))
> +		return PTR_ERR(csi2phy->base);
> +
> +	generic_phy = devm_phy_create(dev, NULL, &phy_qcom_mipi_csi2_ops);
> +	if (IS_ERR(generic_phy)) {
> +		ret = PTR_ERR(generic_phy);
> +		return dev_err_probe(dev, ret, "failed to create phy\n");
> +	}
> +	csi2phy->phy = generic_phy;
> +
> +	phy_set_drvdata(generic_phy, csi2phy);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (!IS_ERR(phy_provider))
> +		dev_dbg(dev, "Registered MIPI CSI2 PHY device\n");
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
> +	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
> +
> +static struct platform_driver phy_qcom_mipi_csi2_driver = {
> +	.probe		= phy_qcom_mipi_csi2_probe,
> +	.driver = {
> +		.name	= "qcom-mipi-csi2-phy",
> +		.of_match_table = phy_qcom_mipi_csi2_of_match_table,
> +	},
> +};
> +
> +module_platform_driver(phy_qcom_mipi_csi2_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm MIPI CSI2 PHY driver");
> +MODULE_AUTHOR("Bryan O'Donoghue <bod@kernel.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
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
> +#define CSI2_MAX_DATA_LANES	4
> +#define CSI2_DEFAULT_CLK_LANE	7
> +
> +struct mipi_csi2phy_lane {
> +	u8 pos;
> +	u8 pol;
> +};
> +
> +struct mipi_csi2phy_lanes_cfg {
> +	struct mipi_csi2phy_lane data[CSI2_MAX_DATA_LANES];
> +	struct mipi_csi2phy_lane clk;
> +};
> +
> +struct mipi_csi2phy_stream_cfg {
> +	s64 link_freq;
> +	u8 num_data_lanes;
> +	struct mipi_csi2phy_lanes_cfg lane_cfg;
> +};
> +
> +struct mipi_csi2phy_device;
> +
> +struct mipi_csi2phy_hw_ops {
> +	void (*hw_version_read)(struct mipi_csi2phy_device *csi2phy_dev);
> +	void (*reset)(struct mipi_csi2phy_device *csi2phy_dev);
> +	int (*lanes_enable)(struct mipi_csi2phy_device *csi2phy_dev,
> +			    struct mipi_csi2phy_stream_cfg *cfg);
> +	void (*lanes_disable)(struct mipi_csi2phy_device *csi2phy_dev,
> +			      struct mipi_csi2phy_stream_cfg *cfg);
> +};
> +
> +struct mipi_csi2phy_lane_regs {
> +	const s32 reg_addr;
> +	const s32 reg_data;
> +	const u32 delay_us;
> +	const u32 param_type;
> +};
> +
> +struct mipi_csi2phy_device_regs {
> +	const struct mipi_csi2phy_lane_regs *init_seq;
> +	const int lane_array_size;
> +	const u32 common_regs_offset;
> +};
> +
> +struct mipi_csi2_genpd {
> +	const char *name;
> +	bool scaled;
> +};
> +
> +struct mipi_csi2phy_soc_cfg {
> +	const struct mipi_csi2phy_hw_ops *ops;
> +	const struct mipi_csi2phy_device_regs reg_info;
> +
> +	const char ** const supply_names;
> +	const unsigned int num_supplies;
> +
> +	const char ** const clk_names;
> +	const unsigned int num_clk;
> +
> +	const struct mipi_csi2_genpd *genpds;
> +	const unsigned int num_genpds;
> +};
> +
> +struct mipi_csi2phy_device {
> +	struct device *dev;
> +	u8 phy_mode;
> +
> +	struct phy *phy;
> +	void __iomem *base;
> +
> +	struct clk_bulk_data *clks;
> +	struct clk *timer_clk;
> +	u32 timer_clk_rate;
> +
> +	struct regulator_bulk_data *supplies;
> +	struct dev_pm_domain_list *pd_list;
> +
> +	const struct mipi_csi2phy_soc_cfg *soc_cfg;
> +	struct mipi_csi2phy_stream_cfg stream_cfg;
> +
> +	u32 hw_version;
> +};
> +
> +extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
> +
> +#endif /* __PHY_QCOM_MIPI_CSI2_H__ */
> 

Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> # Hamoa Evk

