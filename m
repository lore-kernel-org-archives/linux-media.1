Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994928;
	b=NoedBSP78t2y7WK2CMvFFUXJ+LvRKEdP0tAQ7atcaKF2AxAsFcIVU50N3WIxEGzUDNfH
	 Y3D7dTdOn/cEKKedM8uOpGlyULGMrUPSGEDomllFWG/6Uu9YqtTCxdAsrLbkGQxYTmqFf
	 dZelsvckWCSkg4xfqAtIUZt2jXntjYljRfzfQgQxbN7kdFtzPE0n/SYhhQfhEoHTJ/AST
	 m94530hiJsf4AQ+Pf8+z4Wz2Xsu5n7utVriGwwM55cWH6FnxSc42D+2loJ5dYNRJXRbA7
	 7OKx94LXn399UKDKrQkdZVzKpWXG7T3Z6tduIkCBRD1tDaH7M4D+QrF9ope/LZYHa8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J3TKIv/Ak1BJN4kBm+mXFw3Nx1zEXqeHLbvlL3jhk74=;
	b=lhHfGHpeK1dZXMekgwhAleUAu76hpzyfWdFikzQKo207kw22ocHwzjfJvFCCCdkvVlKK
	 Ew+DKltO3G49yb4n152mi6IL2nT5J/i3J9JkWOl/9YZ54JZBnJeL9MaKiETEZt1uWNARn
	 I1ydaIP6d7Syc/ZDV+YxfP2g+fOSDMj9zdYBRz3Z6qAtCwGoqy+PX0TvLzArv3t7genyH
	 1WGEPZzl0fzQZbZ9WF7kJ9v5XVx1lVrh+HUrfu3Kkx4xmbZjyy6gApYnnSMv0eohOf0UW
	 Qz0OHdc6kv+rHtPDXZVOtvIVR5+kW19dGXM4kGjyHbBexs+08G5EtF5WzKhabwQfmAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NHomdapk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P5lBWs8O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AD7606A325
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56AD7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NHomdapk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P5lBWs8O
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8WuIX2453536
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3TKIv/Ak1BJN4kBm+mXFw3Nx1zEXqeHLbvlL3jhk74=; b=NHomdapk1j52RpX8
	sr7keOG7i+AVBw0Y9/KH8lcQEJmAyg8hQj1InHiQ3WIWCrO5FlPq0m0R6s6dkrP8
	a6RmCZ4O77stgbO8jq32atDqpIe5YWPXB2IRea6lw2UnSzYrBrwDULlFFsd7s/4W
	AzdCuONPKUatyXil9k9YKWsdsMEnNR9VOXokXMk/o7C6qJ5zTQkh6RR0HdE9D6C6
	U9iaKes5DLwaoprfRMDQDUlNij2cemJmkIobedaTiP5ZBEXzxrhy/KcKuAda4T9j
	3Vs3MxiwS9Snva4UmbV3fkE1m11Edb9/u7tklSccQ4N4mkdTHGGRF3uu1A32nf9M
	jDxQ5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9abf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:42:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08904845so10329345ad.3
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 01:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994925; x=1795599725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3TKIv/Ak1BJN4kBm+mXFw3Nx1zEXqeHLbvlL3jhk74=;
        b=P5lBWs8Om4WVpOYZIA9c2ewYl3F3TZ/03JjRLR/dneqNT0kgJ53KWWArvWXOvg0OSC
         ck5XC2VcDDd0qgzjUSY1dqkPTfPnI4z/sCwxHn5ZUElIveJYgic2ZUO7oXH4aZEbHT91
         m0XonpnEOFUW6suyLbybtLdCPuwzpDeQn5DtkVHszI5QJFh53/mF21RfjB0H4IdX5+5I
         GaWwGFiGBMXxeDvJNZkSUdTeUshx466/6BEffLigwgv9g8HADF7ODT3bIURAuoYxsy2k
         2wc/VcLYLwU2UwupUOQ/T+FdV2HWMXfqiwZa7N32DfCdzTCnwjpGcKcS8tqWOwiz7KM/
         uung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994925; x=1795599725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3TKIv/Ak1BJN4kBm+mXFw3Nx1zEXqeHLbvlL3jhk74=;
        b=sYNVhyS/Z+ppX0tbojAxn7lRw4MRM7s30/vROUGszp0kJU+EEBh214cCgq3PbWbAKu
         NKMb17grr/p4k8iOvZ6e542+UpCyybXuuCIhtwYl4nUA9OAj9ltzKv5B8edtFXSEk4C8
         U+mv1x53SMNvj2HOwDhm8LWF/821kt0F8zNeTidPYzZ9QdXd2yQVRm85Oxft/ktrgbRS
         CzB8FcPAIvwJ6rjStEBigie0NKv4fC/K8esmFn1R2TYk5kIdnYFoPT1ZqCxg7KPffu8/
         WknzfrZoiz9YGqoViNskqVqs8bL5rU8spyWzHe/lZKa81+kGEGBm/hF23wKWDbMpAg6v
         Dp/A==
