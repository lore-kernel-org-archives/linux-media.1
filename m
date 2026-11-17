Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911380;
	b=jUR+PK9fqZ5h0Mj2v742WbDh+77b0q1lRZv0JIrydscCoEBi5xzOFUBd9P1RLXfXwa3D
	 rk2+5hq3aZkL7/pCU0Ug2t8QWWACSe0tg8bdTeJRbF+Ne7pKZzN6/vIr6hYDFPB2vFwYi
	 mCnxj7BWmnyMZnmjHwqmwx8ZCAztXVvRFHoF4lqg9GpWD22sXGslSIpuUsjrr6UKv377H
	 XLHbymJHuZdNx4zx551WuEpat85glCS+faH3FyN3xTiLhRmcFZ07tq2uqq1N5XrgwWf5V
	 luOgFonTc+PQ4vr7zKt/K+CXW+BWRJuQANOyP/kqvTHIUKhjrQv30BGfnV5NpkX12dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911380;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t5p+dDDdYSchXbu0c1av9YDO0v09Bzx7mLDs56Jdvyo=;
	b=LjwcAKrU5YiIBYECjfdg4yrzd4ku5354vdbRs2Ji9adBjwXqA9LfHGQaVT3+D+5eI0vA
	 5tx85g4Sy9rmmfx5bd2Y8Hg0ZM1pjuVHmPTMtVbyau3EkjGLKLamR95owwY0Dckz1fWPL
	 AKtBr4rkh7Eqfbz8pJhTbqOLT/iIOo7yhCPTSf2oOJzG4kxKshipeYZwqeRvuEVtsUupH
	 ED3xka5WZ4bvOPh1tbtPiyO3t5+1NRczq7dLnL1++c7TwET5pJNXdn307yaeHgN+18s5w
	 ouxXZuyEtCapI8DNg5V3GjErjotMXIeRLT87VMYN2eWWh8WDHhx7zST8xHT5RFsbqMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ofLJuvVx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2kPl9DK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158F1606A323
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 158F1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ofLJuvVx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2kPl9DK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHAGsUC3458474
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5p+dDDdYSchXbu0c1av9YDO0v09Bzx7mLDs56Jdvyo=; b=ofLJuvVx09OpbtG4
	svD5fpYzp+ITivNSnwRqaPZgswV0NJcNuTCHKRpvOkvZYpLm0zvrccV5cwKuIFUP
	gjPfqrWh2gZHPl8scAdh3A93Z2uD8vbl3VccID16Px/Mro59zSBZDZlMEZzcPjBQ
	K3UgMWPxkX3ZH021PigwPbx0n+cUV173/Adu6FUcxSO4paENg0hrC3KzjxmzMqAz
	MKzkWZ0n3fJjwdSzUHDjlxvsIWaX2KTImfzNurVhg4zn49mg0hh/AvQRIdcLqbdj
	TnSDLPik4c3+K2rjteKSrVwJ/X3pI6IMotDXLgblxc74WyIZg3wQuzoZEziOuoiY
	li/Caw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh984h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:29:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3821eb27024so7615eec.1
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 02:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794911377; x=1795516177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t5p+dDDdYSchXbu0c1av9YDO0v09Bzx7mLDs56Jdvyo=;
        b=L2kPl9DKLv2YudVXj/XYNcwPxAZsi5heA4Wgn50edhZxV5iqhw5mlgwIu+PyI+yzlH
         z2dTX5aJH3WP1vMGB/ghLiguWvtbtQBQREktvUx3bh/Qd+9h9+RdMbjpIodnmoxSQN6p
         dIyIBrxsy5v34UjigBFCv34hnK31iWyXplUL2C2msXTOCKEP/pe2yv0mfdeovw6h/VgG
         WMYLOxMb1OXT6MGpLq1xKtBrysrv2uKvMKLNbeWo+qk70BFjal0P+gUr25K7iD04/BOX
         38xyeQWno1Ws4jv70OXfl6d2MKMDJEBfqgnbW6fixLFnlgPd5Tk4KHyzIuoFPEY1ZQyt
         ZwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911377; x=1795516177;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5p+dDDdYSchXbu0c1av9YDO0v09Bzx7mLDs56Jdvyo=;
        b=0Pi68qQI6maw50Psaw79Kdz9cqEiJxgyxHgMvEHjzeGwK1q5ftWo+4rj30fNRIlc7c
         0Q8uKXckeiAMQSiQbFoOh6f0L7pWgxsTfPnsjvy0PlMOs5O1HV6sJLFdIRkkjazrwPJ5
         ne7+rU4EHtRgxBj/n3W1lQj7ebXZLfqFng4ynn11hprKWvky1sxYnjrNy6eE94j0jYk6
         0sJHemHB0jYsUxNx1a3mylFU/qy4W5TJrdDNj4qs60Nt3dPymfah321JgunjJd5+Vm+g
         GVWzBt+iiCB5OR05/+rSBR1SPyYju4iO7TEAC9UDQ8JTcsEdWW8QPvVZGCs6/ArniGaL
         +g2w==
