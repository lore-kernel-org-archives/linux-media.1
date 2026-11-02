Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634810;
	b=J78vCmeIeBhA+zenGr9oWdzBh9DdosrX0bVJURuQZoP5NThBMdn/oT9AniGhhGe8dhM8
	 aYtM3RDDiFxCc81jiGYXq8gcr0FYyFW6nlyWK5Kh4cSqjBLBaE2GwAb1vyDa9gPcxU+s8
	 iOK9e5kQKFxA/6zWGPT06EZydMG0vAzuervkHeEaU9QuUZSQe7kTRr4BOVXbzo0TkkVuo
	 atJnCwkOJLGUWaLrAsrzgx63sHaGn1cgNUYCtU3rWw9KG3LjeUqsVtRU9RUPpo60ijFeh
	 Rj2mtxPPIs1Lx+t0EaDdw5XlGeDAszVqegtC/2Heu7RPI8+exqO8tlGW8OrEeS9U5cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FQCnJ4CNRei6l1u7qB7F+y1q86ACcroiAcDcJoVp/GU=;
	b=48kqZ8t3O9UhXr0vcBLqnLcoRBP0Bj69zVINWl46fEI0Lui/Sjlqj2K4MvG38UJqdWeM
	 foQrfpkbyp+hLmlFF+y8ZLqUu0G/6wwzUsv9qomxD8pfyOe8xFQ5eGwWlZEWows/tJZ+J
	 UgjZIL6uh49/2zb4Hc71JYC/BSC+xZSgg7xCBR0ZQWgNVZ6shsp+4PES577wF2FK2hN8Q
	 IpiCUiuVzD4NI08OCZx+7+utS9cASK8tJAhTGhXAzOKbZAzJ5eiExr6tpvjRRUXUeNU2r
	 Ia3qYfPt/8QdJ4SX313pqOybFxk7uxPcszgVS9nKszVVFMUmu1zVXhzmNmW1n8P/N6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AVFHlbY3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DSefkIGN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C045160AED30
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 15:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C045160AED30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AVFHlbY3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DSefkIGN
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpQgw846145
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 15:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQCnJ4CNRei6l1u7qB7F+y1q86ACcroiAcDcJoVp/GU=; b=AVFHlbY3ZXu+5FTW
	voBlx7zXA98lLSIgRBaR7eKsysia/q8M3vzjoHMU/txY8j2x/sBWDXk2KtkhQvvc
	wga4WvHSe3jOBY3tD2py5Fuh6QfBDj932S+2HUzeKotrSoHek3N6tHCnHKWgIgGf
	awCPbYSlRmKxcIDKQiyt7k005g/E1IZQDgkba4LpyHffB6qFE9SCfe/K3rq3oA/u
	AptCportWZW4F/q0HN3ISwBxEuDXpmDMNHRD/RIImiZBQZGBEri3GY4jkkOj8tsg
	zAxz7/D7zd65UVzCxkORXdg+qCpPz/jAJwyxolM2DJt3BAHDn5jaZ/QWdxaUhI+B
	pg0aNQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1tg40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 15:53:28 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-990c957f129so3788120241.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 07:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634808; x=1794239608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQCnJ4CNRei6l1u7qB7F+y1q86ACcroiAcDcJoVp/GU=;
        b=DSefkIGNLJldEnuWYNW1cTd6UPEMoRfXLNCzGWdZwJB1HmJyMxGLKIBFDueD6UEMrx
         wkzSZCC7nYewh2431xTccKB+RL+xkTHRHO1LepxO2aECVKKUoRW1PgNe4mhRuDMEgWtQ
         9zyAlwmDV9AMHAQuRomtM5n1eOifZAYaDwjHPEAxXZE4IXgrPyHmKCFEgHgXmKWO+3Pq
         wSRG0gfFWU9X5UZ+vD2sBIGMiMAVtARZCB6SLcAHedT306fh6yhQXseeAF60y+RXu/SC
         Sqg/JFh4LzxINtbgXHrChtc57mrowU6nGigfwaqxdp9yT8fJnMdkYcnKktUmRDBpZuu+
         q8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634808; x=1794239608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQCnJ4CNRei6l1u7qB7F+y1q86ACcroiAcDcJoVp/GU=;
        b=XF9kO/OwUGSARVtGOt1dcoJvmzYsiAcukTJrO1/qIxbTMituNt8kR6tgxTyQCpZyOc
         gGO8L8yvbilaKOq2UpmpJvJRF1z/cHsLcuIkWw+snsGScbv3QafDPvJiZ6mpz+VtqZRP
         j4MoX9fyJu/wbSmO3zl/89lvji0GwUz1bAiRYwJa7wHNNJN7UzSKN4ftJ32oZYeuLDMr
         LCvSZMZo2mZtSrYUGHKKm4pOsC6I0loU1jzq88eRd/dGLmqAjoV54lBXbMcZt3Jtz/z8
         CE+XqxJvoRgbDEOCP0y2xxwEDrmV3YzinqJ16K3OH+ChwGaAfHB86Qt0835V/0LoXi29
         EBuw==