X-Forwarded-Encrypted: i=1; AL+hErFaOE2LlAS9is/ydTHsdYIMgoe/NAJC7rzlDF5KNhE4GcqoWuzmvkX2xK2YhqC5RBODsB/8hp/8sFBNqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9HVsxzP1NXD3VTBNQNF3V01pao6Lpf49vjiycOUNVGdoQL66Ne
	jKXc5W94x/mxT4l3uAnuSKoT2aOLMMzPiOh2wVTAEeSBQbMAm/53xnm8habkDMt3AoKdZQ6n9xd
	vJHPYSwUjgi9uNozflHLvIJDVajlTTt9mp+8i/yL28Uiywg318Q7uG11M0/ikRvBK1g==
X-Gm-Gg: AZFdTZe7ygMz8MeltXYLk8GFfL6c3maab9nngsDSMSfUXiLdO0TdNxeDXaoWkdnH48k
	JDfvInZbYYtoAfWhA/zKJmYJ+VIsgLs1xqzZi2nDqVoRIladqbi4sO+9dGLlwnEw7ZEx26MaTSL
	92jz8FlHPJQDG+1MtOhR1ybNqhZxBxyZmkscwWyKzuupqM+n756Nl7y2bZW+ONe9kHZoPSnPhv0
	O1SSnBVXQ5Xfu7YDodtf+8hQNTcVB0KtLiBOMRqVl9nHBaznhjL+HLXLjFpV+YaSfvcyirFStY8
	0LfNM9zSdxXO4ThEHxZAvF/K8B808Wqnm6YaMV0u8cNJPdU7Vjs9CHC5d27j4WO+exOxdln2lrp
	3dsf0YAq6ZlYLgKfD3f/TjiCSA0mrbpp7PZfr4ieOtdGKH3Sab73cQTcrK9cDzCyoulGxgX0UlH
	uex8z1pC8pOyFyaWkJRODbAAFXXzsa/ndshrTc9WSOHnYnL1k9
X-Received: by 2002:a17:903:3d0f:b0:2ef:dcfd:afe3 with SMTP id d9443c01a7336-2eff74013a9mr21435165ad.34.1794994924667;
        Wed, 18 Nov 2026 01:42:04 -0800 (PST)
X-Received: by 2002:a17:903:3d0f:b0:2ef:dcfd:afe3 with SMTP id d9443c01a7336-2eff74013a9mr21434895ad.34.1794994924176;
        Wed, 18 Nov 2026 01:42:04 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:42:03 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:43 +0800
