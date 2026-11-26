Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674613;
	b=2rmwSFJLsCFEezCO5YA80YAqVDFEBgwSYkEuwGhCqUu/rpn86pwIJApkbNRTzmOMqQOf
	 82O/0g/HELbK9rWbqsmx9vgG7tPje5Lc6qWSOLiLkSN5vyaRmsiyo/KVOi4OPlTRrJPRa
	 WsCQDE+RYyOJJG3QTSJSGdoHmyfE3SeeUq/a2P9qPEJGStdysGazDlQJSMAcE4ZXuAzg6
	 3UdH/KyX1S9yuTVwVDDnu+0AT9wj8z+hP8+RX5uWOXa736t27g79AClsnUX3zn1PVjrc5
	 n9TDrCb/Yw1QoddB85iWu/dbcgI5F0bya7fSWYTRHRFnF8spxOAGeiT4Lhzirs7THMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674613;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AeP247M9ox3eKXqTZK5xlmawqY9yNRGdJtyiG2QIHDw=;
	b=yPZdUNeK+DyUYWwDgSl8Ls6GeCtbHgTVJXG1/MqKYWTOEYHDX1NtnRjAEPMxJh2s09Qx
	 f9dyw3truUpPiUb5BpcWwDctM6W2AusXllXEvg/GD1Km3leDH5RCNURMoqzxmdew8tPk6
	 vID9FjnQdEYwWi32oltrKfjGK+FvJqz9E6lHjZKueX0mrb8+1WRzmoK5WnlZETDZ6yACb
	 Zbh6f34DdN3/UUp5YG0ObSAQlv0WteG4erADbwINmmhPYyXtLQmd/pLatb620Q5wlivHP
	 6zcpLQLnk9vnGlG6BHvMMCAFJS6Ho1rfSL6wrQBfC7BuaROdB7g9/aQbi5I39WChwzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cdy1jilZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kXdmjtl3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87D5606A334
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D87D5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cdy1jilZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kXdmjtl3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36X7J2791265
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AeP247M9ox3eKXqTZK5xlmawqY9yNRGdJtyiG2QIHDw=; b=Cdy1jilZLo5oR3LP
	p395mmDZxzYKEj2kn6CkRPBpDhNRQ57VgkSD5iMuNFpbhMK5vwh5rNxANMpj7aks
	nZfFDUGtZAHK5rBmOdqEhsc5cF7ErvqJ7GrE4OtoTbua6p8i4KSW5Zw/8B/kYB/q
	/t2Nh+0Nh49aXsbYNKmy3oJDqMMFxwOMQN8bw9HIcj3LIYYN/GENCtZZh67w3GMt
	JkJIPio/C788JIRiDlHjzyplazdrgezuTUYtyr7JF8GjP6uqSTMq+wsbJPwf0PFA
	z4asHWRMmuh1O5m41hBG/JaKsFcWPbtfSJiqrqsjM4myOfi5aydq0U+8Y0u8A6wl
	c46kMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnv6jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:30:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0651873abso47858925ad.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 22:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674611; x=1796279411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeP247M9ox3eKXqTZK5xlmawqY9yNRGdJtyiG2QIHDw=;
        b=kXdmjtl3GyTRY5NfbTmNk2aeacP5ooIW+7aN2Kk2fu5tNiyykip6KFB56grURntBs2
         C8UgyV2mxVCRiHGBagheUWHb4ajCm5ngGGqxdyqhxe0WtoPel+htXjJg2xSh6ITbERko
         Ava34yXJBpbHxIQ1tr05UNazIB+zlqdjI4aEEEvMQYbAJrdvKHxhNYCQS4kaV+YDxVPm
         MvaQI7e4QlM6XJcGBZ7kd606nQSoA9VXE3hQLyIHtG1OhHogshexaNLAgd+PysR9quRB
         d8ArzEBi5IDv+pnCGd4NnqJqu05bzc6mQxa2fAB+QldT6bmkwG32+j4Jj0MJjL0+1i0R
         v1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674611; x=1796279411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AeP247M9ox3eKXqTZK5xlmawqY9yNRGdJtyiG2QIHDw=;
        b=cG/yFXtYqOjnwWIH2yRUyZe9f7fQYdTRHP4z0bmvnxS/Y3SEGoI0uuR7Zacw8xdNjc
         uTV2Wms0Lig2cNKaIHTBeHLvM2SommkNHkR69JRipPKc/R3niGvuFu/HjHuARnDXHYEI
         g1w15TYWAXtcHzisZjv5gg1fsCwLizugzVJZp7NlmffRtv1QPe2J/qcoBs0uriLsZR4z
         69vZvPtFPbnlRly7qN0NQPGnD4C6+nzaqcthgSOKzg+4LfO7DZZbLu8HPG1Rsf8UUFJm
         aCOkNb+EvnwDw9KX1PnBXPkDvYWle7sAcVmihWrA2c0bua1Rn+Ry5Jpb8ryGj3kMIy1A
         vnvQ==
