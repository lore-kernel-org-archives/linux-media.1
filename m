Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC6E39C00E
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424859; cv=none; b=epUr2mf0fR3Rn/gkXycYwRx5ucWKLr4b1O09E4U5NDYuR+jTogU5VDidHx5wfYBVdawLuN5GlatuG1GGldE/Qxi+bIcjWJqCpoCPjLgPHpJYHIDIY2QStx8EGNZWa36cx+4ztEEELyVBi8NuT1ExfdWPbfGlRyEoTDd37N3a/Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424859; c=relaxed/simple;
	bh=4Of/L7NdW7MxbrKyfHk1I/g6q5hyOjwTpANaDFxdQwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XS43DC0w3KY/rSkK5i2sCCO3J1HHX/CrB1eFfDjYZIq4qKKUZc9gYX6T8OAM83qDKM3mcZA6YdRtaQjjmNKdTKPRnOxODpo0yE2tlh6O9NG4eepE4XJDGj5Bv1RRSdnILOEO2jNNcYoUIojS6fiNb6i2iX7RSK2uqKAe7gRHlzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STVdd7WX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HIU/p7Jt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STVdd7WX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HIU/p7Jt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDKIg1062926
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dWlHTKbdOrFENZeDKp3Vcm0dZAmYu9zKVedUYa+zFOI=; b=STVdd7WXFof3y8cZ
	gdpp2UdfyDdsBBOXdJ6oLhZif2HHFgH2fzsUr/Rjrk9QmAqDuR1t9GHC+ASWCLEw
	CDtuubvWAwMqwwjS19EWZxahcJ3L3GcqkPaVbf4/kR1cnRCDeNAu2O97YbKm3G53
	T7U6ub6EbdghXXsz6i0GiPXJYF9pBnuqzFcN25QMb+5Mi3cL6pZ+rYvYnDdGcacu
	cevL164ZlGqsMSoLh0CI3he6t51018gErHGSXfN4blKUpOOSexcP490ZMZIk7/BI
	FTlwx2DljUtaBucq8LdwspfXNX2rtpBE/9Hb2tK0AxErpNaXM7IZ3QESykAjw7Hc
	R/Yp3w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfrr8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:20:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d7886cdso42337291cf.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424855; x=1786029655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWlHTKbdOrFENZeDKp3Vcm0dZAmYu9zKVedUYa+zFOI=;
        b=HIU/p7Jt33GqjiwRSit0wfzFEnwGa+YHPivGjMw2ARWsJHYKnkV1lK5hZSJ7xjh56M
         6yOknu52WEvUOO4L5aNG7GYs0+iRXXUmj/EVHNSOR0a77EzSZrdmKXhM+6COVvqusX+W
         fTimERGTqnnev13jDnx/OGHreCss8wqI2i1E8xR92APuAKuBvP0pLU44N0DKYqfD4Xk6
         pkhThzUrK/BKhTN+8MvIiqvwgTZdetjtW4wFEB0snlLFy3ESssbM5LMboLQzmSQS0Bdw
         YImmh8Tjl7r5GT1GuGZ5HEBqmDMdPGtTeteyBm5f7yyYFyEJcFAXWLCHZx/S0BLtTkLe
         ICkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424855; x=1786029655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWlHTKbdOrFENZeDKp3Vcm0dZAmYu9zKVedUYa+zFOI=;
        b=AFVdtiWxToKT1Qz8jdpX1+kAMarSOrQyp9HAzqJ2hgpUCHVGkLfF7jzlrWOkccbVLf
         lgx7Gr1l8uw8CLUYQ4koftipqZySYcfdqsbeHIznI+Xu7oF1dE+5yji8a4XK6RhzneO3
         slpBDch/jdtxAmiRyX5Asrmz43dJ7OQruJdBzYO4ejQFjHi856l7/UBrcgrVqiPS85ax
         teCC5gOXIvKsTYgnsOAPRt9QsSjTRKK1HMcHfDOUIEIsBHZen4TVyJEV1zqi7Ytn5gtE
         k5XCsf+P6NwNSkKhC21EslqJCNPG5TUdfoKJvzefj+vqXtneU5emTLP2d3tTjM8AxeHp
         suuw==