Subject: [PATCH v3 4/8] media: iris: add VPU5x hardware ops
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-add_iris_for_hawi-v3-4-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=18411;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=jMfCmakKTHFA+bAi9OM1osQytcRIiEOqIOQorTaOjlA=;
 b=mU8Crny3q+6rGGf1/pJJdbVz8kVQx5uo6qdbB7y+7396L3HNIcLVpXOnjKEhDdrcHmDbBL4/H
 URGLhd6cm4UCjvv68ed4OpLHdSFGHsWN595AveQh3Cr7nAUTuyk2TpL
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX8ro+C6emhqlq
 rbCsYAdlbPmcwIDSwRgLKOJ82oIXlgzBzUbCprxfgudStvUkiHCbvPtKRswAR1Wg/egxXI6ISv+
 To6QQp4eYduf0or1Vw+FsUr20C49NJQ=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd72ee cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SpjvXzj0ZUdBEPdxxcEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfXxh2yCor5yeNV
 grv918K1MGr2IHJu2miN8LDdAFXPgLPyNPuHM8nQgdE8NXmuDuV26Hi9VKxXQceLJkrHuG6pePx
 qbOim6v/N7bOqnvibNgHXEOrn70ica8eXGht6ZB/q2MEZ6RFpLB3tm8lUsIZaHS6hLCPS23i7Bj
 3NhLEzgMFv9+0XLrB2mVTEQUpZbzj9ImDOShsu79J3rU78ylPwmR7n6nh+RlfBsj+rRLrJ+glR3
 lFWGIS05XY7x6asp3/tqrfEYgYd1GHZhB/QunabLTnwd6voj8Y/U/hAzzmV6rUL1WGyu4GV8vG/
 poQK9IG5BJtNVAZXxlsFZCwXXd/045TpezuAjZKcsRBRztPc7iYd07UDANkohTB+zovwQtCi/JK
 vCXimkmeEVbD9HXbPVNSDCzxjqsMA/bR0VjbMmZ1ND5QHjI3wjtdFtwBT2Np2O9wDnSB0jzC5Uy
 Du7+hTx7Hbr/cTcz1eQ==
X-Proofpoint-ORIG-GUID: JvroM_xo8pyU7rMyK-nd-bVQhsXgymP1
X-Proofpoint-GUID: JvroM_xo8pyU7rMyK-nd-bVQhsXgymP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

The Hawi SoC uses the VPU5x generation of the Iris video hardware, which
requires handling for two new power domains — mm-int for the internal
memory interconnect and cx-int for the CX domain AXI interface — as well
as additional generation-specific clocks. Without a VPU5x vpu_ops
implementation the Iris driver cannot power on or off the hardware on
Hawi.

Move the shared idle and core power status definitions to the common
register header so they can be used by both VPU4x and VPU5x code.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_core.h       |   4 +
 drivers/media/platform/qcom/iris/iris_vpu5x.c      | 448 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 4 files changed, 454 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index bbd1f724963e66d45d9b52e5158c593f4061fd95..faaebea4a9afd9620c31fb9daeb8b4b500ecee82 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -27,6 +27,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu2.o \
              iris_vpu3x.o \
              iris_vpu4x.o \
+             iris_vpu5x.o \
              iris_vpu_ar50lt.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 5267d4be84902d655418479367e115536329698f..e6a883adf04bd086008f8b48bb880316f70da92c 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -63,6 +63,8 @@ struct qcom_ubwc_cfg_data;
  * @vcodec_vpp0: power domain and clocks for the vcodec VPP0
  * @vcodec_vpp1: power domain and clocks for the vcodec VPP1
  * @apv: power domain and clocks for the APV hardware block
+ * @mm_int: power domain and clocks for the MM interconnect block
+ * @cx_int: power domain and clocks for the CX interconnect block
  * @opp_pmdomain_tbl: table of opp power domains
  * @resets: table of iris reset clocks
  * @controller_resets: table of controller reset clocks