X-Gm-Message-State: APuU4Z9DnSJYqlR3PqzZlt7RYr1vnUgGV1jEQsCImqa6qFL7KT5iDyFY
	7F9hr5D7oEdnSSzH7i4MZ+Y8Hyq8s7yXWXgVsdQijdCak5DDrENchqvCnzTdC8+MQHm57sbT0Z3
	cBVj4dj3DTmxxWyCt3z7jiG+HVjBD5YHHlQspl2WPgeOkLAgtfVuGI1ziGsWen70+sw==
X-Gm-Gg: AYBFou2EthFT1jzEeXA8s+nHQ4c/ufxTATeErgi79x52+hHVM7xpRnLnmon+idW/ARj
	PRKSoKpd59TxgySu5N1zEuqg7fh3ER6kUyXjx/Jgz9xgbjliG46BRQzd8PKaH2+vRL0zjARyQkv
	Oh4K7wkriU5Ren/oHdSkvyt7fgprMaTIZfm1g0gz60TYC8kx9NfU2+q8obQp8aJ0a9Htd0WuHdy
	dMMLHWDuXjgOGYlAmfcuCnLp5vFFBGV252nfYLsDYDCSfw6H3ir1Ule5ZM8arfg5lD7QNGcrVp0
	QPpUogg9Nt1bY12FFEtD0lpHWYWOqnsbzwCrLuIS9g+o8VuiefsbTTiSAlmuFHFaoO83MTeiISX
	Uta3lS0ePt3FDXTVI/yL56wqFIdxanxUE5xKmnO+iIx1tnMc1cuzLTI6tAj33J5wH5LMF0JT5AH
	u7VqBoSnKtZgtT5/hdxXakEOLOOJLboRbuQ90yGU/yug9D/rzuYBI+8jHwpTGhSEMwHce2zhK5c
	JJfayDEll8iFj6JD0g1dk/ppDB+
X-Received: by 2002:a05:6102:b11:b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7d054180f2cmr5156833137.15.1793634807838;
        Mon, 02 Nov 2026 07:53:27 -0800 (PST)
X-Received: by 2002:a05:6102:b11:b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7d054180f2cmr5156817137.15.1793634807267;
        Mon, 02 Nov 2026 07:53:27 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:26 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:36 +0100
Subject: [PATCH v12 5/9] media: Documentation: uapi: Add qcom-camss ISP
 params documentation
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
Message-Id: <20261102-camss-isp-ope-v12-5-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Ct7__ttb8RL9ey63NZfvixDqf3GjLrgk
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8b1f9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Nff7jVtaK1xTle8F27sA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX4q6CRy1UHkff
 oLXtowMJ0h47MjJ4OhwJ0Q6i11s1RFEjEhvzBf3dnjgkVMuVy/QVFoUKWa+79uuCeDrov5bNvpW
 WKE0rzWlD4ImzkAK5ZstCwghLtErV+PybqWq63+DHwvc2ajYF7T85lqohKimUGA70ofu2WQ1fcT
 FMwk2z7/Mr6arGQMGm15OpUolStRdyTRYyyRYc1l8TK7ONY3co22+WyA71dO3QXHvRRDUZABkNC
 /73z0JzPmORQNaJd9iqkrTBfeDh6RGpiLkRoE4uWA6QApLznzX0hzTlkjxarCRfPQ59sRDDa/2g
 ByiIDhTXdEOsNKh1yPxE/ZZi2076VXCXyIoQerssNgQeiaq4xGUsjp/2IChsXawMTdSRdkppueL
 qrw/E6HrF7bUj46m/KQcd/8NES9p/zm0OwnYEnrjG3oQ7NqQomdnGmo6dYN63mucU0/KWJxe0ru
 hyYE5YqKZa1AwFKSosg==