X-Gm-Message-State: AOJu0YytQZQTAZkyzHJgjMjetOniDvOfpTkxd01M0IfpdOp8+DCOSAIz
	i9VDUgX2HxHfMu37Fq1pNGSC4t7SbSpj3cdr8gd3+JvkLJ/0/T54iYGNbXM88DO2BbVIi/tevWV
	o6DWhd6+eq55LbfJxGIEl2BLA3cMNKWEz9GE2nxLV0zwz7Dqr25Ev36nySusRjXj1Ww==
X-Gm-Gg: AR+sD12X00KrNJS9p99N3+x+5NBHWccML6GyGU+dxV0eabnB9eq1/daOCucFAnMNs4H
	wvUEpHW2ykgQg65xqkw6NJj2DVj+oNMHStvrrj38sHAZbcir1nPs1umGww5fUHEwokCxuwILE/5
	RZSzDlTTMbuQhDvHvFz3rRPo1rI3Ho6WMyTApfIL+kZqPjVzTkQ2bBXyhepdeDG8QSerkC2Ydva
	+rm8hggtM9M2EYW+s9bJpHfIIKWzrUgCUS9mCp7a2c3JiqFnzS4Lq3cskUU4jt9BBrlkwNuyj4B
	0UQVpf3GvxDbykWL9dAGSTLxphkNLzWtWhxDvgEKNyZierLCRwjkPVNnSq6fqG6TdUsog518LuX
	msv45TK9ewFb7C0mPKxWV5oU80WzAhwCWlIIOo3Ohi67vfXd4OjH8GdylD8qUZm8uq01XU7UXCH
	m6RpSk6EUqutoimQ==
X-Received: by 2002:a05:622a:5591:b0:516:d557:15bb with SMTP id d75a77b69052e-52b386750d9mr34259761cf.46.1785424855188;
        Thu, 30 Jul 2026 08:20:55 -0700 (PDT)
X-Received: by 2002:a05:622a:5591:b0:516:d557:15bb with SMTP id d75a77b69052e-52b386750d9mr34259211cf.46.1785424854617;
        Thu, 30 Jul 2026 08:20:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:20:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:44 +0300
Subject: [PATCH v8 01/18] media: iris: Add Gen2 firmware autodetect and
 fallback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-iris-ar50lt-v8-1-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
In-Reply-To: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17244;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Jj1jtoeZXF8qtDkOzKpX3txPsPYJX0KTLQGPeViSQM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vQqRzUk04SOAhCmQApqarONh1a3PxcC8zFC
 HZzL/xKFJSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0AAKCRCLPIo+Aiko
 1cF0B/9+SUfxqoR0z/9PmwJ8Incq6qeitTBAUfHKSAZidu5oSqlIJMiOQuFoo55lj/VtDeevNhq
 M3dk2koaRnqaEaKq/jSra+05/hW2e6eZ0sxPCjkecDhNg+BRINSXIXxCqn6slK4ym1vd166MFJ0
 Na7H3ZaLEa4WPUf78yUfJsLCGY4tEGE+Ox8VU9XXAcrM5WYqE8Dk8RbIRNcGbFTZPm4V/VkHwvb
 KNOS8r0H1NnRRoMs9ut/nvdZ56ycY3cL0HTTooOMgRTY+1GhbeZLsLGRIsY8Sh+Iq8U/s+W2KQV
 XL5NscwlZeswmKe97X9fdHtq5YBRrFjqnFBigT3BfiBbpDJp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX7poZzdfrXuEL
 QTuaHJUTPA2rveUSnZT95f5fxAPpVzkHebHjeOEydPUK7V/p2v3QDovPx/7zJ6CdoYRXN/2AYK+
 BJZxYlsMJqb8qN46j5hQEo8b7zBUhnU/mVwHvJoXta4ntqPDpprJISLE/fMTHQo5f+ZRKoyBk8O
 a4lOtCDIUZxZvy+vdpHltTiTX8bQ4uW+YJKVr6spz6hr1bJg1he/QSeYw6kJxsm4rI9b1NPatFD
 OV8ZX9q0hxg/qQJWC5POBgxFytPsMmmQu3yXJYNWtd5C6yMsb6tQa3uaXVRJQ1kkKfwXejb0xmM
 JLiOnuDch5Iv6bjWIsDkzts+h7dB2AY4mDqH0h1KeRu3RKcJVpRR+gBsD9lu0lmelLD8oX6WG+P
 rFc4jw4GhF/WNOcxE4Rp3v0dro+eA5BYS/7KEfp8cVZXXGpczksny6ps2bX7FIHSfCnjnNvEzef
 J0R7zqk/StZVHROALXQ==