X-Forwarded-Encrypted: i=1; AL+hErHD7zXFkbmd7ZKGa6ufVebKeK9mejDZ4EKA5350fckkOzyL47y3uWMryI9QTP34S2OwAF2/7AhW662E5A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VgI8V/LgB4hhbTddp5E5IaKaefKRry4aIgFjPxcERwxuVtsgM
	FpUs500ET/ZydYLOG2Pc3ZQyw9+MoOynCTNMQAtFDpzhzgL5SpH0BgiFFpcfhMIjeyQgIYR5qJe
	OlLpHwgmtR4P1VJnley2QPR48nkW9h+wLc0ZFEZe6+QbZbAdzyQChSI4yj/JRgNtoTQ==
X-Gm-Gg: AZFdTZc+T5LSrZc9cZR+hRaK7VXdKKHaAeJj7KFkUXT8pb86guFxti0qPgYNkCQFjB7
	fX4QlQPi8lnWpzQXMMhGyjCLlz8dvUlTIt8XrCiXdnBVRQzcE0gFbohmaZAjUGNWg3Foemt7vbO
	cjKc1LrPp0z1Ry8E2t6NPWEP93Ff05BYz4IFfVwBTvnjaNc6SFlBdjcgC9ZaOTrpsQTA0rPNfHC
	C10+Jg/lEcrMuCbz0BtNMsPgpSYkoqFmI4THkSvy2WyjtL7VQRWnBemIqPHiiNfVol0DQqiib4p
	dyPC+PCk2rNBETIhZwoK3n3dfnw/V95Go4wX5w440FORWR2vqGGw7Kh8sWKEklzEwMmezBaAvGw
	jj11fhAJwv2YcoWDOhK+VruqwUXFMhR0XboidYGrsMhjhAuS7U1Al98XKKI9X74QhNDQDAAAGkk
	+RO+wYcc4w
X-Received: by 2002:a17:902:c40b:b0:2f0:7db6:50ad with SMTP id d9443c01a7336-2f07db65335mr133271515ad.18.1795674610018;
        Wed, 25 Nov 2026 22:30:10 -0800 (PST)
X-Received: by 2002:a17:902:c40b:b0:2f0:7db6:50ad with SMTP id d9443c01a7336-2f07db65335mr133271025ad.18.1795674609433;
        Wed, 25 Nov 2026 22:30:09 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:30:09 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:13 +0530
Subject: [PATCH v3 05/21] drm/msm/dcp: Add HFI panel definitions
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-jshekhar-v3-dcp-v3-5-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=19933;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=iSIt4lLu6YzZAw44mF6l058OZd4GV41635W2zrAWp1w=;
 b=RsXdo9uNj6V7jLw6Y3sEyzFYWcRqwTOkv3kSaTYyy/X7LnthExzd8+JQOsBMs7fmaPEri8A6N
 WTMggITtDRQCCQMWyLGiMse3SfTmL9W8NbwZClAeZXjtcLTUDmqREDX
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXwVSDBpyJE4gb
 0Qazdc8MyZR8/HJs8ahM1te6Zx6+OyxlRjlsMTBmCDkM8FOmcX1sO3B5dKvlYCctc6IngMp5gIf
 8b3PgkBHFhrBVZu/pSLXHzLXo0x71tfEqBb6sJynyms4VyNoe7nv6HVDtwhfVhgNajUn56mbWGy
 icuF5ZH7LImf5BrkdzJjtf5mTdPePXSN/00I2KjQh+qIxKYhDjQX2ywdIu0L8/wrg8hqq6MA76f
 wfEWe28D9SIgjnGCXT8DnCA03IJ4rU2FAE9eOGj4vmQrUFkF/0TYv7BVCn9iP55mnQYSIrqPFmX
 NEd129bDTr0hddXmKw2flt54MvUVBtrYg4TzAWUyPjp1QYHPEshGmAfd5+Gxp2u95cZcA72csPa
 QfoWQEKqGHA3RdXmDbt7T/5MPNqRgSgSsnF+Zo2uGUGnO3/7AX/UcJN6AeUSJa9zzQ7oGbdkrWy
 zxPQRnPM2pAC2hlxeMw==