@@ -111,6 +113,8 @@ struct iris_core {
 	struct iris_power_domain		*vcodec_vpp0;
 	struct iris_power_domain		*vcodec_vpp1;
 	struct iris_power_domain		*apv;
+	struct iris_power_domain		*mm_int;
+	struct iris_power_domain		*cx_int;
 	struct dev_pm_domain_list		*opp_pmdomain_tbl;
 	struct reset_control_bulk_data		*resets;
 	struct reset_control_bulk_data		*controller_resets;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu5x.c b/drivers/media/platform/qcom/iris/iris_vpu5x.c
new file mode 100644
index 0000000000000000000000000000000000000000..7a4ed4b3a81dbf8ddd446411ca6114c675d57102
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu5x.c
@@ -0,0 +1,448 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/iopoll.h>
+#include <linux/pm_opp.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+#include "iris_vpu_register_defines.h"
+
+/*
+ * iris5 specific register defines.
+ * Many base offsets are shared with prior generations:
+ *   WRAPPER_BASE_OFFS = 0x000B0000
+ *   AON_BASE_OFFS     = 0x000E0000
+ *   AON_MVP_NOC_RESET = 0x0001F000
+ *   CPU_BASE_OFFS     = 0x000A0000
+ */
+
+#define WRAPPER_MVP_NOC_LPI_CONTROL		(WRAPPER_BASE_OFFS + 0x110)
+#define WRAPPER_MVP_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x114)
+#define WRAPPER_MVP_NOC_CX_LPI_CONTROL		(WRAPPER_BASE_OFFS + 0x118)
+#define WRAPPER_MVP_NOC_CX_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x11C)
+
+#define AON_WRAPPER_MVP_NOC_ARCG_CONTROL	(AON_BASE_OFFS + 0x10)
+
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
+
+#define CPU_NOC_BASE_OFFS			0x000D0000
+#define CPU_NOC_ERRORLOGGER_MAINCTL_LOW		(CPU_NOC_BASE_OFFS + 0x08)
+#define CPU_NOC_SBM_FAULTINEN0_LOW		(CPU_NOC_BASE_OFFS + 0x240)
+
+#define NOC_BASE_OFFS				0x00010000
+#define NOC_ERL_ERRORLOGGER_MAINCTL_LOW		(NOC_BASE_OFFS + 0xA008)
+#define NOC_ERL_ERRORLOGGER_ERRCLR_LOW		(NOC_BASE_OFFS + 0xA018)
+#define NOC_SBM_FAULTINEN0_LOW			(NOC_BASE_OFFS + 0x7040)
+
+#define NOC5_RESET_VPP0_ONLY_DISABLED		0x36010E
+#define NOC5_RESET_VPP1_DISABLED		0x35000F
+#define NOC5_RESET_ALL_VPP_ENABLED		0x37010F
+
+#define NOC_LPI_PD_QREQ				BIT(0)
+#define NOC_SBM_FAULTINEN0_PORT0		BIT(0)
+#define NOC_ERRORLOGGER_MAINCTL_FAULTEN		BIT(0)
+#define NOC_ERL_ERRORLOGGER_ERRCLR		BIT(0)
+#define AON_MVP_NOC_ARCG_OVERRIDE		BIT(0)
+
+#define WRAPPER_INTR_MASK_SS_CPU_NOC		BIT(6)
+#define WRAPPER_INTR_MASK_SS_NOC		BIT(5)
+
+static bool iris_vpu5x_hw_power_collapsed(struct iris_core *core)
+{
+	u32 value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
+
+	return !(value & CORE_PWR_ON);
+}
+
+static int iris_vpu5x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32 efuse_value)
+{
+	int ret;
+
+	ret = iris_genpd_set_hwmode(core->vcodec, hw_mode);
+	if (ret)
+		return ret;
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
+		ret = iris_genpd_set_hwmode(core->vcodec_vpp0, hw_mode);
+		if (ret)
+			goto restore_hw_domain_mode;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
+		ret = iris_genpd_set_hwmode(core->vcodec_vpp1, hw_mode);
+		if (ret)
+			goto restore_vpp0_domain_mode;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
+		ret = iris_genpd_set_hwmode(core->apv, hw_mode);
+		if (ret)
+			goto restore_vpp1_domain_mode;
+	}
+
+	ret = iris_genpd_set_hwmode(core->mm_int, hw_mode);
+	if (ret)
+		goto restore_apv_domain_mode;
+
+	ret = iris_genpd_set_hwmode(core->cx_int, hw_mode);
+	if (ret)
+		goto restore_mm_int_domain_mode;
+
+	return 0;
+
+restore_mm_int_domain_mode:
+	iris_genpd_set_hwmode(core->mm_int, !hw_mode);
+restore_apv_domain_mode:
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		iris_genpd_set_hwmode(core->apv, !hw_mode);
+restore_vpp1_domain_mode:
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_genpd_set_hwmode(core->vcodec_vpp1, !hw_mode);
+restore_vpp0_domain_mode:
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_genpd_set_hwmode(core->vcodec_vpp0, !hw_mode);
+restore_hw_domain_mode:
+	iris_genpd_set_hwmode(core->vcodec, !hw_mode);
+
+	return ret;
+}
+
+static int iris_vpu5x_set_hwmode(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		iris_vpu_ahb_sync_reset_apv(core);
+
+	iris_vpu_ahb_sync_reset_hardware(core);
+
+	return iris_vpu5x_genpd_set_hwmode(core, true, efuse_value);
+}
+
+/*
+ * Perform an LPI power-down handshake on a single NOC interface.
+ *
+ * Sets QREQ and polls for the status DONE bit. On a busy response the request
+ * is toggled and, when @errclr_offs is non-zero, the NOC error-log clear
+ * register at that offset is written between retries to unblock the fabric.
+ * Pass @errclr_offs = 0 for interfaces that do not require error clearing.
+ */
+static void iris_vpu5x_noc_lpi_handshake(struct iris_core *core,
+					 u32 ctrl_offs, u32 status_offs,
+					 u32 busy_mask, u32 errclr_offs,
+					 const char *name)
+{
+	bool handshake_done, handshake_busy;
+	u32 value, count = 0;
+	int ret;
+
+	do {
+		if (errclr_offs) {
+			value = readl(core->reg_base + errclr_offs);
+			value |= NOC_ERL_ERRORLOGGER_ERRCLR;
+			writel(value, core->reg_base + errclr_offs);
+		}
+
+		value = readl(core->reg_base + ctrl_offs);
+		value |= NOC_LPI_PD_QREQ;
+		writel(value, core->reg_base + ctrl_offs);
+		usleep_range(10, 20);
+
+		value = readl(core->reg_base + status_offs);
+		handshake_done = value & NOC_LPI_STATUS_DONE;
+		handshake_busy = value & busy_mask;
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		value = readl(core->reg_base + ctrl_offs);
+		value &= ~NOC_LPI_PD_QREQ;
+		writel(value, core->reg_base + ctrl_offs);
+		usleep_range(10, 20);
+
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		dev_err(core->dev, "%s NOC LPI handshake timeout\n", name);
+
+	ret = readl_poll_timeout(core->reg_base + status_offs,
+				 value, value & NOC_LPI_STATUS_DONE, 200, 2000);
+	if (ret)
+		dev_err(core->dev, "%s NOC LPI status timeout\n", name);
+
+	value = readl(core->reg_base + ctrl_offs);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + ctrl_offs);
+}
+
+static int iris_vpu5x_power_on_cx_int(struct iris_core *core)
+{
+	u32 value;
+	int ret;
+
+	ret = iris_enable_power_domain_and_clocks(core, core->cx_int);
+	if (ret)
+		return ret;
+
+	value = readl(core->reg_base + WRAPPER_MVP_NOC_CX_LPI_CONTROL);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + WRAPPER_MVP_NOC_CX_LPI_CONTROL);
+
+	readl_poll_timeout(core->reg_base + WRAPPER_MVP_NOC_CX_LPI_STATUS,
+			   value, !(value & NOC_LPI_STATUS_DONE), 200, 2000);
+
+	return 0;
+}
+
+static void iris_vpu5x_power_off_cx_int(struct iris_core *core)
+{
+	iris_vpu5x_noc_lpi_handshake(core,
+				     WRAPPER_MVP_NOC_CX_LPI_CONTROL,
+				     WRAPPER_MVP_NOC_CX_LPI_STATUS,
+				     NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE,
+				     NOC_ERL_ERRORLOGGER_ERRCLR_LOW, "CX");
+
+	iris_disable_power_domain_and_clocks(core, core->cx_int);
+}
+
+static int iris_vpu5x_power_on_mm_int(struct iris_core *core)
+{
+	u32 value;
+	int ret;
+
+	ret = iris_enable_power_domain_and_clocks(core, core->mm_int);
+	if (ret)
+		return ret;
+
+	value = readl(core->reg_base + WRAPPER_MVP_NOC_LPI_CONTROL);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	readl_poll_timeout(core->reg_base + WRAPPER_MVP_NOC_LPI_STATUS,
+			   value, !(value & NOC_LPI_STATUS_DONE), 200, 2000);
+
+	return 0;
+}
+
+static void iris_vpu5x_power_off_mm_int(struct iris_core *core)
+{
+	u32 value;
+
+	value = readl(core->reg_base + WRAPPER_MVP_NOC_LPI_CONTROL);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	value = readl(core->reg_base + WRAPPER_MVP_NOC_CX_LPI_CONTROL);
+	value &= ~NOC_LPI_PD_QREQ;
+	writel(value, core->reg_base + WRAPPER_MVP_NOC_CX_LPI_CONTROL);
+
+	iris_vpu5x_noc_lpi_handshake(core,
+				     WRAPPER_MVP_NOC_LPI_CONTROL,
+				     WRAPPER_MVP_NOC_LPI_STATUS,
+				     NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE,
+				     NOC_ERL_ERRORLOGGER_ERRCLR_LOW, "MM");
+
+	iris_disable_power_domain_and_clocks(core, core->mm_int);
+}
+
+static int iris_vpu5x_power_on_hardware(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+	int ret;
+
+	ret = iris_vpu5x_power_on_cx_int(core);
+	if (ret)
+		return ret;
+
+	ret = iris_vpu5x_power_on_mm_int(core);
+	if (ret)
+		goto err_disable_cx_int;
+
+	ret = iris_enable_power_domain_and_clocks(core, core->vcodec);
+	if (ret)
+		goto err_disable_mm_int;
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
+		ret = iris_enable_power_domain_and_clocks(core, core->vcodec_vpp0);
+		if (ret)
+			goto err_disable_hw_power;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
+		ret = iris_enable_power_domain_and_clocks(core, core->vcodec_vpp1);
+		if (ret)
+			goto err_disable_vpp0_power;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
+		ret = iris_vpu_power_on_apv(core);
+		if (ret)
+			goto err_disable_vpp1_power;
+	}
+
+	return 0;
+
+err_disable_vpp1_power:
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp1);
+err_disable_vpp0_power:
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp0);
+err_disable_hw_power:
+	iris_disable_power_domain_and_clocks(core, core->vcodec);
+err_disable_mm_int:
+	iris_vpu5x_power_off_mm_int(core);
+err_disable_cx_int:
+	iris_vpu5x_power_off_cx_int(core);
+
+	return ret;
+}
+
+static void iris_vpu5x_power_off_hardware(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+	u32 noc_reset_mask;
+	u32 value;
+	int ret;
+
+	iris_vpu5x_genpd_set_hwmode(core, false, efuse_value);
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		iris_vpu_power_off_apv(core);
+
+	if (iris_vpu5x_hw_power_collapsed(core))
+		goto disable_clocks_and_power;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+	if (value & CORE_CLK_HALT)
+		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN,
+			   value, (value & VPU_IDLE_BITS) == VPU_IDLE_BITS, 2000, 20000);
+
+	if (efuse_value & DISABLE_VIDEO_VPP0_BIT)
+		noc_reset_mask = NOC5_RESET_VPP0_ONLY_DISABLED;
+	else if (efuse_value & DISABLE_VIDEO_VPP1_BIT)
+		noc_reset_mask = NOC5_RESET_VPP1_DISABLED;
+	else
+		noc_reset_mask = NOC5_RESET_ALL_VPP_ENABLED;
+
+	writel(noc_reset_mask, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, (value & noc_reset_mask) == noc_reset_mask, 200, 2000);
+	if (ret)
+		dev_err(core->dev, "MVP NOC reset ack timeout\n");
+
+	writel(noc_reset_mask, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, value == 0x0, 200, 2000);
+	if (ret)
+		dev_err(core->dev, "MVP NOC reset deassert timeout\n");
+
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_clocks_and_power:
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp1);
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp0);
+
+	iris_disable_power_domain_and_clocks(core, core->vcodec);
+	iris_vpu5x_power_off_mm_int(core);
+	iris_vpu5x_power_off_cx_int(core);
+}
+
+static int iris_vpu5x_power_on_controller(struct iris_core *core)
+{
+	u32 mask_val;
+	int ret;
+
+	ret = iris_enable_power_domain_and_clocks(core, core->ctrl);
+	if (ret)
+		return ret;
+
+	mask_val = readl(core->reg_base + CPU_NOC_SBM_FAULTINEN0_LOW);
+	mask_val |= NOC_SBM_FAULTINEN0_PORT0;
+	writel(mask_val, core->reg_base + CPU_NOC_SBM_FAULTINEN0_LOW);
+
+	mask_val = readl(core->reg_base + CPU_NOC_ERRORLOGGER_MAINCTL_LOW);
+	mask_val |= NOC_ERRORLOGGER_MAINCTL_FAULTEN;
+	writel(mask_val, core->reg_base + CPU_NOC_ERRORLOGGER_MAINCTL_LOW);
+
+	mask_val = readl(core->reg_base + WRAPPER_INTR_MASK);
+	mask_val &= ~WRAPPER_INTR_MASK_SS_CPU_NOC;
+	writel(mask_val, core->reg_base + WRAPPER_INTR_MASK);
+
+	mask_val = readl(core->reg_base + NOC_SBM_FAULTINEN0_LOW);
+	mask_val |= NOC_SBM_FAULTINEN0_PORT0;
+	writel(mask_val, core->reg_base + NOC_SBM_FAULTINEN0_LOW);
+
+	mask_val = readl(core->reg_base + NOC_ERL_ERRORLOGGER_MAINCTL_LOW);
+	mask_val |= NOC_ERRORLOGGER_MAINCTL_FAULTEN;
+	writel(mask_val, core->reg_base + NOC_ERL_ERRORLOGGER_MAINCTL_LOW);
+
+	mask_val = readl(core->reg_base + WRAPPER_INTR_MASK);
+	mask_val &= ~WRAPPER_INTR_MASK_SS_NOC;
+	writel(mask_val, core->reg_base + WRAPPER_INTR_MASK);
+
+	return 0;
+}
+
+static int iris_vpu5x_power_off_controller(struct iris_core *core)
+{
+	u32 ctrl_rst_tbl_size = core->iris_platform_data->controller_rst_tbl_size;
+	u32 value;
+
+	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON,
+	       core->reg_base + CPU_CS_X2RPMH);
+
+	iris_vpu5x_noc_lpi_handshake(core,
+				     WRAPPER_IRIS_CPU_NOC_LPI_CONTROL,
+				     WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
+				     NOC_LPI_STATUS_DENY, 0, "CPU");
+
+	iris_vpu5x_noc_lpi_handshake(core,
+				     AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL,
+				     AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
+				     NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE, 0, "Video CTL");
+
+	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
+	readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
+			   value, value == 0x0, 200, 2000);
+
+	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_ARCG_CONTROL);
+	value |= AON_MVP_NOC_ARCG_OVERRIDE;
+	writel(value, core->reg_base + AON_WRAPPER_MVP_NOC_ARCG_CONTROL);
+
+	iris_disable_power_domain_and_clocks(core, core->ctrl);
+
+	reset_control_bulk_assert(ctrl_rst_tbl_size, core->controller_resets);
+	usleep_range(400, 500);
+	reset_control_bulk_deassert(ctrl_rst_tbl_size, core->controller_resets);
+
+	return 0;
+}
+
+const struct vpu_ops iris_vpu5x_ops = {
+	.power_off_hw		  = iris_vpu5x_power_off_hardware,
+	.power_on_hw		  = iris_vpu5x_power_on_hardware,
+	.power_off_controller	  = iris_vpu5x_power_off_controller,
+	.power_on_controller	  = iris_vpu5x_power_on_controller,
+	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
+	.calc_freq		  = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode		  = iris_vpu5x_set_hwmode,
+	.interrupt_init		  = iris_vpu_interrupt_init,
+	.set_preset_registers	  = iris_vpu_set_preset_registers,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 126555877561e3a9bbaef7fa4da329bbe6645d46..783e2429be28dffe829b0adba998a9a02a7b883b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
+extern const struct vpu_ops iris_vpu5x_ops;
 extern const struct vpu_ops iris_vpu_ar50lt_ops;
 
 struct vpu_ops {

-- 
2.43.0