X-Proofpoint-GUID: dcMUAYR4KPhIte3rd7aj1Se2Wd_6BTL7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX1cNKG6VgJ09o
 7BHw3VmgmT/jJY3QyHGr10eNWchkuHl3+kbJYOsI3c3XET8QDQmwavqVUbTx/Urp5AqEFzWCdYq
 7Ak8LhC7E1yA/loXASQ14+8HH+lr3LY=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b6bd8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4FHYMocE7i0MHXyxtNQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: dcMUAYR4KPhIte3rd7aj1Se2Wd_6BTL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
Update the firmware loading logic to handle this generically by
preferring Gen2 when available, while safely falling back to Gen1
when required.

The firmware loading logic is updated with the following priority:
1. Device Tree (`firmware-name`): If specified, load unconditionally.
2. Gen2 default : If no DT override exists, select the Gen2 firmware
   descriptor when present and attempt to load the corresponding
   firmware image.
3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
   descriptor is available, retry with the Gen1 firmware image.

Loading and generation detection are split into two steps.
iris_load_firmware() applies the priority above and returns the loaded
image together with a candidate descriptor. iris_detect_firmware() then
runs only after qcom_mdt_load() has succeeded and publishes the chosen
descriptor, so the driver commits to a HFI generation only for an image
that has actually been loaded.

When a platform provides both Gen1 and Gen2 firmware descriptors and the
firmware is loaded via a DT override, the candidate descriptor is only a
default: iris_detect_firmware() inspects the loaded image to pick the
generation, before authentication. It scans the memory populated by
qcom_mdt_load() rather than the request_firmware() blob, so that a split
.mdt image, whose version string lives in the .bNN data segments and not
in the ELF headers, is classified correctly. The firmware is classified
as Gen2 if the QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
"video-firmware.N.M" format with N >= 2.

If a Gen1 firmware image is detected in this case, the driver switches
to the Gen1 firmware descriptor and associated platform data so that
the correct HFI implementation is used.

This change makes firmware generation detection platform‑agnostic,
preserves DT overrides, prefers newer Gen2 firmware when available,
and maintains compatibility with platforms that only support Gen1.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       |   2 +
 drivers/media/platform/qcom/iris/iris_firmware.c   | 186 +++++++++++++++++++--
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 7 files changed, 186 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..6dbe18be5b49 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -6,6 +6,7 @@
 #include <linux/pm_runtime.h>
 
 #include "iris_core.h"
+#include "iris_ctrls.h"
 #include "iris_firmware.h"
 #include "iris_state.h"
 #include "iris_vpu_common.h"
@@ -79,6 +80,7 @@ int iris_core_init(struct iris_core *core)
 		goto error_unload_fw;
 
 	core->iris_firmware_data->init_hfi_ops(core);
+	iris_session_init_caps(core);
 
 	ret = iris_hfi_core_init(core);
 	if (ret)
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 1a476146d758..c5d2b9fd0502 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -14,22 +14,175 @@
 
 #define IRIS_PAS_ID				9
 