X-Gm-Message-State: APuU4Z8pOeEppTWSCSKbIQuqjlalLOO+U5hN1P306HxXCzxGrYe8oJm/
	WhFt78FqoVEQiqWHL9ti4r2mU4aJVb9IQo+FnSvrQeUlslm8F1LpC7TFf2SsfAEVhgT5wIyz1Zb
	ggEznBXAsNaP4+sTI2QqNat5WZKSvl8YNSs6Xe2jVbQWU33VMsBC+Qij9p4WrFnWcFA==
X-Gm-Gg: AZFdTZfPVL2ImHimpcMZ8z7YStojzKUIPl6g4gWWNO7LOFGc3eh6xuqJjxXubI193yE
	sQ3A9++50i3cHGuMtVcW00aQhrrhpAogCed8l56/EKRb8ySKfCePU5uwhVs3OkPYSHfanFSJbf5
	QaiUix0x1nIus5h3d7qG5QMN7Rn970c9yl4s46TFtKwv8eN2QTSPVvkO69guZ6+Wk4c+cK/FUkt
	6xPbQS1HAE0kbuc4mEP572vxebkyQBcSB6bMUBmwNaMzgz6pFQfXgw0Pz+635x+xd+Of6Qh0K3f
	R1ayqIvri9Tc99zB8VQ0XHGoXT0HVjs+cTSpb1voPnkpmCcQhQ1NZIdNP+iwYm6cj8yeHFJcte2
	QxXusfDUZjocYXf6Q/uJ/JWP2tZ0Zk0CBmFT2vVjP1jRHiYo/j16TtngJDVsucSt0Ag2Z2INZoJ
	peuajS
X-Received: by 2002:a05:7301:7195:b0:37f:d740:51d7 with SMTP id 5a478bee46e88-37fd74051ddmr4317801eec.41.1794911376661;
        Tue, 17 Nov 2026 02:29:36 -0800 (PST)
X-Received: by 2002:a05:7301:7195:b0:37f:d740:51d7 with SMTP id 5a478bee46e88-37fd74051ddmr4317774eec.41.1794911376062;
        Tue, 17 Nov 2026 02:29:36 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm42299828eec.3.2026.11.17.02.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 02:29:35 -0800 (PST)
Message-ID: <9ef9d2d6-5e49-d46a-286c-fa29e83f481a@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 15:59:28 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] media: iris: add mahua platform data and enable
 qcom,mahua-iris