X-Proofpoint-GUID: Ct7__ttb8RL9ey63NZfvixDqf3GjLrgk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX+McJKT8dwUEV
 ZsnusQVeOAHeNO6SfxrDlqP1LEP3nLChv/wakqL/F6qwv7FYPhFNfBPC5/rtiepqCB0/B0C915h
 TuZQ22lYylp9mNGFT+zhwVykLCxVelY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

Add documentation for the Qualcomm CAMSS ISP parameters metadata format
(V4L2_META_FMT_QCOM_ISP_PARAMS). The format is built on the V4L2
extensible ISP parameters system, with per-block structs defined in the
qcom-camss-config.h uAPI header, and is designed to be shared by any
CAMSS ISP engine exposing a parameters metadata output video node. The
Offline Processing Engine (OPE) ope_params node is the first consumer,
with additional engines expected to add their own parameter blocks in
the future.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 .../userspace-api/media/v4l/metafmt-qcom-isp.rst   | 147 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 149 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index b5455229837e707c24e134438d5e2fd12cb3bf37..25b46af4d9f7faab37000076c530e9aad5b4a076 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -20,6 +20,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-intel-ipu3
     metafmt-pisp-be
     metafmt-pisp-fe
+    metafmt-qcom-isp
     metafmt-rkisp1
     metafmt-rppx1
     metafmt-uvc