X-Proofpoint-ORIG-GUID: zxwkUO0AkoLrCWwk8jncrGd9JdZ-aRCT
X-Proofpoint-GUID: zxwkUO0AkoLrCWwk8jncrGd9JdZ-aRCT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXx+uBQV2MmoLI
 4Hi3vfwBlHecoYzjMFlXtBBhBVDzGCj8ft0l27Dt8hokjuXtf0Uu9Ch/DpFRgYrg5WuPwaLq2/o
 St+TwZzOSzXA4ESIE7R7USxCX0UIyIo=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b07d1f3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uSNoWdYxy1FJq9SozSAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Define the HFI panel protocol required to initialize DSI panels and
issue DCS transfers through DCP firmware. Without these definitions,
the DSI path cannot describe panel modes or panel commands to firmware.

Describe panel commands, timing and panel data structures, and property
identifiers used by panel initialization and DCS transfer helpers.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dcp/hfi/hfi_commands_panel.h   |  27 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_defs_panel.h       | 287 +++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/hfi/hfi_properties_panel.h | 198 ++++++++++++++
 3 files changed, 512 insertions(+)

diff --git a/drivers/gpu/drm/msm/dcp/hfi/hfi_commands_panel.h b/drivers/gpu/drm/msm/dcp/hfi/hfi_commands_panel.h
new file mode 100644
index 000000000000..ceccc8da8a29
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/hfi/hfi_commands_panel.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __H_HFI_COMMANDS_PANEL_H__
+#define __H_HFI_COMMANDS_PANEL_H__
+
+/* Panel-command range. */
+#define HFI_COMMAND_PANEL_BEGIN                                         0x03000000
+
+/* Start panel initialization; send with timing and generic packets in one HFI header. */
+#define HFI_COMMAND_PANEL_INIT_PANEL_CAPS                            0x03000001
+
+/* Provide one panel timing-mode description. */
+#define HFI_COMMAND_PANEL_INIT_TIMING_MODE_CAPS                      0x03000002
+
+/* Provide non-timing panel properties. */
+#define HFI_COMMAND_PANEL_INIT_GENERIC_CAPS                          0x03000003
+
+/* Deinitialize panel attributes. */
+#define HFI_COMMAND_PANEL_DEINIT                                     0x03000004
+
+/* End of panel-command range. */
+#define HFI_COMMAND_PANEL_END                                        0x03ffffff
+
+#endif /* __H_HFI_COMMANDS_PANEL_H__ */
diff --git a/drivers/gpu/drm/msm/dcp/hfi/hfi_defs_panel.h b/drivers/gpu/drm/msm/dcp/hfi/hfi_defs_panel.h
new file mode 100644
index 000000000000..a38d778898b2
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/hfi/hfi_defs_panel.h
@@ -0,0 +1,287 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __H_HFI_DEFS_PANEL_H__
+#define __H_HFI_DEFS_PANEL_H__
+
+#include "hfi_defs_common.h"
+
+/* Panel format, link, and power properties. */
+enum hfi_panel_phy_type {
+	HFI_PANEL_PHY_OLED      = 0x1,
+	HFI_PANEL_PHY_LCD       = 0x2,
+};
+
+/* Lower values have higher display priority. */
+enum hfi_panel_display_type {
+	HFI_PANEL_DISPLAY_TYPE_NONE           = 0x0,
+	HFI_PANEL_DISPLAY_TYPE_BUILT_IN_0     = 0x1,
+	HFI_PANEL_DISPLAY_TYPE_BUILT_IN_1     = 0x2,
+	HFI_PANEL_DISPLAY_TYPE_BUILT_IN_2     = 0x3,
+	HFI_PANEL_DISPLAY_TYPE_BUILT_IN_3     = 0x4,
+	HFI_PANEL_DISPLAY_TYPE_BUILT_IN_4     = 0x5,
+};
+
+enum hfi_panel_bpp {
+	HFI_PANEL_BPP_3      = 1,
+	HFI_PANEL_BPP_8      = 2,
+	HFI_PANEL_BPP_12     = 3,
+	HFI_PANEL_BPP_16     = 4,
+	HFI_PANEL_BPP_18     = 5,
+	HFI_PANEL_BPP_24     = 6,
+	HFI_PANEL_BPP_30     = 7,
+};
+
+enum hfi_panel_deinit_prop {
+	HFI_PANEL_DEINIT_CONT_SPLASH = 0x00000001,
+};
+
+enum hfi_panel_lane_enable {
+	HFI_PANEL_LANE_0      = 0x00000001,
+	HFI_PANEL_LANE_1      = 0x00000002,
+	HFI_PANEL_LANE_2      = 0x00000004,
+	HFI_PANEL_LANE_3      = 0x00000008,
+};
+
+enum hfi_panel_lane_map {
+	HFI_PANEL_LANE_MAP_0123 = 1,
+};
+
+enum hfi_panel_color_order_type {
+	HFI_PANEL_COLOR_ORDER_RGB_SWAP_RGB   = 0x1,
+	HFI_PANEL_COLOR_ORDER_RGB_SWAP_RBG   = 0x2,
+	HFI_PANEL_COLOR_ORDER_RGB_SWAP_BRG   = 0x3,
+	HFI_PANEL_COLOR_ORDER_RGB_SWAP_GRB   = 0x4,
+	HFI_PANEL_COLOR_ORDER_RGB_SWAP_GBR   = 0x5,
+};
+
+enum hfi_panel_vsync_source {
+	HFI_PANEL_VSYNC_SOURCE_GPIO_0  = 0x0,
+	HFI_PANEL_VSYNC_SOURCE_GPIO_1  = 0x1,
+	HFI_PANEL_VSYNC_SOURCE_GPIO_2  = 0x2,
+	HFI_PANEL_VSYNC_SOURCE_GPIO_3  = 0x3,
+	HFI_PANEL_VSYNC_SOURCE_GPIO_4  = 0x4,
+	HFI_PANEL_VSYNC_SOURCE_GPIO_5  = 0x5,
+	HFI_PANEL_VSYNC_SOURCE_WD      = 0xf,
+};
+
+enum hfi_panel_trigger_type {
+	HFI_PANEL_TRIGGER_NONE      = 1,
+	HFI_PANEL_TRIGGER_TE        = 2,
+	HFI_PANEL_TRIGGER_SW        = 3,
+	HFI_PANEL_TRIGGER_SW_TE     = 4,
+	HFI_PANEL_TRIGGER_SW_SEOF   = 5,
+	HFI_PANEL_TRIGGER_SEOF      = 6,
+};
+
+enum hfi_panel_fps_traffic_mode {
+	HFI_PANEL_TRAFFIC_NON_BURST_SYNC_PULSE_MODE     = 1,
+	HFI_PANEL_TRAFFIC_NON_BURST_SYNC_EVENT_MODE     = 2,
+	HFI_PANEL_TRAFFIC_BURST_MODE                    = 3,
+};
+
+enum hfi_panel_modes {
+	HFI_PANEL_VIDEO_MODE_8_BIT      = 0x1,
+	HFI_PANEL_VIDEO_MODE_10_BIT     = 0x2,
+	HFI_PANEL_CMD_MODE_8_BIT        = 0x4,
+	HFI_PANEL_CMD_MODE_10_BIT       = 0x8,
+	HFI_PANEL_VIDEO_MODE_PSR_8_BIT	= 0x10,
+	HFI_PANEL_VIDEO_MODE_PSR_10_BIT	= 0x20,
+	HFI_PANEL_VIDEO_LTPO_8_BIT	= 0x40,
+	HFI_PANEL_VIDEO_LTPO_10_BIT	= 0x80
+};
+
+enum hfi_panel_backlight_ctrl {
+	HFI_PANEL_BACKLIGHT_CTRL_UNKNOWN    = 0x0,
+	HFI_PANEL_BACKLIGHT_CTRL_PWM        = 0x1,
+	HFI_PANEL_BACKLIGHT_CTRL_WLED       = 0x2,
+	HFI_PANEL_BACKLIGHT_CTRL_DCS        = 0x3,
+	HFI_PANEL_BACKLIGHT_CTRL_EXTERNAL   = 0x4,
+};
+
+enum hfi_panel_compression_mode {
+	HFI_PANEL_COMPRESSION_NONE  = 0,
+	HFI_PANEL_COMPRESSION_DSC   = 1,
+};
+
+enum hfi_panel_chroma_format_type {
+	HFI_PANEL_CHROMA_FORMAT_444     = 1,
+	HFI_PANEL_CHROMA_FORMAT_422     = 2,
+	HFI_PANEL_CHROMA_FORMAT_420     = 3,
+};
+
+enum hfi_panel_color_space_type {
+	HFI_PANEL_COLOR_SPACE_RGB     = 1,
+	HFI_PANEL_COLOR_SPACE_YUV     = 2,
+};
+
+enum hfi_panel_dfps_type {
+	HFI_PANEL_DFPS_NONE = 0,
+	HFI_PANEL_DFPS_SUSPEND_RESUME,
+	HFI_PANEL_DFPS_IMMEDIATE_CLK,
+	HFI_PANEL_DFPS_IMMEDIATE_HFP,
+	HFI_PANEL_DFPS_IMMEDIATE_VFP,
+	HFI_PANEL_DFPS_MAX
+};
+
+/* Panel topology. */
+struct hfi_panel_topology {
+	u32 mixer_count;
+	u32 enc_count;
+	u32 display_count;
+};
+
+/* DSI command sequencing. */
+enum hfi_panel_dcs_cmd_state {
+	HFI_PANEL_DSI_HS_MODE   = 0x1,
+	HFI_PANEL_DSI_LP_MODE   = 0x2,
+};
+
+enum hfi_panel_dcs_command_type {
+	HFI_DCS_CMD_PRE_ON                      = 0x00000000,
+	HFI_DCS_CMD_ON                          = 0x00000001,
+	HFI_DCS_CMD_VIDEO_ON                    = 0x00000002,
+	HFI_DCS_CMD_COMMAND_ON                  = 0x00000003,
+	HFI_DCS_CMD_POST_PANEL_ON               = 0x00000004,
+	HFI_DCS_CMD_PRE_OFF                     = 0x00000005,
+	HFI_DCS_CMD_OFF                         = 0x00000006,
+	HFI_DCS_CMD_POST_OFF                    = 0x00000007,
+	HFI_DCS_CMD_PRE_RES_SWITCH              = 0x00000008,
+	HFI_DCS_CMD_RES_SWITCH                  = 0x0000009,
+	HFI_DCS_CMD_POST_RES_SWITCH             = 0x00000010,
+	HFI_DCS_CMD_VIDEO_MODE_SWITCH_INS       = 0x00000011,
+	HFI_DCS_CMD_VIDEO_MODE_SWITCH_OUTS      = 0x00000012,
+	HFI_DCS_CMD_COMMAND_MODE_SWITCH_INS     = 0x00000013,
+	HFI_DCS_CMD_COMMAND_MODE_SWITCH_OUTS    = 0x00000014,
+	HFI_DCS_CMD_PANEL_STATUS                = 0x00000015,
+	HFI_DCS_CMD_LP1                         = 0x00000016,
+	HFI_DCS_CMD_LP2                         = 0x00000017,
+	HFI_DCS_CMD_NOLP                        = 0x00000018,
+	HFI_DCS_CMD_PPS                         = 0x00000019,
+	HFI_DCS_CMD_ROI                         = 0x00000020,
+	HFI_DCS_CMD_TIMING_SWITCH               = 0x00000021,
+	HFI_DCS_CMD_POST_MODE_SWITCH_ON         = 0x00000022,
+	HFI_DCS_CMD_QSYNC_ONS                   = 0x00000023,
+	HFI_DCS_CMD_QSYNC_OFFS                  = 0x00000024,
+	HFI_DCS_CMD_MAX                         = 0x00000025
+};
+
+/* Panel ESD status modes. */
+enum hfi_panel_esd_status_mode {
+	HFI_PANEL_ESD_STATUS_MODE_REG_READ       = 0x1,
+	HFI_PANEL_ESD_STATUS_MODE_SW_BTA         = 0x2,
+	HFI_PANEL_ESD_STATUS_MODE_PANEL_TE       = 0x3,
+	HFI_PANEL_ESD_STATUS_MODE_PANEL_RW       = 0x4,
+	HFI_PANEL_ESD_STATUS_MODE_SW_SIM_SUCCESS = 0x5,
+	HFI_PANEL_ESD_STATUS_MODE_SW_SIM_FAILURE = 0x6
+};
+
+/* Panel timing parameters. */
+struct hfi_panel_res_data {
+	u32 active_width;
+	u32 active_height;
+	u32 h_front_porch;
+	u32 h_back_porch;
+	u32 h_left_border;
+	u32 h_right_border;
+	u32 h_pulse_width;
+	u32 h_sync_skew;
+	u32 h_sync_pulse;
+	u32 v_front_porch;
+	u32 v_back_porch;
+	u32 v_top_border;
+	u32 v_bottom_border;
+	u32 v_pulse_width;
+};
+
+/* Panel compression parameters. */
+struct hfi_panel_compression_params {
+	enum hfi_panel_compression_mode	mode;
+	u32 version;
+	u32 scr_version;
+	u32 slice_height;
+	u32 slice_width;
+	u32 slices_per_pkt;
+	u32 bits_per_component;
+	u32 pps_delay_ms;
+	u32 bits_per_pixel;
+	enum hfi_panel_chroma_format_type chroma_format;
+	enum hfi_panel_color_space_type color_space;
+	u32 block_prediction_enable;
+};
+
+/* DCS command buffers. */
+struct hfi_panel_dcs_cmd_buffer_info {
+	u32 offset_l;
+	u32 offset_h;
+	u32 size;
+	u32 delay;
+	u32 ctrl_flags;
+	enum hfi_panel_dcs_cmd_state mode;
+	u32 reserve1;
+	u32 reserve2;
+};
+
+struct hfi_panel_compression_rc_override {
+	u8 min_qp[15];
+	u8 padding1;
+	u8 max_qp[15];
+	u8 padding2;
+	u8 offsets[15];
+	u8 padding3;
+};
+
+/* Panel ESD configuration. */
+/* Register-read fields are valid only in REG_READ mode. */
+struct hfi_panel_esd_config {
+	u32 size;
+	enum hfi_panel_esd_status_mode status_mode;
+
+		u32 count;
+	u32 groups;
+
+	u32 hfi_dsi_cmd_desc_lsb;
+	u32 hfi_dsi_cmd_desc_msb;
+
+	u32 valid_params_lsb;
+	u32 valid_params_msb;
+
+	u32 status_values_lsb;
+	u32 status_values_msb;
+};
+
+struct hfi_qsync_params {
+	u32 avr_step_fps;
+	u32 qsync_min_fps;
+};
+
+struct hfi_panel_esync_caps {
+	u32 esync_support;
+	u32 esync_milli_skew;
+	u32 hsync_milli_pulse_width;
+	u32 emsync_milli_pulse_width;
+	u32 emsync_fps;
+};
+
+struct hfi_panel_dfps_caps {
+	u32 dfps_support;
+	u32 min_refresh_rate;
+	u32 max_refresh_rate;
+	enum hfi_panel_dfps_type type;
+};
+
+struct hfi_display_vrr_frame_params {
+	u32 frame_interval_ns_lo;
+	u32 frame_interval_ns_hi;
+	u32 usecase_idx;
+};
+
+/* Panel operating-mode capabilities. */
+struct hfi_panel_operating_mode_caps {
+	u32 panel_mode_switch_enabled;
+	u32 vsync_aligned_switch;
+};
+
+#endif /* __H_HFI_DEFS_PANEL_H__ */
diff --git a/drivers/gpu/drm/msm/dcp/hfi/hfi_properties_panel.h b/drivers/gpu/drm/msm/dcp/hfi/hfi_properties_panel.h
new file mode 100644
index 000000000000..53c7789239a6
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/hfi/hfi_properties_panel.h
@@ -0,0 +1,198 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __H_HFI_PROPERTIES_PANEL_H__
+#define __H_HFI_PROPERTIES_PANEL_H__
+
+/* Panel-property range. */
+#define HFI_PROPERTY_PANEL_BEGIN                                     0x00040000
+
+/* Sets the total number of timing modes available for the panel. */
+#define HFI_PROPERTY_PANEL_TIMING_MODE_COUNT                         0x00040001
+
+/* Sets the index of the timing mode. */
+
+#define HFI_PROPERTY_PANEL_INDEX                                     0x00040002
+/* Sets the panel clock speed in Hz. */
+#define HFI_PROPERTY_PANEL_CLOCKRATE                                 0x00040003
+
+/* Sets the frame rate for the panel. */
+#define HFI_PROPERTY_PANEL_FRAMERATE                                 0x00040004
+
+/* Sets active dimensions, porches, pulse width, and sync skew. */
+#define HFI_PROPERTY_PANEL_RESOLUTION_DATA                           0x00040005
+
+/* Sets jitter as a numerator/denominator pair for early wakeup. */
+#define HFI_PROPERTY_PANEL_JITTER                                    0x00040006
+
+/* Sets all the compression data for VDC / DSC. */
+#define HFI_PROPERTY_PANEL_COMPRESSION_DATA                          0x00040007
+
+/* Lists available display topologies. */
+#define HFI_PROPERTY_PANEL_DISPLAY_TOPOLOGY                          0x00040008
+
+/* Sets the default topology index. */
+#define HFI_PROPERTY_PANEL_DEFAULT_TOPOLOGY_INDEX                    0x00040009
+
+/* Panel name available for current timing mode. */
+#define HFI_PROPERTY_PANEL_NAME                                      0x0004000a
+
+/* Specifies the type of the panel, OLED / LCD. */
+#define HFI_PROPERTY_PANEL_PHYSICAL_TYPE                             0x0004000b
+
+/* Sets the panel bits per pixel. */
+#define HFI_PROPERTY_PANEL_BPP                                       0x0004000c
+
+/* Enables or disables each DSI data lane. */
+#define HFI_PROPERTY_PANEL_LANES_STATE                               0x0004000d
+
+/* Specifies the panel lane map. */
+#define HFI_PROPERTY_PANEL_LANE_MAP                                  0x0004000e
+
+/* Specifies the R, G and B channel ordering. */
+#define HFI_PROPERTY_PANEL_COLOR_ORDER                               0x0004000f
+
+/* Specifies the trigger mechanism to be used for DMA path. */
+#define HFI_PROPERTY_PANEL_DMA_TRIGGER                               0x00040010
+
+/* Property used to enable appending end of transmission packets. */
+#define HFI_PROPERTY_PANEL_TX_EOT_APPEND                             0x00040011
+
+/* Selects the DSI lane state at BLLP end-of-frame. */
+#define HFI_PROPERTY_PANEL_BLLP_EOF_POWER_MODE                       0x00040012
+
+/* Selects the DSI lane state during BLLP. */
+#define HFI_PROPERTY_PANEL_BLLP_POWER_MODE                           0x00040013
+
+/* Specifies the panel traffic mode. */
+#define HFI_PROPERTY_PANEL_TRAFFIC_MODE                              0x00040014
+
+/* Specifies the virtual channel identifier. */
+#define HFI_PROPERTY_PANEL_VIRTUAL_CHANNEL_ID                        0x00040015
+
+/* DCS command for write_memory_start. */
+#define HFI_PROPERTY_PANEL_WR_MEM_START                              0x00040016
+
+/* DCS command for write_memory_continue. */
+#define HFI_PROPERTY_PANEL_WR_MEM_CONTINUE                           0x00040017
+
+/* Inserts the DCS command. */
+#define HFI_PROPERTY_PANEL_TE_DCS_COMMAND                            0x00040018
+
+/* Specifies the panel operating mode. */
+#define HFI_PROPERTY_PANEL_OPERATING_MODE                            0x00040019
+
+/* Specifies the min backlight level supported by the panel. */
+#define HFI_PROPERTY_PANEL_BL_MIN_LEVEL                              0x0004001a
+
+/* Specifies the max backlight level supported by the panel. */
+#define HFI_PROPERTY_PANEL_BL_MAX_LEVEL                              0x0004001b
+
+/* Specifies the max brightness level supported. */
+#define HFI_PROPERTY_PANEL_BRIGHTNESS_MAX_LEVEL                      0x0004001c
+
+/* Specifies the DSI controllers to use for primary panel. */
+#define HFI_PROPERTY_PANEL_CTRL_NUM                                  0x0004001d
+
+/* Specifies the DSI PHYs to use for primary panel. */
+#define HFI_PROPERTY_PANEL_PHY_NUM                                   0x0004001e
+
+/* An array that lists the sequence of reset GPIO values and sleeps. */
+#define HFI_PROPERTY_PANEL_RESET_SEQUENCE                            0x0004001f
+
+/* Specifies the implementation of backlight control for this panel. */
+#define HFI_PROPERTY_PANEL_BL_PMIC_CONTROL_TYPE                      0x00040020
+
+/* Specifies the implementation of backlight control for secondary panel. */
+#define HFI_PROPERTY_PANEL_SEC_BL_PMIC_CONTROL_TYPE                  0x00040021
+
+/* Specifies whether to invert the display brightness value. */
+#define HFI_PROPERTY_PANEL_BL_INVERTED_DBV                           0x00040022
+
+/* Sets DCS command buffer data for different types of DCS commands. */
+#define HFI_PROPERTY_PANEL_DCS_CMD_INFO                              0x00040024
+
+/* Provides iova of DPU Mapped buffer of HW understandable panel commands. */
+#define HFI_PROPERTY_PANEL_DPU_ADDRESS                              0x00040025
+
+/* Provides dva of DCP Mapped buffer of structures of cmd descriptions. */
+#define HFI_PROPERTY_PANEL_DCP_ADDRESS                              0x00040026
+
+/* Provides D-PHY timing parameters. */
+#define HFI_PROPERTY_PANEL_DPHY_TIMINGS                              0x00040027
+
+/* Entry to select vsync source from GPIO's/Watchdog timer. */
+#define HFI_PROPERTY_PANEL_VSYNC_SOURCE                              0x00040028
+
+/* Selects the pixel-stream trigger for command mode. */
+#define HFI_PROPERTY_PANEL_STREAM_TRIGGER                            0x00040029
+
+/* Specifies the TE Path for command mode panels. */
+#define HFI_PROPERTY_PANEL_TE_MODE                                   0x0004002a
+
+/* Reports whether the panel uses C-PHY. */
+#define HFI_PROPERTY_PANEL_CPHY_MODE                                 0x0004002b
+
+/* Provides the shared DCP address for DCS command DMA. */
+#define HFI_PROPERTY_PANEL_DCS_CMD_TX_BUF_DVA                        0x0004002c
+
+/* Provides the shared DPU address for DCS command DMA. */
+#define HFI_PROPERTY_PANEL_DCS_CMD_TX_BUF_IOVA                       0x0004002d
+
+/* Sets the compression rate control override value for the panel. */
+#define HFI_PROPERTY_PANEL_COMPRESSION_RC_OVERRIDE                   0x0004002e
+
+/* Selects the line that triggers DSI command DMA. */
+#define HFI_PROPERTY_PANEL_DMA_SCHEDULE_LINE                         0x0004002f
+
+/* Provides the panel ESD config data required for ESD status check to the DCP. */
+#define HFI_PROPERTY_PANEL_ESD_CONFIG                                0x00040030
+
+/* Specifies the QSYNC parameters of the panel. */
+#define HFI_PROPERTY_PANEL_QSYNC_PARAMS                              0x00040031
+
+/* Provides esync properties for VHM panel. */
+#define HFI_PROPERTY_PANEL_ESYNC_CAPS				     0x00040032
+
+/* Specifies the DFPS capabilities supported by the panel. */
+#define HFI_PROPERTY_PANEL_DFPS_CAPS                                 0x00040033
+
+/* Specifies the frequency stepping pattern of the panel. */
+#define HFI_PROPERTY_PANEL_FREQ_PATTERN				     0x00040034
+
+/* Specifies whether panel requires LP11_INIT mode. */
+#define HFI_PROPERTY_PANEL_LP11_INIT                                 0x00040035
+
+/* Specifies the width of the DMA scheduling window, expressed in number of display lines. */
+#define HFI_PROPERTY_PANEL_DMA_SCHEDULE_WINDOW                       0x00040036
+
+/* Provides DSI bit clock frequencies for dynamic refresh. */
+#define HFI_PROPERTY_PANEL_DYN_REF_CLK_FREQS                         0x00040038
+
+/* Reports supported operating-mode switches. */
+#define HFI_PROPERTY_PANEL_OPERATING_SWITCH_CAPABILITY               0x00040039
+
+/* Selects the display type and priority. */
+#define HFI_PROPERTY_PANEL_DISPLAY_TYPE                              0x0004003a
+
+/* Specifies whether ULPS (Ultra Low Power State) is supported by the panel. */
+#define HFI_PROPERTY_PANEL_ULPS_SUPPORTED                            0x0004003b
+
+/* Specifies the DSI custom command set start index and count. */
+#define HFI_PROPERTY_PANEL_DSI_CUSTOM_DCS_CMDS_SET_INFO              0x00040040
+
+/* Provides per-mode esync timing capabilities for VHM panel. */
+#define HFI_PROPERTY_PANEL_ESYNC_TIMING_CAPS                         0x00040041
+
+/* Provides per-mode qsync timing parameters for panels supporting QSYNC/AVR. */
+#define HFI_PROPERTY_PANEL_QSYNC_TIMING_PARAMS                       0x00040042
+
+/* Specifies the current display format being used by the panel. */
+#define HFI_PROPERTY_PANEL_COLOR_FORMAT                              0x00040043
+
+/* End of panel-property range. */
+#define HFI_PROPERTY_PANEL_END                                       0x0004ffff
+
+#endif /* __H_HFI_PROPERTIES_PANEL_H__ */

-- 
2.43.0