Content-Language: en-US
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
 <20261113-mahua_iris_enable-v1-3-b7107e1cbcaa@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261113-mahua_iris_enable-v1-3-b7107e1cbcaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0U3EMNZ9KE9bJmlWfFFPZ6Vol7N_v0Os
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc2c91 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=M8cVLYsfoSyvLF12CAwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 0U3EMNZ9KE9bJmlWfFFPZ6Vol7N_v0Os
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MSBTYWx0ZWRfX5D+7djnNYg0f
 eGvPxodtb92SMMZOvVUktQncci3ZobyctowHO3rr99izSloXLG5WvoUtoGQRpZTRwnmGwC8Lrnt
 beY6COu2FtC/x9u5raP+hYBIzZqMyis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MSBTYWx0ZWRfX1+PaRaogktb5
 6FBgs/Jc9DTvKOawBhXlrFhnStDzn5FuZFn6DxJVOWxkv4qJQHU4Qpw+fKQATS3MrEsgT6lvhmb
 9E6lgY3uUL4ryI3brfqk2FnNVrAOBYF0z/TK77p80jx1BcOOcRvPQwEsUaEVpCRpXFSm3GBKLTa
 bI6DbR+XfQx5RDgPAI8FwU+ei/6Z5PTdcedVW0OVLGu3F2oPRpQuCTBLi5/nuf+E/JOsT3ui5B3
 c+o0rHFqKDMu6FxkDgQ8xEBdjJXWTEpYxKb8pcq06rtZ3UpTC6ex3MeWJDj5TfHgwGBn0sEUL/y
 JVydO1ozWtQHJupuoFNnb/zsKwSlTGpsDbLCBXrZEW0c7bYVRRxAECdVMDNMWcaZuojrdiddzoK
 rls7yq7CeuepIaDP9ZzNq1zxWtE/Zlm9n8HoxdnpbM/EJTZr1a0RHJ7WGom6bxdAsK7X32eb7ud
 oylqDn+/vl1tCbI2Adw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170041