-#define MAX_FIRMWARE_NAME_SIZE	128
+/* Detect Gen2 firmware by scanning the blob for:
+ *   QC_IMAGE_VERSION_STRING=<version>
+ * and then checking:
+ *   - version starts with "vfw", OR
+ *   - version matches "video-firmware.N.M" with N >= 2
+ */
+
+static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
+{
+	static const char *marker = "QC_IMAGE_VERSION_STRING=";
+	const size_t mlen = strlen(marker);
+	static const char *vfw = "vfw";
+	const size_t vfwlen = strlen(vfw);
+	static const char *vf = "video-firmware.";
+	const size_t vflen = strlen(vf);
+
+	for (size_t i = 0; i + mlen < size; i++) {
+		const char *found;
+
+		if (memcmp(data + i, marker, mlen))
+			continue;
+
+		found = data + i + mlen;
+		size -= i + mlen;
+
+		/* vfw => Gen2 */
+		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
+			return true;
+
+		if (size < vflen ||
+		    memcmp(found, vf, vflen))
+			return false;
+
+		found += vflen;
+		size -= vflen;
+
+		/*
+		 * video-firmware.1.x is Gen1.
+		 * video-firmware.2.x and video-firmware.10.x are Gen2.
+		 */
+		return size >= 2 &&
+			(*found >= '2' || (*found == '1' && found[1] != '.'));
+	}
+
+	return false;
+}
+
+/*
+ * Load the firmware image and return the descriptor that was used to pick the
+ * file. On a platform that provides only one generation, or when no DT
+ * firmware-name override is present, the returned descriptor is final. With a
+ * DT override on a dual-generation platform the returned descriptor is only a
+ * default; iris_detect_firmware() inspects the loaded image to confirm it.
+ */
+static const struct firmware *iris_load_firmware(struct iris_core *core,
+						 const char **fw_name,
+						 const struct iris_firmware_desc **fw_desc)
+{
+	const struct iris_firmware_desc *desc;
+	const struct firmware *firmware;
+	bool has_both_gens;
+	int ret;
+
+	*fw_name = NULL;
+	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
+
+	/*
+	 * A platform may support both Gen1 and Gen2 firmware; which one is used
+	 * depends on the firmware image installed on the system, not on the
+	 * hardware. That installed image does not change while the device is
+	 * bound, so the generation is detected only once and the chosen
+	 * descriptor is reused on later core bring-ups (e.g. after a system
+	 * error recovery).
+	 */
+	if (core->iris_firmware_desc) {
+		if (ret)
+			*fw_name = core->iris_firmware_desc->fwname;
+		ret = request_firmware(&firmware, *fw_name, core->dev);
+		if (ret)
+			return ERR_PTR(ret);
+		*fw_desc = core->iris_firmware_desc;
+		return firmware;
+	}
+
+	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
+		core->iris_platform_data->firmware_desc_gen1;
+
+	if (core->iris_platform_data->firmware_desc_gen2)
+		desc = core->iris_platform_data->firmware_desc_gen2;
+	else if (core->iris_platform_data->firmware_desc_gen1)
+		desc = core->iris_platform_data->firmware_desc_gen1;
+	else
+		return ERR_PTR(-EINVAL);
 
-static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
+	if (ret) {
+		/* No firmware-name in DT: select by probing Gen2 then Gen1. */
+		*fw_name = desc->fwname;
+		if (has_both_gens)
+			ret = firmware_request_nowarn(&firmware, *fw_name, core->dev);
+		else
+			ret = request_firmware(&firmware, *fw_name, core->dev);
+		if (ret && has_both_gens) {
+			desc = core->iris_platform_data->firmware_desc_gen1;
+			*fw_name = desc->fwname;
+			ret = request_firmware(&firmware, *fw_name, core->dev);
+		}
+	} else {
+		/* firmware-name given: iris_detect_firmware() picks the gen. */
+		ret = request_firmware(&firmware, *fw_name, core->dev);
+	}
+	if (ret)
+		return ERR_PTR(ret);
+
+	*fw_desc = desc;
+	return firmware;
+}
+
+/*
+ * Detect the firmware generation and publish the descriptor. Run only after
+ * qcom_mdt_load() has succeeded, so the driver commits to a HFI generation
+ * only for a firmware image that has actually been loaded.
+ *
+ * The generation is detected from the loaded image (@data / @size point at the
+ * reserved memory region populated by qcom_mdt_load()) rather than from the
+ * request_firmware() blob: for a split .mdt the latter holds only the ELF
+ * headers, while QC_IMAGE_VERSION_STRING lives in the .bNN data segments.
+ *
+ * The descriptor and firmware data are published exactly once, before any
+ * session exists, so the lockless readers in the ioctl paths never observe a
+ * reassignment. Later bring-ups reuse the already published descriptor.
+ */
+static void iris_detect_firmware(struct iris_core *core, const char *fw_name,
+				 const u8 *data, size_t size,
+				 const struct iris_firmware_desc *desc)
 {
+	if (core->iris_firmware_desc)
+		return;
+
+	/*
+	 * With a DT firmware-name override on a dual-generation platform the
+	 * image on disk decides the generation, so inspect it and switch to the
+	 * Gen1 descriptor when a Gen1 image was loaded.
+	 */
+	if (desc == core->iris_platform_data->firmware_desc_gen2 &&
+	    core->iris_platform_data->firmware_desc_gen1 &&
+	    of_property_present(dev_of_node(core->dev), "firmware-name") &&
+	    !iris_detect_gen2_from_fwdata(data, size)) {
+		dev_info(core->dev, "Gen1 FW detected in %s\n", fw_name);
+		desc = core->iris_platform_data->firmware_desc_gen1;
+	}
+
+	/* Publish iris_firmware_data first, then iris_firmware_desc (the guard). */
+	core->iris_firmware_data = desc->firmware_data;
+	core->iris_firmware_desc = desc;
+}
+
+static int iris_load_fw_to_memory(struct iris_core *core)
+{
+	const struct iris_firmware_desc *desc;
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
 	phys_addr_t mem_phys;
+	const char *fw_name;
 	size_t res_size;
 	ssize_t fw_size;
 	void *mem_virt;
 	int ret;
 
-	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
-		return -EINVAL;
-
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
 	if (ret)
 		return ret;
@@ -37,9 +190,9 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
-	if (ret)
-		return ret;
+	firmware = iris_load_firmware(core, &fw_name, &desc);
+	if (IS_ERR(firmware))
+		return PTR_ERR(firmware);
 
 	fw_size = qcom_mdt_get_size(firmware);
 	if (fw_size < 0 || res_size < (size_t)fw_size) {
@@ -56,6 +209,9 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	ret = qcom_mdt_load(dev, firmware, fw_name,
 			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
 
+	if (!ret)
+		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
+
 	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
@@ -66,18 +222,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
-	const char *fwpath = NULL;
 	int i, ret;
 
-	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
-					    &fwpath);
-	if (ret)
-		fwpath = core->iris_firmware_desc->fwname;
-
-	ret = iris_load_fw_to_memory(core, fwpath);
+	ret = iris_load_fw_to_memory(core);
 	if (ret) {
-		dev_err(core->dev, "firmware download failed\n");
-		return -ENOMEM;
+		dev_err(core->dev, "firmware download failed %d\n", ret);
+		return ret;
 	}
 
 	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
@@ -99,7 +249,7 @@ int iris_fw_load(struct iris_core *core)
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 int iris_fw_unload(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..55a4fa356985 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -289,11 +289,7 @@ struct iris_firmware_desc {
 };
 
 struct iris_platform_data {
-	/*
-	 * XXX: replace with gen1 / gen2 pointers once we have platforms
-	 * supporting both firmware kinds.
-	 */
-	const struct iris_firmware_desc *firmware_desc;
+	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
 
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 6e06a32822bb..961dce2e6aa9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -22,6 +22,12 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -65,7 +71,8 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.firmware_desc = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -94,7 +101,7 @@ const struct iris_platform_data sc7280_data = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.firmware_desc = &iris_vpu20_p4_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 2c63adbc5579..74626b35d9cb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.firmware_desc = &iris_vpu30_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data = {
  * - controller_rst_tbl to sm8650_controller_reset_table
  */
 const struct iris_platform_data sm8650_data = {
-	.firmware_desc = &iris_vpu33_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.firmware_desc = &iris_vpu35_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data = {
  * - different num_vpp_pipe
  */
 const struct iris_platform_data x1p42100_data = {
-	.firmware_desc = &iris_vpu30_p1_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p1_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c2dcb50a2782..7fe31136df21 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,8 +251,6 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
-	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
-	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))
@@ -271,8 +269,6 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	iris_session_init_caps(core);
-
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 14d63dc76c9b..33edbc5cab8f 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -9,6 +9,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 
+#include "iris_ctrls.h"
 #include "iris_vidc.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"

-- 
2.47.3