diff --git a/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..da0dd9b0884ea8b3c5fba7b5aa2eb1af80418cae
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
@@ -0,0 +1,147 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. c:namespace:: V4L
+
+.. _v4l2-meta-fmt-qcom-isp-params:
+
+**************************************
+V4L2_META_FMT_QCOM_ISP_PARAMS ('QCIP')
+**************************************
+
+Configuration Parameters
+========================
+
+The ``V4L2_META_FMT_QCOM_ISP_PARAMS`` format carries image processing
+configuration for the ISP engines found in the Qualcomm Camera Subsystem
+(CAMSS). It is passed to a metadata output video node using the
+:c:type:`v4l2_meta_format` interface.
+
+Rather than a single struct containing sub-structs for each configurable area
+of the ISP, parameters use the :ref:`v4l2-isp` parameters system, through which
+groups of parameters are defined as distinct structs or "blocks" which may be
+added to the data member of :c:type:`v4l2_isp_buffer`. Userspace is
+responsible for populating the data member with the blocks that need to be
+configured by the driver. Each block-specific struct embeds
+:c:type:`v4l2_isp_block_header` as its first member and userspace must
+populate the type member with a value from :c:type:`camss_params_block_type`.
+Populated blocks must be placed consecutively in the data member, and the
+combined size of all populated blocks must be set in the data_size member of
+:c:type:`v4l2_isp_buffer`.
+
+The set of supported blocks depends on the CAMSS engine consuming the buffer.
+The block definitions themselves are shared across CAMSS ISPs; currently the
+Offline Processing Engine (OPE) is the only engine consuming them, through its
+``ope_params`` metadata output video node. Additional engines and blocks may be
+added to this format in the future.
+
+A block carrying ``V4L2_ISP_PARAMS_FL_BLOCK_DISABLE`` bypasses the
+corresponding hardware module. Any other block updates the module's
+configuration and leaves it enabled. Blocks omitted from a buffer keep their
+previously programmed configuration and enable state; until userspace submits
+a block for a given module, the driver's default configuration applies.
+
+OPE processing pipeline
+=======================
+
+The OPE is a memory-to-memory engine that reads a Bayer RAW frame from its
+``ope_input`` node and writes a YUV frame to its ``ope_disp_output`` node. The
+parameter blocks configure fixed-function hardware modules that the frame data
+passes through, in the following order:
+
+.. code-block:: none
+
+	 Bayer RAW in            RGB domain                      YUV domain      YUV out
+	 (8/10-bit)   +------+   +------+   +------+   +------+   +------+   +------+   (NV12/NV16/
+	  ----------> |  WB  |-->| DEMO |-->|  CC  |-->| GLUT |-->|CHROMA|-->| DSC  |----------->
+	              +------+   +------+   +------+   +------+   |ENHAN |   +------+    NV24/GREY)
+	                                                         +------+
+
+The stages, and the parameter block that configures each one, are:
+
+.. flat-table:: OPE pipeline stages
+    :header-rows: 1
+    :stub-columns: 0
+
+    * - Stage
+      - Module
+      - Parameter block
+      - Function
+    * - WB
+      - CLC_WB
+      - :c:type:`camss_params_wb_gain`
+      - Per-channel white balance gains and black-level / pedestal offsets,
+        applied to the raw Bayer data.
+    * - DEMO
+      - CLC_DEMO
+      - *(none)*
+      - Demosaic: reconstructs a full-resolution RGB image from the Bayer
+        mosaic. Always enabled; not configurable through this format.
+    * - CC
+      - CLC_CC
+      - :c:type:`camss_params_color_correct`
+      - Color correction matrix applied in the RGB domain.
+    * - GLUT
+      - CLC_GLUT
+      - :c:type:`camss_params_gamma`
+      - Per-channel gamma correction curves (256-entry LUTs).
+    * - CHROMA_ENHAN
+      - CLC_CHROMA_ENHAN
+      - :c:type:`camss_params_chroma_enhan`
+      - RGB to YUV color transfer matrix.
+    * - DSC
+      - Downscaler
+      - *(none)*
+      - Chroma (and, when required, luma) downscaling to produce the requested
+        YUV subsampling, e.g. YUV 4:4:4 to 4:2:2 (NV16) or 4:2:0 (NV12).
+
+The input node accepts 8-bit and 10-bit packed Bayer RAW formats (for example
+``V4L2_PIX_FMT_SRGGB8`` and ``V4L2_PIX_FMT_SRGGB10P``). The output node
+produces semi-planar YUV (``V4L2_PIX_FMT_NV12`` / ``NV21`` / ``NV16`` /
+``NV61`` / ``NV24`` / ``NV42``) or luma-only ``V4L2_PIX_FMT_GREY``. A
+configurable stage is bypassed while its block carries
+``V4L2_ISP_PARAMS_FL_BLOCK_DISABLE``.
+
+The following example populates an OPE parameters buffer with a white balance
+and a gamma correction block:
+
+.. code-block:: c
+
+	struct v4l2_isp_buffer *params =
+		(struct v4l2_isp_buffer *)buffer;
+
+	params->version = V4L2_ISP_VERSION_V1;
+	params->data_size = sizeof(struct camss_params_wb_gain) +
+			    sizeof(struct camss_params_gamma);
+
+	__u8 *data = params->data;
+
+	struct camss_params_wb_gain *wb =
+		(struct camss_params_wb_gain *)data;
+
+	memset(wb, 0, sizeof(*wb));
+	wb->header.type = CAMSS_PARAMS_WB_GAIN;
+	wb->header.flags = V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	wb->header.size = sizeof(struct camss_params_wb_gain);
+
+	/* Unity gain on all three channels (15uQ10, 1024 = 1.0) */
+	wb->g_gain = 1024;
+	wb->b_gain = 1024;
+	wb->r_gain = 1024;
+
+	data += sizeof(struct camss_params_wb_gain);
+
+	struct camss_params_gamma *gamma =
+		(struct camss_params_gamma *)data;
+
+	memset(gamma, 0, sizeof(*gamma));
+	gamma->header.type = CAMSS_PARAMS_GAMMA;
+	gamma->header.flags = V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	gamma->header.size = sizeof(struct camss_params_gamma);
+
+	/* Identity curve (pass-through, gamma 1.0) */
+	for (unsigned int i = 0; i < CAMSS_GAMMA_LUT_SIZE; i++)
+		gamma->glut[i] = gamma->blut[i] = gamma->rlut[i] = i;
+
+Qualcomm CAMSS ISP uAPI data types
+==================================
+
+.. kernel-doc:: include/uapi/linux/qcom-camss-config.h
diff --git a/MAINTAINERS b/MAINTAINERS
index e4ca41cdd8729625fe2f731cd443bdd4da527dca..234c4c69dec7e7264763f1970438c22d0cec11a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22908,6 +22908,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
 F:	Documentation/devicetree/bindings/media/qcom,*camss*
+F:	Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CLOCK DRIVERS

-- 
2.34.1