On 11/14/2026 8:39 AM, Deepa Guthyappa Madivalara wrote:
> Add qcom,mahua-iris compatible to initialize the hardware
> and necessary Mahua platform data describing the needed clock
> resets and powerdomain tables only for one core, vcodec0.
> Most of the data is leveraged from Glymur as they are the same
> Iris variant. Firmware, vpu ops, buffer sizes are the same as for
> Glymur.
>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |  1 +
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_mahua.c | 44 ++++++++++++++++++++++
>  .../media/platform/qcom/iris/iris_platform_mahua.h | 14 +++++++
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 34 +++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 10 +++++
>  7 files changed, 108 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 48570da56aa052577e05ead12bd26df090d97454..6c187d25980eabcd1c789b132e2f0bffa62fc805 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -13,6 +13,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_hfi_gen2_response.o \
>               iris_hfi_queue.o \
>               iris_platform_glymur.o \
> +             iris_platform_mahua.o \
>               iris_platform_vpu2.o \
>               iris_platform_vpu3x.o \
>               iris_power.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 1024a2fd75a3ae2b7e194e583b91ec5f16e2773a..817b8a9e2712e7f1e335dbb8600dc033670c5cfa 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -58,6 +58,7 @@ extern const struct iris_firmware_data iris_hfi_gen1_data;
>  extern const struct iris_firmware_data iris_hfi_gen2_data;
>  extern const struct iris_firmware_data iris_hfi_milos_data;
>  
> +extern const struct iris_platform_data mahua_data;
>  extern const struct iris_platform_data glymur_data;
>  extern const struct iris_platform_data milos_data;
>  extern const struct iris_platform_data qcs8300_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_mahua.c b/drivers/media/platform/qcom/iris/iris_platform_mahua.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..14b085426ac29cf69824d1d0da142c026266a0bb
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_mahua.c
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_core.h"
> +#include "iris_platform_common.h"
> +
> +const struct iris_power_domain_data iris_mahua_ctrl_data = {
> +	.pd_names = (const char *[]) {
> +		"venus",
> +	},
> +	.pd_cnt = 1,
> +	.clk_names = (const char *[]) {
> +		"core_iface", "core_freerun", "core",
> +	},
> +	.clk_cnt = 3,
> +};
> +
> +const struct iris_power_domain_data iris_mahua_vcodec_data[] = {
> +	{
> +		.pd_names = (const char *[]) {
> +			"vcodec0",
> +		},
> +		.pd_cnt = 1,
> +		.clk_names = (const char *[]) {
> +			"vcodec0_iface", "vcodec0_core_freerun", "vcodec0_core",
> +		},
> +		.clk_cnt = 3,
> +	},
> +};
> +
> +const char * const iris_mahua_clk_reset_table[] = {
> +	"core_bus",
> +	"vcodec0_bus",
> +	"core",
> +	"vcodec0_core",
> +};
> +
> +const char * const iris_mahua_opp_clk_table[] = {
> +	"vcodec0_core",
> +	"core",
> +	NULL,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_mahua.h b/drivers/media/platform/qcom/iris/iris_platform_mahua.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..fa30f33c5b03b515fa57e52a1b7413406cf5823e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_mahua.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_PLATFORM_MAHUA_H__
> +#define __IRIS_PLATFORM_MAHUA_H__
> +
> +extern const struct iris_power_domain_data iris_mahua_ctrl_data;
> +extern const struct iris_power_domain_data iris_mahua_vcodec_data[1];
> +extern const char * const iris_mahua_clk_reset_table[4];
> +extern const char * const iris_mahua_opp_clk_table[2];
> +
> +#endif /* __IRIS_PLATFORM_MAHUA_H__ */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index aa03f86d19453a2f3b314d13b7137827d6939a49..0fe485b360d2a9271392f6e5a397211ed94cf99a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -13,6 +13,7 @@
>  #include "iris_vpu_common.h"
>  
>  #include "iris_platform_glymur.h"
> +#include "iris_platform_mahua.h"
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8550.h"
>  #include "iris_platform_sm8650.h"
> @@ -90,6 +91,39 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
>  	},
>  };
>  
> +/*
> + * Shares most of Glymur data except, num_cores
> + */
> +
> +const struct iris_platform_data mahua_data = {
> +	.firmware_desc_gen2 = &iris_vpu36_p4_s7_gen2_desc,
> +	.vpu_ops = &iris_vpu36_ops,
> +	.icc_tbl = iris_icc_info_vpu3x,
> +	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> +	.clk_rst_tbl = iris_mahua_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(iris_mahua_clk_reset_table),
> +	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
> +	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
> +	.ctrl_data = &iris_mahua_ctrl_data,
> +	.vcodec_data = iris_mahua_vcodec_data,
> +	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
> +	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
> +	.opp_clk_tbl = iris_mahua_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xffe00000 - 1,
> +	.inst_iris_fmts = iris_fmts_vpu3x_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
> +	.inst_caps = &platform_inst_cap_sm8550,
> +	.slice_caps = &iris_vpu2_vpu3x_slice_caps,
> +	.tz_cp_config_data = iris_glymur_tz_cp_config,
> +	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.num_cores = 1,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +};
> +
>  const struct iris_platform_data glymur_data = {
>  	.firmware_desc_gen2 = &iris_vpu36_p4_s7_gen2_desc,
>  	.vpu_ops = &iris_vpu36_ops,
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 411ef7ef8dae957fae1ca47131e84244e3306ba6..cf2e92f440351e7b0aaf19c4c71db90d8a2deee7 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -550,6 +550,10 @@ static const struct dev_pm_ops iris_pm_ops = {
>  };
>  
>  static const struct of_device_id iris_dt_match[] = {
> +	{
> +		.compatible = "qcom,mahua-iris",
> +		.data = &mahua_data,
> +	},

iris_dt_match[] appears to be maintained in alphabetical order. Please move
qcom,mahua-iris to the appropriate position to preserve the ordering.

>  	{
>  		.compatible = "qcom,glymur-iris",
>  		.data = &glymur_data,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 375defbb959424df5a6b0033af6e267187f97333..e981c8f93318c5afd5ead162e00690a0c6054edf 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -365,6 +365,16 @@ static int iris_vpu36_check_core_load(struct iris_inst *inst, bool mbpf)
>  	new_load = mbpf ? iris_get_mbpf(inst) : iris_get_mbps(inst);
>  
>  	select_core0 = core0_load + new_load <= max_load && core0_session_cnt < max_session_cnt;
> +
> +	if (platform_data->num_cores == 1) {
> +		if (select_core0) {
> +			inst->core_id = IRIS_VCODEC0;
> +			return 0;
> +		}
> +
> +		return -ENOMEM;
> +	}
> +
>  	select_core1 = core1_load + new_load <= max_load && core1_session_cnt < max_session_cnt;
>  
>  	if (select_core0 && select_core1)
>
